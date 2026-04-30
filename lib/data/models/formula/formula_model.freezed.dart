// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formula_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormulaModel {

 String get name;@JsonKey(name: 'full_name') String get fullName; String get tap; String get desc; String? get license; String? get homepage; FormulaVersions get versions; List<String> get dependencies;@JsonKey(name: 'build_dependencies') List<String> get buildDependencies; bool get outdated; bool get deprecated; bool get disabled;@JsonKey(name: 'is_installed') bool get isInstalled; Map<String, dynamic>? get bottle; Map<String, dynamic>? get variations; Map<String, dynamic>? get analytics; int? get installs30d; int? get installs90d; int? get installs365d;@JsonKey(name: 'generated_date') String? get generatedDate;
/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaModelCopyWith<FormulaModel> get copyWith => _$FormulaModelCopyWithImpl<FormulaModel>(this as FormulaModel, _$identity);

  /// Serializes this FormulaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.versions, versions) || other.versions == versions)&&const DeepCollectionEquality().equals(other.dependencies, dependencies)&&const DeepCollectionEquality().equals(other.buildDependencies, buildDependencies)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&const DeepCollectionEquality().equals(other.bottle, bottle)&&const DeepCollectionEquality().equals(other.variations, variations)&&const DeepCollectionEquality().equals(other.analytics, analytics)&&(identical(other.installs30d, installs30d) || other.installs30d == installs30d)&&(identical(other.installs90d, installs90d) || other.installs90d == installs90d)&&(identical(other.installs365d, installs365d) || other.installs365d == installs365d)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,fullName,tap,desc,license,homepage,versions,const DeepCollectionEquality().hash(dependencies),const DeepCollectionEquality().hash(buildDependencies),outdated,deprecated,disabled,isInstalled,const DeepCollectionEquality().hash(bottle),const DeepCollectionEquality().hash(variations),const DeepCollectionEquality().hash(analytics),installs30d,installs90d,installs365d,generatedDate]);

@override
String toString() {
  return 'FormulaModel(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, dependencies: $dependencies, buildDependencies: $buildDependencies, outdated: $outdated, deprecated: $deprecated, disabled: $disabled, isInstalled: $isInstalled, bottle: $bottle, variations: $variations, analytics: $analytics, installs30d: $installs30d, installs90d: $installs90d, installs365d: $installs365d, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class $FormulaModelCopyWith<$Res>  {
  factory $FormulaModelCopyWith(FormulaModel value, $Res Function(FormulaModel) _then) = _$FormulaModelCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String tap, String desc, String? license, String? homepage, FormulaVersions versions, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies, bool outdated, bool deprecated, bool disabled,@JsonKey(name: 'is_installed') bool isInstalled, Map<String, dynamic>? bottle, Map<String, dynamic>? variations, Map<String, dynamic>? analytics, int? installs30d, int? installs90d, int? installs365d,@JsonKey(name: 'generated_date') String? generatedDate
});


