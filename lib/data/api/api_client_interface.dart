

import '../../core/enums/analytics_period.dart';
import '../models/formula/formula_model.dart';
import '../models/cask/cask_model.dart';
import '../models/analytics/category/category_analytics_model.dart';
import '../models/analytics/formulae/formulae_analytics_model.dart';
import '../models/analytics/casks/casks_analytics_model.dart';
import '../network_resource.dart';

abstract interface class ApiClientInterface {

  // Listing and details functions:  
  Future<NetworkResource<List<FormulaModel>>> getFormulaeListing({String? eTag}); // https://formulae.brew.sh/api/formula.json
  Future<NetworkResource<List<CaskModel>>> getCasksListing({String? eTag});  // https://formulae.brew.sh/api/cask.json
  Future<NetworkResource<FormulaModel>> getFormulaDetails(String formula); // https://formulae.brew.sh/api/formula/${FORMULA}.json
  Future<NetworkResource<CaskModel>> getCaskDetails(String cask);  // https://formulae.brew.sh/api/cask/${CASK}.json

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
  Future<NetworkResource<CategoryAnalyticsResponse>> getCategoryAnalytics(String category, AnalyticsPeriod days, {String? eTag}); // curl https://formulae.brew.sh/api/analytics/${CATEGORY}/${DAYS}.json
  Future<NetworkResource<FormulaeAnalyticsResponse>> getFormulaeAnalytics(String category, AnalyticsPeriod days, {String? eTag}); // curl https://formulae.brew.sh/api/analytics/${CATEGORY}/homebrew-core/${DAYS}.json
  Future<NetworkResource<CasksAnalyticsResponse>> getCasksAnalytics(AnalyticsPeriod days, {String? eTag}); // curl https://formulae.brew.sh/api/analytics/cask-install/homebrew-cask/${DAYS}.json
}