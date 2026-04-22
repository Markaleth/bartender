import 'package:bartender/dependency_manager.dart';
import 'package:bartender/theme/bartender_theme.dart';
import 'package:bartender/core/routing/app_router.dart';
import 'package:bartender/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(providers: dependencyList, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BartenderTheme.darkTheme,
      navigatorKey: context.read<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
