import '../../core/enums/analytics_period.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';
import '../models/icon_cache/resolved_icon.dart';

import '../models/analytics/category/category_analytics_model.dart';
import '../../core/enums/package_type_filter.dart';
import '../../core/enums/os_support_filter.dart';

abstract class DatabaseInterface {
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    OsSupportFilter osSupport = OsSupportFilter.all,
    int limit = 50,
    int offset = 0,
  });

  Future<void> cacheFormulae(List<FormulaModel> formulae);
  Future<void> cacheCasks(List<CaskModel> casks);

  Future<void> cacheFormula(FormulaModel formula);
  Future<void> cacheCask(CaskModel cask);

  Future<List<FormulaModel>> getAllFormulae();
  Future<List<CaskModel>> getAllCasks();

  Future<FormulaModel?> getFormula(String name);
  Future<CaskModel?> getCask(String token);

  Future<List<FormulaModel>> searchFormulae(String query);
  Future<List<CaskModel>> searchCasks(String query);

  Future<List<FormulaModel>> getFormulaeSortedAlphabetically();
  Future<List<CaskModel>> getCasksSortedAlphabetically();

  Future<List<FormulaModel>> getInstalledFormulae();
  Future<List<CaskModel>> getInstalledCasks();

  // Assuming generatedDate or another field could be used for 'created' date
  Future<List<FormulaModel>> getFormulaeSortedByDate();
  Future<List<CaskModel>> getCasksSortedByDate();

  Future<void> cacheCategoryAnalytics(String category, AnalyticsPeriod period, List<CategoryAnalyticsItem> items);

  Future<void> updateFormulaInstallationStatus(String name, bool isInstalled);
  Future<void> updateCaskInstallationStatus(String token, bool isInstalled);
  Future<void> resetAllInstallationStatuses();

  Future<void> updateFormulaAnalytics(String name, int installs, AnalyticsPeriod period);
  Future<void> updateCaskAnalytics(String token, int installs, AnalyticsPeriod period);
  
  Future<void> updateFormulaeAnalyticsBatch(List<FormulaAnalyticsItem> items, AnalyticsPeriod period);
  Future<void> updateCasksAnalyticsBatch(List<CaskAnalyticsItem> items, AnalyticsPeriod period);

  Future<List<FormulaModel>> getMostDownloadedFormulae(AnalyticsPeriod period, {int limit = 10});
  Future<List<CaskModel>> getMostDownloadedCasks(AnalyticsPeriod period, {int limit = 10});
  Future<List<CategoryAnalyticsItem>> getCategoryAnalytics(String category, AnalyticsPeriod period);

  Future<String?> getETag(String endpoint);
  Future<void> saveETag(String endpoint, String etag);

  Future<void> purgeAllData();
  Future<void> deleteDatabaseFile();
  Future<bool> isDatabaseEmpty();

  Future<void> saveIconCache(String packageName, String? iconUrl, bool isSvg);
  Future<ResolvedIcon?> getIconCache(String packageName);
}
