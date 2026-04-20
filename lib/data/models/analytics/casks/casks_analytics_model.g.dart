// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casks_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CasksAnalyticsResponse _$CasksAnalyticsResponseFromJson(
  Map<String, dynamic> json,
) => _CasksAnalyticsResponse(
  category: json['category'] as String,
  totalItems: (json['total_items'] as num).toInt(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  totalCount: (json['total_count'] as num).toInt(),
  casks: (json['formulae'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => CaskAnalyticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$CasksAnalyticsResponseToJson(
  _CasksAnalyticsResponse instance,
) => <String, dynamic>{
  'category': instance.category,
  'total_items': instance.totalItems,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'total_count': instance.totalCount,
  'formulae': instance.casks,
};

_CaskAnalyticsItem _$CaskAnalyticsItemFromJson(Map<String, dynamic> json) =>
    _CaskAnalyticsItem(
      number: (json['number'] as num?)?.toInt(),
      cask: json['cask'] as String,
      count: json['count'] as String,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$CaskAnalyticsItemToJson(_CaskAnalyticsItem instance) =>
    <String, dynamic>{
      'number': instance.number,
      'cask': instance.cask,
      'count': instance.count,
      'percent': instance.percent,
    };
