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
mixin _$CaskModel {

 String get token;@JsonKey(name: 'full_token') String? get fullToken; List<String> get name; String? get desc; String? get homepage; String? get url; String get version;@JsonKey(name: 'auto_updates') bool? get autoUpdates;@JsonKey(name: 'depends_on') Map<String, dynamic>? get dependsOn; bool get outdated; bool get deprecated; bool get disabled;@JsonKey(name: 'is_installed') bool get isInstalled; Map<String, dynamic>? get analytics; int? get installs30d; int? get installs90d; int? get installs365d;@JsonKey(name: 'generated_date') String? get generatedDate;
/// Create a copy of CaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskModelCopyWith<CaskModel> get copyWith => _$CaskModelCopyWithImpl<CaskModel>(this as CaskModel, _$identity);

  /// Serializes this CaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaskModel&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&const DeepCollectionEquality().equals(other.name, name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other.dependsOn, dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&const DeepCollectionEquality().equals(other.analytics, analytics)&&(identical(other.installs30d, installs30d) || other.installs30d == installs30d)&&(identical(other.installs90d, installs90d) || other.installs90d == installs90d)&&(identical(other.installs365d, installs365d) || other.installs365d == installs365d)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,const DeepCollectionEquality().hash(name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(dependsOn),outdated,deprecated,disabled,isInstalled,const DeepCollectionEquality().hash(analytics),installs30d,installs90d,installs365d,generatedDate);

@override
String toString() {
  return 'CaskModel(token: $token, fullToken: $fullToken, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled, isInstalled: $isInstalled, analytics: $analytics, installs30d: $installs30d, installs90d: $installs90d, installs365d: $installs365d, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class $CaskModelCopyWith<$Res>  {
  factory $CaskModelCopyWith(CaskModel value, $Res Function(CaskModel) _then) = _$CaskModelCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled,@JsonKey(name: 'is_installed') bool isInstalled, Map<String, dynamic>? analytics, int? installs30d, int? installs90d, int? installs365d,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class _$CaskModelCopyWithImpl<$Res>
    implements $CaskModelCopyWith<$Res> {
  _$CaskModelCopyWithImpl(this._self, this._then);

  final CaskModel _self;
  final $Res Function(CaskModel) _then;

/// Create a copy of CaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? fullToken = freezed,Object? name = null,Object? desc = freezed,Object? homepage = freezed,Object? url = freezed,Object? version = null,Object? autoUpdates = freezed,Object? dependsOn = freezed,Object? outdated = null,Object? deprecated = null,Object? disabled = null,Object? isInstalled = null,Object? analytics = freezed,Object? installs30d = freezed,Object? installs90d = freezed,Object? installs365d = freezed,Object? generatedDate = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as List<String>,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,dependsOn: freezed == dependsOn ? _self.dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,installs30d: freezed == installs30d ? _self.installs30d : installs30d // ignore: cast_nullable_to_non_nullable
as int?,installs90d: freezed == installs90d ? _self.installs90d : installs90d // ignore: cast_nullable_to_non_nullable
as int?,installs365d: freezed == installs365d ? _self.installs365d : installs365d // ignore: cast_nullable_to_non_nullable
as int?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CaskModel].
extension CaskModelPatterns on CaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaskModel value)  $default,){
final _that = this;
switch (_that) {
case _CaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _CaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskModel() when $default != null:
return $default(_that.token,_that.fullToken,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)  $default,) {final _that = this;
switch (_that) {
case _CaskModel():
return $default(_that.token,_that.fullToken,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'full_token')  String? fullToken,  List<String> name,  String? desc,  String? homepage,  String? url,  String version, @JsonKey(name: 'auto_updates')  bool? autoUpdates, @JsonKey(name: 'depends_on')  Map<String, dynamic>? dependsOn,  bool outdated,  bool deprecated,  bool disabled, @JsonKey(name: 'is_installed')  bool isInstalled,  Map<String, dynamic>? analytics,  int? installs30d,  int? installs90d,  int? installs365d, @JsonKey(name: 'generated_date')  String? generatedDate)?  $default,) {final _that = this;
switch (_that) {
case _CaskModel() when $default != null:
return $default(_that.token,_that.fullToken,_that.name,_that.desc,_that.homepage,_that.url,_that.version,_that.autoUpdates,_that.dependsOn,_that.outdated,_that.deprecated,_that.disabled,_that.isInstalled,_that.analytics,_that.installs30d,_that.installs90d,_that.installs365d,_that.generatedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaskModel implements CaskModel {
  const _CaskModel({required this.token, @JsonKey(name: 'full_token') this.fullToken, required final  List<String> name, this.desc, this.homepage, this.url, required this.version, @JsonKey(name: 'auto_updates') this.autoUpdates, @JsonKey(name: 'depends_on') final  Map<String, dynamic>? dependsOn, this.outdated = false, this.deprecated = false, this.disabled = false, @JsonKey(name: 'is_installed') this.isInstalled = false, final  Map<String, dynamic>? analytics, this.installs30d, this.installs90d, this.installs365d, @JsonKey(name: 'generated_date') this.generatedDate}): _name = name,_dependsOn = dependsOn,_analytics = analytics;
  factory _CaskModel.fromJson(Map<String, dynamic> json) => _$CaskModelFromJson(json);

@override final  String token;
@override@JsonKey(name: 'full_token') final  String? fullToken;
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
@override@JsonKey(name: 'is_installed') final  bool isInstalled;
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

/// Create a copy of CaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskModelCopyWith<_CaskModel> get copyWith => __$CaskModelCopyWithImpl<_CaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskModel&&(identical(other.token, token) || other.token == token)&&(identical(other.fullToken, fullToken) || other.fullToken == fullToken)&&const DeepCollectionEquality().equals(other._name, _name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.url, url) || other.url == url)&&(identical(other.version, version) || other.version == version)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&const DeepCollectionEquality().equals(other._dependsOn, _dependsOn)&&(identical(other.outdated, outdated) || other.outdated == outdated)&&(identical(other.deprecated, deprecated) || other.deprecated == deprecated)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&const DeepCollectionEquality().equals(other._analytics, _analytics)&&(identical(other.installs30d, installs30d) || other.installs30d == installs30d)&&(identical(other.installs90d, installs90d) || other.installs90d == installs90d)&&(identical(other.installs365d, installs365d) || other.installs365d == installs365d)&&(identical(other.generatedDate, generatedDate) || other.generatedDate == generatedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,fullToken,const DeepCollectionEquality().hash(_name),desc,homepage,url,version,autoUpdates,const DeepCollectionEquality().hash(_dependsOn),outdated,deprecated,disabled,isInstalled,const DeepCollectionEquality().hash(_analytics),installs30d,installs90d,installs365d,generatedDate);

@override
String toString() {
  return 'CaskModel(token: $token, fullToken: $fullToken, name: $name, desc: $desc, homepage: $homepage, url: $url, version: $version, autoUpdates: $autoUpdates, dependsOn: $dependsOn, outdated: $outdated, deprecated: $deprecated, disabled: $disabled, isInstalled: $isInstalled, analytics: $analytics, installs30d: $installs30d, installs90d: $installs90d, installs365d: $installs365d, generatedDate: $generatedDate)';
}


}

/// @nodoc
abstract mixin class _$CaskModelCopyWith<$Res> implements $CaskModelCopyWith<$Res> {
  factory _$CaskModelCopyWith(_CaskModel value, $Res Function(_CaskModel) _then) = __$CaskModelCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'full_token') String? fullToken, List<String> name, String? desc, String? homepage, String? url, String version,@JsonKey(name: 'auto_updates') bool? autoUpdates,@JsonKey(name: 'depends_on') Map<String, dynamic>? dependsOn, bool outdated, bool deprecated, bool disabled,@JsonKey(name: 'is_installed') bool isInstalled, Map<String, dynamic>? analytics, int? installs30d, int? installs90d, int? installs365d,@JsonKey(name: 'generated_date') String? generatedDate
});




}
/// @nodoc
class __$CaskModelCopyWithImpl<$Res>
    implements _$CaskModelCopyWith<$Res> {
  __$CaskModelCopyWithImpl(this._self, this._then);

  final _CaskModel _self;
  final $Res Function(_CaskModel) _then;

/// Create a copy of CaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? fullToken = freezed,Object? name = null,Object? desc = freezed,Object? homepage = freezed,Object? url = freezed,Object? version = null,Object? autoUpdates = freezed,Object? dependsOn = freezed,Object? outdated = null,Object? deprecated = null,Object? disabled = null,Object? isInstalled = null,Object? analytics = freezed,Object? installs30d = freezed,Object? installs90d = freezed,Object? installs365d = freezed,Object? generatedDate = freezed,}) {
  return _then(_CaskModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,fullToken: freezed == fullToken ? _self.fullToken : fullToken // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self._name : name // ignore: cast_nullable_to_non_nullable
as List<String>,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,autoUpdates: freezed == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool?,dependsOn: freezed == dependsOn ? _self._dependsOn : dependsOn // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,outdated: null == outdated ? _self.outdated : outdated // ignore: cast_nullable_to_non_nullable
as bool,deprecated: null == deprecated ? _self.deprecated : deprecated // ignore: cast_nullable_to_non_nullable
as bool,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,analytics: freezed == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,installs30d: freezed == installs30d ? _self.installs30d : installs30d // ignore: cast_nullable_to_non_nullable
as int?,installs90d: freezed == installs90d ? _self.installs90d : installs90d // ignore: cast_nullable_to_non_nullable
as int?,installs365d: freezed == installs365d ? _self.installs365d : installs365d // ignore: cast_nullable_to_non_nullable
as int?,generatedDate: freezed == generatedDate ? _self.generatedDate : generatedDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
