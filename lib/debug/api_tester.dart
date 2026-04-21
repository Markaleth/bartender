import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/api/api_client.dart';
import '../data/db/database.dart';
import '../data/repository/homebrew_repository.dart';

class ApiTesterWidget extends StatefulWidget {
  const ApiTesterWidget({super.key});

  @override
  State<ApiTesterWidget> createState() => _ApiTesterWidgetState();
}

class _ApiTesterWidgetState extends State<ApiTesterWidget> {
  late final HomebrewRepository _repository;
  String _result = 'No result yet.';

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final apiClient = ApiClient(dio);
    final database = AppDatabase();
    _repository = HomebrewRepository(apiClient, database);
  }

  void _updateResult(String message) {
    setState(() {
      _result = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Syncing Formulae Listing...');
                  try {
                    await _repository.syncFormulae();
                    final data = await _repository.getAllFormulae();
                    _updateResult(
                      'Success: Fetched and cached ${data.length} formulae. First item: ${data.isNotEmpty ? data.first.name : "None"}',
                    );
                  } catch (e) {
                    _updateResult('Error: $e');
                  }
                },
                child: const Text('syncFormulae()'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Syncing Casks Listing...');
                  try {
                    await _repository.syncCasks();
                    final data = await _repository.getAllCasks();
                    _updateResult(
                      'Success: Fetched and cached ${data.length} casks. First item: ${data.isNotEmpty ? data.first.token : "None"}',
                    );
                  } catch (e) {
                    _updateResult('Error: $e');
                  }
                },
                child: const Text('syncCasks()'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Formula Details (wget)...');
                  final formula = await _repository.getFormula('wget');
                  if (formula != null) {
                    _updateResult(
                      'Name: ${formula.name}\nDesc: ${formula.desc}\nVersions: ${formula.versions.stable}',
                    );
                  } else {
                    _updateResult('Error: Formula not found');
                  }
                },
                child: const Text("getFormula('wget')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Cask Details (google-chrome)...');
                  final cask = await _repository.getCask('google-chrome');
                  if (cask != null) {
                    _updateResult(
                      'Token: ${cask.token}\nName: ${cask.name.first}\nVersion: ${cask.version}',
                    );
                  } else {
                    _updateResult('Error: Cask not found');
                  }
                },
                child: const Text("getCask('google-chrome')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Syncing Formulae Analytics (install, 30d)...');
                  try {
                    await _repository.syncFormulaeAnalytics('install', '30d');
                    _updateResult('Success: Synced formulae analytics.');
                  } catch (e) {
                    _updateResult('Error: $e');
                  }
                },
                child: const Text("syncFormulaeAnalytics('install', '30d')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Syncing Casks Analytics (30d)...');
                  try {
                    await _repository.syncCasksAnalytics('30d');
                    _updateResult('Success: Synced casks analytics.');
                  } catch (e) {
                    _updateResult('Error: $e');
                  }
                },
                child: const Text("syncCasksAnalytics('30d')"),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.black12,
            child: SingleChildScrollView(
              child: Text(
                _result,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
