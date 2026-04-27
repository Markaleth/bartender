import '../../core/enums/analytics_period.dart';
import '../api/api_client_interface.dart';
import '../db/database_interface.dart';
import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../network_resource.dart';

class HomebrewRepository {
  final ApiClientInterface _apiClient;
  final DatabaseInterface _database;

  HomebrewRepository(this._apiClient, this._database);

  Future<List<CategoryAnalyticsItem>> getCategoryAnalytics(String category, AnalyticsPeriod days) async {
    return await _database.getCategoryAnalytics(category, days);
  }

  Future<void> syncCategoryAnalytics(String category, AnalyticsPeriod days) async {
    final endpoint = '/analytics/$category/${days.value}.json';
    final currentETag = await _database.getETag(endpoint);
    final response = await _apiClient.getCategoryAnalytics(category, days, eTag: currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) {
        return;
      }
      if (response.data != null) {
        await _database.cacheCategoryAnalytics(category, days, response.data!.items);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      throw Exception('Failed to sync category analytics: ${response.errorMessage}');
    }
  }

  // Bulk endpoints
  Future<void> syncAllData() async {
    final isDbEmpty = await _database.isDatabaseEmpty();
    if (isDbEmpty) {
      await Future.wait([
        syncFormulae(),
        syncCasks(),
      ]);
      await Future.wait([
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days30),
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days90),
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days365),
        syncCasksAnalytics(AnalyticsPeriod.days30),
        syncCasksAnalytics(AnalyticsPeriod.days90),
        syncCasksAnalytics(AnalyticsPeriod.days365),
      ]);
    } else {
      await Future.wait([
        syncFormulae(),
        syncCasks(),
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days30),
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days90),
        syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days365),
        syncCasksAnalytics(AnalyticsPeriod.days30),
        syncCasksAnalytics(AnalyticsPeriod.days90),
        syncCasksAnalytics(AnalyticsPeriod.days365),
      ]);
    }
  }

  Future<void> syncFormulae() async {
    const endpoint = '/formula.json';
    final currentETag = await _database.getETag(endpoint);
    final response = await _apiClient.getFormulaeListing(eTag: currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) {
        // Up to date
        return;
      }
      if (response.data != null) {
        await _database.cacheFormulae(response.data!);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      // Handle error or just ignore to use cached data
      throw Exception('Failed to sync formulae: ${response.errorMessage}');
    }
  }

  Future<void> syncCasks() async {
    const endpoint = '/cask.json';
    final currentETag = await _database.getETag(endpoint);
    final response = await _apiClient.getCasksListing(eTag: currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) {
        // Up to date
        return;
      }
      if (response.data != null) {
        await _database.cacheCasks(response.data!);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      throw Exception('Failed to sync casks: ${response.errorMessage}');
    }
  }

  // Example for one of the analytics endpoints
  // You would expand this for all analytics categories/days if needed
  Future<void> syncFormulaeAnalytics(String category, AnalyticsPeriod days) async {
    final endpoint = '/analytics/$category/homebrew-core/${days.value}.json';
    final currentETag = await _database.getETag(endpoint);
    final response = await _apiClient.getFormulaeAnalytics(category, days, eTag: currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) {
        return;
      }
      if (response.data != null) {
        final items = response.data!.formulae.values.expand((e) => e).toList();
        await _database.updateFormulaeAnalyticsBatch(items, days);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      throw Exception('Failed to sync formulae analytics: ${response.errorMessage}');
    }
  }

  Future<void> syncCasksAnalytics(AnalyticsPeriod days) async {
    final endpoint = '/analytics/cask-install/homebrew-cask/${days.value}.json';
    final currentETag = await _database.getETag(endpoint);
    final response = await _apiClient.getCasksAnalytics(days, eTag: currentETag);

    if (response.status == NetworkStatus.success) {
      if (response.statusCode == 304) {
        return;
      }
      if (response.data != null) {
        final items = response.data!.casks.values.expand((e) => e).toList();
        await _database.updateCasksAnalyticsBatch(items, days);
        if (response.eTag != null) {
          await _database.saveETag(endpoint, response.eTag!);
        }
      }
    } else {
      throw Exception('Failed to sync casks analytics: ${response.errorMessage}');
    }
  }

  // Individual endpoints
  Future<FormulaModel?> getFormula(String name) async {
    // Try network first, cache it, return it. If network fails, try DB.
    final response = await _apiClient.getFormulaDetails(name);
    if (response.status == NetworkStatus.success && response.data != null) {
      final formula = response.data!;
      await _database.cacheFormula(formula);
      return formula;
    }
    return _database.getFormula(name);
  }

  Future<CaskModel?> getCask(String token) async {
    final response = await _apiClient.getCaskDetails(token);
    if (response.status == NetworkStatus.success && response.data != null) {
      final cask = response.data!;
      await _database.cacheCask(cask);
      return cask;
    }
    return _database.getCask(token);
  }

  // Local access methods
  Future<List<FormulaModel>> getAllFormulae() => _database.getAllFormulae();
  Future<List<CaskModel>> getAllCasks() => _database.getAllCasks();
  Future<List<FormulaModel>> searchFormulae(String query) => _database.searchFormulae(query);
  Future<List<CaskModel>> searchCasks(String query) => _database.searchCasks(query);
  Future<List<FormulaModel>> getTrendingFormulae(AnalyticsPeriod period, {int limit = 10}) => _database.getMostDownloadedFormulae(period, limit: limit);
  Future<List<CaskModel>> getTrendingCasks(AnalyticsPeriod period, {int limit = 10}) => _database.getMostDownloadedCasks(period, limit: limit);
}
