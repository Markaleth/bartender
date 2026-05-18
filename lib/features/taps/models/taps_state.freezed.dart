// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taps_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TapsState {

 FetchState<List<TapModel>> get tapsState; bool get isSyncing;
/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapsStateCopyWith<TapsState> get copyWith => _$TapsStateCopyWithImpl<TapsState>(this as TapsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapsState&&(identical(other.tapsState, tapsState) || other.tapsState == tapsState)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing));
}


@override
int get hashCode => Object.hash(runtimeType,tapsState,isSyncing);

@override
String toString() {
  return 'TapsState(tapsState: $tapsState, isSyncing: $isSyncing)';
}


}

/// @nodoc
abstract mixin class $TapsStateCopyWith<$Res>  {
  factory $TapsStateCopyWith(TapsState value, $Res Function(TapsState) _then) = _$TapsStateCopyWithImpl;
@useResult
$Res call({
 FetchState<List<TapModel>> tapsState, bool isSyncing
});


$FetchStateCopyWith<List<TapModel>, $Res> get tapsState;

}
/// @nodoc
class _$TapsStateCopyWithImpl<$Res>
    implements $TapsStateCopyWith<$Res> {
  _$TapsStateCopyWithImpl(this._self, this._then);

  final TapsState _self;
  final $Res Function(TapsState) _then;

/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tapsState = null,Object? isSyncing = null,}) {
  return _then(_self.copyWith(
tapsState: null == tapsState ? _self.tapsState : tapsState // ignore: cast_nullable_to_non_nullable
as FetchState<List<TapModel>>,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<TapModel>, $Res> get tapsState {
  
  return $FetchStateCopyWith<List<TapModel>, $Res>(_self.tapsState, (value) {
    return _then(_self.copyWith(tapsState: value));
  });
}
}


/// Adds pattern-matching-related methods to [TapsState].
extension TapsStatePatterns on TapsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TapsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TapsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TapsState value)  $default,){
final _that = this;
switch (_that) {
case _TapsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TapsState value)?  $default,){
final _that = this;
switch (_that) {
case _TapsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FetchState<List<TapModel>> tapsState,  bool isSyncing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TapsState() when $default != null:
return $default(_that.tapsState,_that.isSyncing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FetchState<List<TapModel>> tapsState,  bool isSyncing)  $default,) {final _that = this;
switch (_that) {
case _TapsState():
return $default(_that.tapsState,_that.isSyncing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FetchState<List<TapModel>> tapsState,  bool isSyncing)?  $default,) {final _that = this;
switch (_that) {
case _TapsState() when $default != null:
return $default(_that.tapsState,_that.isSyncing);case _:
  return null;

}
}

}

/// @nodoc


class _TapsState implements TapsState {
  const _TapsState({this.tapsState = const FetchState.loading(), this.isSyncing = false});
  

@override@JsonKey() final  FetchState<List<TapModel>> tapsState;
@override@JsonKey() final  bool isSyncing;

/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapsStateCopyWith<_TapsState> get copyWith => __$TapsStateCopyWithImpl<_TapsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TapsState&&(identical(other.tapsState, tapsState) || other.tapsState == tapsState)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing));
}


@override
int get hashCode => Object.hash(runtimeType,tapsState,isSyncing);

@override
String toString() {
  return 'TapsState(tapsState: $tapsState, isSyncing: $isSyncing)';
}


}

/// @nodoc
abstract mixin class _$TapsStateCopyWith<$Res> implements $TapsStateCopyWith<$Res> {
  factory _$TapsStateCopyWith(_TapsState value, $Res Function(_TapsState) _then) = __$TapsStateCopyWithImpl;
@override @useResult
$Res call({
 FetchState<List<TapModel>> tapsState, bool isSyncing
});


@override $FetchStateCopyWith<List<TapModel>, $Res> get tapsState;

}
/// @nodoc
class __$TapsStateCopyWithImpl<$Res>
    implements _$TapsStateCopyWith<$Res> {
  __$TapsStateCopyWithImpl(this._self, this._then);

  final _TapsState _self;
  final $Res Function(_TapsState) _then;

/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tapsState = null,Object? isSyncing = null,}) {
  return _then(_TapsState(
tapsState: null == tapsState ? _self.tapsState : tapsState // ignore: cast_nullable_to_non_nullable
as FetchState<List<TapModel>>,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TapsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<TapModel>, $Res> get tapsState {
  
  return $FetchStateCopyWith<List<TapModel>, $Res>(_self.tapsState, (value) {
    return _then(_self.copyWith(tapsState: value));
  });
}
}

// dart format on
