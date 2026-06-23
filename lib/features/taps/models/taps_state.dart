import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/core/fetch_state/fetch_state.dart';

part 'taps_state.freezed.dart';

@freezed
abstract class TapsState with _$TapsState {
  const factory TapsState({
    @Default(FetchState.loading()) FetchState<List<TapModel>> tapsState,
    String? syncingTap,
  }) = _TapsState;
}
