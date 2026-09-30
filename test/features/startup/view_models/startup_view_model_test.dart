import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/routing/app_router.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/startup/view_models/startup_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomebrewRepository extends Mock
    implements HomebrewRepositoryInterface {}

class MockQueueViewModel extends Mock implements QueueViewModel {}

class MockSettingsService extends Mock implements SettingsService {}

class MockBrewService extends Mock implements BrewService {}

void main() {
  late MockHomebrewRepository mockRepo;
  late MockQueueViewModel mockQueue;
  late MockSettingsService mockSettings;
  late MockBrewService mockBrewService;
  late StartupViewModel viewModel;
  bool exitCalled = false;

  setUp(() {
    mockRepo = MockHomebrewRepository();
    mockQueue = MockQueueViewModel();
    mockSettings = MockSettingsService();
    mockBrewService = MockBrewService();
    exitCalled = false;

    when(() => mockSettings.backgroundFetching).thenReturn(false);

    viewModel = StartupViewModel(
      mockRepo,
      mockQueue,
      mockSettings,
      mockBrewService,
      onExit: () => exitCalled = true,
    );
  });

  tearDown(() {
    viewModel.dispose();
  });

  group('StartupViewModel Tests', () {
    test(
      'When Homebrew is installed, syncs packages and navigates to home',
      () async {
        when(() => mockBrewService.isInstalled()).thenAnswer((_) async => true);
        when(() => mockRepo.isDatabaseEmpty()).thenAnswer((_) async => false);
        when(() => mockRepo.syncInstalledPackages()).thenAnswer((_) async {});
        when(() => mockRepo.syncAllData()).thenAnswer((_) async {});

        ScreenEffect? receivedEffect;
        viewModel.effectStream.listen((effect) {
          receivedEffect = effect;
        });

        await viewModel.initialize();
        await pumpEventQueue();

        expect(viewModel.state.isBrewMissing, false);
        expect(viewModel.state.isLoading, false);
        expect(viewModel.state.statusText, 'Ready');
        verify(() => mockBrewService.isInstalled()).called(1);
        verify(() => mockRepo.syncInstalledPackages()).called(1);
        expect(receivedEffect, isA<NavigateToScreenEffect>());
        expect(
          (receivedEffect as NavigateToScreenEffect).routeName,
          AppRoutes.home,
        );
      },
    );

    test('When Homebrew is NOT installed, sets isBrewMissing to true', () async {
      when(() => mockBrewService.isInstalled()).thenAnswer((_) async => false);

      await viewModel.initialize();

      expect(viewModel.state.isBrewMissing, true);
      expect(viewModel.state.isInstallingBrew, false);
      expect(viewModel.state.isLoading, false);
      verify(() => mockBrewService.isInstalled()).called(1);
      verifyNever(() => mockRepo.isDatabaseEmpty());
      verifyNever(() => mockRepo.syncAllData());
      verifyNever(() => mockRepo.syncInstalledPackages());
    });

    test('exitApp calls onExit callback', () {
      viewModel.exitApp();
      expect(exitCalled, true);
    });

    test('installHomebrew launches installer and updates state', () async {
      when(
        () => mockBrewService.launchHomebrewInstaller(),
      ).thenAnswer((_) async => true);
      when(() => mockBrewService.isInstalled()).thenAnswer((_) async => false);

      await viewModel.installHomebrew();

      expect(viewModel.state.isInstallingBrew, true);
      verify(() => mockBrewService.launchHomebrewInstaller()).called(1);
    });

    test(
      'checkBrewInstalledAgain proceeds with initialization when brew detected',
      () async {
        when(() => mockBrewService.isInstalled()).thenAnswer((_) async => true);
        when(() => mockRepo.isDatabaseEmpty()).thenAnswer((_) async => true);
        when(() => mockRepo.syncAllData()).thenAnswer((_) async {});
        when(() => mockRepo.syncInstalledPackages()).thenAnswer((_) async {});

        final result = await viewModel.checkBrewInstalledAgain();

        expect(result, true);
        expect(viewModel.state.isBrewMissing, false);
        expect(viewModel.state.isInstallingBrew, false);
        verify(() => mockRepo.syncAllData()).called(1);
        verify(() => mockRepo.syncInstalledPackages()).called(1);
      },
    );

    test(
      'checkBrewInstalledAgain emits warning toast when brew still missing',
      () async {
        when(() => mockBrewService.isInstalled()).thenAnswer((_) async => false);

        ScreenEffect? receivedEffect;
        viewModel.effectStream.listen((effect) {
          receivedEffect = effect;
        });

        final result = await viewModel.checkBrewInstalledAgain();
        await pumpEventQueue();

        expect(result, false);
        expect(receivedEffect, isA<ShowToastEffect>());
        expect((receivedEffect as ShowToastEffect).isWarning, true);
      },
    );
  });
}
