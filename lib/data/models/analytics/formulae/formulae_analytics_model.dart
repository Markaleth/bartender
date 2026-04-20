import 'package:freezed_annotation/freezed_annotation.dart';

part 'formulae_analytics_model.freezed.dart';
part 'formulae_analytics_model.g.dart';

@freezed
abstract class FormulaeAnalyticsResponse with _$FormulaeAnalyticsResponse {
  const factory FormulaeAnalyticsResponse({
    required String category,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_count') required int totalCount,
    required Map<String, List<FormulaAnalyticsItem>> formulae,
  }) = _FormulaeAnalyticsResponse;

  factory FormulaeAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$FormulaeAnalyticsResponseFromJson(json);
}

@freezed
abstract class FormulaAnalyticsItem with _$FormulaAnalyticsItem {
  const factory FormulaAnalyticsItem({
    int? number,
    required String formula,
    required String count,
    String? percent,
  }) = _FormulaAnalyticsItem;

  factory FormulaAnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$FormulaAnalyticsItemFromJson(json);
}
