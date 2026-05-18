import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import '../models/home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState, ScreenEffect> {
  final TapFilterNotifier _tapFilterNotifier;

  HomeViewModel(this._tapFilterNotifier) : super(const HomeState());

  void setTab(HomeTab tab) {
    emitState(state.copyWith(selectedTab: tab));
  }

  void navigateAndFilterByTap(String tapName) {
    _tapFilterNotifier.setFilter(tapName);
    setTab(HomeTab.browse);
  }
}
