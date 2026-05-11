import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';

part 'library_state.freezed.dart';

@freezed
abstract class LibraryState with _$LibraryState {
  const LibraryState._();

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

  bool get isSelectedPackageCask => selectedPackage is CaskModel;
  
  String get selectedPackageName {
    if (selectedPackage == null) return '';
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).token 
        : (selectedPackage as FormulaModel).name;
  }

  String get selectedPackageVersion {
    if (selectedPackage == null) return '';
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).version 
        : (selectedPackage as FormulaModel).versions.stable;
  }

  String get selectedPackageDescription {
    if (selectedPackage == null) return '';
    return isSelectedPackageCask 
        ? ((selectedPackage as CaskModel).desc ?? 'No description available') 
        : ((selectedPackage as FormulaModel).desc);
  }

  String get selectedPackageInstallPath {
    if (selectedPackage == null) return '';
    return isSelectedPackageCask
        ? '$brewPrefix/Caskroom/$selectedPackageName'
        : '$brewPrefix/Cellar/$selectedPackageName';
  }

  List<String> get selectedPackageDependencies {
    if (selectedPackage == null || isSelectedPackageCask) return [];
    return (selectedPackage as FormulaModel).dependencies;
  }
}
