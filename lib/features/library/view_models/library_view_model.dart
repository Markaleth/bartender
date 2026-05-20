import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/library/models/system_health_state.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';

class LibraryViewModel extends BaseViewModel<LibraryState, ScreenEffect> {
  final DatabaseInterface _db;
  final BrewService _brewService;
  final PackageStatusNotifier _statusNotifier;
  final PackageRepository _packageRepository;

  LibraryViewModel({
    required DatabaseInterface db,
    required BrewService brewService,
    required PackageStatusNotifier statusNotifier,
    required PackageRepository packageRepository,
  }) : _db = db,
       _brewService = brewService,
       _statusNotifier = statusNotifier,
       _packageRepository = packageRepository,
       super(const LibraryState()) {
    _statusNotifier.addListener(_onStatusNotifierUpdated);
  }

  @override
  void dispose() {
    _statusNotifier.removeListener(_onStatusNotifierUpdated);
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
      await refreshData();
      emitState(state.copyWith(isLoading: false));
    } catch (e) {
      emitState(state.copyWith(isLoading: false));
      emitEffect(ShowToastEffect('Failed to load library: $e', isError: true));
    }
  }

  Future<void> refreshData() async {
    try {
      final formulae = await _db.getInstalledFormulae();
      final casks = await _db.getInstalledCasks();
      final taps = await _db.getTaps();

      emitState(
        state.copyWith(
          installedFormulae: formulae,
          installedCasks: casks,
          installedTaps: taps,
        ),
      );

      await fetchSystemHealth();
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

  Future<void> fetchSystemHealth() async {
    try {
      final brewPrefix = await _fetchBrewPrefix();
      emitState(state.copyWith(brewPrefix: brewPrefix));

      final storageUsed = await _fetchSystemStorage(brewPrefix);
      if (storageUsed != null) {
        emitState(state.copyWith(systemStorageUsed: storageUsed));
      }

      // Run async tasks concurrently
      final results = await Future.wait([
        _brewService.autoremoveDryRun(),
        _brewService.cleanupDryRun(),
        _brewService.doctorSync(),
        _brewService.outdated(),
      ]);

      final healthState = SystemHealthState.fromResults(
        autoremoveResult: results[0],
        cleanupResult: results[1],
        doctorResult: results[2],
        outdatedResult: results[3],
      );

      emitState(state.copyWith(healthState: healthState));
    } catch (e) {
      emitEffect(ShowToastEffect('Failed to fetch system health: $e', isError: true));
    }
  }

  Future<String> _fetchBrewPrefix() async {
    final prefixResult = await _brewService.runCustom(['--prefix']);
    if (prefixResult.exitCode == 0) {
      return prefixResult.stdout.trim();
    }
    return '/opt/homebrew';
  }

  Future<String?> _fetchSystemStorage(String brewPrefix) async {
    final duResult = await ShellUtils.run('du', ['-sh', brewPrefix]);
    if (duResult.exitCode == 0) {
      final storageLine = duResult.stdout.toString().trim();
      final sizeMatch = RegExp(r'^(\S+)').firstMatch(storageLine);
      return sizeMatch?.group(1);
    }
    return null;
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
}
