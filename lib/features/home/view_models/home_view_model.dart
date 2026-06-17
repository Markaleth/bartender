import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import '../models/home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState, ScreenEffect> {
  final TapFilterNotifier _tapFilterNotifier;
  final HomebrewRepository _repository;

  HomeViewModel(this._tapFilterNotifier, this._repository) : super(const HomeState());

  void init() {
    checkForUpdates();
  }

  Future<void> checkForUpdates() async {
    emitState(state.copyWith(isCheckingForUpdates: true));
    try {
      final (localVersion, hasUpdate) = await _repository.checkUpdateStatus();
      emitState(state.copyWith(
        localVersion: localVersion.isEmpty ? null : localVersion,
        updateAvailable: hasUpdate,
        isCheckingForUpdates: false,
      ));
    } catch (_) {
      emitState(state.copyWith(isCheckingForUpdates: false));
    }
  }

  void setTab(HomeTab tab) {
    emitState(state.copyWith(selectedTab: tab));
  }

  void navigateAndFilterByTap(String tapName) {
    _tapFilterNotifier.setFilter(tapName);
    setTab(HomeTab.browse);
  }
}
