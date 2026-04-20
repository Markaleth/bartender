// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cask_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaskDetailModel _$CaskDetailModelFromJson(Map<String, dynamic> json) =>
    _CaskDetailModel(
      token: json['token'] as String,
      name: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
      desc: json['desc'] as String?,
      homepage: json['homepage'] as String?,
      url: json['url'] as String?,
      version: json['version'] as String,
      autoUpdates: json['auto_updates'] as bool?,
      dependsOn: json['depends_on'] as Map<String, dynamic>?,
      outdated: json['outdated'] as bool? ?? false,
      deprecated: json['deprecated'] as bool? ?? false,
      disabled: json['disabled'] as bool? ?? false,
    );

Map<String, dynamic> _$CaskDetailModelToJson(_CaskDetailModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'desc': instance.desc,
      'homepage': instance.homepage,
      'url': instance.url,
      'version': instance.version,
      'auto_updates': instance.autoUpdates,
      'depends_on': instance.dependsOn,
      'outdated': instance.outdated,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
    };
