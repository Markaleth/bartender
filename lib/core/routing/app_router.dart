import 'package:flutter/material.dart';
import 'package:bartender/features/home/home_view.dart';
import 'package:bartender/features/startup/views/startup_view.dart';

class AppRoutes {
  static const String startup = '/startup';
  static const String home = '/';
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.startup:
        return MaterialPageRoute(
          builder: (_) => const StartupView(),
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
