import 'dart:io';
import 'dart:convert';

import '../../db/database_interface.dart';
import '../../models/tap/tap_model.dart';
import '../../models/formula/formula_model.dart';
import '../../models/cask/cask_model.dart';
import '../../shell/brew_service.dart';

class TapOperations {
  final BrewService _brewService;
  final DatabaseInterface _database;

  TapOperations(this._brewService, this._database);

  Future<void> syncTaps() async {
    final result = await _brewService.listTaps();
    if (result.exitCode == 0) {
      final List<dynamic> jsonList = jsonDecode(result.stdout);

      final oldTaps = await _database.getTaps();
      final trustedTapNames = oldTaps
          .where((t) => t.trusted)
          .map((t) => t.name)
          .toSet();

      final taps = jsonList.map((json) {
        final tapName = json['name'] as String;
        final isTrusted = trustedTapNames.contains(tapName);
        return TapModel.fromJson(json).copyWith(trusted: isTrusted);
      }).toList();
      await _database.insertTaps(taps);
    } else {
      throw Exception('Failed to sync taps: ${result.stderr}');
    }
  }

  Future<void> toggleTapTrust(String name, bool isTrusted) async {
    final result = isTrusted
        ? await _brewService.trustTap(name)
        : await _brewService.untrustTap(name);
    if (result.exitCode == 0) {
      await _updateTapTrust(tapName: name, isTrusted: isTrusted);
    } else {
      throw Exception(
        'Failed to ${isTrusted ? 'trust' : 'untrust'} tap $name: ${result.stderr}',
      );
    }
  }

  Future<void> _updateTapTrust({
    required String tapName,
    required bool isTrusted,
  }) async {
    final taps = await _database.getTaps();
    final tap = taps.firstWhere((t) => t.name == tapName);
    await _database.insertTaps([tap.copyWith(trusted: isTrusted)]);
    await syncTap(tapName);
  }

  Future<void> syncThirdPartyTapPackages() async {
    final result = await _brewService.listTaps();
    if (result.exitCode != 0) return;

    try {
      final packagesToFetch = _extractThirdPartyPackages(result.stdout);
      if (packagesToFetch.isEmpty) return;

      await _fetchAndCachePackageChunks(packagesToFetch);
    } catch (e) {
      // Ignore errors if taps cannot be parsed
    }
  }

  Future<void> syncTap(String tapName) async {
    final result = await _brewService.listTaps();
    if (result.exitCode != 0) {
      throw Exception('Failed to list taps: ${result.stderr}');
    }

    try {
      final List<dynamic> jsonList = jsonDecode(result.stdout);

      final tapJson = jsonList.firstWhere(
        (t) => t['name'] == tapName,
        orElse: () => null,
      );

      if (tapJson == null) {
        throw Exception('Tap $tapName not found');
      }

      // Preserve existing trusted state from database
      final oldTaps = await _database.getTaps();
      final isTrusted = oldTaps.any((t) => t.name == tapName && t.trusted);

      final tap = TapModel.fromJson(tapJson).copyWith(trusted: isTrusted);
      await _database.insertTaps([tap]);

      if (tapName != 'homebrew/core' && tapName != 'homebrew/cask') {
        if (!isTrusted) return;

        final formulaNames = List<String>.from(tapJson['formula_names'] ?? []);
        final caskTokens = List<String>.from(tapJson['cask_tokens'] ?? []);

        final packagesToFetch = [...formulaNames];
        if (!Platform.isLinux) {
          packagesToFetch.addAll(caskTokens);
        }

        if (packagesToFetch.isNotEmpty) {
          await _fetchAndCachePackageChunks(packagesToFetch);
        }
      }
    } catch (e) {
      throw Exception('Failed to sync tap $tapName: $e');
    }
  }

  List<String> _extractThirdPartyPackages(String tapsJson) {
    final List<dynamic> jsonList = jsonDecode(tapsJson);
    final packagesToFetch = <String>[];

    for (final tapJson in jsonList) {
      final name = tapJson['name'] as String?;
      final trusted = tapJson['trusted'] as bool? ?? false;

      if (name == null ||
          name == 'homebrew/core' ||
          name == 'homebrew/cask' ||
          !trusted) {
        continue;
      }

      final formulaNames = List<String>.from(tapJson['formula_names'] ?? []);
      packagesToFetch.addAll(formulaNames);

      if (!Platform.isLinux) {
        final caskTokens = List<String>.from(tapJson['cask_tokens'] ?? []);
        packagesToFetch.addAll(caskTokens);
      }
    }

    return packagesToFetch;
  }

  Future<void> _fetchAndCachePackageChunks(List<String> packagesToFetch) async {
    const chunkSize = 50;
    for (var i = 0; i < packagesToFetch.length; i += chunkSize) {
      final end = (i + chunkSize < packagesToFetch.length)
          ? i + chunkSize
          : packagesToFetch.length;
      final chunk = packagesToFetch.sublist(i, end);

      final infoResult = await _brewService.runCommand([
        'info',
        '--json=v2',
        ...chunk,
      ]);

      if (infoResult.stdout.isNotEmpty) {
        try {
          await _parseAndCacheInfo(infoResult.stdout);
        } catch (e) {
          // Ignore parse errors for specific chunks to allow other chunks to proceed
        }
      }
    }
  }

  Future<void> _parseAndCacheInfo(String infoJsonString) async {
    final infoJson = jsonDecode(infoJsonString);

    if (infoJson['formulae'] != null) {
      final List<dynamic> formulaeJson = infoJson['formulae'];
      final formulae = formulaeJson
          .map((json) => FormulaModel.fromJson(json))
          .toList();
      if (formulae.isNotEmpty) {
        await _database.cacheNetworkFormulae(formulae);
      }
    }

    if (infoJson['casks'] != null) {
      final List<dynamic> casksJson = infoJson['casks'];
      final casks = casksJson.map((json) => CaskModel.fromJson(json)).toList();
      if (casks.isNotEmpty) {
        await _database.cacheNetworkCasks(casks);
      }
    }
  }

  Future<List<TapModel>> getTaps() => _database.getTaps();
  Future<void> deleteTap(String name) => _database.deleteTap(name);
  Future<int> getTapInstalledSize(String tapName) =>
      _database.getTapInstalledSize(tapName);
}
