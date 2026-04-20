import 'package:bartender/theme/bartender_theme.dart';
import 'package:flutter/material.dart';
import 'package:bartender/debug/api_tester.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: BartenderTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(title: const Text('API Tester')),
        body: const ApiTesterWidget(),
      ),
    );
  }
}
