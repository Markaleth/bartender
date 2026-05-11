import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';

part 'library_state.freezed.dart';

@freezed
abstract class LibraryState with _$LibraryState {
  const factory LibraryState({
    @Default(true) bool isLoading,
    @Default([]) List<FormulaModel> installedFormulae,
    @Default([]) List<CaskModel> installedCasks,
    dynamic selectedPackage,
    @Default('0 B') String systemStorageUsed,
    @Default(0) int orphanedDependenciesCount,
    @Default(100) int globalHealthScore,
    @Default('/opt/homebrew') String brewPrefix,
  }) = _LibraryState;
}
