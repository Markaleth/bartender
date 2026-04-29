import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/icon_cache/resolved_icon.dart';

part 'package_icon_state.freezed.dart';

@freezed
class PackageIconState with _$PackageIconState {
  const factory PackageIconState.loading() = _Loading;
  const factory PackageIconState.success(ResolvedIcon icon) = _Success;
  const factory PackageIconState.fallback() = _Fallback;
}

@freezed
class PackageIconEffect with _$PackageIconEffect {
  const factory PackageIconEffect.none() = _None;
}
