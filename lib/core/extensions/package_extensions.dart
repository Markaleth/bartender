import 'dart:io';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/core/utils/artifact_parser.dart';

enum CompatibilityInfo {
  appleSilicon('Apple Silicon'),
  intelMac('Intel Mac'),
  linux('Linux'),
  precompiled('Precompiled');

  final String label;
  const CompatibilityInfo(this.label);
}

extension FormulaCompatibilityExt on FormulaModel {
  bool get isSupportedOnCurrentOs {
    if (requirements == null || requirements!.isEmpty) return true;
    if (Platform.isLinux) {
      return !requirements!.any((r) => r['name'] == 'macos');
    } else if (Platform.isMacOS) {
      return !requirements!.any((r) => r['name'] == 'linux');
    }
    return true;
  }

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
  bool get isSupportedOnCurrentOs => Platform.isMacOS;

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

  String get primaryArtifactType => ArtifactParser.getPrimaryType(artifacts);
}
