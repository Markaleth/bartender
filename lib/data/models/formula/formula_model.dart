import 'package:freezed_annotation/freezed_annotation.dart';

part 'formula_model.freezed.dart';
part 'formula_model.g.dart';

@freezed
abstract class FormulaModel with _$FormulaModel {
  const factory FormulaModel({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required String tap,
    required String desc,
    String? license,
    String? homepage,
    required FormulaVersions versions,
    required List<String> dependencies,
    @JsonKey(name: 'build_dependencies')
    required List<String> buildDependencies,
    @Default(false) bool outdated,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
    @Default(false) @JsonKey(name: 'is_installed') bool isInstalled,
    List<Map<String, dynamic>>? requirements,
    Map<String, dynamic>? bottle,
    Map<String, dynamic>? variations,
    Map<String, dynamic>? analytics,
    int? installs30d,
    int? installs90d,
    int? installs365d,
    @JsonKey(name: 'generated_date') String? generatedDate,
  }) = _FormulaModel;

  factory FormulaModel.fromJson(Map<String, dynamic> json) =>
      _$FormulaModelFromJson(json);
}

@freezed
abstract class FormulaVersions with _$FormulaVersions {
  const factory FormulaVersions({
    required String stable,
    String? head,
    required bool bottle,
  }) = _FormulaVersions;

  factory FormulaVersions.fromJson(Map<String, dynamic> json) =>
      _$FormulaVersionsFromJson(json);
}
