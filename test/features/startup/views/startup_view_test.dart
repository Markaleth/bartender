import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/routing/navigation_service.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/startup/views/startup_view.dart';
import 'package:bartender/features/startup/widgets/homebrew_install_dialog.dart';
import 'package:bartender/theme/bartender_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

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

  setUp(() {
    mockRepo = MockHomebrewRepository();
    mockQueue = MockQueueViewModel();
    mockSettings = MockSettingsService();
    mockBrewService = MockBrewService();

    when(() => mockSettings.backgroundFetching).thenReturn(false);
  });

  Widget createWidgetUnderTest() {
    return MultiProvider(
      providers: [
        Provider<HomebrewRepositoryInterface>.value(value: mockRepo),
        ChangeNotifierProvider<QueueViewModel>.value(value: mockQueue),
        ChangeNotifierProvider<SettingsService>.value(value: mockSettings),
        Provider<BrewService>.value(value: mockBrewService),
        Provider<NavigationService>(create: (_) => NavigationService()),
      ],
      child: MaterialApp(
        theme: BartenderTheme.darkTheme,
        home: const StartupView(),
      ),
    );
  }

  group('StartupView Integration Tests', () {
    testWidgets('shows HomebrewInstallDialog when brew is missing', (
      tester,
    ) async {
      when(() => mockBrewService.isInstalled()).thenAnswer((_) async => false);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(HomebrewInstallDialog), findsOneWidget);
      expect(find.text(brewMissingDialogTitle), findsOneWidget);
      expect(find.text(brewInstallButtonLabel), findsOneWidget);
      expect(find.text(exitAppButtonLabel), findsOneWidget);
    });

    testWidgets('does not show dialog when brew is installed', (tester) async {
      when(() => mockBrewService.isInstalled()).thenAnswer((_) async => true);
      when(() => mockRepo.isDatabaseEmpty()).thenAnswer((_) async => false);
      when(() => mockRepo.syncInstalledPackages()).thenAnswer((_) async {});
      when(() => mockRepo.syncAllData()).thenAnswer((_) async {});

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(HomebrewInstallDialog), findsNothing);
    });
  });
}
