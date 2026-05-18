// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TapModel _$TapModelFromJson(Map<String, dynamic> json) => _TapModel(
  name: json['name'] as String,
  user: json['user'] as String,
  repo: json['repo'] as String,
  path: json['path'] as String,
  installed: json['installed'] as bool? ?? false,
  official: json['official'] as bool? ?? false,
  customRemote: json['custom_remote'] as bool?,
  remote: json['remote'] as String?,
);

Map<String, dynamic> _$TapModelToJson(_TapModel instance) => <String, dynamic>{
  'name': instance.name,
  'user': instance.user,
  'repo': instance.repo,
  'path': instance.path,
  'installed': instance.installed,
  'official': instance.official,
  'custom_remote': instance.customRemote,
  'remote': instance.remote,
};
