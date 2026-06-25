import '../../../core/enums/analytics_period.dart';
import '../../api/api_client_interface.dart';
import '../../db/database_interface.dart';
import '../../models/analytics/category/category_analytics_model.dart';
import '../../models/formula/formula_model.dart';
import '../../models/cask/cask_model.dart';
import 'network_helper.dart';

class AnalyticsOperations {
  final ApiClientInterface _apiClient;
  final DatabaseInterface _database;

  AnalyticsOperations(this._apiClient, this._database);

  Future<void> syncCategoryAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    final endpoint = '/analytics/$category/${days.value}.json';
    await fetchAndCache(
      database: _database,
      endpoint: endpoint,
      fetcher: (eTag) =>
          _apiClient.getCategoryAnalytics(category, days, eTag: eTag),
      cacher: (data) =>
          _database.cacheCategoryAnalytics(category, days, data.items),
      errorMessage: 'Failed to sync category analytics',
    );
  }

  Future<void> syncFormulaeAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    final endpoint = '/analytics/$category/homebrew-core/${days.value}.json';
    await fetchAndCache(
      database: _database,
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
    await fetchAndCache(
      database: _database,
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getCasksAnalytics(days, eTag: eTag),
      cacher: (data) async {
        final items = data.casks.values.expand((e) => e).toList();
        await _database.updateCasksAnalyticsBatch(items, days);
      },
      errorMessage: 'Failed to sync casks analytics',
    );
  }

  Future<List<CategoryAnalyticsItem>> getCategoryAnalytics(
    String category,
    AnalyticsPeriod days,
  ) async {
    return await _database.getCategoryAnalytics(category, days);
  }

  Future<List<FormulaModel>> getTrendingFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _database.getMostDownloadedFormulae(period, limit: limit);

  Future<List<CaskModel>> getTrendingCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _database.getMostDownloadedCasks(period, limit: limit);
}
