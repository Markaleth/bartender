import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

class LibraryViewModel extends BaseViewModel<LibraryState, ScreenEffect> {
  final PackageStatusNotifier _statusNotifier;
  final PackageRepository _packageRepository;
  final HomebrewRepository _homebrewRepository;
  final TapStatusNotifier _tapStatusNotifier;

  LibraryViewModel({
    required PackageStatusNotifier statusNotifier,
    required PackageRepository packageRepository,
    required HomebrewRepository homebrewRepository,
    required TapStatusNotifier tapStatusNotifier,
  }) : _statusNotifier = statusNotifier,
       _packageRepository = packageRepository,
       _homebrewRepository = homebrewRepository,
       _tapStatusNotifier = tapStatusNotifier,
       super(const LibraryState()) {
    _statusNotifier.addListener(_onStatusNotifierUpdated);
    _tapStatusNotifier.addListener(_onTapStatusNotifierUpdated);
  }

  @override
  void dispose() {
    _statusNotifier.removeListener(_onStatusNotifierUpdated);
    _tapStatusNotifier.removeListener(_onTapStatusNotifierUpdated);
    super.dispose();
  }

  void _onStatusNotifierUpdated() {
    final update = _statusNotifier.value;
    if (update != null) {
      onPackageStatusChanged(
        update.itemId,
        update.isInstalled,
        update.timestamp,
      );
    }
  }

  void _onTapStatusNotifierUpdated() {
    refreshData();
  }

  void setFilterQuery(String query) {
    emitState(state.copyWith(filterQuery: query));
  }

  Future<void> syncData() async {
    emitState(state.copyWith(isSyncing: true));
    try {
      await _packageRepository.syncInstalledPackages();
      await refreshData();
    } catch (e) {
      emitEffect(ShowToastEffect('Failed to sync data: $e', isError: true));
    } finally {
      emitState(state.copyWith(isSyncing: false));
    }
  }

  Future<void> init() async {
    emitState(state.copyWith(isLoading: true));
    try {
      final brewPrefix = await _packageRepository.getPrefix();
      emitState(state.copyWith(brewPrefix: brewPrefix));

      await refreshData();
      emitState(state.copyWith(isLoading: false));
    } catch (e) {
      emitState(state.copyWith(isLoading: false));
      emitEffect(ShowToastEffect('Failed to load library: $e', isError: true));
    }
  }

  Future<void> refreshData() async {
    try {
      final formulae = await _packageRepository.getInstalledFormulae();
      final casks = await _packageRepository.getInstalledCasks();
      final taps = await _homebrewRepository.getTaps();

      emitState(
        state.copyWith(
          installedFormulae: formulae,
          installedCasks: casks,
          installedTaps: taps,
        ),
      );
    } catch (e) {
      emitEffect(ShowToastEffect('Failed to refresh data: $e', isError: true));
    }
  }

  DateTime? _lastUpdateTimestamp;

  Future<void> onPackageStatusChanged(
    String packageId,
    bool isInstalled,
    DateTime timestamp,
  ) async {
    if (_lastUpdateTimestamp == timestamp) return;
    _lastUpdateTimestamp = timestamp;

    await refreshData();
  }

  void selectPackage(dynamic package) {
    emitState(state.copyWith(selectedPackage: package));
  }

  void toggleTapExpanded(String tapName) {
    final updatedExpandedTaps = Set<String>.from(state.expandedTaps);
    if (updatedExpandedTaps.contains(tapName)) {
      updatedExpandedTaps.remove(tapName);
    } else {
      updatedExpandedTaps.add(tapName);
    }
    emitState(state.copyWith(expandedTaps: updatedExpandedTaps));
  }

  Future<void> untrustTap(String name) async {
    await _homebrewRepository.toggleTapTrust(name, false);
    await refreshData();
    _tapStatusNotifier.markUpdated(name, true, false);
  }
}
