import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/features/startup/widgets/homebrew_install_dialog.dart';
import 'package:bartender/theme/bartender_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestableWidget({
    required bool isInstalling,
    required VoidCallback onInstall,
    required VoidCallback onExit,
    required VoidCallback onCheckAgain,
  }) {
    return MaterialApp(
      theme: BartenderTheme.darkTheme,
      home: Scaffold(
        body: HomebrewInstallDialog(
          isInstalling: isInstalling,
          onInstall: onInstall,
          onExit: onExit,
          onCheckAgain: onCheckAgain,
        ),
      ),
    );
  }

  group('HomebrewInstallDialog Widget Tests', () {
    testWidgets('renders missing Homebrew state correctly', (tester) async {
      bool installCalled = false;
      bool exitCalled = false;
      bool checkAgainCalled = false;

      await tester.pumpWidget(
        buildTestableWidget(
          isInstalling: false,
          onInstall: () => installCalled = true,
          onExit: () => exitCalled = true,
          onCheckAgain: () => checkAgainCalled = true,
        ),
      );

      expect(find.text(brewMissingDialogTitle), findsOneWidget);
      expect(find.text(brewMissingDialogContent), findsOneWidget);
      expect(find.text(brewInstallButtonLabel), findsOneWidget);
      expect(find.text(exitAppButtonLabel), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      await tester.tap(find.text(brewInstallButtonLabel));
      expect(installCalled, true);

      await tester.tap(find.text(exitAppButtonLabel));
      expect(exitCalled, true);
      expect(checkAgainCalled, false);
    });

    testWidgets('renders installing Homebrew state correctly', (tester) async {
      bool installCalled = false;
      bool exitCalled = false;
      bool checkAgainCalled = false;

      await tester.pumpWidget(
        buildTestableWidget(
          isInstalling: true,
          onInstall: () => installCalled = true,
          onExit: () => exitCalled = true,
          onCheckAgain: () => checkAgainCalled = true,
        ),
      );

      expect(find.text(brewInstallingDialogTitle), findsOneWidget);
      expect(find.text(brewInstallingDialogContent), findsOneWidget);
      expect(find.text(checkAgainButtonLabel), findsOneWidget);
      expect(find.text(exitAppButtonLabel), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.tap(find.text(checkAgainButtonLabel));
      expect(checkAgainCalled, true);

      await tester.tap(find.text(exitAppButtonLabel));
      expect(exitCalled, true);
      expect(installCalled, false);
    });
  });
}
