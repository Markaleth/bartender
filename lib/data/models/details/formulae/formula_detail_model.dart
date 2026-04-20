import 'package:freezed_annotation/freezed_annotation.dart';

part 'formula_detail_model.freezed.dart';
part 'formula_detail_model.g.dart';

@freezed
abstract class FormulaDetailModel with _$FormulaDetailModel {
  const factory FormulaDetailModel({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required String tap,
    required String desc,
    String? license,
    String? homepage,
    required FormulaDetailVersions versions,
    required List<String> dependencies,
    @JsonKey(name: 'build_dependencies') required List<String> buildDependencies,
    @Default(false) bool outdated,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
  }) = _FormulaDetailModel;

  factory FormulaDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FormulaDetailModelFromJson(json);
}

@freezed
abstract class FormulaDetailVersions with _$FormulaDetailVersions {
  const factory FormulaDetailVersions({
    required String stable,
    String? head,
    required bool bottle,
  }) = _FormulaDetailVersions;

  factory FormulaDetailVersions.fromJson(Map<String, dynamic> json) =>
      _$FormulaDetailVersionsFromJson(json);
}
