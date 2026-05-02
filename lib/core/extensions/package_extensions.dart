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

extension FormulaCompatibilityExt on FormulaModel {
  List<CompatibilityInfo> get compatibility {
    final Set<CompatibilityInfo> info = {};

    final stableFiles = bottle?['stable']?['files'] as Map<String, dynamic>?;

    if (_hasPrecompiledFormula(stableFiles)) {
      info.add(CompatibilityInfo.precompiled);
    }

    final keys = [...?stableFiles?.keys, ...?variations?.keys];

    if (_hasArm64Mac(keys)) info.add(CompatibilityInfo.appleSilicon);
    if (_hasIntelMac(keys)) info.add(CompatibilityInfo.intelMac);
    if (_hasLinux(keys)) info.add(CompatibilityInfo.linux);

    return info.toList();
  }

  bool _hasPrecompiledFormula(Map<String, dynamic>? stableFiles) =>
      stableFiles != null && stableFiles.isNotEmpty;

  bool _hasArm64Mac(Iterable<String> keys) =>
      keys.any((key) => key.startsWith('arm64_') && !key.endsWith('_linux'));

  bool _hasIntelMac(Iterable<String> keys) => keys.any(
    (key) =>
        !key.endsWith('_linux') && !key.startsWith('arm64_') && key != 'all',
  );

  bool _hasLinux(Iterable<String> keys) =>
      keys.any((key) => key.endsWith('_linux'));
}

extension CaskCompatibilityExt on CaskModel {
  List<CompatibilityInfo> get compatibility {
    final Set<CompatibilityInfo> info = {CompatibilityInfo.precompiled};

    final safeUrl = url?.toLowerCase() ?? '';

    if (_hasCaskArmIndicators(safeUrl, variations)) {
      info.add(CompatibilityInfo.appleSilicon);
    }

    if (_hasCaskIntelIndicators(safeUrl, variations)) {
      info.add(CompatibilityInfo.intelMac);
    }

    return info.toList();
  }

  List<String> get flattenedDependencies {
    if (dependsOn == null || dependsOn!.isEmpty) return [];

    return dependsOn!.entries.expand((entry) {
      if (entry.key == 'macos') return _parseMacosDependencies(entry.value);
      if (entry.value is List) {
        return (entry.value as List).map((item) => item.toString());
      }
      if (entry.value is String) return [entry.value as String];
      return const <String>[];
    }).toList();
  }

  bool _hasCaskArmIndicators(String safeUrl, Map<String, dynamic>? variations) {
    if (RegExp(r'universal|arm64|aarch64|m1|m2').hasMatch(safeUrl)) return true;
    return variations?.keys.any((k) => k.contains('arm64')) ?? false;
  }

  bool _hasCaskIntelIndicators(
    String safeUrl,
    Map<String, dynamic>? variations,
  ) {
    if (RegExp(r'universal|intel|x86_64').hasMatch(safeUrl)) return true;
    if (!RegExp(r'arm64|aarch64|m1|m2').hasMatch(safeUrl)) return true;
    return variations?.keys.any(
          (k) => k.contains('x86_64') || !k.contains('arm64'),
        ) ??
        false;
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

  String get primaryArtifactType {
    if (artifacts == null || artifacts!.isEmpty) return 'Unknown';

    for (final artifact in artifacts!) {
      if (artifact.containsKey('app')) return 'Application (.app)';
      if (artifact.containsKey('pkg')) return 'Installer (.pkg)';
      if (artifact.containsKey('binary')) return 'Binary';
      if (artifact.containsKey('font')) return 'Font';
      if (artifact.containsKey('dictionary')) return 'Dictionary';
      if (artifact.containsKey('audio_unit_plugin')) return 'Audio Unit Plugin';
      if (artifact.containsKey('vst_plugin')) return 'VST Plugin';
      if (artifact.containsKey('vst3_plugin')) return 'VST3 Plugin';
      if (artifact.containsKey('colorpicker')) return 'Color Picker';
      if (artifact.containsKey('prefpane')) return 'Preference Pane';
      if (artifact.containsKey('qlplugin')) return 'QuickLook Plugin';
      if (artifact.containsKey('screen_saver')) return 'Screen Saver';
      if (artifact.containsKey('input_method')) return 'Input Method';
      if (artifact.containsKey('internet_plugin')) return 'Internet Plugin';
      if (artifact.containsKey('service')) return 'Service';
      if (artifact.containsKey('uninstall')) continue;
      if (artifact.containsKey('zap')) continue;
      if (artifact.containsKey('postflight')) continue;
      if (artifact.containsKey('preflight')) continue;

      if (artifact.keys.isNotEmpty) {
        final firstKey = artifact.keys.first.toString();
        return firstKey[0].toUpperCase() + firstKey.substring(1);
      }
    }
    return 'Unknown';
  }
}
