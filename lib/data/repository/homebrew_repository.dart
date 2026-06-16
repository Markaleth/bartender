import 'dart:io';

import '../../core/enums/package_type_filter.dart';
import '../../core/enums/analytics_period.dart';
import 'dart:convert';
import '../shell/brew_service.dart';
import '../models/tap/tap_model.dart';
import '../api/api_client_interface.dart';
import '../db/database_interface.dart';
import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../network_resource.dart';

class HomebrewRepository {
  final ApiClientInterface _apiClient;
  final DatabaseInterface _database;
  final BrewService _brewService;

  HomebrewRepository(this._apiClient, this._database, this._brewService);

  Future<void> syncTaps() async {
    final result = await _brewService.listTaps();
    if (result.exitCode == 0) {
      final List<dynamic> jsonList = jsonDecode(result.stdout);
      final taps = jsonList.map((json) {
        return TapModel.fromJson(json);
      }).toList();
      await _database.insertTaps(taps);
    } else {
      throw Exception('Failed to sync taps: ${result.stderr}');
    }
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

      final tap = TapModel.fromJson(tapJson);
      await _database.insertTaps([tap]);

      if (tapName != 'homebrew/core' && tapName != 'homebrew/cask') {
        final trusted = tapJson['trusted'] as bool? ?? false;
        if (!trusted) return;

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

  Future<List<CategoryAnalyticsItem>> getCategoryAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    return await _database.getCategoryAnalytics(category, days);
  }

  Future<bool> isDatabaseEmpty() async {
    return await _database.isDatabaseEmpty();
  }

  Future<void> _fetchAndCache<T>({
    required String endpoint,
    required Future<NetworkResource<T>> Function(String? currentETag) fetcher,
    required Future<void> Function(T data) cacher,
    required String errorMessage,
  }) async {
    final currentETag = await _database.getETag(endpoint);
    final response = await fetcher(currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) return;
      if (response.data != null) {
        await cacher(response.data as T);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      throw Exception('$errorMessage: ${response.errorMessage}');
    }
  }

  Future<void> syncCategoryAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    final endpoint = '/analytics/$category/${days.value}.json';
    await _fetchAndCache(
      endpoint: endpoint,
      fetcher: (eTag) =>
          _apiClient.getCategoryAnalytics(category, days, eTag: eTag),
      cacher: (data) =>
          _database.cacheCategoryAnalytics(category, days, data.items),
      errorMessage: 'Failed to sync category analytics',
    );
  }

  // Bulk endpoints
  Future<void> syncAllData() async {
    // Sync base packages first
    await Future.wait([syncFormulae(), if (!Platform.isLinux) syncCasks()]);

    await syncTaps();
    await syncThirdPartyTapPackages();

    // Then sync analytics
    await Future.wait([
      syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days30),
      syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days90),
      syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days365),
      if (!Platform.isLinux) ...[
        syncCasksAnalytics(AnalyticsPeriod.days30),
        syncCasksAnalytics(AnalyticsPeriod.days90),
        syncCasksAnalytics(AnalyticsPeriod.days365),
      ],
    ]);
  }

  Future<void> syncFormulae() async {
    const endpoint = '/formula.json';
    await _fetchAndCache(
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getFormulaeListing(eTag: eTag),
      cacher: (data) => _database.cacheNetworkFormulae(data),
      errorMessage: 'Failed to sync formulae',
    );
  }

  Future<void> syncCasks() async {
    const endpoint = '/cask.json';
    await _fetchAndCache(
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getCasksListing(eTag: eTag),
      cacher: (data) => _database.cacheNetworkCasks(data),
      errorMessage: 'Failed to sync casks',
    );
  }

  // Example for one of the analytics endpoints
  // You would expand this for all analytics categories/days if needed
  Future<void> syncFormulaeAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    final endpoint = '/analytics/$category/homebrew-core/${days.value}.json';
    await _fetchAndCache(
      endpoint: endpoint,
      fetcher: (eTag) =>
          _apiClient.getFormulaeAnalytics(category, days, eTag: eTag),
      cacher: (data) async {
        final items = data.formulae.values.expand((e) => e).toList();
        await _database.updateFormulaeAnalyticsBatch(items, days);
      },
      errorMessage: 'Failed to sync formulae analytics',
    );
  }

  Future<void> syncCasksAnalytics(AnalyticsPeriod days) async {
    final endpoint = '/analytics/cask-install/homebrew-cask/${days.value}.json';
    await _fetchAndCache(
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getCasksAnalytics(days, eTag: eTag),
      cacher: (data) async {
        final items = data.casks.values.expand((e) => e).toList();
        await _database.updateCasksAnalyticsBatch(items, days);
      },
      errorMessage: 'Failed to sync casks analytics',
    );
  }

  // Individual endpoints
  Future<FormulaModel?> getFormula(String name) async {
    // Try network first, cache it, return it. If network fails, try DB.
    final response = await _apiClient.getFormulaDetails(name);
    if (response.status == NetworkStatus.success && response.data != null) {
      final formula = response.data!;
      await _database.cacheNetworkFormula(formula);
      return formula;
    }
    return _database.getFormula(name);
  }

  Future<CaskModel?> getCask(String token) async {
    final response = await _apiClient.getCaskDetails(token);
    if (response.status == NetworkStatus.success && response.data != null) {
      final cask = response.data!;
      await _database.cacheNetworkCask(cask);
      return cask;
    }
    return _database.getCask(token);
  }

  // Local access methods
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
    String? tapFilter,
  }) async {
    return _database.getFilteredPackages(
      query: query,
      installedOnly: installedOnly,
      type: type,
      limit: limit,
      offset: offset,
      tapFilter: tapFilter,
    );
  }

  Future<List<FormulaModel>> getAllFormulae() => _database.getAllFormulae();
  Future<List<CaskModel>> getAllCasks() => _database.getAllCasks();
  Future<List<FormulaModel>> searchFormulae(String query) =>
      _database.searchFormulae(query);
  Future<List<CaskModel>> searchCasks(String query) =>
      _database.searchCasks(query);
  Future<List<FormulaModel>> getTrendingFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _database.getMostDownloadedFormulae(period, limit: limit);
  Future<List<CaskModel>> getTrendingCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _database.getMostDownloadedCasks(period, limit: limit);
}
