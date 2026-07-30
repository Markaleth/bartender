import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:bartender/data/db/database.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/core/enums/package_type_filter.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('Formulae tests', () {
    final formula = FormulaModel(
      name: 'wget',
      fullName: 'wget',
      tap: 'homebrew/core',
      desc: 'Internet file retriever',
      versions: const FormulaVersions(stable: '1.21.4', bottle: true),
      dependencies: [],
      buildDependencies: [],
    );

    test('cacheFormula inserts and getFormula retrieves', () async {
      await db.cacheFormula(formula);

      final result = await db.getFormula('wget');
      expect(result, isNotNull);
      expect(result?.name, 'wget');
      expect(result?.desc, 'Internet file retriever');
    });

    test('updateFormulaInstallationStatus updates correctly', () async {
      await db.cacheFormula(formula);
      await db.updateFormulaInstallationStatus('wget', true);

      final installed = await db.getInstalledFormulae();
      expect(installed.length, 1);
      expect(installed.first.name, 'wget');
      expect(installed.first.isInstalled, true);
    });

    test('resetAllInstallationStatuses works for formulae', () async {
      await db.cacheFormula(formula.copyWith(isInstalled: true));
      await db.resetAllInstallationStatuses();

      final installed = await db.getInstalledFormulae();
      expect(installed.isEmpty, true);

      final result = await db.getFormula('wget');
      expect(result?.isInstalled, false);
    });
  });

  group('Casks tests', () {
    final cask = CaskModel(
      token: 'google-chrome',
      fullToken: 'google-chrome',
      name: ['Google Chrome'],
      version: '120.0.6099.109',
      desc: 'Web browser',
    );

    test('cacheCask inserts and getCask retrieves', () async {
      await db.cacheCask(cask);

      final result = await db.getCask('google-chrome');
      expect(result, isNotNull);
      expect(result?.token, 'google-chrome');
      expect(result?.desc, 'Web browser');
    });

    test('updateCaskInstallationStatus updates correctly', () async {
      await db.cacheCask(cask);
      await db.updateCaskInstallationStatus('google-chrome', true);

      final installed = await db.getInstalledCasks();
      expect(installed.length, 1);
      expect(installed.first.token, 'google-chrome');
      expect(installed.first.isInstalled, true);
    });

    test('resetAllInstallationStatuses works for casks', () async {
      await db.cacheCask(cask.copyWith(isInstalled: true));
      await db.resetAllInstallationStatuses();

      final installed = await db.getInstalledCasks();
      expect(installed.isEmpty, true);

      final result = await db.getCask('google-chrome');
      expect(result?.isInstalled, false);
    });
  });

  group('Filtered packages tests', () {
    final formula = FormulaModel(
      name: 'curl',
      fullName: 'curl',
      tap: 'homebrew/core',
      desc: 'Get a file from an HTTP, HTTPS or FTP server',
      versions: const FormulaVersions(stable: '8.5.0', bottle: true),
      dependencies: [],
      buildDependencies: [],
      isInstalled: true,
    );

    final cask = CaskModel(
      token: 'firefox',
      fullToken: 'firefox',
      name: ['Firefox'],
      version: '121.0',
      desc: 'Web browser',
      isInstalled: false,
    );

    setUp(() async {
      await db.cacheFormula(formula);
      await db.cacheCask(cask);
    });

    test('getFilteredPackages returns all packages by default', () async {
      final results = await db.getFilteredPackages();
      if (Platform.isLinux) {
        expect(results.length, 1);
      } else {
        expect(results.length, 2);
      }
    });

    test('getFilteredPackages filters by query', () async {
      final results = await db.getFilteredPackages(query: 'curl');
      expect(results.length, 1);
      expect(results.first, isA<FormulaModel>());
      expect((results.first as FormulaModel).name, 'curl');
    });

    test('getFilteredPackages filters by installedOnly', () async {
      final results = await db.getFilteredPackages(installedOnly: true);
      expect(results.length, 1);
      expect(results.first, isA<FormulaModel>());
      expect(
        (results.first as FormulaModel).name,
        'curl',
      ); // since cask isInstalled is false
    });

    test('getFilteredPackages filters by type', () async {
      final caskResults = await db.getFilteredPackages(
        type: PackageTypeFilter.casks,
      );
      if (Platform.isLinux) {
        expect(caskResults.length, 0);
      } else {
        expect(caskResults.length, 1);
        expect(caskResults.first, isA<CaskModel>());
        expect((caskResults.first as CaskModel).token, 'firefox');
      }

      final formulaResults = await db.getFilteredPackages(
        type: PackageTypeFilter.formulae,
      );
      expect(formulaResults.length, 1);
      expect(formulaResults.first, isA<FormulaModel>());
      expect((formulaResults.first as FormulaModel).name, 'curl');
    });

    test('getFilteredPackages pagination limits', () async {
      final results = await db.getFilteredPackages(limit: 1);
      expect(results.length, 1);
    });
  });

  group('Purge data test', () {
    test('purgeAllData clears casks and formulae', () async {
      final formula = FormulaModel(
        name: 'curl',
        fullName: 'curl',
        tap: 'homebrew/core',
        desc: 'Get a file from an HTTP, HTTPS or FTP server',
        versions: const FormulaVersions(stable: '8.5.0', bottle: true),
        dependencies: [],
        buildDependencies: [],
      );

      final cask = CaskModel(
        token: 'firefox',
        fullToken: 'firefox',
        name: ['Firefox'],
        version: '121.0',
        desc: 'Web browser',
      );

      await db.cacheFormula(formula);
      await db.cacheCask(cask);

      expect((await db.getAllFormulae()).length, 1);
      expect((await db.getAllCasks()).length, 1);

      await db.purgeAllData();

      expect((await db.getAllFormulae()).length, 0);
      expect((await db.getAllCasks()).length, 0);
      expect(await db.isDatabaseEmpty(), true);
    });
  });
}
