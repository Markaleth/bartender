import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';

enum CompatibilityInfo {
  appleSilicon('Apple Silicon'),
  intelMac('Intel Mac'),
  linux('Linux'),
  precompiled('Precompiled');

  final String label;
  const CompatibilityInfo(this.label);
}

List<CompatibilityInfo> getFormulaCompatibility(FormulaModel formula) {
  final Set<CompatibilityInfo> info = {};

  final bottle = formula.bottle;
  final stableFiles = bottle?['stable']?['files'] as Map<String, dynamic>?;
  final variations = formula.variations;

  if (_hasPrecompiledFormula(stableFiles)) {
    info.add(CompatibilityInfo.precompiled);
  }

  final keys = [...?stableFiles?.keys, ...?variations?.keys];

  if (_hasArm64Mac(keys)) info.add(CompatibilityInfo.appleSilicon);
  if (_hasIntelMac(keys)) info.add(CompatibilityInfo.intelMac);
  if (_hasLinux(keys)) info.add(CompatibilityInfo.linux);

  return info.toList();
}

bool _hasPrecompiledFormula(Map<String, dynamic>? stableFiles) {
  return stableFiles != null && stableFiles.isNotEmpty;
}

bool _hasArm64Mac(Iterable<String> keys) {
  return keys.any((key) => key.startsWith('arm64_') && !key.endsWith('_linux'));
}

bool _hasIntelMac(Iterable<String> keys) {
  return keys.any(
    (key) =>
        !key.endsWith('_linux') && !key.startsWith('arm64_') && key != 'all',
  );
}

bool _hasLinux(Iterable<String> keys) {
  return keys.any((key) => key.endsWith('_linux'));
}

List<CompatibilityInfo> getCaskCompatibility(CaskModel cask) {
  final Set<CompatibilityInfo> info = {CompatibilityInfo.precompiled};

  final url = cask.url?.toLowerCase() ?? '';
  final variations = cask.variations;

  if (_hasCaskArmIndicators(url, variations)) {
    info.add(CompatibilityInfo.appleSilicon);
  }

  if (_hasCaskIntelIndicators(url, variations)) {
    info.add(CompatibilityInfo.intelMac);
  }

  return info.toList();
}

bool _hasCaskArmIndicators(String url, Map<String, dynamic>? variations) {
  if (RegExp(r'universal|arm64|aarch64|m1|m2').hasMatch(url)) return true;
  return variations?.keys.any((k) => k.contains('arm64')) ?? false;
}

bool _hasCaskIntelIndicators(String url, Map<String, dynamic>? variations) {
  if (RegExp(r'universal|intel|x86_64').hasMatch(url)) return true;
  if (!RegExp(r'arm64|aarch64|m1|m2').hasMatch(url)) return true;
  return variations?.keys.any(
        (k) => k.contains('x86_64') || !k.contains('arm64'),
      ) ??
      false;
}

List<String> getCaskDependencies(CaskModel cask) {
  final dependsOn = cask.dependsOn;
  if (dependsOn == null || dependsOn.isEmpty) return [];

  return dependsOn.entries.expand((entry) {
    if (entry.key == 'macos') return _parseMacosDependencies(entry.value);
    if (entry.value is List) {
      return (entry.value as List).map((item) => item.toString());
    }
    if (entry.value is String) return [entry.value as String];
    return const <String>[];
  }).toList();
}

Iterable<String> _parseMacosDependencies(dynamic value) {
  if (value is! Map) return ['macOS $value'];

  return value.entries.map((entry) {
    final version = entry.value is List && entry.value.isNotEmpty
        ? entry.value.first
        : entry.value;
    return 'macOS ${entry.key} $version';
  });
}
