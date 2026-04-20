// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulae_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormulaeAnalyticsResponse _$FormulaeAnalyticsResponseFromJson(
  Map<String, dynamic> json,
) => _FormulaeAnalyticsResponse(
  category: json['category'] as String,
  totalItems: (json['total_items'] as num).toInt(),
  startDate: json['start_date'] as String,
  endDate: json['end_date'] as String,
  totalCount: (json['total_count'] as num).toInt(),
  formulae: (json['formulae'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => FormulaAnalyticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$FormulaeAnalyticsResponseToJson(
  _FormulaeAnalyticsResponse instance,
) => <String, dynamic>{
  'category': instance.category,
  'total_items': instance.totalItems,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'total_count': instance.totalCount,
  'formulae': instance.formulae,
};

_FormulaAnalyticsItem _$FormulaAnalyticsItemFromJson(
  Map<String, dynamic> json,
) => _FormulaAnalyticsItem(
  number: (json['number'] as num?)?.toInt(),
  formula: json['formula'] as String,
  count: json['count'] as String,
  percent: json['percent'] as String?,
);

Map<String, dynamic> _$FormulaAnalyticsItemToJson(
  _FormulaAnalyticsItem instance,
) => <String, dynamic>{
  'number': instance.number,
  'formula': instance.formula,
  'count': instance.count,
  'percent': instance.percent,
};
