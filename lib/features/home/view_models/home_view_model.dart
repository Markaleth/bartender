import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import '../models/home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState, ScreenEffect> {
  final TapFilterNotifier _tapFilterNotifier;
  final HomebrewRepository _repository;
  final QueueViewModel _queueViewModel;
  final SystemStatusNotifier _systemNotifier;

  HomeViewModel(
    this._tapFilterNotifier,
    this._repository,
    this._queueViewModel,
    this._systemNotifier,
  ) : super(const HomeState());

  void init() {
    checkForUpdates();
    _systemNotifier.addListener(_onSystemStatusChanged);
  }

  Future<void> checkForUpdates() async {
    emitState(state.copyWith(isCheckingForUpdates: true));
    try {
      final (localVersion, hasUpdate) = await _repository.system.checkUpdateStatus();
      emitState(
        state.copyWith(
          localVersion: localVersion.isEmpty ? null : localVersion,
          updateAvailable: hasUpdate,
          isCheckingForUpdates: false,
        ),
      );
    } catch (_) {
      emitState(state.copyWith(isCheckingForUpdates: false));
    }
  }

    Future<void> _onSystemStatusChanged() async {
    final update = _systemNotifier.value;
    if (update != null && update.operation == OperationType.update) {
      
      // 1. Show the syncing state in the UI
      emitState(state.copyWith(isSyncingDatabase: true));
      
      try {
        // 2. Perform the actual DB sync
        await _repository.local.syncInstalledPackages();
      } finally {
        // 3. Clear the syncing state and refresh the Brew version
        emitState(state.copyWith(isSyncingDatabase: false));
        checkForUpdates();
      }
    }
  }

  Future<void> onUpdateBrewTapped() async {
    _queueViewModel.queueOperation(
      packageId: 'homebrew',
      type: PackageType.system,
      operation: OperationType.update,
    );
    emitState(state.copyWith(updateAvailable: false));
  }

  void setTab(HomeTab tab) {
    emitState(state.copyWith(selectedTab: tab));
  }

  void navigateAndFilterByTap(String tapName) {
    _tapFilterNotifier.setFilter(tapName);
    setTab(HomeTab.browse);
  }

  @override
  void dispose() {
    _systemNotifier.removeListener(_onSystemStatusChanged);
    super.dispose();
  }
}
