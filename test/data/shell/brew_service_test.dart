import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingsService extends Mock implements SettingsService {}

void main() {
  late MockSettingsService mockSettings;
  late BrewService brewService;

  setUp(() {
    mockSettings = MockSettingsService();
    brewService = BrewService(mockSettings);
    BrewService.resetSimulation();
  });

  tearDown(() {
    BrewService.resetSimulation();
  });

  group('BrewService Simulation & Detection Tests', () {
    test('simulateNoBrewOverride controls isSimulateNoBrewActive', () {
      expect(BrewService.isSimulateNoBrewActive, false);
      BrewService.simulateNoBrewOverride = true;
      expect(BrewService.isSimulateNoBrewActive, true);
      BrewService.simulateNoBrewOverride = false;
      expect(BrewService.isSimulateNoBrewActive, false);
    });

    test(
      'isInstalled returns simulatedInstalled when simulation is active',
      () async {
        BrewService.simulateNoBrewOverride = true;
        BrewService.simulatedInstalled = false;

        expect(await brewService.isInstalled(), false);

        BrewService.simulatedInstalled = true;
        expect(await brewService.isInstalled(), true);
      },
    );

    test(
      'launchHomebrewInstaller in simulation sets simulatedInstalled to true',
      () async {
        BrewService.simulateNoBrewOverride = true;
        BrewService.simulatedInstalled = false;

        expect(await brewService.isInstalled(), false);

        final result = await brewService.launchHomebrewInstaller();

        expect(result, true);
        expect(BrewService.simulatedInstalled, true);
        expect(await brewService.isInstalled(), true);
      },
    );

    test('resetSimulation clears simulation state', () {
      BrewService.simulateNoBrewOverride = true;
      BrewService.simulatedInstalled = true;

      BrewService.resetSimulation();

      expect(BrewService.simulateNoBrewOverride, null);
      expect(BrewService.simulatedInstalled, false);
      expect(BrewService.isSimulateNoBrewActive, false);
    });
  });
}
