import 'dart:convert';
import '../db/database_interface.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../shell/brew_service.dart';

class PackageRepository {
  final BrewService _brewService;
  final DatabaseInterface _database;

  PackageRepository(this._brewService, this._database);

  Future<void> syncInstalledPackages() async {
    final result = await _brewService.infoInstalled();
    if (result.exitCode != 0) {
      throw Exception('Failed to get installed packages: ${result.stderr}');
    }

    final jsonMap = jsonDecode(result.stdout) as Map<String, dynamic>;
    final formulaeJson = jsonMap['formulae'] as List<dynamic>? ?? [];
    final casksJson = jsonMap['casks'] as List<dynamic>? ?? [];

    final formulae = formulaeJson
        .map(
          (json) => FormulaModel.fromJson(
            json as Map<String, dynamic>,
          ).copyWith(isInstalled: true),
        )
        .toList();

    final casks = casksJson
        .map(
          (json) => CaskModel.fromJson(
            json as Map<String, dynamic>,
          ).copyWith(isInstalled: true),
        )
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

      if (isCask) {
        final casksJson = jsonMap['casks'] as List<dynamic>? ?? [];
        if (casksJson.isNotEmpty) {
          final cask = CaskModel.fromJson(
            casksJson.first as Map<String, dynamic>,
          ).copyWith(isInstalled: true);
          await _database.cacheCask(cask);
        } else {
          // Fallback if missing
          await _database.updateCaskInstallationStatus(package, true);
        }
      } else {
        final formulaeJson = jsonMap['formulae'] as List<dynamic>? ?? [];
        if (formulaeJson.isNotEmpty) {
          final formula = FormulaModel.fromJson(
            formulaeJson.first as Map<String, dynamic>,
          ).copyWith(isInstalled: true);
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
