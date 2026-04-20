import 'package:freezed_annotation/freezed_annotation.dart';

part 'cask_model.freezed.dart';
part 'cask_model.g.dart';

@freezed
abstract class Cask with _$Cask {
  const factory Cask({
    required String token,
    required List<String> name,
    String? desc,
    String? homepage,
    String? url,
    required String version,
    @JsonKey(name: 'auto_updates') bool? autoUpdates,
    @JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn,
    @Default(false) bool outdated,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
  }) = _Cask;

  factory Cask.fromJson(Map<String, dynamic> json) => _$CaskFromJson(json);
}
