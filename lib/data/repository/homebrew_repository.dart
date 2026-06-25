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
}
