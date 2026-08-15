import 'dart:convert';
import 'dart:developer';

import '../../db/database_interface.dart';
import '../../models/tap/tap_model.dart';
import '../../models/formula/formula_model.dart';
import '../../models/cask/cask_model.dart';
import '../../shell/brew_service.dart';
import '../../shell/shell_command_result.dart';

class TapOperations {
  final BrewService _brewService;
  final DatabaseInterface _database;

  TapOperations(this._brewService, this._database);

  Future<void> syncTaps() async {
    final result = await _brewService.listTaps();
    if (result.exitCode == 0) {
      final List<dynamic> jsonList;
      try {
        final sanitized = _sanitizeJsonOutput(result.stdout);
        jsonList = jsonDecode(sanitized);
      } on FormatException {
        throw Exception('Homebrew output was mangled and could not be parsed.');
      }

      final oldTaps = await _database.getTaps();
      final oldTapsMap = {for (var tap in oldTaps) tap.name: tap};

      final taps = jsonList.map((json) {
        final tapName = json['name'] as String;
        final bool isTrusted;
        if (oldTapsMap.containsKey(tapName)) {
          isTrusted = oldTapsMap[tapName]!.trusted;
        } else {
          isTrusted =
              tapName.startsWith('homebrew/') || json['official'] == true;
        }
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
  }

  Future<void> syncThirdPartyTapPackages() async {
    final result = await _brewService.listTaps();
    if (result.exitCode != 0) {
      throw Exception('Failed to list taps for third-party sync: ${result.stderr}');
    }

    try {
      final oldTaps = await _database.getTaps();
      final trustedTapNames = oldTaps
          .where((t) => t.trusted)
          .map((t) => t.name)
          .toSet();

      final packagesToFetch = _extractThirdPartyPackages(
        result.stdout,
        trustedTapNames,
      );
      if (packagesToFetch.isEmpty) return;

      final brokenPackages = await _fetchAndCachePackageChunks(packagesToFetch);

      final brokenByTap = <String, List<String>>{};
      for (final pkg in brokenPackages) {
        final parts = pkg.split('/');
        if (parts.length >= 3) {
          final tapName = '${parts[0]}/${parts[1]}';
          brokenByTap.putIfAbsent(tapName, () => []).add(pkg);
        }
      }

      final tapsToUpdate = oldTaps
          .where((t) => trustedTapNames.contains(t.name))
          .map((t) {
            return t.copyWith(brokenPackages: brokenByTap[t.name] ?? []);
          })
          .toList();

      if (tapsToUpdate.isNotEmpty) {
        await _database.insertTaps(tapsToUpdate);
      }
    } on FormatException {
      throw Exception('Failed to sync third-party taps due to corrupted output.');
    } catch (e) {
      throw Exception('Failed to sync third-party taps: $e');
    }
  }

  Future<void> syncTap(String tapName) async {
    final result = await _brewService.listTaps();
    if (result.exitCode != 0) {
      throw Exception('Failed to list taps: ${result.stderr}');
    }

    try {
      final List<dynamic> jsonList;
      try {
        final sanitized = _sanitizeJsonOutput(result.stdout);
        jsonList = jsonDecode(sanitized);
      } on FormatException {
        throw Exception('Homebrew output was mangled and could not be parsed.');
      }

      final tapJson = jsonList.firstWhere(
        (t) => t['name'] == tapName,
        orElse: () => null,
      );

      if (tapJson == null) {
        throw Exception('Tap $tapName not found');
      }

      // Preserve existing trusted state from database
      final oldTaps = await _database.getTaps();
      final oldTapIndex = oldTaps.indexWhere((t) => t.name == tapName);
      final bool isTrusted;
      if (oldTapIndex != -1) {
        isTrusted = oldTaps[oldTapIndex].trusted;
      } else {
        isTrusted =
            tapName.startsWith('homebrew/') || tapJson['official'] == true;
      }

      final tap = TapModel.fromJson(tapJson).copyWith(trusted: isTrusted);

      if (tapName != 'homebrew/core' && tapName != 'homebrew/cask') {
        if (!isTrusted) {
          await _database.insertTaps([tap]);
          return;
        }

        final formulaNames = List<String>.from(tapJson['formula_names'] ?? []);
        final caskTokens = List<String>.from(tapJson['cask_tokens'] ?? []);

        final packagesToFetch = [...formulaNames];
        packagesToFetch.addAll(caskTokens);

        List<String> brokenPackages = [];
        if (packagesToFetch.isNotEmpty) {
          brokenPackages = await _fetchAndCachePackageChunks(packagesToFetch);
        }

        final updatedTap = tap.copyWith(brokenPackages: brokenPackages);
        await _database.insertTaps([updatedTap]);
      } else {
        await _database.insertTaps([tap]);
      }
    } catch (e) {
      throw Exception('Failed to sync tap $tapName: $e');
    }
  }

  List<String> _extractThirdPartyPackages(
    String tapsJson,
    Set<String> trustedTapNames,
  ) {
    final sanitized = _sanitizeJsonOutput(tapsJson);
    final List<dynamic> jsonList = jsonDecode(sanitized);
    final packagesToFetch = <String>[];

    for (final tapJson in jsonList) {
      final name = tapJson['name'] as String?;

      if (name == null ||
          name == 'homebrew/core' ||
          name == 'homebrew/cask' ||
          !trustedTapNames.contains(name)) {
        continue;
      }

      final formulaNames = List<String>.from(tapJson['formula_names'] ?? []);
      packagesToFetch.addAll(formulaNames);

      final caskTokens = List<String>.from(tapJson['cask_tokens'] ?? []);
      packagesToFetch.addAll(caskTokens);
    }

    return packagesToFetch;
  }

  Future<List<String>> _fetchAndCachePackageChunks(
    List<String> packagesToFetch,
  ) async {
    const chunkSize = 50;
    final brokenPackages = <String>[];
    for (var i = 0; i < packagesToFetch.length; i += chunkSize) {
      final end = (i + chunkSize < packagesToFetch.length)
          ? i + chunkSize
          : packagesToFetch.length;
      final chunk = packagesToFetch.sublist(i, end);

      final broken = await _processChunk(chunk);
      brokenPackages.addAll(broken);
    }

    return brokenPackages;
  }

  Future<List<String>> _processChunk(List<String> chunk) async {
    if (chunk.isEmpty) return [];

    final infoResult = await _brewService.runCommand([
      'info',
      '--json=v2',
      ...chunk,
    ]);

    if (_isChunkSuccess(infoResult)) {
      try {
        await _parseAndCacheInfo(infoResult.stdout);
        return [];
      } catch (_) {
        // Silently treat as failure to trigger the smart fallback
      }
    }

    return await _handleChunkFailure(chunk, infoResult);
  }

  bool _isChunkSuccess(ShellCommandResult infoResult) {
    return infoResult.exitCode == 0 && infoResult.stdout.isNotEmpty;
  }

  Future<List<String>> _handleChunkFailure(
    List<String> chunk,
    ShellCommandResult infoResult,
  ) async {
    // Base case: if chunk is 1, we isolated the broken package.
    if (chunk.length == 1) {
      _logIsolatedFailure(chunk.first, infoResult);
      return [chunk.first];
    }

    // Fast Path: Try to instantly identify the broken package(s) from stderr
    if (infoResult.stderr.isNotEmpty) {
      final failedPackages = _identifyFailedPackagesFromStderr(
        chunk,
        infoResult.stderr,
      );

      if (failedPackages.isNotEmpty && failedPackages.length < chunk.length) {
        return await _processGoodPackages(chunk, failedPackages);
      }
    }

    // If the fast path fails to identify the culprit, the tap chunk is fundamentally unparseable.
    _logChunkCorrupted(chunk.length);
    return chunk;
  }

  List<String> _identifyFailedPackagesFromStderr(
    List<String> chunk,
    String stderr,
  ) {
    return chunk.where((pkg) {
      return stderr.contains('$pkg:') ||
          stderr.contains("'$pkg'") ||
          stderr.contains('"$pkg"');
    }).toList();
  }

  Future<List<String>> _processGoodPackages(
    List<String> chunk,
    List<String> failedPackages,
  ) async {
    for (final bad in failedPackages) {
      log('❌ Skipping broken package "$bad" (fast-isolated from stderr).');
    }

    final goodPackages = chunk
        .where((pkg) => !failedPackages.contains(pkg))
        .toList();

    if (goodPackages.isNotEmpty) {
      final additionalBroken = await _processChunk(goodPackages);
      return [...failedPackages, ...additionalBroken];
    }

    return failedPackages;
  }

  void _logIsolatedFailure(String pkg, ShellCommandResult infoResult) {
    final errorMsg = infoResult.stderr.isNotEmpty
        ? infoResult.stderr
        : (infoResult.stdout.isNotEmpty ? infoResult.stdout : 'Unknown error');
    log(
      '❌ Skipping broken package "$pkg". Reason: ${errorMsg.split('\n').first}',
    );
  }

  void _logChunkCorrupted(int chunkLength) {
    log(
      '⚠️ Homebrew failed to parse a chunk of $chunkLength packages and stderr provided no clear culprits.',
    );
    log('Skipping this chunk as its contents appear corrupted.');
  }

  Future<void> _parseAndCacheInfo(String infoJsonString) async {
    final sanitized = _sanitizeJsonOutput(infoJsonString);
    final infoJson = jsonDecode(sanitized);

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

  String _sanitizeJsonOutput(String output) {
    final trimmed = output.trim();
    final startMatch = RegExp(r'(?:^|\n)\s*([\[{])').firstMatch(trimmed);
    if (startMatch == null) return trimmed;

    final startIndex = trimmed.indexOf(startMatch.group(1)!, startMatch.start);

    final lastCloseSquare = trimmed.lastIndexOf(']');
    final lastCloseCurly = trimmed.lastIndexOf('}');
    final endIndex = lastCloseSquare > lastCloseCurly
        ? lastCloseSquare
        : lastCloseCurly;

    if (startIndex != -1 && endIndex != -1 && endIndex >= startIndex) {
      return trimmed.substring(startIndex, endIndex + 1);
    }
    return trimmed;
  }
}

