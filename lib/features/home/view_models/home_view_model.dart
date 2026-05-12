import 'package:bartender/core/base_view_model.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import '../models/home_state.dart';

class HomeViewModel extends BaseViewModel<HomeState, ScreenEffect> {
  HomeViewModel() : super(const HomeState());

  void setTab(HomeTab tab) {
    emitState(state.copyWith(selectedTab: tab));
  }
}
