import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/features/packages/models/trending_package_state.dart';
import 'package:bartender/features/packages/models/package_states.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'packages_state.freezed.dart';

@freezed
abstract class PackagesState with _$PackagesState {
  const PackagesState._();

  const factory PackagesState({
    @Default(AnalyticsPeriod.days30) AnalyticsPeriod analyticsPeriod,
    @Default('') String searchQuery,
    @Default(PackageTypeFilter.all) PackageTypeFilter packageType,

    @Default(FetchState.loading()) FetchState<List<List<TrendingPackageState>>> trendingData,

    @Default(false) bool isSyncingBackground,

    @Default([]) List<PackageListItemState> paginatedPackages,
    String? expandedPackageId,

    @Default([]) List<TapModel> taps,
  }) = _PackagesState;

  Set<String> get uniqueTapNames =>
      taps.where((t) => t.trusted).map((t) => t.name).toSet();
}
