

import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';

abstract interface class ApiClientInterface {

  // Listing and details functions:  
  Future<List<FormulaModel>> getFormulaeListing(); // https://formulae.brew.sh/api/formula.json
  Future<List<CaskModel>> getCasksListing();  // https://formulae.brew.sh/api/cask.json
  Future<FormulaModel> getFormulaDetails(String formula); // https://formulae.brew.sh/api/formula/${FORMULA}.json
  Future<CaskModel> getCaskDetails(String cask);  // https://formulae.brew.sh/api/cask/${CASK}.json

//analytics functions:

/// Variables:
/// ${CATEGORY}: the analytics event category, i.e.
/// install: the installation of all formulae
/// install-on-request: the requested installation of all formulae (i.e. not as a dependency of other formulae)
/// build-error: the installation failure of all formulae
/// ${DAYS}: the number of days of analytics events, i.e.
/// 30d: 30 days
/// 90d: 90 days
/// 365d: 365 days
  Future<dynamic> getCategoryAnalytics(); // curl https://formulae.brew.sh/api/analytics/${CATEGORY}/${DAYS}.json
  Future<dynamic> getFormulaeAnalytics(); // curl https://formulae.brew.sh/api/analytics/formulae/${DAYS}.json
  Future<dynamic> getCasksAnalytics(); // curl https://formulae.brew.sh/api/analytics/casks/${DAYS}.json
}