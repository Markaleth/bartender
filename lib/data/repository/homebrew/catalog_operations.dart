import 'dart:convert';
import '../../../core/enums/package_type_filter.dart';
import '../../api/api_client_interface.dart';
import '../../db/database_interface.dart';
import '../../models/formula/formula_model.dart';
import '../../models/cask/cask_model.dart';
import '../../shell/brew_service.dart';
import 'network_helper.dart';

class CatalogOperations {
  final ApiClientInterface _apiClient;
  final DatabaseInterface _database;
  final BrewService _brewService;

  CatalogOperations(this._apiClient, this._database, this._brewService);

  Future<void> syncFormulae() async {
    const endpoint = '/formula.json';
    await fetchAndCache(
      database: _database,
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getFormulaeListing(eTag: eTag),
      cacher: (data) => _database.cacheNetworkFormulae(data),
      errorMessage: 'Failed to sync formulae',
    );
  }

  Future<void> syncCasks() async {
    const endpoint = '/cask.json';
    await fetchAndCache(
      database: _database,
      endpoint: endpoint,
      fetcher: (eTag) => _apiClient.getCasksListing(eTag: eTag),
      cacher: (data) => _database.cacheNetworkCasks(data),
      errorMessage: 'Failed to sync casks',
    );
  }

  Future<FormulaModel?> getFormula(String name) async {
    final result = await _brewService.info(name);
    if (result.exitCode == 0) {
      try {
        final Map<String, dynamic> json = jsonDecode(result.stdout);
        final formulaeList = json['formulae'] as List<dynamic>?;
        if (formulaeList != null && formulaeList.isNotEmpty) {
          final formula = FormulaModel.fromJson(
            formulaeList.first as Map<String, dynamic>,
          );
          await _database.cacheNetworkFormula(formula);
          return formula;
        }
      } catch (e) {
        // Fall back to database on parsing error
      }
    }
    return _database.getFormula(name);
  }

  Future<CaskModel?> getCask(String token) async {
    final result = await _brewService.info(token);
    if (result.exitCode == 0) {
      try {
        final Map<String, dynamic> json = jsonDecode(result.stdout);
        final casksList = json['casks'] as List<dynamic>?;
        if (casksList != null && casksList.isNotEmpty) {
          final cask = CaskModel.fromJson(
            casksList.first as Map<String, dynamic>,
          );
          await _database.cacheNetworkCask(cask);
          return cask;
        }
      } catch (e) {
        // Fall back to database on parsing error
      }
    }
    return _database.getCask(token);
  }

  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    bool installedOnly = false,
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
    List<String>? tapFilters,
  }) async {
    return _database.getFilteredPackages(
      query: query,
      installedOnly: installedOnly,
      type: type,
      limit: limit,
      offset: offset,
      tapFilters: tapFilters,
    );
  }

  Future<List<FormulaModel>> getAllFormulae() => _database.getAllFormulae();
  Future<List<CaskModel>> getAllCasks() => _database.getAllCasks();
  Future<List<FormulaModel>> searchFormulae(String query) =>
      _database.searchFormulae(query);
  Future<List<CaskModel>> searchCasks(String query) =>
      _database.searchCasks(query);

  Future<bool> isDatabaseEmpty() async {
    return await _database.isDatabaseEmpty();
  }
}
