// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formula_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormulaModel _$FormulaModelFromJson(Map<String, dynamic> json) =>
    _FormulaModel(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      tap: json['tap'] as String,
      desc: json['desc'] as String,
      license: json['license'] as String?,
      homepage: json['homepage'] as String?,
      versions: FormulaVersions.fromJson(
        json['versions'] as Map<String, dynamic>,
      ),
      dependencies: (json['dependencies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      buildDependencies: (json['build_dependencies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
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

Map<String, dynamic> _$FormulaModelToJson(_FormulaModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'full_name': instance.fullName,
      'tap': instance.tap,
      'desc': instance.desc,
      'license': instance.license,
      'homepage': instance.homepage,
      'versions': instance.versions,
      'dependencies': instance.dependencies,
      'build_dependencies': instance.buildDependencies,
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

_FormulaVersions _$FormulaVersionsFromJson(Map<String, dynamic> json) =>
    _FormulaVersions(
      stable: json['stable'] as String,
      head: json['head'] as String?,
      bottle: json['bottle'] as bool,
    );

Map<String, dynamic> _$FormulaVersionsToJson(_FormulaVersions instance) =>
    <String, dynamic>{
      'stable': instance.stable,
      'head': instance.head,
      'bottle': instance.bottle,
    };
