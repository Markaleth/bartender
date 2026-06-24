import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_states.freezed.dart';

@freezed
abstract class PackageListItemState with _$PackageListItemState {
  const factory PackageListItemState({
    required String id,
    required String name,
    required String? description,
    required String version,
    required String? homepage,
    required bool isInstalled,
    required bool isCask,
    required bool isDeprecated,
    required PackageGridMatrixState gridModel,
  }) = _PackageListItemState;
}

@freezed
sealed class PackageGridMatrixState with _$PackageGridMatrixState {
  const factory PackageGridMatrixState.cask({
    required String? homepage,
    required String archs,
    required String version,
    required String typeAndTap,
    required String fullTag,
    required String formattedInstalls,
    required bool autoUpdates,
    required String artifactType,
  }) = _CaskGrid;

  const factory PackageGridMatrixState.formula({
    required String? homepage,
    required String archs,
    required String version,
    required String typeAndTap,
    required String fullTag,
    required String formattedInstalls,
    required String license,
    required bool isBottle,
  }) = _FormulaGrid;
}
