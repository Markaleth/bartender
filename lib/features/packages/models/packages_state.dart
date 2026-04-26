import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/core/models/package_operations/package_operation.dart';
import 'package:bartender/data/models/analytics/category/category_analytics_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'packages_state.freezed.dart';

@freezed
abstract class PackagesState with _$PackagesState {
  const factory PackagesState({
    @Default('') String searchQuery,
    @Default(FetchState.loading()) FetchState<List<CaskModel>> casksData,
    @Default(FetchState.loading()) FetchState<List<FormulaModel>> formulaeData,
    @Default(FetchState.loading()) FetchState<List<CategoryAnalyticsItem>> trendingData,
    
    @Default([]) List<PackageOperation> operationsQueue,
  }) = _PackagesState;
}