import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import '../models/taps_state.dart';

class TapsViewModel extends BaseViewModel<TapsState, ScreenEffect> {
  final HomebrewRepository _repository;
  final QueueViewModel _queueViewModel;

  TapsViewModel(this._repository, this._queueViewModel) : super(const TapsState());

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
      emitState(state.copyWith(
        tapsState: FetchState.success(taps),
        isSyncing: false,
      ));
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
