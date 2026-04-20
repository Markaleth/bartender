// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryAnalyticsResponse _$CategoryAnalyticsResponseFromJson(
  Map<String, dynamic> json,
) => _CategoryAnalyticsResponse(
  category: json['category'] as String,
  totalItems: (json['total_items'] as num).toInt(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  totalCount: (json['total_count'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => CategoryAnalyticsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryAnalyticsResponseToJson(
  _CategoryAnalyticsResponse instance,
) => <String, dynamic>{
  'category': instance.category,
  'total_items': instance.totalItems,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'total_count': instance.totalCount,
  'items': instance.items,
};

_CategoryAnalyticsItem _$CategoryAnalyticsItemFromJson(
  Map<String, dynamic> json,
) => _CategoryAnalyticsItem(
  number: (json['number'] as num?)?.toInt(),
  formula: json['formula'] as String?,
  cask: json['cask'] as String?,
  count: json['count'] as String,
  percent: json['percent'] as String?,
);

Map<String, dynamic> _$CategoryAnalyticsItemToJson(
  _CategoryAnalyticsItem instance,
) => <String, dynamic>{
  'number': instance.number,
  'formula': instance.formula,
  'cask': instance.cask,
  'count': instance.count,
  'percent': instance.percent,
};
