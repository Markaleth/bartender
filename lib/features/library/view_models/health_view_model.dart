import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/features/library/models/system_health_state.dart';

class HealthViewModel extends BaseViewModel<SystemHealthState, ScreenEffect> {
  final BrewService _brewService;
  final PackageStatusNotifier _statusNotifier;

  HealthViewModel({
    required BrewService brewService,
    required PackageStatusNotifier statusNotifier,
  }) : _brewService = brewService,
       _statusNotifier = statusNotifier,
       super(const SystemHealthState()) {
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
      fetchSystemHealth();
    }
  }

  Future<void> fetchSystemHealth() async {
    try {
      final brewPrefix = await _brewService.getPrefix();

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
        systemStorageUsed: state.systemStorageUsed,
      );

      emitState(healthState);
    } catch (e) {
      emitEffect(
        ShowToastEffect('Failed to fetch system health: $e', isError: true),
      );
    }
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
}
