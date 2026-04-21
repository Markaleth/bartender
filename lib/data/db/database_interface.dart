import '../models/analytics/casks/casks_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/cask/cask_model.dart';
import '../models/formula/formula_model.dart';

abstract class DatabaseInterface {
  Future<void> cacheFormulae(List<FormulaModel> formulae);
  Future<void> cacheCasks(List<CaskModel> casks);

  Future<void> cacheFormula(FormulaModel formula);
  Future<void> cacheCask(CaskModel cask);

  Future<List<FormulaModel>> getAllFormulae();
  Future<List<CaskModel>> getAllCasks();

  Future<FormulaModel?> getFormula(String name);
  Future<CaskModel?> getCask(String token);

  Future<List<FormulaModel>> searchFormulae(String query);
  Future<List<CaskModel>> searchCasks(String query);

  Future<List<FormulaModel>> getFormulaeSortedAlphabetically();
  Future<List<CaskModel>> getCasksSortedAlphabetically();

  // Assuming generatedDate or another field could be used for 'created' date
  Future<List<FormulaModel>> getFormulaeSortedByDate();
  Future<List<CaskModel>> getCasksSortedByDate();

  Future<void> cacheFormulaeAnalytics(String period, List<FormulaAnalyticsItem> items);
  Future<void> cacheCasksAnalytics(String period, List<CaskAnalyticsItem> items);

  Future<List<FormulaModel>> getMostDownloadedFormulae(String period);
  Future<List<CaskModel>> getMostDownloadedCasks(String period);

  Future<String?> getETag(String endpoint);
  Future<void> saveETag(String endpoint, String etag);
}
