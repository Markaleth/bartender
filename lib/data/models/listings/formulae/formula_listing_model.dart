import 'package:freezed_annotation/freezed_annotation.dart';

part 'formula_listing_model.freezed.dart';
part 'formula_listing_model.g.dart';

@freezed
abstract class FormulaListingModel with _$FormulaListingModel {
  const factory FormulaListingModel({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required String tap,
    required String desc,
    String? license,
    String? homepage,
    required FormulaVersions versions,
    required List<String> dependencies,
    @JsonKey(name: 'build_dependencies') required List<String> buildDependencies,
    @Default(false) bool outdated,
    @Default(false) bool deprecated,
    @Default(false) bool disabled,
  }) = _FormulaListingModel;

  factory FormulaListingModel.fromJson(Map<String, dynamic> json) =>
      _$FormulaListingModelFromJson(json);
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
