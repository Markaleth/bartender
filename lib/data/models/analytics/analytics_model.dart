import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_model.freezed.dart';
part 'analytics_model.g.dart';

@freezed
abstract class AnalyticsResponse with _$AnalyticsResponse {
  const factory AnalyticsResponse({
    required String category,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_count') required int totalCount,
    List<AnalyticsItem>? items,
    Map<String, List<AnalyticsItem>>? formulae,
  }) = _AnalyticsResponse;

  factory AnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsResponseFromJson(json);
}

@freezed
abstract class AnalyticsItem with _$AnalyticsItem {
  const factory AnalyticsItem({
    int? number,
    String? formula,
    String? cask,
    required String count,
    String? percent,
  }) = _AnalyticsItem;

  factory AnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsItemFromJson(json);
}
