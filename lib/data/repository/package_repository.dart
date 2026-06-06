import 'dart:convert';
import 'dart:io';
import '../db/database_interface.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../shell/brew_service.dart';

class PackageRepository {
  final BrewService _brewService;
  final DatabaseInterface _database;

  PackageRepository(this._brewService, this._database);

  Future<Map<String, int>> _getDirectorySizes(String basePath) async {
    final sizes = <String, int>{};
    try {
      final dir = Directory(basePath);
      if (dir.existsSync()) {
        final result = await Process.run('sh', ['-c', 'du -sk "$basePath"/*']);
        if (result.exitCode == 0) {
          final lines = (result.stdout as String).split('\n');
          for (final line in lines) {
            if (line.trim().isEmpty) continue;
            final parts = line.trim().split(RegExp(r'\s+'));
            if (parts.length >= 2) {
              final sizeKb = int.tryParse(parts[0]) ?? 0;
              final path = parts.sublist(1).join(' ');
              final name = path.split('/').last;
              sizes[name] = sizeKb * 1024;
            }
          }
        }
      }
    } catch (_) {}
    return sizes;
  }

  Future<void> syncInstalledPackages() async {
    final result = await _brewService.infoInstalled();
    if (result.exitCode != 0) {
      throw Exception('Failed to get installed packages: ${result.stderr}');
    }

    final jsonMap = jsonDecode(result.stdout) as Map<String, dynamic>;
    final formulaeJson = jsonMap['formulae'] as List<dynamic>? ?? [];
    final casksJson = jsonMap['casks'] as List<dynamic>? ?? [];

    final prefix = await _brewService.getPrefix();
    final cellarSizes = await _getDirectorySizes('$prefix/Cellar');
    final caskroomSizes = await _getDirectorySizes('$prefix/Caskroom');

    final now = DateTime.now();

    final formulae = formulaeJson
        .map((json) {
          final map = json as Map<String, dynamic>;
          int? installedTime;
          int? installedSize = cellarSizes[map['name'] as String];
          
          final installed = map['installed'] as List<dynamic>?;
          if (installed != null && installed.isNotEmpty) {
            final first = installed.first as Map<String, dynamic>;
            installedTime = first['time'] as int?;
          }
          
          return FormulaModel.fromJson(map).copyWith(
            isInstalled: true,
            installedOnTimestamp: installedTime,
            installedSize: installedSize,
            lastSync: now,
          );
        })
        .toList();

    final casks = casksJson
        .map((json) {
          final map = json as Map<String, dynamic>;
          int? installedTime = map['installed_time'] as int?;
          int? sizeBytes = caskroomSizes[map['token'] as String];
          String? installedSize = sizeBytes != null ? sizeBytes.toString() : null;
          
          return CaskModel.fromJson(map).copyWith(
            isInstalled: true,
            installedOnTimestamp: installedTime,
            installedSize: installedSize,
            lastSync: now,
          );
        })
        .toList();

    await _database.resetAllInstallationStatuses();

    // We insert/update the fetched records.
    // They are fully populated from `brew info --installed --json=v2`.
    if (formulae.isNotEmpty) {
      await _database.cacheFormulae(formulae);
    }
    if (casks.isNotEmpty) {
      await _database.cacheCasks(casks);
    }
  }

  Future<void> install(String package, {bool isCask = false}) async {
    final result = await _brewService.install(package, isCask: isCask);
    if (result.exitCode != 0) {
      throw Exception('Failed to install $package: ${result.stderr}');
    }

    // On success, query local metadata and update database
    final infoResult = await _brewService.info(package);
    if (infoResult.exitCode == 0) {
      final jsonMap = jsonDecode(infoResult.stdout) as Map<String, dynamic>;
      final prefix = await _brewService.getPrefix();
      final now = DateTime.now();

      if (isCask) {
        final casksJson = jsonMap['casks'] as List<dynamic>? ?? [];
        if (casksJson.isNotEmpty) {
          final map = casksJson.first as Map<String, dynamic>;
          int? installedTime = map['installed_time'] as int?;
          
          final caskroomSizes = await _getDirectorySizes('$prefix/Caskroom');
          int? sizeBytes = caskroomSizes[map['token'] as String];
          String? installedSize = sizeBytes != null ? sizeBytes.toString() : null;

          final cask = CaskModel.fromJson(map).copyWith(
            isInstalled: true,
            installedOnTimestamp: installedTime,
            installedSize: installedSize,
            lastSync: now,
          );
          await _database.cacheCask(cask);
        } else {
          // Fallback if missing
          await _database.updateCaskInstallationStatus(package, true);
        }
      } else {
        final formulaeJson = jsonMap['formulae'] as List<dynamic>? ?? [];
        if (formulaeJson.isNotEmpty) {
          final map = formulaeJson.first as Map<String, dynamic>;
          int? installedTime;
          final installed = map['installed'] as List<dynamic>?;
          if (installed != null && installed.isNotEmpty) {
            final first = installed.first as Map<String, dynamic>;
            installedTime = first['time'] as int?;
          }

          final cellarSizes = await _getDirectorySizes('$prefix/Cellar');
          int? installedSize = cellarSizes[map['name'] as String];

          final formula = FormulaModel.fromJson(map).copyWith(
            isInstalled: true,
            installedOnTimestamp: installedTime,
            installedSize: installedSize,
            lastSync: now,
          );
          await _database.cacheFormula(formula);
        } else {
          // Fallback if missing
          await _database.updateFormulaInstallationStatus(package, true);
        }
      }
    } else {
      // Just update the flag
      if (isCask) {
        await _database.updateCaskInstallationStatus(package, true);
      } else {
        await _database.updateFormulaInstallationStatus(package, true);
      }
    }
  }

  Future<void> uninstall(String package, {bool isCask = false}) async {
    final result = await _brewService.uninstall(package, isCask: isCask);
    if (result.exitCode != 0) {
      throw Exception('Failed to uninstall $package: ${result.stderr}');
    }

    // On success, update database flag
    if (isCask) {
      await _database.updateCaskInstallationStatus(package, false);
    } else {
      await _database.updateFormulaInstallationStatus(package, false);
    }
  }
}
