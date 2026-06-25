import 'dart:io';

import '../../core/enums/analytics_period.dart';
import '../api/api_client_interface.dart';
import '../db/database_interface.dart';
import '../shell/brew_service.dart';

import 'homebrew/local_package_operations.dart';
import 'homebrew/tap_operations.dart';
import 'homebrew/catalog_operations.dart';
import 'homebrew/analytics_operations.dart';
import 'homebrew/system_operations.dart';

class HomebrewRepository {
  late final LocalPackageOperations local;
  late final TapOperations taps;
  late final CatalogOperations catalog;
  late final AnalyticsOperations analytics;
  late final SystemOperations system;

  HomebrewRepository(
      ApiClientInterface apiClient,
      DatabaseInterface database,
      BrewService brewService) {
    local = LocalPackageOperations(brewService, database);
    taps = TapOperations(brewService, database);
    catalog = CatalogOperations(apiClient, database);
    analytics = AnalyticsOperations(apiClient, database);
    system = SystemOperations(apiClient, brewService);
  }

  // Bulk endpoints
  Future<void> syncAllData() async {
    // Sync base packages first
    await Future.wait([
      catalog.syncFormulae(),
      if (!Platform.isLinux) catalog.syncCasks()
    ]);

    await taps.syncTaps();
    await taps.syncThirdPartyTapPackages();

    // Then sync analytics
    await Future.wait([
      analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days30),
      analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days90),
      analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days365),
      if (!Platform.isLinux) ...[
        analytics.syncCasksAnalytics(AnalyticsPeriod.days30),
        analytics.syncCasksAnalytics(AnalyticsPeriod.days90),
        analytics.syncCasksAnalytics(AnalyticsPeriod.days365),
      ],
    ]);
  }
}
