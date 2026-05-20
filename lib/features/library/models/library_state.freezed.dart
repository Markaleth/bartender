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

 bool get isLoading; List<FormulaModel> get installedFormulae; List<CaskModel> get installedCasks; List<TapModel> get installedTaps; dynamic get selectedPackage; String get systemStorageUsed; SystemHealthState get healthState; String get brewPrefix; bool get isSyncing; String get filterQuery; Set<String> get expandedTaps;
/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryStateCopyWith<LibraryState> get copyWith => _$LibraryStateCopyWithImpl<LibraryState>(this as LibraryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.installedFormulae, installedFormulae)&&const DeepCollectionEquality().equals(other.installedCasks, installedCasks)&&const DeepCollectionEquality().equals(other.installedTaps, installedTaps)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.healthState, healthState) || other.healthState == healthState)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.filterQuery, filterQuery) || other.filterQuery == filterQuery)&&const DeepCollectionEquality().equals(other.expandedTaps, expandedTaps));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(installedFormulae),const DeepCollectionEquality().hash(installedCasks),const DeepCollectionEquality().hash(installedTaps),const DeepCollectionEquality().hash(selectedPackage),systemStorageUsed,healthState,brewPrefix,isSyncing,filterQuery,const DeepCollectionEquality().hash(expandedTaps));

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, installedTaps: $installedTaps, selectedPackage: $selectedPackage, systemStorageUsed: $systemStorageUsed, healthState: $healthState, brewPrefix: $brewPrefix, isSyncing: $isSyncing, filterQuery: $filterQuery, expandedTaps: $expandedTaps)';
}


}

/// @nodoc
abstract mixin class $LibraryStateCopyWith<$Res>  {
  factory $LibraryStateCopyWith(LibraryState value, $Res Function(LibraryState) _then) = _$LibraryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, List<TapModel> installedTaps, dynamic selectedPackage, String systemStorageUsed, SystemHealthState healthState, String brewPrefix, bool isSyncing, String filterQuery, Set<String> expandedTaps
});


$SystemHealthStateCopyWith<$Res> get healthState;

}
/// @nodoc
class _$LibraryStateCopyWithImpl<$Res>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._self, this._then);

  final LibraryState _self;
  final $Res Function(LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? installedTaps = null,Object? selectedPackage = freezed,Object? systemStorageUsed = null,Object? healthState = null,Object? brewPrefix = null,Object? isSyncing = null,Object? filterQuery = null,Object? expandedTaps = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self.installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self.installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,installedTaps: null == installedTaps ? _self.installedTaps : installedTaps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,healthState: null == healthState ? _self.healthState : healthState // ignore: cast_nullable_to_non_nullable
as SystemHealthState,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,filterQuery: null == filterQuery ? _self.filterQuery : filterQuery // ignore: cast_nullable_to_non_nullable
as String,expandedTaps: null == expandedTaps ? _self.expandedTaps : expandedTaps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}
/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SystemHealthStateCopyWith<$Res> get healthState {
  
  return $SystemHealthStateCopyWith<$Res>(_self.healthState, (value) {
    return _then(_self.copyWith(healthState: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String systemStorageUsed,  SystemHealthState healthState,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.systemStorageUsed,_that.healthState,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String systemStorageUsed,  SystemHealthState healthState,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)  $default,) {final _that = this;
switch (_that) {
case _LibraryState():
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.systemStorageUsed,_that.healthState,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String systemStorageUsed,  SystemHealthState healthState,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)?  $default,) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.systemStorageUsed,_that.healthState,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryState extends LibraryState {
  const _LibraryState({this.isLoading = true, final  List<FormulaModel> installedFormulae = const [], final  List<CaskModel> installedCasks = const [], final  List<TapModel> installedTaps = const [], this.selectedPackage, this.systemStorageUsed = '0 B', this.healthState = const SystemHealthState(), this.brewPrefix = '/opt/homebrew', this.isSyncing = false, this.filterQuery = '', final  Set<String> expandedTaps = const <String>{}}): _installedFormulae = installedFormulae,_installedCasks = installedCasks,_installedTaps = installedTaps,_expandedTaps = expandedTaps,super._();
  

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

 final  List<TapModel> _installedTaps;
@override@JsonKey() List<TapModel> get installedTaps {
  if (_installedTaps is EqualUnmodifiableListView) return _installedTaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedTaps);
}

@override final  dynamic selectedPackage;
@override@JsonKey() final  String systemStorageUsed;
@override@JsonKey() final  SystemHealthState healthState;
@override@JsonKey() final  String brewPrefix;
@override@JsonKey() final  bool isSyncing;
@override@JsonKey() final  String filterQuery;
 final  Set<String> _expandedTaps;
@override@JsonKey() Set<String> get expandedTaps {
  if (_expandedTaps is EqualUnmodifiableSetView) return _expandedTaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedTaps);
}


/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryStateCopyWith<_LibraryState> get copyWith => __$LibraryStateCopyWithImpl<_LibraryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._installedFormulae, _installedFormulae)&&const DeepCollectionEquality().equals(other._installedCasks, _installedCasks)&&const DeepCollectionEquality().equals(other._installedTaps, _installedTaps)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.healthState, healthState) || other.healthState == healthState)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.filterQuery, filterQuery) || other.filterQuery == filterQuery)&&const DeepCollectionEquality().equals(other._expandedTaps, _expandedTaps));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_installedFormulae),const DeepCollectionEquality().hash(_installedCasks),const DeepCollectionEquality().hash(_installedTaps),const DeepCollectionEquality().hash(selectedPackage),systemStorageUsed,healthState,brewPrefix,isSyncing,filterQuery,const DeepCollectionEquality().hash(_expandedTaps));

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, installedTaps: $installedTaps, selectedPackage: $selectedPackage, systemStorageUsed: $systemStorageUsed, healthState: $healthState, brewPrefix: $brewPrefix, isSyncing: $isSyncing, filterQuery: $filterQuery, expandedTaps: $expandedTaps)';
}


}

/// @nodoc
abstract mixin class _$LibraryStateCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory _$LibraryStateCopyWith(_LibraryState value, $Res Function(_LibraryState) _then) = __$LibraryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, List<TapModel> installedTaps, dynamic selectedPackage, String systemStorageUsed, SystemHealthState healthState, String brewPrefix, bool isSyncing, String filterQuery, Set<String> expandedTaps
});


@override $SystemHealthStateCopyWith<$Res> get healthState;

}
/// @nodoc
class __$LibraryStateCopyWithImpl<$Res>
    implements _$LibraryStateCopyWith<$Res> {
  __$LibraryStateCopyWithImpl(this._self, this._then);

  final _LibraryState _self;
  final $Res Function(_LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? installedTaps = null,Object? selectedPackage = freezed,Object? systemStorageUsed = null,Object? healthState = null,Object? brewPrefix = null,Object? isSyncing = null,Object? filterQuery = null,Object? expandedTaps = null,}) {
  return _then(_LibraryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self._installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self._installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,installedTaps: null == installedTaps ? _self._installedTaps : installedTaps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,healthState: null == healthState ? _self.healthState : healthState // ignore: cast_nullable_to_non_nullable
as SystemHealthState,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,filterQuery: null == filterQuery ? _self.filterQuery : filterQuery // ignore: cast_nullable_to_non_nullable
as String,expandedTaps: null == expandedTaps ? _self._expandedTaps : expandedTaps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SystemHealthStateCopyWith<$Res> get healthState {
  
  return $SystemHealthStateCopyWith<$Res>(_self.healthState, (value) {
    return _then(_self.copyWith(healthState: value));
  });
}
}

// dart format on
