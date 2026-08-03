import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';

import '../api/api_client_interface.dart';
import '../db/database_interface.dart';
import '../shell/brew_service.dart';

import 'homebrew/local_package_operations.dart';
import 'homebrew/tap_operations.dart';
import 'homebrew/catalog_operations.dart';
import 'homebrew/analytics_operations.dart';
import 'homebrew/system_operations.dart';

class HomebrewRepository implements HomebrewRepositoryInterface {
  late final LocalPackageOperations _local;
  late final TapOperations _taps;
  late final CatalogOperations _catalog;
  late final AnalyticsOperations _analytics;
  late final SystemOperations _system;

  HomebrewRepository(
    ApiClientInterface apiClient,
    DatabaseInterface database,
    BrewService brewService,
  ) {
    _local = LocalPackageOperations(brewService, database);
    _taps = TapOperations(brewService, database);
    _catalog = CatalogOperations(apiClient, database, brewService);
    _analytics = AnalyticsOperations(apiClient, database);
    _system = SystemOperations(apiClient, brewService);
  }

  // Orchestration

  @override
  Future<void> syncAllData() async {
    // Sync base packages first
    await Future.wait([
      _catalog.syncFormulae(),
      _catalog.syncCasks(),
    ]);

    await _taps.syncTaps();
    await _taps.syncThirdPartyTapPackages();

    // Then sync analytics
    await Future.wait([
      _analytics.syncFormulaeAnalytics(
        'install-on-request',
        AnalyticsPeriod.days30,
      ),
      _analytics.syncFormulaeAnalytics(
        'install-on-request',
        AnalyticsPeriod.days90,
      ),
      _analytics.syncFormulaeAnalytics(
        'install-on-request',
        AnalyticsPeriod.days365,
      ),
      _analytics.syncCasksAnalytics(AnalyticsPeriod.days30),
      _analytics.syncCasksAnalytics(AnalyticsPeriod.days90),
      _analytics.syncCasksAnalytics(AnalyticsPeriod.days365),
    ]);
  }

  // System Operations

  @override
  Future<(String, bool)> checkUpdateStatus() => _system.checkUpdateStatus();

  // Catalog Operations

  @override
  Future<void> syncFormulae() => _catalog.syncFormulae();

  @override
  Future<void> syncCasks() => _catalog.syncCasks();

  @override
  Future<FormulaModel?> getFormula(String name) => _catalog.getFormula(name);

  @override
  Future<CaskModel?> getCask(String token) => _catalog.getCask(token);

  @override
  Future<bool> isDatabaseEmpty() => _catalog.isDatabaseEmpty();

  @override
  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
    List<String>? tapFilters,
  }) => _catalog.getFilteredPackages(
    query: query,
    installedOnly: installedOnly,
    type: type,
    limit: limit,
    offset: offset,
    tapFilters: tapFilters,
  );

  // Local Package Operations

  @override
  Future<void> syncInstalledPackages() => _local.syncInstalledPackages();

  @override
  Future<String> getPrefix() => _local.getPrefix();

  @override
  Future<List<FormulaModel>> getInstalledFormulae() =>
      _local.getInstalledFormulae();

  @override
  Future<List<CaskModel>> getInstalledCasks() => _local.getInstalledCasks();

  @override
  Future<void> install(String package, {bool isCask = false}) =>
      _local.install(package, isCask: isCask);

  @override
  Future<void> uninstall(String package, {bool isCask = false}) =>
      _local.uninstall(package, isCask: isCask);

  // Analytics Operations

  @override
  Future<void> syncFormulaeAnalytics(String category, AnalyticsPeriod days) =>
      _analytics.syncFormulaeAnalytics(category, days);

  @override
  Future<void> syncCasksAnalytics(AnalyticsPeriod days) =>
      _analytics.syncCasksAnalytics(days);

  @override
  Future<List<FormulaModel>> getTrendingFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _analytics.getTrendingFormulae(period, limit: limit);

  @override
  Future<List<CaskModel>> getTrendingCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  }) => _analytics.getTrendingCasks(period, limit: limit);

  // Tap Operations

  @override
  Future<List<TapModel>> getTaps() => _taps.getTaps();

  @override
  Future<void> deleteTap(String name) => _taps.deleteTap(name);

  @override
  Future<void> syncTaps() => _taps.syncTaps();

  @override
  Future<void> syncThirdPartyTapPackages() => _taps.syncThirdPartyTapPackages();

  @override
  Future<void> syncTap(String tapName) => _taps.syncTap(tapName);

  @override
  Future<void> toggleTapTrust(String name, bool isTrusted) =>
      _taps.toggleTapTrust(name, isTrusted);

  @override
  Future<int> getTapInstalledSize(String tapName) =>
      _taps.getTapInstalledSize(tapName);
}
