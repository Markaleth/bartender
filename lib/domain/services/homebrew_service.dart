import 'dart:io';

import 'package:bartender/core/enums/analytics_period.dart';
import 'package:bartender/core/enums/package_type_filter.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';

class HomebrewService {
  final HomebrewRepository _repository;

  HomebrewService(this._repository);

  // --- System Operations ---

  Future<(String, bool)> checkUpdateStatus() =>
      _repository.system.checkUpdateStatus();

  // --- Local Package Operations ---

  Future<void> syncInstalledPackages() =>
      _repository.local.syncInstalledPackages();

  Future<String> getPrefix() => _repository.local.getPrefix();

  Future<List<FormulaModel>> getInstalledFormulae() =>
      _repository.local.getInstalledFormulae();

  Future<List<CaskModel>> getInstalledCasks() =>
      _repository.local.getInstalledCasks();

  // --- Catalog Operations ---

  Future<bool> isDatabaseEmpty() => _repository.catalog.isDatabaseEmpty();

  Future<List<dynamic>> getFilteredPackages({
    String query = '',
    PackageTypeFilter type = PackageTypeFilter.all,
    int limit = 50,
    int offset = 0,
    String? tapFilter,
  }) =>
      _repository.catalog.getFilteredPackages(
        query: query,
        type: type,
        limit: limit,
        offset: offset,
        tapFilter: tapFilter,
      );

  // --- Analytics Operations ---

  Future<List<FormulaModel>> getTrendingFormulae(
    AnalyticsPeriod period, {
    int limit = 10,
  }) =>
      _repository.analytics.getTrendingFormulae(period, limit: limit);

  Future<List<CaskModel>> getTrendingCasks(
    AnalyticsPeriod period, {
    int limit = 10,
  }) =>
      _repository.analytics.getTrendingCasks(period, limit: limit);

  // --- Tap Operations ---

  Future<List<TapModel>> getTaps() => _repository.taps.getTaps();

  Future<void> deleteTap(String name) => _repository.taps.deleteTap(name);

  Future<void> syncTaps() => _repository.taps.syncTaps();

  Future<void> syncThirdPartyTapPackages() =>
      _repository.taps.syncThirdPartyTapPackages();

  Future<void> syncTap(String tapName) => _repository.taps.syncTap(tapName);

  Future<void> toggleTapTrust(String name, bool isTrusted) =>
      _repository.taps.toggleTapTrust(name, isTrusted);

  Future<int> getTapInstalledSize(String tapName) =>
      _repository.taps.getTapInstalledSize(tapName);

  // --- Orchestration ---

  Future<void> syncAllData() async {
    // Sync base packages first
    await Future.wait([
      _repository.catalog.syncFormulae(),
      if (!Platform.isLinux) _repository.catalog.syncCasks(),
    ]);

    await _repository.taps.syncTaps();
    await _repository.taps.syncThirdPartyTapPackages();

    // Then sync analytics
    await Future.wait([
      _repository.analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days30),
      _repository.analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days90),
      _repository.analytics.syncFormulaeAnalytics('install-on-request', AnalyticsPeriod.days365),
      if (!Platform.isLinux) ...[
        _repository.analytics.syncCasksAnalytics(AnalyticsPeriod.days30),
        _repository.analytics.syncCasksAnalytics(AnalyticsPeriod.days90),
        _repository.analytics.syncCasksAnalytics(AnalyticsPeriod.days365),
      ],
    ]);
  }
}
