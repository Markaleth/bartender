// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cask_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CaskDetailModel {

 String get token; List<String> get name; String? get desc; String? get homepage; String? get url; String get version;@JsonKey(name: 'auto_updates') bool? get autoUpdates;@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn; bool get outdated; bool get deprecated; bool get disabled;
/// Create a copy of CaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskDetailModelCopyWith<CaskDetailModel> get copyWith => _$CaskDetailModelCopyWithImpl<CaskDetailModel>(this as CaskDetailModel, _$identity);

  /// Serializes this CaskDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaskDetailModel&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,const DeepCollectionEquality().hash(name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(dependsOn),outdated,deprecated,disabled);

@override
String toString() {
  return 'CaskDetailModel(token: $token, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class $CaskDetailModelCopyWith<$Res>  {
  factory $CaskDetailModelCopyWith(CaskDetailModel value, $Res Function(CaskDetailModel) _then) = _$CaskDetailModelCopyWithImpl;
@useResult
$Res call({
 String token, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled
});




}
/// @nodoc
class _$CaskDetailModelCopyWithImpl<$Res>
    implements $CaskDetailModelCopyWith<$Res> {
  _$CaskDetailModelCopyWithImpl(this._self, this._then);

  final CaskDetailModel _self;
  final $Res Function(CaskDetailModel) _then;

/// Create a copy of CaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? name = null,Object? desc = freezed,Object? homepage = freezed,Object? url = freezed,Object? version = null,Object? autoUpdates = freezed,Object? dependsOn = freezed,Object? outdated = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as List<String>,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CaskDetailModel].
extension CaskDetailModelPatterns on CaskDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaskDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaskDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CaskDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaskDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CaskDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskDetailModel() when $default != null:
return $default(_that.token,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled)  $default,) {final _that = this;
switch (_that) {
case _CaskDetailModel():
return $default(_that.token,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled)?  $default,) {final _that = this;
switch (_that) {
case _CaskDetailModel() when $default != null:
return $default(_that.token,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaskDetailModel implements CaskDetailModel {
  const _CaskDetailModel({required this.token, required final  List<String> name, this.desc, this.homepage, this.url, required this.version, @JsonKey(name: 'auto_updates') this.autoUpdates, @JsonKey(name: 'depends_on') final  Map<String, dynamic>? dependsOn, this.outdated = false, this.deprecated = false, this.disabled = false}): _name = name,_dependsOn = dependsOn;
  factory _CaskDetailModel.fromJson(Map<String, dynamic> json) => _$CaskDetailModelFromJson(json);

@override final  String token;
 final  List<String> _name;
@override List<String> get name {
  if (_name is EqualUnmodifiableListView) return _name;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_name);
}

@override final  String? desc;
@override final  String? homepage;
@override final  String? url;
@override final  String version;
@override@JsonKey(name: 'auto_updates') final  bool? autoUpdates;
 final  Map<String, dynamic>? _dependsOn;
@override@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn {
  final value = _dependsOn;
  if (value == null) return null;
  if (_dependsOn is EqualUnmodifiableMapView) return _dependsOn;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool outdated;
@override@JsonKey() final  bool deprecated;
@override@JsonKey() final  bool disabled;

/// Create a copy of CaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskDetailModelCopyWith<_CaskDetailModel> get copyWith => __$CaskDetailModelCopyWithImpl<_CaskDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskDetailModel&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,const DeepCollectionEquality().hash(_name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(_dependsOn),outdated,deprecated,disabled);

@override
String toString() {
  return 'CaskDetailModel(token: $token, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class _$CaskDetailModelCopyWith<$Res> implements $CaskDetailModelCopyWith<$Res> {
  factory _$CaskDetailModelCopyWith(_CaskDetailModel value, $Res Function(_CaskDetailModel) _then) = __$CaskDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String token, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled
});




}
/// @nodoc
class __$CaskDetailModelCopyWithImpl<$Res>
    implements _$CaskDetailModelCopyWith<$Res> {
  __$CaskDetailModelCopyWithImpl(this._self, this._then);

  final _CaskDetailModel _self;
  final $Res Function(_CaskDetailModel) _then;

/// Create a copy of CaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? name = null,Object? desc = freezed,Object? homepage = freezed,Object? url = freezed,Object? version = null,Object? autoUpdates = freezed,Object? dependsOn = freezed,Object? outdated = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_CaskDetailModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as List<String>,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,dependsOn: freezed == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
