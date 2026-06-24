import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

part 'library_ui_models.freezed.dart';

@freezed
abstract class TapSectionUiModel with _$TapSectionUiModel {
  const factory TapSectionUiModel({
    required TapModel tapModel,
    required String tapName,
    required String installPath,
    required bool isExpanded,
    required bool isSelected,
    required List<PackageItemUiModel> packages,
  }) = _TapSectionUiModel;
}

@freezed
abstract class PackageItemUiModel with _$PackageItemUiModel {
  const factory PackageItemUiModel({
    required dynamic package, // original model (FormulaModel or CaskModel)
    required String title,
    required String version,
    required bool isCask,
    required bool isHealthy,
    required bool isSelected,
  }) = _PackageItemUiModel;
}
