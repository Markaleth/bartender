import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/enums/analytics_period.dart';
import '../data/api/api_client_interface.dart';
import '../data/db/database_interface.dart';
import '../domain/repositories/homebrew_repository_interface.dart';
import '../data/network_resource.dart';

class ApiTesterWidget extends StatefulWidget {
  const ApiTesterWidget({super.key});

  @override
  State<ApiTesterWidget> createState() => _ApiTesterWidgetState();
}

class _ApiTesterWidgetState extends State<ApiTesterWidget> {
  late final ApiClientInterface _apiClient;
  late final DatabaseInterface _database;
  late final HomebrewRepositoryInterface _repository;
  String _result = 'No result yet.';
  bool _isDbEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _apiClient = Provider.of<ApiClientInterface>(context, listen: false);
    _database = Provider.of<DatabaseInterface>(context, listen: false);
    _repository = Provider.of<HomebrewRepositoryInterface>(context, listen: false);
    _checkDbState();
  }

  Future<void> _checkDbState() async {
    final isEmpty = await _database.isDatabaseEmpty();
    if (mounted) {
      setState(() {
        _isDbEmpty = isEmpty;
      });
    }
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
          flex: 2,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          const Text(
                            'API Calls',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const Divider(),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult('API: getFormulaeListing()...');
                              try {
                                final res = await _apiClient
                                    .getFormulaeListing();
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.length} items.',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text('getFormulaeListing()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult('API: getCasksListing()...');
                              try {
                                final res = await _apiClient.getCasksListing();
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.length} items.',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text('getCasksListing()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult(
                                'API: getFormulaDetails("wget")...',
                              );
                              try {
                                final res = await _apiClient.getFormulaDetails(
                                  'wget',
                                );
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.name} - ${res.data?.desc}',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text('getFormulaDetails("wget")'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult(
                                'API: getCaskDetails("google-chrome")...',
                              );
                              try {
                                final res = await _apiClient.getCaskDetails(
                                  'google-chrome',
                                );
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.token} - ${res.data?.name.first}',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text(
                              'getCaskDetails("google-chrome")',
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult(
                                'API: getFormulaeAnalytics("install", AnalyticsPeriod.days30)...',
                              );
                              try {
                                final res = await _apiClient
                                    .getFormulaeAnalytics(
                                      'install',
                                      AnalyticsPeriod.days30,
                                    );
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.totalItems} items.',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text('getFormulaeAnalytics()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () async {
                              _updateResult(
                                'API: getCasksAnalytics(AnalyticsPeriod.days30)...',
                              );
                              try {
                                final res = await _apiClient.getCasksAnalytics(
                                  AnalyticsPeriod.days30,
                                );
                                if (res.status == NetworkStatus.success) {
                                  _updateResult(
                                    'Success: ${res.data?.totalItems} items.',
                                  );
                                } else {
                                  _updateResult('Error: ${res.errorMessage}');
                                }
                              } catch (e) {
                                _updateResult('Error: $e');
                              }
                            },
                            child: const Text('getCasksAnalytics()'),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: [
                          const Text(
                            'Database Calls',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const Divider(),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult('DB: getAllFormulae()...');
                                    try {
                                      final res = await _database
                                          .getAllFormulae();
                                      _updateResult(
                                        'Success: ${res.length} items.',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getAllFormulae()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult('DB: getAllCasks()...');
                                    try {
                                      final res = await _database.getAllCasks();
                                      _updateResult(
                                        'Success: ${res.length} items.',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getAllCasks()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult(
                                      'DB: getInstalledFormulae()...',
                                    );
                                    try {
                                      final res = await _database
                                          .getInstalledFormulae();
                                      final names = res
                                          .map((f) => f.name)
                                          .take(10)
                                          .join(', ');
                                      _updateResult(
                                        'Success: ${res.length} installed formulae.\n\nSample: $names${res.length > 10 ? '...' : ''}',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getInstalledFormulae()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult('DB: getInstalledCasks()...');
                                    try {
                                      final res = await _database
                                          .getInstalledCasks();
                                      final tokens = res
                                          .map((c) => c.token)
                                          .take(10)
                                          .join(', ');
                                      _updateResult(
                                        'Success: ${res.length} installed casks.\n\nSample: $tokens${res.length > 10 ? '...' : ''}',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getInstalledCasks()'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult('DB: getFormula("wget")...');
                                    try {
                                      final res = await _database.getFormula(
                                        'wget',
                                      );
                                      _updateResult(
                                        'Success: ${res?.name} - ${res?.desc}',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getFormula("wget")'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult(
                                      'DB: getCask("google-chrome")...',
                                    );
                                    try {
                                      final res = await _database.getCask(
                                        'google-chrome',
                                      );
                                      _updateResult(
                                        'Success: ${res?.token} - ${res?.name.first}',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getCask("google-chrome")'),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: _isDbEmpty
                                ? null
                                : () async {
                                    _updateResult(
                                      'DB: getMostDownloadedFormulae(AnalyticsPeriod.days30)...',
                                    );
                                    try {
                                      final res = await _database
                                          .getMostDownloadedFormulae(
                                            AnalyticsPeriod.days30,
                                          );
                                      _updateResult(
                                        'Success: ${res.length} items.',
                                      );
                                    } catch (e) {
                                      _updateResult('Error: $e');
                                    }
                                  },
                            child: const Text('getMostDownloadedFormulae()'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Repository & Management',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          direction: Axis.vertical,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult('Repository: syncFormulae()...');
                                try {
                                  await _repository.syncFormulae();
                                  _updateResult('Success: synced formulae.');
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('syncFormulae()'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult('Repository: syncCasks()...');
                                try {
                                  await _repository.syncCasks();
                                  _updateResult('Success: synced casks.');
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('syncCasks()'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'Repository: getFormula("wget")...',
                                );
                                try {
                                  final formula = await _repository.getFormula(
                                    'wget',
                                  );
                                  _updateResult(
                                    'Success: ${formula?.name} - ${formula?.desc}',
                                  );
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('getFormula("wget")'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'Repository: getCask("google-chrome")...',
                                );
                                try {
                                  final cask = await _repository.getCask(
                                    'google-chrome',
                                  );
                                  _updateResult(
                                    'Success: ${cask?.token} - ${cask?.name.first}',
                                  );
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('getCask("google-chrome")'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'Repository: syncFormulaeAnalytics()...',
                                );
                                try {
                                  await _repository.syncFormulaeAnalytics(
                                    'install',
                                    AnalyticsPeriod.days30,
                                  );
                                  _updateResult(
                                    'Success: synced formula analytics.',
                                  );
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('syncFormulaeAnalytics()'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'Repository: syncCasksAnalytics()...',
                                );
                                try {
                                  await _repository.syncCasksAnalytics(
                                    AnalyticsPeriod.days30,
                                  );
                                  _updateResult(
                                    'Success: synced casks analytics.',
                                  );
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('syncCasksAnalytics()'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'PackageRepo: syncInstalledPackages()...',
                                );
                                try {
                                  await _repository.syncInstalledPackages();
                                  _updateResult(
                                    'Success: synced installed packages.',
                                  );
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('syncInstalledPackages()'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'PackageRepo: install("wget")...',
                                );
                                try {
                                  await _repository.install('wget');
                                  _updateResult('Success: installed wget.');
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('install("wget")'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                _updateResult(
                                  'PackageRepo: uninstall("wget")...',
                                );
                                try {
                                  await _repository.uninstall('wget');
                                  _updateResult('Success: uninstalled wget.');
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text('Uninstall("wget")'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                              onPressed: () async {
                                _updateResult('Purging Database...');
                                try {
                                  await _database.purgeAllData();
                                  _updateResult('Success: database purged.');
                                  await _checkDbState();
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text(
                                'Purge Database',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.withValues(
                                  alpha: 0.1,
                                ),
                              ),
                              onPressed: () async {
                                _updateResult('Deleting Database File...');
                                try {
                                  await _database.deleteDatabaseFile();
                                  _updateResult(
                                    'Success: database file deleted. Please restart the app.',
                                  );
                                } catch (e) {
                                  _updateResult('Error: $e');
                                }
                              },
                              child: const Text(
                                'Delete DB File',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
