// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsResponse _$AnalyticsResponseFromJson(Map<String, dynamic> json) =>
    _AnalyticsResponse(
      category: json['category'] as String,
      totalItems: (json['total_items'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      totalCount: (json['total_count'] as num).toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => AnalyticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      formulae: (json['formulae'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => AnalyticsItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$AnalyticsResponseToJson(_AnalyticsResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'total_items': instance.totalItems,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total_count': instance.totalCount,
      'items': instance.items,
      'formulae': instance.formulae,
    };

_AnalyticsItem _$AnalyticsItemFromJson(Map<String, dynamic> json) =>
    _AnalyticsItem(
      number: (json['number'] as num?)?.toInt(),
      formula: json['formula'] as String?,
      cask: json['cask'] as String?,
      count: json['count'] as String,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$AnalyticsItemToJson(_AnalyticsItem instance) =>
    <String, dynamic>{
      'number': instance.number,
      'formula': instance.formula,
      'cask': instance.cask,
      'count': instance.count,
      'percent': instance.percent,
    };
