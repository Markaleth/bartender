import 'package:bartender/core/enums/os_support_filter.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'packages_state.freezed.dart';

@freezed
abstract class PackagesState with _$PackagesState {
  const factory PackagesState({
    @Default('') String searchQuery,
    @Default(PackageTypeFilter.all) PackageTypeFilter packageType,
    @Default(OsSupportFilter.all) OsSupportFilter osSupport,

    @Default(FetchState.loading()) FetchState<List<dynamic>> trendingData,

    @Default(false) bool isSyncingBackground,

    @Default([]) List<dynamic> paginatedPackages,
    String? expandedPackageId,
  }) = _PackagesState;
}
