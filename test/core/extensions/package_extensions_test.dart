import 'package:flutter_test/flutter_test.dart';
import 'package:bartender/core/extensions/package_extensions.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';

void main() {
  group('FormulaModelExt Compatibility', () {
    test('should detect precompiled, apple silicon, intel mac, and linux', () {
      final formula = FormulaModel(
        name: 'test-formula',
        fullName: 'test-formula',
        tap: 'homebrew/core',
        desc: 'Test formula',
        versions: const FormulaVersions(stable: '1.0.0', bottle: true),
        dependencies: [],
        buildDependencies: [],
        bottle: {
          'stable': {
            'files': {'arm64_sonoma': {}, 'sonoma': {}, 'x86_64_linux': {}},
          },
        },
      );

      final result = formula.compatibility;

      expect(result.contains(CompatibilityInfo.precompiled), isTrue);
      expect(result.contains(CompatibilityInfo.appleSilicon), isTrue);
      expect(result.contains(CompatibilityInfo.intelMac), isTrue);
      expect(result.contains(CompatibilityInfo.linux), isTrue);
    });

    test('should handle missing bottle/variations gracefully', () {
      final formula = FormulaModel(
        name: 'test-formula',
        fullName: 'test-formula',
        tap: 'homebrew/core',
        desc: 'Test formula',
        versions: const FormulaVersions(stable: '1.0.0', bottle: false),
        dependencies: [],
        buildDependencies: [],
      );

      final result = formula.compatibility;
      expect(result, isEmpty);
    });
  });

  group('CaskModelExt Compatibility', () {
    test('should detect precompiled and architecture based on url', () {
      final cask = CaskModel(
        token: 'test-cask',
        name: ['Test Cask'],
        version: '1.0.0',
        url: 'https://example.com/test-cask-universal.dmg',
      );

      final result = cask.compatibility;

      expect(result.contains(CompatibilityInfo.precompiled), isTrue);
      expect(result.contains(CompatibilityInfo.appleSilicon), isTrue);
      expect(result.contains(CompatibilityInfo.intelMac), isTrue);
    });

    test('should detect apple silicon only from variations', () {
      final cask = CaskModel(
        token: 'test-cask',
        name: ['Test Cask'],
        version: '1.0.0',
        url: 'https://example.com/test-cask.dmg',
        variations: {
          'arm64_sonoma': {'url': 'some-url'},
        },
      );

      final result = cask.compatibility;

      expect(result.contains(CompatibilityInfo.precompiled), isTrue);
      expect(result.contains(CompatibilityInfo.appleSilicon), isTrue);
      // By default IntelMac is added if url is missing arm indicators
      expect(result.contains(CompatibilityInfo.intelMac), isTrue);
    });
  });

  group('CaskModelExt Dependencies', () {
    test('should flatten complex depends_on object', () {
      final cask = CaskModel(
        token: 'test-cask',
        name: ['Test Cask'],
        version: '1.0.0',
        dependsOn: {
          'macos': {
            '>=': ['12'],
          },
          'cask': ['another-cask', 'third-cask'],
          'formula': ['some-formula'],
        },
      );

      final dependencies = cask.flattenedDependencies;

      expect(dependencies.length, equals(4));
      expect(dependencies.contains('macOS >= 12'), isTrue);
      expect(dependencies.contains('another-cask'), isTrue);
      expect(dependencies.contains('third-cask'), isTrue);
      expect(dependencies.contains('some-formula'), isTrue);
    });

    test('should handle empty dependsOn gracefully', () {
      final cask = CaskModel(
        token: 'test-cask',
        name: ['Test Cask'],
        version: '1.0.0',
      );

      final dependencies = cask.flattenedDependencies;

      expect(dependencies, isEmpty);
    });
  });
}
