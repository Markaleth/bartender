// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tap_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TapModel {

 String get name; String get user; String get repo; String get path; bool get installed; bool get official;@JsonKey(name: 'custom_remote') bool? get customRemote; String? get remote;@JsonKey(name: 'formula_names') List<String> get formulaNames;@JsonKey(name: 'cask_tokens') List<String> get caskTokens; DateTime? get lastSync;
/// Create a copy of TapModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapModelCopyWith<TapModel> get copyWith => _$TapModelCopyWithImpl<TapModel>(this as TapModel, _$identity);

  /// Serializes this TapModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapModel&&(identical(other.name, name) || other.name == name)&&(identical(other.user, user) || other.user == user)&&(identical(other.repo, repo) || other.repo == repo)&&(identical(other.path, path) || other.path == path)&&(identical(other.installed, installed) || other.installed == installed)&&(identical(other.official, official) || other.official == official)&&(identical(other.customRemote, customRemote) || other.customRemote == customRemote)&&(identical(other.remote, remote) || other.remote == remote)&&const DeepCollectionEquality().equals(other.formulaNames, formulaNames)&&const DeepCollectionEquality().equals(other.caskTokens, caskTokens)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,user,repo,path,installed,official,customRemote,remote,const DeepCollectionEquality().hash(formulaNames),const DeepCollectionEquality().hash(caskTokens),lastSync);

@override
String toString() {
  return 'TapModel(name: $name, user: $user, repo: $repo, path: $path, installed: $installed, official: $official, customRemote: $customRemote, remote: $remote, formulaNames: $formulaNames, caskTokens: $caskTokens, lastSync: $lastSync)';
}


}

