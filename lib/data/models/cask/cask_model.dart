import 'package:freezed_annotation/freezed_annotation.dart';

part 'cask_model.freezed.dart';
part 'cask_model.g.dart';

@freezed
abstract class CaskModel with _$CaskModel {
  const factory CaskModel({
    required String token,
    @JsonKey(name: 'full_token') String? fullToken,
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
    @Default(false) @JsonKey(name: 'is_installed') bool isInstalled,
    Map<String, dynamic>? variations,
    Map<String, dynamic>? analytics,
    int? installs30d,
    int? installs90d,
    int? installs365d,
    @JsonKey(name: 'generated_date') String? generatedDate,
  }) = _CaskModel;

  factory CaskModel.fromJson(Map<String, dynamic> json) =>
      _$CaskModelFromJson(json);
}
