import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_analytics_model.freezed.dart';
part 'category_analytics_model.g.dart';

@freezed
abstract class CategoryAnalyticsResponse with _$CategoryAnalyticsResponse {
  const factory CategoryAnalyticsResponse({
    required String category,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_count') required int totalCount,
    required List<CategoryAnalyticsItem> items,
  }) = _CategoryAnalyticsResponse;

  factory CategoryAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryAnalyticsResponseFromJson(json);
}

@freezed
abstract class CategoryAnalyticsItem with _$CategoryAnalyticsItem {
  const factory CategoryAnalyticsItem({
    int? number,
    String? formula,
    String? cask,
    required String count,
    String? percent,
  }) = _CategoryAnalyticsItem;

  factory CategoryAnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryAnalyticsItemFromJson(json);
}
