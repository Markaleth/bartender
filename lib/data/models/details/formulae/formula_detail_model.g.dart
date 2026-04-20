// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formula_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormulaDetailModel _$FormulaDetailModelFromJson(Map<String, dynamic> json) =>
    _FormulaDetailModel(
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      tap: json['tap'] as String,
      desc: json['desc'] as String,
      license: json['license'] as String?,
      homepage: json['homepage'] as String?,
      versions: FormulaDetailVersions.fromJson(
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
    );

Map<String, dynamic> _$FormulaDetailModelToJson(_FormulaDetailModel instance) =>
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
    };

_FormulaDetailVersions _$FormulaDetailVersionsFromJson(
  Map<String, dynamic> json,
) => _FormulaDetailVersions(
  stable: json['stable'] as String,
  head: json['head'] as String?,
  bottle: json['bottle'] as bool,
);

Map<String, dynamic> _$FormulaDetailVersionsToJson(
  _FormulaDetailVersions instance,
) => <String, dynamic>{
  'stable': instance.stable,
  'head': instance.head,
  'bottle': instance.bottle,
};
