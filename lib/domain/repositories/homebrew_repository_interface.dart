import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

abstract class HomebrewRepositoryInterface {
  // Orchestration
  Future<void> syncAllData();

  // System Operations
  Future<(String, bool)> checkUpdateStatus();

  // Catalog Operations
  Future<void> syncFormulae();
  Future<void> syncCasks();
  Future<FormulaModel?> getFormula(String name);
  Future<CaskModel?> getCask(String token);
  Future<bool> isDatabaseEmpty();
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
    List<String>? tapFilters,
  });

  // Local Package Operations
  Future<void> syncInstalledPackages();
  Future<String> getPrefix();
  Future<List<FormulaModel>> getInstalledFormulae();
  Future<List<CaskModel>> getInstalledCasks();
  Future<void> install(String package, {bool isCask = false});
  Future<void> uninstall(String package, {bool isCask = false});

  // Analytics Operations
  Future<void> syncFormulaeAnalytics(String category, AnalyticsPeriod days);
  Future<void> syncCasksAnalytics(AnalyticsPeriod days);
  Future<List<FormulaModel>> getTrendingFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  });
  Future<List<CaskModel>> getTrendingCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  });

  // Tap Operations
  Future<List<TapModel>> getTaps();
  Future<void> deleteTap(String name);
  Future<void> syncTaps();
  Future<void> syncThirdPartyTapPackages();
  Future<void> syncTap(String tapName);
  Future<void> toggleTapTrust(String name, bool isTrusted);
  Future<int> getTapInstalledSize(String tapName);
}
