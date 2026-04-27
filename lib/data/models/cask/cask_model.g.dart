// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaskModel _$CaskModelFromJson(Map<String, dynamic> json) => _CaskModel(
  token: json['token'] as String,
  fullToken: json['full_token'] as String?,
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
  isInstalled: json['is_installed'] as bool? ?? false,
  analytics: json['analytics'] as Map<String, dynamic>?,
  installs30d: (json['installs30d'] as num?)?.toInt(),
  installs90d: (json['installs90d'] as num?)?.toInt(),
  installs365d: (json['installs365d'] as num?)?.toInt(),
  generatedDate: json['generated_date'] as String?,
);

Map<String, dynamic> _$CaskModelToJson(_CaskModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_token': instance.fullToken,
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
      'is_installed': instance.isInstalled,
      'analytics': instance.analytics,
      'installs30d': instance.installs30d,
      'installs90d': instance.installs90d,
      'installs365d': instance.installs365d,
      'generated_date': instance.generatedDate,
    };
