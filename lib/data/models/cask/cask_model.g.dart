// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaskModel _$CaskModelFromJson(Map<String, dynamic> json) => _CaskModel(
  token: json['token'] as String,
  fullToken: json['full_token'] as String?,
  tap: json['tap'] as String?,
  name: (json['name'] as List<dynamic>).map((e) => e as String).toList(),
  desc: json['desc'] as String?,
  homepage: json['homepage'] as String?,
  url: json['url'] as String?,
  version: json['version'] as String,
  artifacts: (json['artifacts'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
  autoUpdates: json['auto_updates'] as bool?,
  dependsOn: json['depends_on'] as Map<String, dynamic>?,
  outdated: json['outdated'] as bool? ?? false,
  deprecated: json['deprecated'] as bool? ?? false,
  disabled: json['disabled'] as bool? ?? false,
  isInstalled: json['is_installed'] as bool? ?? false,
  missingDeps:
      (json['missingDeps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  variations: json['variations'] as Map<String, dynamic>?,
  analytics: json['analytics'] as Map<String, dynamic>?,
  installs30d: (json['installs30d'] as num?)?.toInt(),
  installs90d: (json['installs90d'] as num?)?.toInt(),
  installs365d: (json['installs365d'] as num?)?.toInt(),
  generatedDate: json['generated_date'] as String?,
  installedSize: json['installedSize'] as String?,
  installedOnTimestamp: (json['installedOnTimestamp'] as num?)?.toInt(),
  lastSync: json['lastSync'] == null
      ? null
      : DateTime.parse(json['lastSync'] as String),
);

Map<String, dynamic> _$CaskModelToJson(_CaskModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'full_token': instance.fullToken,
      'tap': instance.tap,
      'name': instance.name,
      'desc': instance.desc,
      'homepage': instance.homepage,
      'url': instance.url,
      'version': instance.version,
      'artifacts': instance.artifacts,
      'auto_updates': instance.autoUpdates,
      'depends_on': instance.dependsOn,
      'outdated': instance.outdated,
      'deprecated': instance.deprecated,
      'disabled': instance.disabled,
      'is_installed': instance.isInstalled,
      'missingDeps': instance.missingDeps,
      'variations': instance.variations,
      'analytics': instance.analytics,
      'installs30d': instance.installs30d,
      'installs90d': instance.installs90d,
      'installs365d': instance.installs365d,
      'generated_date': instance.generatedDate,
      'installedSize': instance.installedSize,
      'installedOnTimestamp': instance.installedOnTimestamp,
      'lastSync': instance.lastSync?.toIso8601String(),
    };
