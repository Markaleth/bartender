import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/core/extensions/package_extensions.dart';

part 'trending_package_state.freezed.dart';

@freezed
abstract class TrendingPackageState with _$TrendingPackageState {
  const TrendingPackageState._();

  const factory TrendingPackageState({
    required String id,
    required String? description,
    required String version,
    required String? homepage,
    required String? formattedDownloads,
    required bool isInstalled,
    required bool isFormula,
    required bool isSupported,
  }) = _TrendingPackageState;

  factory TrendingPackageState.fromFormula(FormulaModel item) {
    return TrendingPackageState(
      id: item.fullName,
      description: item.desc,
      version: item.versions.stable,
      homepage: item.homepage,
      formattedDownloads: StringUtils.formatDownloads(item.installs30d),
      isInstalled: item.isInstalled,
      isFormula: true,
      isSupported: item.isSupportedOnCurrentOs,
    );
  }

  factory TrendingPackageState.fromCask(CaskModel cask) {
    return TrendingPackageState(
      id: cask.fullToken,
      description: cask.desc,
      version: cask.version,
      homepage: cask.homepage,
      formattedDownloads: StringUtils.formatDownloads(cask.installs30d),
      isInstalled: cask.isInstalled,
      isFormula: false,
      isSupported: cask.isSupportedOnCurrentOs,
    );
  }
}
