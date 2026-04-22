import 'package:flutter/material.dart';
import 'package:bartender/debug/api_tester.dart';

class AppRoutes {
  static const String home = '/';

}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: SafeArea(child: ApiTesterWidget()),
          ),
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
