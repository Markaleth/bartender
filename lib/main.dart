import 'package:bartender/dependency_manager.dart';
import 'package:bartender/theme/bartender_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/debug/api_tester.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('API Tester')),
        body: const ApiTesterWidget(),
      ),
    );
  }
}
