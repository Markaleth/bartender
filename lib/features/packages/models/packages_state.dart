import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'packages_state.freezed.dart';

@freezed
abstract class PackagesState with _$PackagesState {
  const PackagesState._();

  const factory PackagesState({
    @Default('') String searchQuery,
    @Default(PackageTypeFilter.all) PackageTypeFilter packageType,

    @Default(FetchState.loading()) FetchState<List<dynamic>> trendingData,

    @Default(false) bool isSyncingBackground,

    @Default([]) List<dynamic> paginatedPackages,
    String? expandedPackageId,

    @Default([]) List<TapModel> taps,
  }) = _PackagesState;

  Set<String> get uniqueTapNames => taps.map((t) => t.name).toSet();
}
