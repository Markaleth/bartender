import 'dart:convert';
import 'package:bartender/core/utils/shell_utils.dart';

import '../db/database_interface.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../shell/brew_service.dart';

class PackageRepository {
  final BrewService _brewService;
  final DatabaseInterface _database;

  PackageRepository(this._brewService, this._database);

  Future<int?> _getPackageSize(String path) async {
    try {
      final result = await ShellUtils.run('sh', ['-c', 'du -sk "$path"']);
      if (result.exitCode == 0) {
        final stdout = result.stdout as String;
        final parts = stdout.trim().split(RegExp(r'\s+'));
        if (parts.isNotEmpty) {
          final sizeKb = int.tryParse(parts[0]);
          if (sizeKb != null) {
            return sizeKb * 1024;
          }
        }
      }
    } catch (_) {}
    return null;
  }

  Future<List<FormulaModel>> _processFormulae(
    List<dynamic> formulaeJson,
    String prefix,
    DateTime now,
  ) async {
    final futures = formulaeJson.map((json) async {
      final map = json as Map<String, dynamic>;
      int? installedTime;
      int? installedSize = await _getPackageSize(
        '$prefix/Cellar/${(map['name'] as String).split('/').last}',
      );

      final installed = map['installed'] as List<dynamic>?;
      if (installed != null && installed.isNotEmpty) {
        final first = installed.first as Map<String, dynamic>;
        installedTime = first['time'] as int?;
      }

      return FormulaModel.fromJson(map).copyWith(
        isInstalled: true,
        installedOnTimestamp: installedTime,
        installedSize: installedSize,
      );
    });

    return Future.wait(futures);
  }

  Future<List<CaskModel>> _processCasks(
    List<dynamic> casksJson,
    String prefix,
    DateTime now,
  ) async {
    final futures = casksJson.map((json) async {
      final map = json as Map<String, dynamic>;
      int? installedTime = map['installed_time'] as int?;
      int? sizeBytes = await _getPackageSize(
        '$prefix/Caskroom/${(map['token'] as String).split('/').last}',
      );
      String? installedSize = sizeBytes?.toString();

      return CaskModel.fromJson(map).copyWith(
        isInstalled: true,
        installedOnTimestamp: installedTime,
        installedSize: installedSize,
      );
    });

    return Future.wait(futures);
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
    final now = DateTime.now();

    final formulae = await _processFormulae(formulaeJson, prefix, now);
    final casks = await _processCasks(casksJson, prefix, now);

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

  Future<void> _handleCaskInstallation(
    Map<String, dynamic> jsonMap,
    String prefix,
    DateTime now,
    String package,
  ) async {
    final casksJson = jsonMap['casks'] as List<dynamic>? ?? [];
    if (casksJson.isNotEmpty) {
      final map = casksJson.first as Map<String, dynamic>;
      int? installedTime = map['installed_time'] as int?;

      int? sizeBytes = await _getPackageSize(
        '$prefix/Caskroom/${(map['token'] as String).split('/').last}',
      );
      String? installedSize = sizeBytes?.toString();

      final cask = CaskModel.fromJson(map).copyWith(
        isInstalled: true,
        installedOnTimestamp: installedTime,
        installedSize: installedSize,
      );
      await _database.cacheCask(cask);
    } else {
      // Fallback if missing
      await _database.updateCaskInstallationStatus(package, true);
    }
  }

  Future<void> _handleFormulaInstallation(
    Map<String, dynamic> jsonMap,
    String prefix,
    DateTime now,
    String package,
  ) async {
    final formulaeJson = jsonMap['formulae'] as List<dynamic>? ?? [];
    if (formulaeJson.isNotEmpty) {
      final map = formulaeJson.first as Map<String, dynamic>;
      int? installedTime;
      final installed = map['installed'] as List<dynamic>?;
      if (installed != null && installed.isNotEmpty) {
        final first = installed.first as Map<String, dynamic>;
        installedTime = first['time'] as int?;
      }

      int? installedSize = await _getPackageSize(
        '$prefix/Cellar/${(map['name'] as String).split('/').last}',
      );

      final formula = FormulaModel.fromJson(map).copyWith(
        isInstalled: true,
        installedOnTimestamp: installedTime,
        installedSize: installedSize,
      );
      await _database.cacheFormula(formula);
    } else {
      // Fallback if missing
      await _database.updateFormulaInstallationStatus(package, true);
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
        await _handleCaskInstallation(jsonMap, prefix, now, package);
      } else {
        await _handleFormulaInstallation(jsonMap, prefix, now, package);
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
