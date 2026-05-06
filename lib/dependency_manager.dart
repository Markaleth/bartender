import 'package:bartender/core/services/hardware_service.dart';
import 'package:bartender/data/api/api_client.dart';
import 'package:bartender/data/api/api_client_interface.dart';
import 'package:bartender/data/db/database.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/services/icon_resolution/icon_resolution_service.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/core/routing/navigation_service.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> buildDependencyList(DeviceEnvironment deviceEnvironment) {
  return [
    // Hardware
    Provider<DeviceEnvironment>.value(value: deviceEnvironment),

    // Navigation
    Provider<NavigationService>(create: (_) => NavigationService()),

    // Base Services
    Provider<ApiClientInterface>(create: (_) => ApiClient.initialize()),
    Provider<DatabaseInterface>(
      create: (_) => AppDatabase(),
      dispose: (_, db) => (db as AppDatabase).close(),
    ),
    Provider<BrewService>(create: (_) => BrewService()),
    ChangeNotifierProxyProvider<BrewService, QueueViewModel>(
      create: (context) => QueueViewModel(context.read<BrewService>()),
      update: (_, brewService, previous) => previous ?? QueueViewModel(brewService),
    ),
    ProxyProvider<DatabaseInterface, IconResolutionService>(
      update: (_, db, _) => IconResolutionService(db),
    ),

    // Repositories
    ProxyProvider2<ApiClientInterface, DatabaseInterface, HomebrewRepository>(
      update: (_, apiClient, db, _) => HomebrewRepository(apiClient, db),
    ),
    ProxyProvider2<BrewService, DatabaseInterface, PackageRepository>(
      update: (_, brewService, db, _) => PackageRepository(brewService, db),
    ),
  ];
}
