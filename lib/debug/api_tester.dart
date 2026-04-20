import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/api/api_client.dart';
import '../data/network_resource.dart';

class ApiTesterWidget extends StatefulWidget {
  const ApiTesterWidget({super.key});

  @override
  State<ApiTesterWidget> createState() => _ApiTesterWidgetState();
}

class _ApiTesterWidgetState extends State<ApiTesterWidget> {
  late final ApiClient _apiClient;
  String _result = 'No result yet.';

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    _apiClient = ApiClient(dio);
  }

  void _updateResult(String message) {
    setState(() {
      _result = message;
    });
  }

  void _handleResponse<T>(
    NetworkResource<T> response,
    String Function(T) successMessage,
  ) {
    if (response.status == NetworkStatus.success && response.data != null) {
      _updateResult(
        'Success (${response.statusCode}):\n\n${successMessage(response.data as T)}',
      );
    } else {
      _updateResult(
        'Error (${response.statusCode}):\n\n${response.errorMessage}',
      );
    }
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
                  _updateResult('Loading Formulae Listing...');
                  final res = await _apiClient.getFormulaeListing();
                  _handleResponse(
                    res,
                    (data) =>
                        'Fetched ${data.length} formulae. First item: ${data.isNotEmpty ? data.first.name : "None"}',
                  );
                },
                child: const Text('getFormulaeListing()'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Casks Listing...');
                  final res = await _apiClient.getCasksListing();
                  _handleResponse(
                    res,
                    (data) =>
                        'Fetched ${data.length} casks. First item: ${data.isNotEmpty ? data.first.token : "None"}',
                  );
                },
                child: const Text('getCasksListing()'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Formula Details (wget)...');
                  final res = await _apiClient.getFormulaDetails('wget');
                  _handleResponse(
                    res,
                    (data) =>
                        'Name: ${data.name}\nDesc: ${data.desc}\nVersions: ${data.versions.stable}',
                  );
                },
                child: const Text("getFormulaDetails('wget')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Cask Details (google-chrome)...');
                  final res = await _apiClient.getCaskDetails('google-chrome');
                  _handleResponse(
                    res,
                    (data) =>
                        'Token: ${data.token}\nName: ${data.name.first}\nVersion: ${data.version}',
                  );
                },
                child: const Text("getCaskDetails('google-chrome')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Category Analytics (install, 30d)...');
                  final res = await _apiClient.getCategoryAnalytics(
                    'install',
                    '30d',
                  );
                  _updateResult(
                    'Fetched ${res.data?.items.length ?? 0} category analytics items.',
                  );
                },
                child: const Text("getCategoryAnalytics('install', '30d')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Formulae Analytics (install, 30d)...');
                  final res = await _apiClient.getFormulaeAnalytics(
                    'install',
                    '30d',
                  );
                  _updateResult(
                    'Fetched ${res.data?.formulae.length ?? 0} formulae analytics items.',
                  );
                },
                child: const Text("getFormulaeAnalytics('install', '30d')"),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  _updateResult('Loading Casks Analytics (30d)...');
                  final res = await _apiClient.getCasksAnalytics('30d');
                  _updateResult(
                    'Fetched ${res.data?.casks.length ?? 0} cask analytics items.',
                  );
                },
                child: const Text("getCasksAnalytics('30d')"),
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
