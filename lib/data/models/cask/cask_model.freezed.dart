// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cask_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cask {

 String get token; List<String> get name; String? get desc; String? get homepage; String? get url; String get version;@JsonKey(name: 'auto_updates') bool? get autoUpdates;@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn; bool get outdated; bool get deprecated; bool get disabled;
/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskCopyWith<Cask> get copyWith => _$CaskCopyWithImpl<Cask>(this as Cask, _$identity);

  /// Serializes this Cask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cask&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,const DeepCollectionEquality().hash(name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(dependsOn),outdated,deprecated,disabled);

@override
String toString() {
  return 'Cask(token: $token, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class $CaskCopyWith<$Res>  {
  factory $CaskCopyWith(Cask value, $Res Function(Cask) _then) = _$CaskCopyWithImpl;
@useResult
$Res call({
 String token, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled
});




}
/// @nodoc
class _$CaskCopyWithImpl<$Res>
    implements $CaskCopyWith<$Res> {
  _$CaskCopyWithImpl(this._self, this._then);

  final Cask _self;
  final $Res Function(Cask) _then;

/// Create a copy of Cask
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


/// Adds pattern-matching-related methods to [Cask].
extension CaskPatterns on Cask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cask value)  $default,){
final _that = this;
switch (_that) {
case _Cask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cask value)?  $default,){
final _that = this;
switch (_that) {
case _Cask() when $default != null:
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
case _Cask() when $default != null:
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
case _Cask():
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
case _Cask() when $default != null:
return $default(_that.token,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cask implements Cask {
  const _Cask({required this.token, required final  List<String> name, this.desc, this.homepage, this.url, required this.version, @JsonKey(name: 'auto_updates') this.autoUpdates, @JsonKey(name: 'depends_on') final  Map<String, dynamic>? dependsOn, this.outdated = false, this.deprecated = false, this.disabled = false}): _name = name,_dependsOn = dependsOn;
  factory _Cask.fromJson(Map<String, dynamic> json) => _$CaskFromJson(json);

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

/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskCopyWith<_Cask> get copyWith => __$CaskCopyWithImpl<_Cask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cask&&(identical(other.token, token) || other.token == token)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,const DeepCollectionEquality().hash(_name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(_dependsOn),outdated,deprecated,disabled);

@override
String toString() {
  return 'Cask(token: $token, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled)';
}


}

/// @nodoc
abstract mixin class _$CaskCopyWith<$Res> implements $CaskCopyWith<$Res> {
  factory _$CaskCopyWith(_Cask value, $Res Function(_Cask) _then) = __$CaskCopyWithImpl;
@override @useResult
$Res call({
 String token, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled
});




}
/// @nodoc
class __$CaskCopyWithImpl<$Res>
    implements _$CaskCopyWith<$Res> {
  __$CaskCopyWithImpl(this._self, this._then);

  final _Cask _self;
  final $Res Function(_Cask) _then;

/// Create a copy of Cask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? name = null,Object? desc = freezed,Object? homepage = freezed,Object? url = freezed,Object? version = null,Object? autoUpdates = freezed,Object? dependsOn = freezed,Object? outdated = null,Object? deprecated = null,Object? disabled = null,}) {
  return _then(_Cask(
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
