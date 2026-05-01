import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/core/models/package_operations/package_operation.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';

class MockHomebrewRepository extends Mock implements HomebrewRepository {}

class MockPackageRepository extends Mock implements PackageRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(AnalyticsPeriod.days30);
    registerFallbackValue(PackageType.formula);
  });

  group('PackagesViewModel Tests', () {
    late MockHomebrewRepository mockHomebrewRepository;
    late MockPackageRepository mockPackageRepository;
    late PackagesViewModel viewModel;

    setUp(() {
      mockHomebrewRepository = MockHomebrewRepository();
      mockPackageRepository = MockPackageRepository();
      viewModel = PackagesViewModel(
        mockHomebrewRepository,
        mockPackageRepository,
      );
    });

    tearDown(() {
      viewModel.dispose();
    });

    test('Initial State should start with empty data / loading states', () {
      expect(
        viewModel.state.formulaeData,
        const FetchState<List<FormulaModel>>.loading(),
      );
      expect(
        viewModel.state.casksData,
        const FetchState<List<CaskModel>>.loading(),
      );
      expect(
        viewModel.state.trendingData,
        const FetchState<List<dynamic>>.loading(),
      );
      expect(viewModel.state.paginatedPackages, isEmpty);
      expect(viewModel.state.operationsQueue, isEmpty);
    });

    test(
      'Data Fetching (Success): fetchData should sync remote, fetch local, merge, sort, and initialize paginatedPackages',
      () async {
        when(
          () => mockHomebrewRepository.syncAllData(),
        ).thenAnswer((_) async {});

        final formula = FormulaModel(
          name: 'a-formula',
          fullName: 'a-formula',
          tap: 'homebrew/core',
          desc: 'A test formula',
          license: 'MIT',
          homepage: 'http://test.com',
          versions: const FormulaVersions(stable: '1.0.0', bottle: true),
          dependencies: const [],
          buildDependencies: const [],
          outdated: false,
          deprecated: false,
          disabled: false,
          isInstalled: false,
          installs30d: 100,
          installs90d: 300,
          installs365d: 1000,
        );

        final cask = CaskModel(
          token: 'b-cask',
          fullToken: 'b-cask',
          name: const ['B Cask'],
          desc: 'A test cask',
          homepage: 'http://test.com',
          url: 'http://test.com/b-cask.zip',
          version: '1.0.0',
          autoUpdates: false,
          outdated: false,
          deprecated: false,
          disabled: false,
          isInstalled: false,
          installs30d: 50,
          installs90d: 150,
          installs365d: 500,
        );

        when(
          () => mockHomebrewRepository.getAllFormulae(),
        ).thenAnswer((_) async => [formula]);
        when(
          () => mockHomebrewRepository.getAllCasks(),
        ).thenAnswer((_) async => [cask]);
        when(
          () => mockHomebrewRepository.getTrendingFormulae(
            any(),
            limit: any(named: 'limit'),
          ),
        ).thenAnswer((_) async => [formula]);
        when(
          () => mockHomebrewRepository.getTrendingCasks(
            any(),
            limit: any(named: 'limit'),
          ),
        ).thenAnswer((_) async => [cask]);

        await viewModel.fetchData();

        verify(() => mockHomebrewRepository.syncAllData()).called(1);
        verify(() => mockHomebrewRepository.getAllFormulae()).called(1);
        verify(() => mockHomebrewRepository.getAllCasks()).called(1);

        expect(
          viewModel.state.formulaeData.maybeWhen(
            success: (d) => d,
            orElse: () => null,
          ),
          [formula],
        );
        expect(
          viewModel.state.casksData.maybeWhen(
            success: (d) => d,
            orElse: () => null,
          ),
          [cask],
        );
        expect(viewModel.state.paginatedPackages, [formula, cask]);

        final trending = viewModel.state.trendingData.maybeWhen(
          success: (d) => d,
          orElse: () => null,
        );
        expect(trending, isNotNull);
        expect(trending!.length, 1);
        expect(trending[0], [formula, cask]); // sorted by installs30d
      },
    );

    test(
      'Data Fetching (Error): repository throws, transition all to error',
      () async {
        when(
          () => mockHomebrewRepository.syncAllData(),
        ).thenThrow(Exception('Sync failed'));

        await viewModel.fetchData();

        expect(
          viewModel.state.formulaeData.maybeWhen(
            error: (e) => e,
            orElse: () => null,
          ),
          'Exception: Sync failed',
        );
        expect(
          viewModel.state.casksData.maybeWhen(
            error: (e) => e,
            orElse: () => null,
          ),
          'Exception: Sync failed',
        );
        expect(
          viewModel.state.trendingData.maybeWhen(
            error: (e) => e,
            orElse: () => null,
          ),
          'Exception: Sync failed',
        );
      },
    );

    test('Pagination: loadMorePackages grows paginatedPackages', () async {
      when(() => mockHomebrewRepository.syncAllData()).thenAnswer((_) async {});

      final formulae = List.generate(
        60,
        (i) => FormulaModel(
          name: 'formula-$i',
          fullName: 'formula-$i',
          tap: 'homebrew/core',
          desc: 'desc',
          license: 'MIT',
          homepage: 'home',
          versions: const FormulaVersions(stable: '1.0.0', bottle: true),
          dependencies: const [],
          buildDependencies: const [],
          outdated: false,
          deprecated: false,
          disabled: false,
          isInstalled: false,
        ),
      );

      when(
        () => mockHomebrewRepository.getAllFormulae(),
      ).thenAnswer((_) async => formulae);
      when(
        () => mockHomebrewRepository.getAllCasks(),
      ).thenAnswer((_) async => []);
      when(
        () => mockHomebrewRepository.getTrendingFormulae(
          any(),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => []);
      when(
        () => mockHomebrewRepository.getTrendingCasks(
          any(),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => []);

      await viewModel.fetchData();

      // initially 50 items
      expect(viewModel.state.paginatedPackages.length, 50);

      viewModel.loadMorePackages();

      // now all 60 items
      expect(viewModel.state.paginatedPackages.length, 60);

      // calling again should not increase
      viewModel.loadMorePackages();
      expect(viewModel.state.paginatedPackages.length, 60);
    });

    test(
      'Installation Queue (Success): queueInstall adds operation, runs, and refreshes',
      () async {
        when(
          () => mockPackageRepository.install('pkg1', isCask: false),
        ).thenAnswer((_) async {});
        when(
          () => mockHomebrewRepository.getAllFormulae(),
        ).thenAnswer((_) async => []);
        when(
          () => mockHomebrewRepository.getAllCasks(),
        ).thenAnswer((_) async => []);

        viewModel.queueInstall('pkg1', PackageType.formula);

        // Since processQueue is async, the state immediately after queueInstall
        // might be queued or inProgress depending on microtask execution.
        // We will wait for the queue to process.
        await Future.delayed(Duration.zero);

        expect(viewModel.state.operationsQueue.length, 1);
        expect(
          viewModel.state.operationsQueue.first.status,
          OperationStatus.success,
        );
        verify(
          () => mockPackageRepository.install('pkg1', isCask: false),
        ).called(1);
        verify(
          () => mockHomebrewRepository.getAllFormulae(),
        ).called(1); // from _refreshListings
      },
    );

    test(
      'Installation Queue (Error): queueInstall reflects error status',
      () async {
        when(
          () => mockPackageRepository.install('pkg2', isCask: true),
        ).thenThrow(Exception('Install failed'));

        viewModel.queueInstall('pkg2', PackageType.cask);

        await Future.delayed(Duration.zero);

        expect(viewModel.state.operationsQueue.length, 1);
        expect(
          viewModel.state.operationsQueue.first.status,
          OperationStatus.error,
        );
        expect(
          viewModel.state.operationsQueue.first.errorMessage,
          'Exception: Install failed',
        );
      },
    );
  });
}
