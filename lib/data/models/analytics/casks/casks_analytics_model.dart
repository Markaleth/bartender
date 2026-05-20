import 'package:freezed_annotation/freezed_annotation.dart';

part 'casks_analytics_model.freezed.dart';
part 'casks_analytics_model.g.dart';

@freezed
abstract class CasksAnalyticsResponse with _$CasksAnalyticsResponse {
  const factory CasksAnalyticsResponse({
    required String category,
    @JsonKey(name: 'total_items') required int totalItems,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'formulae')
    required Map<String, List<CaskAnalyticsItem>> casks,
  }) = _CasksAnalyticsResponse;

  factory CasksAnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$CasksAnalyticsResponseFromJson(json);
}

@freezed
abstract class CaskAnalyticsItem with _$CaskAnalyticsItem {
  const factory CaskAnalyticsItem({
    int? number,
    required String cask,
    required String count,
    String? percent,
  }) = _CaskAnalyticsItem;

  factory CaskAnalyticsItem.fromJson(Map<String, dynamic> json) =>
      _$CaskAnalyticsItemFromJson(json);
}
