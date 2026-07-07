import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  final SharedPreferences _prefs;

  // Defaults
  static const String _defaultBrewExecutablePath = '';
  static const bool _defaultDisableAnalytics = false;
  static const bool _defaultGreedyUpgrades = false;
  static const bool _defaultZapUninstallDefault = false;
  static const bool _defaultSuppressEnvHints = true;
  static const bool _defaultAutoCleanup = false;
  static const bool _defaultBackgroundFetching = false;
  static const String _defaultThemeMode = 'system';
  static const double _defaultTerminalFontSize = 12.0;

  // Keys
  static const String _keyBrewExecutablePath = 'brewExecutablePath';
  static const String _keyDisableAnalytics = 'disableAnalytics';
  static const String _keyGreedyUpgrades = 'greedyUpgrades';
  static const String _keyZapUninstallDefault = 'zapUninstallDefault';
  static const String _keySuppressEnvHints = 'suppressEnvHints';
  static const String _keyAutoCleanup = 'autoCleanup';
  static const String _keyBackgroundFetching = 'backgroundFetching';
  static const String _keyThemeMode = 'themeMode';
  static const String _keyTerminalFontSize = 'terminalFontSize';

  SettingsService(SharedPreferences prefs) : _prefs = prefs;

  static Future<SettingsService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SettingsService(prefs);
  }

  bool get isInitialized => true;

  String get brewExecutablePath =>
      _prefs.getString(_keyBrewExecutablePath) ?? _defaultBrewExecutablePath;
  set brewExecutablePath(String value) {
    _prefs.setString(_keyBrewExecutablePath, value);
    notifyListeners();
  }

  bool get disableAnalytics =>
      _prefs.getBool(_keyDisableAnalytics) ?? _defaultDisableAnalytics;
  set disableAnalytics(bool value) {
    _prefs.setBool(_keyDisableAnalytics, value);
    notifyListeners();
  }

  bool get greedyUpgrades =>
      _prefs.getBool(_keyGreedyUpgrades) ?? _defaultGreedyUpgrades;
  set greedyUpgrades(bool value) {
    _prefs.setBool(_keyGreedyUpgrades, value);
    notifyListeners();
  }

  bool get zapUninstallDefault =>
      _prefs.getBool(_keyZapUninstallDefault) ?? _defaultZapUninstallDefault;
  set zapUninstallDefault(bool value) {
    _prefs.setBool(_keyZapUninstallDefault, value);
    notifyListeners();
  }

  bool get suppressEnvHints =>
      _prefs.getBool(_keySuppressEnvHints) ?? _defaultSuppressEnvHints;
  set suppressEnvHints(bool value) {
    _prefs.setBool(_keySuppressEnvHints, value);
    notifyListeners();
  }

  bool get autoCleanup =>
      _prefs.getBool(_keyAutoCleanup) ?? _defaultAutoCleanup;
  set autoCleanup(bool value) {
    _prefs.setBool(_keyAutoCleanup, value);
    notifyListeners();
  }

  bool get backgroundFetching =>
      _prefs.getBool(_keyBackgroundFetching) ?? _defaultBackgroundFetching;
  set backgroundFetching(bool value) {
    _prefs.setBool(_keyBackgroundFetching, value);
    notifyListeners();
  }

  String get themeMode => _prefs.getString(_keyThemeMode) ?? _defaultThemeMode;
  set themeMode(String value) {
    _prefs.setString(_keyThemeMode, value);
    notifyListeners();
  }

  double get terminalFontSize =>
      _prefs.getDouble(_keyTerminalFontSize) ?? _defaultTerminalFontSize;
  set terminalFontSize(double value) {
    _prefs.setDouble(_keyTerminalFontSize, value);
    notifyListeners();
  }
}
