import 'package:bartender/theme/bartender_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/debug/api_tester.dart';
import 'package:bartender/data/db/database.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/data/repository/package_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  final brewService = BrewService();
  final packageRepository = PackageRepository(brewService, database);

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseInterface>.value(value: database),
        Provider<BrewService>.value(value: brewService),
        Provider<PackageRepository>.value(value: packageRepository),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BartenderTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('API Tester')),
        body: const ApiTesterWidget(),
      ),
    );
  }
}
