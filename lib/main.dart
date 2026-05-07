import 'package:bartender/core/services/hardware_service.dart';
import 'package:bartender/dependency_manager.dart';
import 'package:bartender/theme/bartender_theme.dart';
import 'package:bartender/core/routing/app_router.dart';
import 'package:bartender/core/routing/navigation_service.dart';
import 'package:bartender/features/queue/views/terminal_drawer_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hardwareEnvironment = LinuxHardwareEnvironment();
  await hardwareEnvironment.init();

  runApp(
    MultiProvider(
      providers: buildDependencyList(hardwareEnvironment),
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
      navigatorKey: context.read<NavigationService>().navigatorKey,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.home,
      builder: (context, child) {
        return Stack(
          children: [
            child ?? const SizedBox.shrink(),
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: TerminalDrawerOverlay(),
            ),
          ],
        );
      },
    );
  }
}