$FormulaVersionsCopyWith<$Res> get versions;

}
/// @nodoc
class _$FormulaModelCopyWithImpl<$Res>
    implements $FormulaModelCopyWith<$Res> {
  _$FormulaModelCopyWithImpl(this._self, this._then);

  final FormulaModel _self;
  final $Res Function(FormulaModel) _then;

/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? fullName = null,Object? tap = null,Object? desc = null,Object? license = freezed,Object? homepage = freezed,Object? versions = null,Object? dependencies = null,Object? buildDependencies = null,Object? outdated = null,Object? deprecated = null,Object? disabled = null,Object? isInstalled = null,Object? bottle = freezed,Object? variations = freezed,Object? analytics = freezed,Object? installs30d = freezed,Object? installs90d = freezed,Object? installs365d = freezed,Object? generatedDate = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: null == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FormulaVersions,dependencies: null == dependencies ? _self.dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self.buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,bottle: freezed == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,variations: freezed == variations ? _self.variations : variations // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,installs30d: freezed == installs30d ? _self.installs30d : installs30d // ignore: cast_nullable_to_non_nullable
as int?,installs90d: freezed == installs90d ? _self.installs90d : installs90d // ignore: cast_nullable_to_non_nullable
as int?,installs365d: freezed == installs365d ? _self.installs365d : installs365d // ignore: cast_nullable_to_non_nullable
as int?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<$Res> get versions {
  
  return $FormulaVersionsCopyWith<$Res>(_self.versions, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}


/// Adds pattern-matching-related methods to [FormulaModel].
extension FormulaModelPatterns on FormulaModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaModel value)  $default,){
final _that = this;
switch (_that) {
case _FormulaModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaModel value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String tap,  String desc,  String? license,  String? homepage,  FormulaVersions versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? bottle,  Map<String, dynamic>? variations,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaModel() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.bottle,_that.variations,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(name: 'full_name')  String fullName,  String tap,  String desc,  String? license,  String? homepage,  FormulaVersions versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? bottle,  Map<String, dynamic>? variations,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)  $default,) {final _that = this;
switch (_that) {
case _FormulaModel():
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.bottle,_that.variations,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(name: 'full_name')  String fullName,  String tap,  String desc,  String? license,  String? homepage,  FormulaVersions versions,  List<String> dependencies, @JsonKey(name: 'build_dependencies')  List<String> buildDependencies,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? bottle,  Map<String, dynamic>? variations,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,) {final _that = this;
switch (_that) {
case _FormulaModel() when $default != null:
return $default(_that.name,_that.fullName,_that.tap,_that.desc,_that.license,_that.homepage,_that.versions,_that.dependencies,_that.buildDependencies,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.bottle,_that.variations,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaModel implements FormulaModel {
  const _FormulaModel({required this.name, @JsonKey(name: 'full_name') required this.fullName, required this.tap, required this.desc, this.license, this.homepage, required this.versions, required final  List<String> dependencies, @JsonKey(name: 'build_dependencies') required final  List<String> buildDependencies, this.outdated = false, this.deprecated = false, this.disabled = false, @JsonKey(name: 'is_installed') this.isInstalled = false, final  Map<String, dynamic>? bottle, final  Map<String, dynamic>? variations, final  Map<String, dynamic>? analytics, this.installs30d, this.installs90d, this.installs365d, @JsonKey(name: 'generated_date') this.generatedDate}): _dependencies = dependencies,_buildDependencies = buildDependencies,_bottle = bottle,_variations = variations,_analytics = analytics;
  factory _FormulaModel.fromJson(Map<String, dynamic> json) => _$FormulaModelFromJson(json);

@override final  String name;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String tap;
@override final  String desc;
@override final  String? license;
@override final  String? homepage;
@override final  FormulaVersions versions;
 final  List<String> _dependencies;
@override List<String> get dependencies {
  if (_dependencies is EqualUnmodifiableListView) return _dependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dependencies);
}

 final  List<String> _buildDependencies;
@override@JsonKey(name: 'build_dependencies') List<String> get buildDependencies {
  if (_buildDependencies is EqualUnmodifiableListView) return _buildDependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buildDependencies);
}

@override@JsonKey() final  bool outdated;
@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;
@override@JsonKey(name: 'is_installed') final  bool isInstalled;
 final  Map<String, dynamic>? _bottle;
@override Map<String, dynamic>? get bottle {
  final value = _bottle;
  if (value == null) return null;
  if (_bottle is EqualUnmodifiableMapView) return _bottle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _variations;
@override Map<String, dynamic>? get variations {
  final value = _variations;
  if (value == null) return null;
  if (_variations is EqualUnmodifiableMapView) return _variations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _analytics;
@override Map<String, dynamic>? get analytics {
  final value = _analytics;
  if (value == null) return null;
  if (_analytics is EqualUnmodifiableMapView) return _analytics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int? installs30d;
@override final  int? installs90d;
@override final  int? installs365d;
@override@JsonKey(name: 'generated_date') final  String? generatedDate;

/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaModelCopyWith<_FormulaModel> get copyWith => __$FormulaModelCopyWithImpl<_FormulaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaModel&&(identical(other.name, name) || other.name == name)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.tap, tap) || other.tap == tap)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.license, license) || other.license == license)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.versions, versions) || other.versions == versions)&&const DeepCollectionEquality().equals(other._dependencies, _dependencies)&&const DeepCollectionEquality().equals(other._buildDependencies, _buildDependencies)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&const DeepCollectionEquality().equals(other._bottle, _bottle)&&const DeepCollectionEquality().equals(other._variations, _variations)&&const DeepCollectionEquality().equals(other._analytics, _analytics)&&(identical(other.installs30d, installs30d) || other.installs30d == installs30d)&&(identical(other.installs90d, installs90d) || other.installs90d == installs90d)&&(identical(other.installs365d, installs365d) || other.installs365d == installs365d)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,fullName,tap,desc,license,homepage,versions,const DeepCollectionEquality().hash(_dependencies),const DeepCollectionEquality().hash(_buildDependencies),outdated,deprecated,disabled,isInstalled,const DeepCollectionEquality().hash(_bottle),const DeepCollectionEquality().hash(_variations),const DeepCollectionEquality().hash(_analytics),installs30d,installs90d,installs365d,generatedDate]);

