import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

enum HomeTab { browse, library, taps, debug, settings }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeTab.browse) HomeTab selectedTab,
    String? localVersion,
    @Default(false) bool updateAvailable,
    @Default(false) bool isCheckingForUpdates,
    @Default(false) bool isSyncingDatabase,
  }) = _HomeState;
}
