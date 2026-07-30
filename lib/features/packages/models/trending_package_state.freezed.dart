// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_package_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrendingPackageState {

 String get id; String? get description; String get version; String? get homepage; String? get formattedDownloads; bool get isInstalled; bool get isFormula; bool get isSupported;
/// Create a copy of TrendingPackageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendingPackageStateCopyWith<TrendingPackageState> get copyWith => _$TrendingPackageStateCopyWithImpl<TrendingPackageState>(this as TrendingPackageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendingPackageState&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.formattedDownloads, formattedDownloads) || other.formattedDownloads == formattedDownloads)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.isFormula, isFormula) || other.isFormula == isFormula)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,version,homepage,formattedDownloads,isInstalled,isFormula,isSupported);

@override
String toString() {
  return 'TrendingPackageState(id: $id, description: $description, version: $version, homepage: $homepage, formattedDownloads: $formattedDownloads, isInstalled: $isInstalled, isFormula: $isFormula, isSupported: $isSupported)';
}


}

/// @nodoc
abstract mixin class $TrendingPackageStateCopyWith<$Res>  {
  factory $TrendingPackageStateCopyWith(TrendingPackageState value, $Res Function(TrendingPackageState) _then) = _$TrendingPackageStateCopyWithImpl;
@useResult
$Res call({
 String id, String? description, String version, String? homepage, String? formattedDownloads, bool isInstalled, bool isFormula, bool isSupported
});




}
/// @nodoc
class _$TrendingPackageStateCopyWithImpl<$Res>
    implements $TrendingPackageStateCopyWith<$Res> {
  _$TrendingPackageStateCopyWithImpl(this._self, this._then);

  final TrendingPackageState _self;
  final $Res Function(TrendingPackageState) _then;

/// Create a copy of TrendingPackageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = freezed,Object? version = null,Object? homepage = freezed,Object? formattedDownloads = freezed,Object? isInstalled = null,Object? isFormula = null,Object? isSupported = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,formattedDownloads: freezed == formattedDownloads ? _self.formattedDownloads : formattedDownloads // ignore: cast_nullable_to_non_nullable
as String?,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,isFormula: null == isFormula ? _self.isFormula : isFormula // ignore: cast_nullable_to_non_nullable
as bool,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendingPackageState].
extension TrendingPackageStatePatterns on TrendingPackageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendingPackageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendingPackageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendingPackageState value)  $default,){
final _that = this;
switch (_that) {
case _TrendingPackageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendingPackageState value)?  $default,){
final _that = this;
switch (_that) {
case _TrendingPackageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? description,  String version,  String? homepage,  String? formattedDownloads,  bool isInstalled,  bool isFormula,  bool isSupported)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendingPackageState() when $default != null:
return $default(_that.id,_that.description,_that.version,_that.homepage,_that.formattedDownloads,_that.isInstalled,_that.isFormula,_that.isSupported);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? description,  String version,  String? homepage,  String? formattedDownloads,  bool isInstalled,  bool isFormula,  bool isSupported)  $default,) {final _that = this;
switch (_that) {
case _TrendingPackageState():
return $default(_that.id,_that.description,_that.version,_that.homepage,_that.formattedDownloads,_that.isInstalled,_that.isFormula,_that.isSupported);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? description,  String version,  String? homepage,  String? formattedDownloads,  bool isInstalled,  bool isFormula,  bool isSupported)?  $default,) {final _that = this;
switch (_that) {
case _TrendingPackageState() when $default != null:
return $default(_that.id,_that.description,_that.version,_that.homepage,_that.formattedDownloads,_that.isInstalled,_that.isFormula,_that.isSupported);case _:
  return null;

}
}

}

/// @nodoc


class _TrendingPackageState extends TrendingPackageState {
  const _TrendingPackageState({required this.id, required this.description, required this.version, required this.homepage, required this.formattedDownloads, required this.isInstalled, required this.isFormula, required this.isSupported}): super._();
  

@override final  String id;
@override final  String? description;
@override final  String version;
@override final  String? homepage;
@override final  String? formattedDownloads;
@override final  bool isInstalled;
@override final  bool isFormula;
@override final  bool isSupported;

/// Create a copy of TrendingPackageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendingPackageStateCopyWith<_TrendingPackageState> get copyWith => __$TrendingPackageStateCopyWithImpl<_TrendingPackageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendingPackageState&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.formattedDownloads, formattedDownloads) || other.formattedDownloads == formattedDownloads)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.isFormula, isFormula) || other.isFormula == isFormula)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported));
}


@override
int get hashCode => Object.hash(runtimeType,id,description,version,homepage,formattedDownloads,isInstalled,isFormula,isSupported);

@override
String toString() {
  return 'TrendingPackageState(id: $id, description: $description, version: $version, homepage: $homepage, formattedDownloads: $formattedDownloads, isInstalled: $isInstalled, isFormula: $isFormula, isSupported: $isSupported)';
}


}

/// @nodoc
abstract mixin class _$TrendingPackageStateCopyWith<$Res> implements $TrendingPackageStateCopyWith<$Res> {
  factory _$TrendingPackageStateCopyWith(_TrendingPackageState value, $Res Function(_TrendingPackageState) _then) = __$TrendingPackageStateCopyWithImpl;
@override @useResult
$Res call({
 String id, String? description, String version, String? homepage, String? formattedDownloads, bool isInstalled, bool isFormula, bool isSupported
});




}
/// @nodoc
class __$TrendingPackageStateCopyWithImpl<$Res>
    implements _$TrendingPackageStateCopyWith<$Res> {
  __$TrendingPackageStateCopyWithImpl(this._self, this._then);

  final _TrendingPackageState _self;
  final $Res Function(_TrendingPackageState) _then;

/// Create a copy of TrendingPackageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = freezed,Object? version = null,Object? homepage = freezed,Object? formattedDownloads = freezed,Object? isInstalled = null,Object? isFormula = null,Object? isSupported = null,}) {
  return _then(_TrendingPackageState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,formattedDownloads: freezed == formattedDownloads ? _self.formattedDownloads : formattedDownloads // ignore: cast_nullable_to_non_nullable
as String?,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,isFormula: null == isFormula ? _self.isFormula : isFormula // ignore: cast_nullable_to_non_nullable
as bool,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
