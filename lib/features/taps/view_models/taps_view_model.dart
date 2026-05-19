import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import '../models/taps_state.dart';

class TapsViewModel extends BaseViewModel<TapsState, ScreenEffect> {
  final HomebrewRepository _repository;
  final QueueViewModel _queueViewModel;
  final TapStatusNotifier _statusNotifier;

  TapsViewModel(this._repository, this._queueViewModel, this._statusNotifier)
    : super(const TapsState()) {
    _statusNotifier.addListener(_onStatusUpdated);
  }

  @override
  void dispose() {
    _statusNotifier.removeListener(_onStatusUpdated);
    super.dispose();
  }

  void _onStatusUpdated() {
    final update = _statusNotifier.value;
    if (update != null) {
      _onTapStatusChanged(
        update.tapName,
        update.isInstalled,
        update.timestamp,
      );
    }
  }

  DateTime? _lastUpdateTimestamp;

  void _onTapStatusChanged(
    String tapName,
    bool isInstalled,
    DateTime timestamp,
  ) {
    if (_lastUpdateTimestamp == timestamp) return;
    _lastUpdateTimestamp = timestamp;

    if (isInstalled) {
      fetchTaps(); // Refetch to show newly added tap
    } else {
      // Remove tap from the current state if successful uninstall
      state.tapsState.maybeWhen(
        success: (taps) {
          final newTaps = taps.where((t) => t.name != tapName).toList();
          emitState(state.copyWith(tapsState: FetchState.success(newTaps)));
        },
        orElse: () {},
      );
    }
  }

  Future<void> init() async {
    await fetchTaps();
  }

  Future<void> fetchTaps() async {
    emitState(state.copyWith(tapsState: const FetchState.loading()));
    try {
      final taps = await _repository.getTaps();
      if (taps.isEmpty) {
        await syncTaps();
      } else {
        emitState(state.copyWith(tapsState: FetchState.success(taps)));
      }
    } catch (e) {
      emitState(state.copyWith(tapsState: FetchState.error(e.toString())));
    }
  }

  Future<void> syncTaps() async {
    emitState(state.copyWith(isSyncing: true));
    try {
      await _repository.syncTaps();
      final taps = await _repository.getTaps();
      emitState(
        state.copyWith(tapsState: FetchState.success(taps), isSyncing: false),
      );
    } catch (e) {
      emitState(state.copyWith(isSyncing: false));
      emitEffect(ShowToastEffect(e.toString(), isError: true));
    }
  }

  Future<void> syncTap(String tapName) async {
    emitState(state.copyWith(isSyncing: true));
    try {
      await _repository.syncTap(tapName);
      final taps = await _repository.getTaps();
      emitState(
        state.copyWith(tapsState: FetchState.success(taps), isSyncing: false),
      );
    } catch (e) {
      emitState(state.copyWith(isSyncing: false));
      emitEffect(ShowToastEffect(e.toString(), isError: true));
    }
  }

  void addTap(String name) {
    _queueViewModel.queueOperation(
      packageId: name,
      type: PackageType.tap,
      operation: OperationType.install,
    );
  }

  void removeTap(String name) {
    _queueViewModel.queueOperation(
      packageId: name,
      type: PackageType.tap,
      operation: OperationType.uninstall,
    );
  }
}
