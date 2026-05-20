import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/features/library/models/system_health_state.dart';

part 'library_state.freezed.dart';

@freezed
abstract class LibraryState with _$LibraryState {
  const LibraryState._();

  const factory LibraryState({
    @Default(true) bool isLoading,
    @Default([]) List<FormulaModel> installedFormulae,
    @Default([]) List<CaskModel> installedCasks,
    @Default([]) List<TapModel> installedTaps,
    dynamic selectedPackage,
    @Default(SystemHealthState()) SystemHealthState healthState,
    @Default('/opt/homebrew') String brewPrefix,
    @Default(false) bool isSyncing,
    @Default('') String filterQuery,
    @Default(<String>{}) Set<String> expandedTaps,
  }) = _LibraryState;

  List<FormulaModel> get filteredFormulae {
    if (filterQuery.isEmpty) return installedFormulae;
    return installedFormulae.where((f) => f.name.toLowerCase().contains(filterQuery.toLowerCase())).toList();
  }

  List<CaskModel> get filteredCasks {
    if (filterQuery.isEmpty) return installedCasks;
    return installedCasks.where((c) => c.token.toLowerCase().contains(filterQuery.toLowerCase())).toList();
  }

  List<TapModel> get filteredTaps {
    if (filterQuery.isEmpty) return installedTaps;
    return installedTaps.where((t) => t.name.toLowerCase().contains(filterQuery.toLowerCase())).toList();
  }

  Map<String, List<dynamic>> get packagesByTap {
    final map = <String, List<dynamic>>{};
    for (final formula in filteredFormulae) {
      map.putIfAbsent(formula.tap, () => []).add(formula);
    }
    for (final cask in filteredCasks) {
      final tapName = cask.tap ?? 'homebrew/cask';
      map.putIfAbsent(tapName, () => []).add(cask);
    }
    return map;
  }

  bool get isSelectedPackageCask => selectedPackage is CaskModel;
  bool get isSelectedPackageTap => selectedPackage is TapModel;
  
  String get selectedPackageName {
    if (selectedPackage == null) return '';
    if (isSelectedPackageTap) return (selectedPackage as TapModel).name;
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).token 
        : (selectedPackage as FormulaModel).name;
  }

  String get selectedPackageVersion {
    if (selectedPackage == null) return '';
    if (isSelectedPackageTap) return '';
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).version 
        : (selectedPackage as FormulaModel).versions.stable;
  }

  String get selectedPackageDescription {
    if (selectedPackage == null) return '';
    if (isSelectedPackageTap) return 'Brew Tap';
    return isSelectedPackageCask 
        ? ((selectedPackage as CaskModel).desc ?? 'No description available') 
        : ((selectedPackage as FormulaModel).desc);
  }

  String get selectedPackageInstallPath {
    if (selectedPackage == null) return '';
    if (isSelectedPackageTap) return (selectedPackage as TapModel).path;
    return isSelectedPackageCask
        ? '$brewPrefix/Caskroom/$selectedPackageName'
        : '$brewPrefix/Cellar/$selectedPackageName';
  }

  List<String> get selectedPackageDependencies {
    if (selectedPackage == null || isSelectedPackageCask || isSelectedPackageTap) return [];
    return (selectedPackage as FormulaModel).dependencies;
  }

  bool get selectedPackageIsDeprecated {
    if (selectedPackage == null || isSelectedPackageTap) return false;
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).deprecated 
        : (selectedPackage as FormulaModel).deprecated;
  }

  bool get selectedPackageIsOutdated {
    if (selectedPackage == null || isSelectedPackageTap) return false;
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).outdated 
        : (selectedPackage as FormulaModel).outdated;
  }

  List<String> get selectedPackageMissingDeps {
    if (selectedPackage == null || isSelectedPackageTap) return [];
    return isSelectedPackageCask 
        ? (selectedPackage as CaskModel).missingDeps 
        : (selectedPackage as FormulaModel).missingDeps;
  }
}
