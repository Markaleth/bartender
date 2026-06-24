import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/core/extensions/package_extensions.dart';

part 'package_states.freezed.dart';

@freezed
abstract class PackageListItemState with _$PackageListItemState {
  const PackageListItemState._();

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

  factory PackageListItemState.fromFormula(FormulaModel item) {
    return PackageListItemState(
      id: item.name,
      name: item.fullName,
      description: item.desc,
      version: item.versions.stable,
      homepage: item.homepage,
      isInstalled: item.isInstalled,
      isCask: false,
      isDeprecated: item.deprecated,
      gridModel: PackageGridMatrixState.fromFormula(item),
    );
  }

  factory PackageListItemState.fromCask(CaskModel cask) {
    return PackageListItemState(
      id: cask.token,
      name: cask.name.first,
      description: cask.desc,
      version: cask.version,
      homepage: cask.homepage,
      isInstalled: cask.isInstalled,
      isCask: true,
      isDeprecated: cask.deprecated,
      gridModel: PackageGridMatrixState.fromCask(cask),
    );
  }
}

@freezed
sealed class PackageGridMatrixState with _$PackageGridMatrixState {
  const PackageGridMatrixState._();

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

  factory PackageGridMatrixState.fromFormula(FormulaModel item) {
    return PackageGridMatrixState.formula(
      homepage: item.homepage,
      archs: item.compatibility
          .where((info) => info != CompatibilityInfo.precompiled)
          .map((info) => info.label)
          .join(', '),
      version: item.versions.stable,
      typeAndTap: 'Formula • ${item.tap}',
      fullTag: item.fullName,
      formattedInstalls: item.installs30d != null
          ? '${StringUtils.formatWithCommas(item.installs30d!)} installs'
          : 'N/A',
      license: item.license ?? 'Unknown',
      isBottle: item.versions.bottle,
    );
  }

  factory PackageGridMatrixState.fromCask(CaskModel cask) {
    return PackageGridMatrixState.cask(
      homepage: cask.homepage,
      archs: cask.compatibility
          .where((info) => info != CompatibilityInfo.precompiled)
          .map((info) => info.label)
          .join(', '),
      version: cask.version,
      typeAndTap: 'Cask • ${cask.tap ?? 'homebrew/cask'}',
      fullTag: cask.fullToken ?? cask.token,
      formattedInstalls: cask.installs30d != null
          ? '${StringUtils.formatWithCommas(cask.installs30d!)} installs'
          : 'N/A',
      autoUpdates: cask.autoUpdates == true,
      artifactType: cask.primaryArtifactType,
    );
  }
}