/// @nodoc
abstract mixin class $TapModelCopyWith<$Res>  {
  factory $TapModelCopyWith(TapModel value, $Res Function(TapModel) _then) = _$TapModelCopyWithImpl;
@useResult
$Res call({
 String name, String user, String repo, String path, bool installed, bool official,@JsonKey(name: 'custom_remote') bool? customRemote, String? remote,@JsonKey(name: 'formula_names') List<String> formulaNames,@JsonKey(name: 'cask_tokens') List<String> caskTokens, DateTime? lastSync
});




}
/// @nodoc
class _$TapModelCopyWithImpl<$Res>
    implements $TapModelCopyWith<$Res> {
  _$TapModelCopyWithImpl(this._self, this._then);

  final TapModel _self;
  final $Res Function(TapModel) _then;

/// Create a copy of TapModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? user = null,Object? repo = null,Object? path = null,Object? installed = null,Object? official = null,Object? customRemote = freezed,Object? remote = freezed,Object? formulaNames = null,Object? caskTokens = null,Object? lastSync = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,repo: null == repo ? _self.repo : repo // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,installed: null == installed ? _self.installed : installed // ignore: cast_nullable_to_non_nullable
as bool,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,customRemote: freezed == customRemote ? _self.customRemote : customRemote // ignore: cast_nullable_to_non_nullable
as bool?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,formulaNames: null == formulaNames ? _self.formulaNames : formulaNames // ignore: cast_nullable_to_non_nullable
as List<String>,caskTokens: null == caskTokens ? _self.caskTokens : caskTokens // ignore: cast_nullable_to_non_nullable
as List<String>,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TapModel].
extension TapModelPatterns on TapModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TapModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TapModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TapModel value)  $default,){
final _that = this;
switch (_that) {
case _TapModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TapModel value)?  $default,){
final _that = this;
switch (_that) {
case _TapModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String user,  String repo,  String path,  bool installed,  bool official, @JsonKey(name: 'custom_remote')  bool? customRemote,  String? remote, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'cask_tokens')  List<String> caskTokens,  DateTime? lastSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TapModel() when $default != null:
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.customRemote,_that.remote,_that.formulaNames,_that.caskTokens,_that.lastSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String user,  String repo,  String path,  bool installed,  bool official, @JsonKey(name: 'custom_remote')  bool? customRemote,  String? remote, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'cask_tokens')  List<String> caskTokens,  DateTime? lastSync)  $default,) {final _that = this;
switch (_that) {
case _TapModel():
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.customRemote,_that.remote,_that.formulaNames,_that.caskTokens,_that.lastSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String user,  String repo,  String path,  bool installed,  bool official, @JsonKey(name: 'custom_remote')  bool? customRemote,  String? remote, @JsonKey(name: 'formula_names')  List<String> formulaNames, @JsonKey(name: 'cask_tokens')  List<String> caskTokens,  DateTime? lastSync)?  $default,) {final _that = this;
switch (_that) {
case _TapModel() when $default != null:
return $default(_that.name,_that.user,_that.repo,_that.path,_that.installed,_that.official,_that.customRemote,_that.remote,_that.formulaNames,_that.caskTokens,_that.lastSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TapModel implements TapModel {
  const _TapModel({required this.name, required this.user, required this.repo, required this.path, this.installed = false, this.official = false, @JsonKey(name: 'custom_remote') this.customRemote, this.remote, @JsonKey(name: 'formula_names') final  List<String> formulaNames = const [], @JsonKey(name: 'cask_tokens') final  List<String> caskTokens = const [], this.lastSync}): _formulaNames = formulaNames,_caskTokens = caskTokens;
  factory _TapModel.fromJson(Map<String, dynamic> json) => _$TapModelFromJson(json);

@override final  String name;
@override final  String user;
@override final  String repo;
@override final  String path;
@override@JsonKey() final  bool installed;
@override@JsonKey() final  bool official;
@override@JsonKey(name: 'custom_remote') final  bool? customRemote;
@override final  String? remote;
 final  List<String> _formulaNames;
@override@JsonKey(name: 'formula_names') List<String> get formulaNames {
  if (_formulaNames is EqualUnmodifiableListView) return _formulaNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_formulaNames);
}

 final  List<String> _caskTokens;
@override@JsonKey(name: 'cask_tokens') List<String> get caskTokens {
  if (_caskTokens is EqualUnmodifiableListView) return _caskTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_caskTokens);
}

@override final  DateTime? lastSync;

/// Create a copy of TapModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapModelCopyWith<_TapModel> get copyWith => __$TapModelCopyWithImpl<_TapModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TapModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TapModel&&(identical(other.name, name) || other.name == name)&&(identical(other.user, user) || other.user == user)&&(identical(other.repo, repo) || other.repo == repo)&&(identical(other.path, path) || other.path == path)&&(identical(other.installed, installed) || other.installed == installed)&&(identical(other.official, official) || other.official == official)&&(identical(other.customRemote, customRemote) || other.customRemote == customRemote)&&(identical(other.remote, remote) || other.remote == remote)&&const DeepCollectionEquality().equals(other._formulaNames, _formulaNames)&&const DeepCollectionEquality().equals(other._caskTokens, _caskTokens)&&(identical(other.lastSync, lastSync) || other.lastSync == lastSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,user,repo,path,installed,official,customRemote,remote,const DeepCollectionEquality().hash(_formulaNames),const DeepCollectionEquality().hash(_caskTokens),lastSync);

@override
String toString() {
  return 'TapModel(name: $name, user: $user, repo: $repo, path: $path, installed: $installed, official: $official, customRemote: $customRemote, remote: $remote, formulaNames: $formulaNames, caskTokens: $caskTokens, lastSync: $lastSync)';
}


}

/// @nodoc
abstract mixin class _$TapModelCopyWith<$Res> implements $TapModelCopyWith<$Res> {
  factory _$TapModelCopyWith(_TapModel value, $Res Function(_TapModel) _then) = __$TapModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String user, String repo, String path, bool installed, bool official,@JsonKey(name: 'custom_remote') bool? customRemote, String? remote,@JsonKey(name: 'formula_names') List<String> formulaNames,@JsonKey(name: 'cask_tokens') List<String> caskTokens, DateTime? lastSync
});




}
/// @nodoc
class __$TapModelCopyWithImpl<$Res>
    implements _$TapModelCopyWith<$Res> {
  __$TapModelCopyWithImpl(this._self, this._then);

  final _TapModel _self;
  final $Res Function(_TapModel) _then;

/// Create a copy of TapModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? user = null,Object? repo = null,Object? path = null,Object? installed = null,Object? official = null,Object? customRemote = freezed,Object? remote = freezed,Object? formulaNames = null,Object? caskTokens = null,Object? lastSync = freezed,}) {
  return _then(_TapModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,repo: null == repo ? _self.repo : repo // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,installed: null == installed ? _self.installed : installed // ignore: cast_nullable_to_non_nullable
as bool,official: null == official ? _self.official : official // ignore: cast_nullable_to_non_nullable
as bool,customRemote: freezed == customRemote ? _self.customRemote : customRemote // ignore: cast_nullable_to_non_nullable
as bool?,remote: freezed == remote ? _self.remote : remote // ignore: cast_nullable_to_non_nullable
as String?,formulaNames: null == formulaNames ? _self._formulaNames : formulaNames // ignore: cast_nullable_to_non_nullable
as List<String>,caskTokens: null == caskTokens ? _self._caskTokens : caskTokens // ignore: cast_nullable_to_non_nullable
as List<String>,lastSync: freezed == lastSync ? _self.lastSync : lastSync // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
