// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryState {

 bool get isLoading; List<FormulaModel> get installedFormulae; List<CaskModel> get installedCasks; dynamic get selectedPackage; String get systemStorageUsed; int get orphanedDependenciesCount; int get globalHealthScore; String get brewPrefix;
/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryStateCopyWith<LibraryState> get copyWith => _$LibraryStateCopyWithImpl<LibraryState>(this as LibraryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.installedFormulae, installedFormulae)&&const DeepCollectionEquality().equals(other.installedCasks, installedCasks)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.orphanedDependenciesCount, orphanedDependenciesCount) || other.orphanedDependenciesCount == orphanedDependenciesCount)&&(identical(other.globalHealthScore, globalHealthScore) || other.globalHealthScore == globalHealthScore)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(installedFormulae),const DeepCollectionEquality().hash(installedCasks),const DeepCollectionEquality().hash(selectedPackage),systemStorageUsed,orphanedDependenciesCount,globalHealthScore,brewPrefix);

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, selectedPackage: $selectedPackage, systemStorageUsed: $systemStorageUsed, orphanedDependenciesCount: $orphanedDependenciesCount, globalHealthScore: $globalHealthScore, brewPrefix: $brewPrefix)';
}


}

/// @nodoc
abstract mixin class $LibraryStateCopyWith<$Res>  {
  factory $LibraryStateCopyWith(LibraryState value, $Res Function(LibraryState) _then) = _$LibraryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, dynamic selectedPackage, String systemStorageUsed, int orphanedDependenciesCount, int globalHealthScore, String brewPrefix
});




}
/// @nodoc
class _$LibraryStateCopyWithImpl<$Res>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._self, this._then);

  final LibraryState _self;
  final $Res Function(LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? selectedPackage = freezed,Object? systemStorageUsed = null,Object? orphanedDependenciesCount = null,Object? globalHealthScore = null,Object? brewPrefix = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self.installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self.installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,orphanedDependenciesCount: null == orphanedDependenciesCount ? _self.orphanedDependenciesCount : orphanedDependenciesCount // ignore: cast_nullable_to_non_nullable
as int,globalHealthScore: null == globalHealthScore ? _self.globalHealthScore : globalHealthScore // ignore: cast_nullable_to_non_nullable
as int,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryState].
extension LibraryStatePatterns on LibraryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryState value)  $default,){
final _that = this;
switch (_that) {
case _LibraryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryState value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  dynamic selectedPackage,  String systemStorageUsed,  int orphanedDependenciesCount,  int globalHealthScore,  String brewPrefix)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.selectedPackage,_that.systemStorageUsed,_that.orphanedDependenciesCount,_that.globalHealthScore,_that.brewPrefix);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  dynamic selectedPackage,  String systemStorageUsed,  int orphanedDependenciesCount,  int globalHealthScore,  String brewPrefix)  $default,) {final _that = this;
switch (_that) {
case _LibraryState():
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.selectedPackage,_that.systemStorageUsed,_that.orphanedDependenciesCount,_that.globalHealthScore,_that.brewPrefix);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  dynamic selectedPackage,  String systemStorageUsed,  int orphanedDependenciesCount,  int globalHealthScore,  String brewPrefix)?  $default,) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.selectedPackage,_that.systemStorageUsed,_that.orphanedDependenciesCount,_that.globalHealthScore,_that.brewPrefix);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryState extends LibraryState {
  const _LibraryState({this.isLoading = true, final  List<FormulaModel> installedFormulae = const [], final  List<CaskModel> installedCasks = const [], this.selectedPackage, this.systemStorageUsed = '0 B', this.orphanedDependenciesCount = 0, this.globalHealthScore = 100, this.brewPrefix = '/opt/homebrew'}): _installedFormulae = installedFormulae,_installedCasks = installedCasks,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<FormulaModel> _installedFormulae;
@override@JsonKey() List<FormulaModel> get installedFormulae {
  if (_installedFormulae is EqualUnmodifiableListView) return _installedFormulae;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedFormulae);
}

 final  List<CaskModel> _installedCasks;
@override@JsonKey() List<CaskModel> get installedCasks {
  if (_installedCasks is EqualUnmodifiableListView) return _installedCasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedCasks);
}

@override final  dynamic selectedPackage;
@override@JsonKey() final  String systemStorageUsed;
@override@JsonKey() final  int orphanedDependenciesCount;
@override@JsonKey() final  int globalHealthScore;
@override@JsonKey() final  String brewPrefix;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryStateCopyWith<_LibraryState> get copyWith => __$LibraryStateCopyWithImpl<_LibraryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._installedFormulae, _installedFormulae)&&const DeepCollectionEquality().equals(other._installedCasks, _installedCasks)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.orphanedDependenciesCount, orphanedDependenciesCount) || other.orphanedDependenciesCount == orphanedDependenciesCount)&&(identical(other.globalHealthScore, globalHealthScore) || other.globalHealthScore == globalHealthScore)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_installedFormulae),const DeepCollectionEquality().hash(_installedCasks),const DeepCollectionEquality().hash(selectedPackage),systemStorageUsed,orphanedDependenciesCount,globalHealthScore,brewPrefix);

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, selectedPackage: $selectedPackage, systemStorageUsed: $systemStorageUsed, orphanedDependenciesCount: $orphanedDependenciesCount, globalHealthScore: $globalHealthScore, brewPrefix: $brewPrefix)';
}


}

/// @nodoc
abstract mixin class _$LibraryStateCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory _$LibraryStateCopyWith(_LibraryState value, $Res Function(_LibraryState) _then) = __$LibraryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, dynamic selectedPackage, String systemStorageUsed, int orphanedDependenciesCount, int globalHealthScore, String brewPrefix
});




}
/// @nodoc
class __$LibraryStateCopyWithImpl<$Res>
    implements _$LibraryStateCopyWith<$Res> {
  __$LibraryStateCopyWithImpl(this._self, this._then);

  final _LibraryState _self;
  final $Res Function(_LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? selectedPackage = freezed,Object? systemStorageUsed = null,Object? orphanedDependenciesCount = null,Object? globalHealthScore = null,Object? brewPrefix = null,}) {
  return _then(_LibraryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self._installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self._installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,orphanedDependenciesCount: null == orphanedDependenciesCount ? _self.orphanedDependenciesCount : orphanedDependenciesCount // ignore: cast_nullable_to_non_nullable
as int,globalHealthScore: null == globalHealthScore ? _self.globalHealthScore : globalHealthScore // ignore: cast_nullable_to_non_nullable
as int,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
