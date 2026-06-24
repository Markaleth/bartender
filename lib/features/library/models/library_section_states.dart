import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

part 'library_section_states.freezed.dart';

@freezed
abstract class TapSectionState with _$TapSectionState {
  const factory TapSectionState({
    required TapModel tapModel,
    required String tapName,
    required String installPath,
    required bool isExpanded,
    required bool isSelected,
    required List<PackageItemState> packages,
  }) = _TapSectionState;
}

@freezed
abstract class PackageItemState with _$PackageItemState {
  const factory PackageItemState({
    required dynamic package, // original model (FormulaModel or CaskModel)
    required String title,
    required String version,
    required bool isCask,
    required bool isHealthy,
    required bool isSelected,
  }) = _PackageItemState;
}
