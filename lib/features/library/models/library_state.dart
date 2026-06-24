import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'library_ui_models.dart';

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
    @Default('/opt/homebrew') String brewPrefix,
    @Default(false) bool isSyncing,
    @Default('') String filterQuery,
    @Default(<String>{}) Set<String> expandedTaps,
  }) = _LibraryState;

  List<FormulaModel> get filteredFormulae {
    if (filterQuery.isEmpty) return installedFormulae;
    return installedFormulae
        .where((f) => f.name.toLowerCase().contains(filterQuery.toLowerCase()))
        .toList();
  }

  List<CaskModel> get filteredCasks {
    if (filterQuery.isEmpty) return installedCasks;
    return installedCasks
        .where((c) => c.token.toLowerCase().contains(filterQuery.toLowerCase()))
        .toList();
  }

  List<TapModel> get filteredTaps {
    if (filterQuery.isEmpty) return installedTaps;
    return installedTaps
        .where((t) => t.name.toLowerCase().contains(filterQuery.toLowerCase()))
        .toList();
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

  List<TapSectionUiModel> get uiSections {
    final tapEntries = packagesByTap.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return tapEntries.map((entry) {
      final tapName = entry.key;
      final packages = entry.value;

      final tapModel = installedTaps.firstWhere(
        (t) => t.name == tapName,
        orElse: () => TapModel(
          name: tapName,
          user: tapName.split('/').firstOrNull ?? '',
          repo: tapName.split('/').skip(1).firstOrNull ?? '',
          path: '$brewPrefix/Library/Taps/$tapName',
        ),
      );

      final isExpanded = expandedTaps.contains(tapName);
      final isSelected =
          selectedPackage is TapModel &&
          (selectedPackage as TapModel).name == tapName;

      final packageItems = packages.map((package) {
        String title = '';
        String version = '';
        bool isCask = false;
        bool isHealthy = true;

        if (package is FormulaModel) {
          title = package.name;
          version = package.versions.stable;
          isCask = false;
          isHealthy =
              (package.deprecated ||
              package.outdated ||
              package.missingDeps.isNotEmpty ||
              package.disabled);
        } else if (package is CaskModel) {
          title = package.token;
          version = package.version;
          isCask = true;
        }

        return PackageItemUiModel(
          package: package,
          title: title,
          version: version,
          isCask: isCask,
          isHealthy: isHealthy,
          isSelected: selectedPackage == package,
        );
      }).toList();

      return TapSectionUiModel(
        tapModel: tapModel,
        tapName: tapName,
        installPath: tapModel.path,
        isExpanded: isExpanded,
        isSelected: isSelected,
        packages: packageItems,
      );
    }).toList();
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

  List<String> get selectedPackageDependencies =>
      (selectedPackage == null || isSelectedPackageCask || isSelectedPackageTap)
      ? []
      : (selectedPackage as FormulaModel).dependencies;

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

  bool get selectedPackageIsMissingDeps {
    if (selectedPackage == null || isSelectedPackageTap) return false;
    final missingDeps = isSelectedPackageCask
        ? (selectedPackage as CaskModel).missingDeps
        : (selectedPackage as FormulaModel).missingDeps;
    return missingDeps.isNotEmpty;
  }

  bool get selectedPackageIsDisabled {
    if (selectedPackage == null || isSelectedPackageTap) return false;
    return isSelectedPackageCask
        ? (selectedPackage as CaskModel).disabled
        : (selectedPackage as FormulaModel).disabled;
  }
}
