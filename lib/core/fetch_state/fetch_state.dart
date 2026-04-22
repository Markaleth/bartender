import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_state.freezed.dart';

@freezed
class FetchState<T> with _$FetchState<T> {
  const factory FetchState.loading() = _Loading;
  const factory FetchState.success(T data) = _Success;
  const factory FetchState.error(String message) = _Error;
}
