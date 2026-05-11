import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_effect.freezed.dart';

@freezed
abstract class LibraryEffect with _$LibraryEffect {
  const factory LibraryEffect.error(String message) = _Error;
  const factory LibraryEffect.success(String message) = _Success;
}
