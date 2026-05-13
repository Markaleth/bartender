import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/features/library/models/library_effect.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/core/services/package_status_notifier.dart';

class LibraryViewModel extends BaseViewModel<LibraryState, LibraryEffect> {
  final DatabaseInterface _db;
  final BrewService _brewService;
  final PackageStatusNotifier _statusNotifier;

  LibraryViewModel({
    required DatabaseInterface db,
    required BrewService brewService,
    required PackageStatusNotifier statusNotifier,
  }) : _db = db,
       _brewService = brewService,
       _statusNotifier = statusNotifier,
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
        update.packageId,
        update.isInstalled,
        update.timestamp,
      );
    }
  }

  Future<void> init() async {
    emitState(state.copyWith(isLoading: true));
    try {
      await refreshData();
      emitState(state.copyWith(isLoading: false));
    } catch (e) {
      emitState(state.copyWith(isLoading: false));
      emitEffect(LibraryEffect.error('Failed to load library: $e'));
    }
  }

  Future<void> refreshData() async {
    try {
      final formulae = await _db.getInstalledFormulae();
      final casks = await _db.getInstalledCasks();

      emitState(
        state.copyWith(installedFormulae: formulae, installedCasks: casks),
      );

      await fetchSystemHealth();
    } catch (e) {
      emitEffect(LibraryEffect.error('Failed to refresh data: $e'));
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

      final orphans = await _fetchOrphanCount();
      emitState(state.copyWith(orphanedDependenciesCount: orphans));

      final health = _calculateHealthScore(orphans);
      emitState(state.copyWith(globalHealthScore: health));
    } catch (e) {
      emitEffect(LibraryEffect.error('Failed to fetch system health: $e'));
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

  Future<int> _fetchOrphanCount() async {
    final autoremoveResult = await _brewService.runCustom([
      'autoremove',
      '--dry-run',
    ]);
    if (autoremoveResult.exitCode == 0) {
      final lines = autoremoveResult.stdout.trim().split('\n');
      // ignore empty lines or specific header lines
      final orphanLines = lines
          .where(
            (line) =>
                line.trim().isNotEmpty && !line.startsWith('Would remove:'),
          )
          .toList();
      return orphanLines.length;
    }
    return 0;
  }

  int _calculateHealthScore(int orphans) {
    int health = 100 - (orphans * 2);
    return health < 0 ? 0 : health;
  }

  void selectPackage(dynamic package) {
    emitState(state.copyWith(selectedPackage: package));
  }
}
