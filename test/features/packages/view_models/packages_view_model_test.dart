import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:io';

import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/packages/view_models/packages_view_model.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';

class MockHomebrewRepository extends Mock
    implements HomebrewRepositoryInterface {}

void main() {
  setUpAll(() {
    registerFallbackValue(AnalyticsPeriod.days30);
    registerFallbackValue(PackageTypeFilter.all);
  });

  late MockHomebrewRepository mockRepo;
  late PackageStatusNotifier statusNotifier;
  late TapFilterNotifier tapFilterNotifier;
  late TapStatusNotifier tapStatusNotifier;
  late PackagesViewModel viewModel;

  setUp(() {
    mockRepo = MockHomebrewRepository();
    statusNotifier = PackageStatusNotifier();
    tapFilterNotifier = TapFilterNotifier();
    tapStatusNotifier = TapStatusNotifier();

    viewModel = PackagesViewModel(
      mockRepo,
      statusNotifier,
      tapFilterNotifier,
      tapStatusNotifier,
    );
  });

  tearDown(() {
    viewModel.dispose();
  });

  group('PackagesViewModel', () {
    final mockFormula = FormulaModel(
      name: 'test_package',
      fullName: 'test_package',
      tap: 'homebrew/core',
      desc: 'A test package',
      versions: const FormulaVersions(stable: '1.0.0', bottle: true),
      dependencies: [],
      buildDependencies: [],
      installs30d: 100,
    );

    final mockCask = CaskModel(
      token: 'test_cask',
      fullToken: 'test_cask',
      tap: 'homebrew/cask',
      name: ['Test Cask'],
      version: '2.0.0',
      installs30d: 200,
    );

    final mockCoreTap = TapModel(
      name: 'homebrew/core',
      user: 'homebrew',
      repo: 'core',
      path: '/opt/homebrew/Library/Taps/homebrew/homebrew-core',
      installed: true,
      official: true,
      trusted: true,
    );

    final mockCaskTap = TapModel(
      name: 'homebrew/cask',
      user: 'homebrew',
      repo: 'cask',
      path: '/opt/homebrew/Library/Taps/homebrew/homebrew-cask',
      installed: true,
      official: true,
      trusted: true,
    );

    test('init calls correct repo methods and updates state', () async {
      when(
        () => mockRepo.getTrendingFormulae(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => [mockFormula]);
      when(
        () => mockRepo.getTrendingCasks(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => [mockCask]);
      when(
        () => mockRepo.getTaps(),
      ).thenAnswer((_) async => [mockCoreTap, mockCaskTap]);
      when(
        () => mockRepo.getFilteredPackages(
          query: any(named: 'query'),
          type: any(named: 'type'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          tapFilters: any(named: 'tapFilters'),
        ),
      ).thenAnswer((_) async => [mockFormula, mockCask]);

      await viewModel.init();

      verify(() => mockRepo.getTrendingFormulae(any(), limit: 10)).called(1);
      verify(() => mockRepo.getTrendingCasks(any(), limit: 20)).called(1);
      verify(() => mockRepo.getTaps()).called(1);
      verify(
        () => mockRepo.getFilteredPackages(
          query: '',
          type: Platform.isLinux
              ? PackageTypeFilter.formulae
              : PackageTypeFilter.all,
          limit: 50,
          offset: 0,
          tapFilters: [],
        ),
      ).called(1);

      expect(viewModel.state.taps, [mockCoreTap, mockCaskTap]);
      expect(viewModel.state.paginatedPackages.length, 2);
      expect(viewModel.state.paginatedPackages[0].id, 'test_package');
      expect(viewModel.state.paginatedPackages[1].id, 'test_cask');

      viewModel.state.trendingData.maybeWhen(
        success: (data) {
          expect(data.isNotEmpty, true);
        },
        orElse: () => fail('trendingData should be success'),
      );
    });

    test('setSearchQuery debounces and fetches new packages', () async {
      when(
        () => mockRepo.getFilteredPackages(
          query: any(named: 'query'),
          type: any(named: 'type'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          tapFilters: any(named: 'tapFilters'),
        ),
      ).thenAnswer((_) async => [mockFormula]);

      viewModel.setSearchQuery('test query');

      // The debounce is 300ms, wait for it
      await Future.delayed(const Duration(milliseconds: 350));

      verify(
        () => mockRepo.getFilteredPackages(
          query: 'test query',
          type: any(named: 'type'),
          limit: 50,
          offset: 0,
          tapFilters: [],
        ),
      ).called(1);

      expect(viewModel.state.searchQuery, 'test query');
    });

    test('setPackageType updates state and fetches new packages', () async {
      when(
        () => mockRepo.getFilteredPackages(
          query: any(named: 'query'),
          type: any(named: 'type'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          tapFilters: any(named: 'tapFilters'),
        ),
      ).thenAnswer((_) async => [mockCask]);

      viewModel.setPackageType(PackageTypeFilter.casks);

      // _refreshListings does not debounce for type changes
      await Future.delayed(Duration.zero);

      verify(
        () => mockRepo.getFilteredPackages(
          query: '',
          type: PackageTypeFilter.casks,
          limit: 50,
          offset: 0,
          tapFilters: [],
        ),
      ).called(1);

      expect(viewModel.state.packageType, PackageTypeFilter.casks);
    });

    test('tap status update (isInstalled: true) triggers refresh', () async {
      // Setup initial data fetching responses
      when(
        () => mockRepo.getTrendingFormulae(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => []);
      when(
        () => mockRepo.getTrendingCasks(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => []);
      when(() => mockRepo.getTaps()).thenAnswer((_) async => []);
      when(
        () => mockRepo.getFilteredPackages(
          query: any(named: 'query'),
          type: any(named: 'type'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          tapFilters: any(named: 'tapFilters'),
        ),
      ).thenAnswer((_) async => []);

      await viewModel.init();

      // Clear interactions from init
      clearInteractions(mockRepo);

      // Setup mock for the refresh we expect to happen
      when(
        () => mockRepo.getTrendingFormulae(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => []);
      when(
        () => mockRepo.getTrendingCasks(any(), limit: any(named: 'limit')),
      ).thenAnswer((_) async => []);
      when(() => mockRepo.getTaps()).thenAnswer((_) async => []);
      when(
        () => mockRepo.getFilteredPackages(
          query: any(named: 'query'),
          type: any(named: 'type'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
          tapFilters: any(named: 'tapFilters'),
        ),
      ).thenAnswer((_) async => []);

      // Trigger the bug: emit a new installed tap
      tapStatusNotifier.markUpdated('hashicorp/tap', true, true);

      // Wait a tick for listeners to process
      await Future.delayed(Duration.zero);

      // Verify that data refresh was called (this will fail initially because of the bug)
      verify(() => mockRepo.getTaps()).called(1);
    });
  });
}
