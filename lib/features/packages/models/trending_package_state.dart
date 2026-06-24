import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_package_state.freezed.dart';

@freezed
abstract class TrendingPackageState with _$TrendingPackageState {
  const factory TrendingPackageState({
    required String id,
    required String? description,
    required String version,
    required String? homepage,
    required String? formattedDownloads,
    required bool isInstalled,
    required bool isFormula,
  }) = _TrendingPackageState;
}
