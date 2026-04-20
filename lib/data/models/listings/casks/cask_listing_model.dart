import 'package:freezed_annotation/freezed_annotation.dart';

part 'cask_listing_model.freezed.dart';
part 'cask_listing_model.g.dart';

@freezed
abstract class CaskListingModel with _$CaskListingModel {
  const factory CaskListingModel({
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
  }) = _CaskListingModel;

  factory CaskListingModel.fromJson(Map<String, dynamic> json) =>
      _$CaskListingModelFromJson(json);
}