@override
String toString() {
  return 'FormulaModel(name: $name, fullName: $fullName, tap: $tap, desc: $desc, license: $license, homepage: $homepage, versions: $versions, dependencies: $dependencies, buildDependencies: $buildDependencies, outdated: $outdated, deprecated: $deprecated, disabled: $disabled, isInstalled: $isInstalled, bottle: $bottle, variations: $variations, analytics: $analytics, installs30d: $installs30d, installs90d: $installs90d, installs365d: $installs365d, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class _$FormulaModelCopyWith<$Res> implements $FormulaModelCopyWith<$Res> {
  factory _$FormulaModelCopyWith(_FormulaModel value, $Res Function(_FormulaModel) _then) = __$FormulaModelCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(name: 'full_name') String fullName, String tap, String desc, String? license, String? homepage, FormulaVersions versions, List<String> dependencies,@JsonKey(name: 'build_dependencies') List<String> buildDependencies, bool outdated, bool deprecated, bool disabled,@JsonKey(name: 'is_installed') bool isInstalled, Map<String, dynamic>? bottle, Map<String, dynamic>? variations, Map<String, dynamic>? analytics, int? installs30d, int? installs90d, int? installs365d,@JsonKey(name: 'generated_date') String? generatedDate
});


@override $FormulaVersionsCopyWith<$Res> get versions;

}
/// @nodoc
class __$FormulaModelCopyWithImpl<$Res>
    implements _$FormulaModelCopyWith<$Res> {
  __$FormulaModelCopyWithImpl(this._self, this._then);

  final _FormulaModel _self;
  final $Res Function(_FormulaModel) _then;

/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? fullName = null,Object? tap = null,Object? desc = null,Object? license = freezed,Object? homepage = freezed,Object? versions = null,Object? dependencies = null,Object? buildDependencies = null,Object? outdated = null,Object? deprecated = null,Object? disabled = null,Object? isInstalled = null,Object? bottle = freezed,Object? variations = freezed,Object? analytics = freezed,Object? installs30d = freezed,Object? installs90d = freezed,Object? installs365d = freezed,Object? generatedDate = freezed,}) {
  return _then(_FormulaModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,tap: null == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,versions: null == versions ? _self.versions : versions // ignore: cast_nullable_to_non_nullable
as FormulaVersions,dependencies: null == dependencies ? _self._dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,buildDependencies: null == buildDependencies ? _self._buildDependencies : buildDependencies // ignore: cast_nullable_to_non_nullable
as List<String>,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,bottle: freezed == bottle ? _self._bottle : bottle // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,variations: freezed == variations ? _self._variations : variations // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,analytics: freezed == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,installs30d: freezed == installs30d ? _self.installs30d : installs30d // ignore: cast_nullable_to_non_nullable
as int?,installs90d: freezed == installs90d ? _self.installs90d : installs90d // ignore: cast_nullable_to_non_nullable
as int?,installs365d: freezed == installs365d ? _self.installs365d : installs365d // ignore: cast_nullable_to_non_nullable
as int?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of FormulaModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<$Res> get versions {
  
  return $FormulaVersionsCopyWith<$Res>(_self.versions, (value) {
    return _then(_self.copyWith(versions: value));
  });
}
}


/// @nodoc
mixin _$FormulaVersions {

 String get stable; String? get head; bool get bottle;
/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaVersionsCopyWith<FormulaVersions> get copyWith => _$FormulaVersionsCopyWithImpl<FormulaVersions>(this as FormulaVersions, _$identity);

  /// Serializes this FormulaVersions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaVersions&&(identical(other.stable, stable) || other.stable == stable)&&(identical(other.head, head) || other.head == head)&&(identical(other.bottle, bottle) || other.bottle == bottle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stable,head,bottle);

@override
String toString() {
  return 'FormulaVersions(stable: $stable, head: $head, bottle: $bottle)';
}


}

/// @nodoc
abstract mixin class $FormulaVersionsCopyWith<$Res>  {
  factory $FormulaVersionsCopyWith(FormulaVersions value, $Res Function(FormulaVersions) _then) = _$FormulaVersionsCopyWithImpl;
@useResult
$Res call({
 String stable, String? head, bool bottle
});




}
/// @nodoc
class _$FormulaVersionsCopyWithImpl<$Res>
    implements $FormulaVersionsCopyWith<$Res> {
  _$FormulaVersionsCopyWithImpl(this._self, this._then);

  final FormulaVersions _self;
  final $Res Function(FormulaVersions) _then;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stable = null,Object? head = freezed,Object? bottle = null,}) {
  return _then(_self.copyWith(
stable: null == stable ? _self.stable : stable // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,bottle: null == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaVersions].
extension FormulaVersionsPatterns on FormulaVersions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaVersions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaVersions value)  $default,){
final _that = this;
switch (_that) {
case _FormulaVersions():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaVersions value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String stable,  String? head,  bool bottle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that.stable,_that.head,_that.bottle);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String stable,  String? head,  bool bottle)  $default,) {final _that = this;
switch (_that) {
case _FormulaVersions():
return $default(_that.stable,_that.head,_that.bottle);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String stable,  String? head,  bool bottle)?  $default,) {final _that = this;
switch (_that) {
case _FormulaVersions() when $default != null:
return $default(_that.stable,_that.head,_that.bottle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaVersions implements FormulaVersions {
  const _FormulaVersions({required this.stable, this.head, required this.bottle});
  factory _FormulaVersions.fromJson(Map<String, dynamic> json) => _$FormulaVersionsFromJson(json);

@override final  String stable;
@override final  String? head;
@override final  bool bottle;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaVersionsCopyWith<_FormulaVersions> get copyWith => __$FormulaVersionsCopyWithImpl<_FormulaVersions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaVersionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaVersions&&(identical(other.stable, stable) || other.stable == stable)&&(identical(other.head, head) || other.head == head)&&(identical(other.bottle, bottle) || other.bottle == bottle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stable,head,bottle);

@override
String toString() {
  return 'FormulaVersions(stable: $stable, head: $head, bottle: $bottle)';
}


}

/// @nodoc
abstract mixin class _$FormulaVersionsCopyWith<$Res> implements $FormulaVersionsCopyWith<$Res> {
  factory _$FormulaVersionsCopyWith(_FormulaVersions value, $Res Function(_FormulaVersions) _then) = __$FormulaVersionsCopyWithImpl;
@override @useResult
$Res call({
 String stable, String? head, bool bottle
});




}
/// @nodoc
class __$FormulaVersionsCopyWithImpl<$Res>
    implements _$FormulaVersionsCopyWith<$Res> {
  __$FormulaVersionsCopyWithImpl(this._self, this._then);

  final _FormulaVersions _self;
  final $Res Function(_FormulaVersions) _then;

/// Create a copy of FormulaVersions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stable = null,Object? head = freezed,Object? bottle = null,}) {
  return _then(_FormulaVersions(
stable: null == stable ? _self.stable : stable // ignore: cast_nullable_to_non_nullable
as String,head: freezed == head ? _self.head : head // ignore: cast_nullable_to_non_nullable
as String?,bottle: null == bottle ? _self.bottle : bottle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
