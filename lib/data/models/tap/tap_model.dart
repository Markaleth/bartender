import 'package:freezed_annotation/freezed_annotation.dart';

part 'tap_model.freezed.dart';
part 'tap_model.g.dart';

@freezed
abstract class TapModel with _$TapModel {
  const factory TapModel({
    required String name,
    required String user,
    required String repo,
    required String path,
    @Default(false) bool installed,
    @Default(false) bool official,
    @JsonKey(name: 'custom_remote') bool? customRemote,
    String? remote,
    @JsonKey(name: 'formula_names') @Default([]) List<String> formulaNames,
    @JsonKey(name: 'cask_tokens') @Default([]) List<String> caskTokens,
    @JsonKey(name: 'broken_packages') @Default([]) List<String> brokenPackages,
    @Default(false) bool trusted,
  }) = _TapModel;

  factory TapModel.fromJson(Map<String, dynamic> json) =>
      _$TapModelFromJson(json);
}
