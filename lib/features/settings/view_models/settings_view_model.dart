import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/settings_service.dart';

class SettingsState {
  const SettingsState();
}

class SettingsViewModel extends BaseViewModel<SettingsState, ScreenEffect> {
  final SettingsService _settingsService;

  SettingsViewModel(this._settingsService) : super(const SettingsState());

  SettingsService get settings => _settingsService;

  void setBrewExecutablePath(String value) {
    _settingsService.brewExecutablePath = value;
  }

  void setDisableAnalytics(bool value) {
    _settingsService.disableAnalytics = value;
  }

  void setGreedyUpgrades(bool value) {
    _settingsService.greedyUpgrades = value;
  }

  void setZapUninstallDefault(bool value) {
    _settingsService.zapUninstallDefault = value;
  }

  void setEnableCrashReporting(bool value) {
    _settingsService.enableCrashReporting = value;
  }

  void setSuppressEnvHints(bool value) {
    _settingsService.suppressEnvHints = value;
  }

  void setAutoCleanup(bool value) {
    _settingsService.autoCleanup = value;
  }

  void setBackgroundFetching(bool value) {
    _settingsService.backgroundFetching = value;
  }

  void setThemeMode(String value) {
    _settingsService.themeMode = value;
  }

  void setTerminalFontSize(double value) {
    _settingsService.terminalFontSize = value;
  }
}
