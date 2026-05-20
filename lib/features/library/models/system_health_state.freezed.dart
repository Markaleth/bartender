// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_health_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SystemHealthState {

 int get globalHealthScore; String get systemStorageUsed; int get outdatedCount; String get reclaimableSpace; int get doctorWarningsCount; int get doctorErrorsCount; List<String> get doctorIssues; int get orphanedDependenciesCount;
/// Create a copy of SystemHealthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemHealthStateCopyWith<SystemHealthState> get copyWith => _$SystemHealthStateCopyWithImpl<SystemHealthState>(this as SystemHealthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemHealthState&&(identical(other.globalHealthScore, globalHealthScore) || other.globalHealthScore == globalHealthScore)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.outdatedCount, outdatedCount) || other.outdatedCount == outdatedCount)&&(identical(other.reclaimableSpace, reclaimableSpace) || other.reclaimableSpace == reclaimableSpace)&&(identical(other.doctorWarningsCount, doctorWarningsCount) || other.doctorWarningsCount == doctorWarningsCount)&&(identical(other.doctorErrorsCount, doctorErrorsCount) || other.doctorErrorsCount == doctorErrorsCount)&&const DeepCollectionEquality().equals(other.doctorIssues, doctorIssues)&&(identical(other.orphanedDependenciesCount, orphanedDependenciesCount) || other.orphanedDependenciesCount == orphanedDependenciesCount));
}


@override
int get hashCode => Object.hash(runtimeType,globalHealthScore,systemStorageUsed,outdatedCount,reclaimableSpace,doctorWarningsCount,doctorErrorsCount,const DeepCollectionEquality().hash(doctorIssues),orphanedDependenciesCount);

@override
String toString() {
  return 'SystemHealthState(globalHealthScore: $globalHealthScore, systemStorageUsed: $systemStorageUsed, outdatedCount: $outdatedCount, reclaimableSpace: $reclaimableSpace, doctorWarningsCount: $doctorWarningsCount, doctorErrorsCount: $doctorErrorsCount, doctorIssues: $doctorIssues, orphanedDependenciesCount: $orphanedDependenciesCount)';
}


}

/// @nodoc
abstract mixin class $SystemHealthStateCopyWith<$Res>  {
  factory $SystemHealthStateCopyWith(SystemHealthState value, $Res Function(SystemHealthState) _then) = _$SystemHealthStateCopyWithImpl;
@useResult
$Res call({
 int globalHealthScore, String systemStorageUsed, int outdatedCount, String reclaimableSpace, int doctorWarningsCount, int doctorErrorsCount, List<String> doctorIssues, int orphanedDependenciesCount
});




}
/// @nodoc
class _$SystemHealthStateCopyWithImpl<$Res>
    implements $SystemHealthStateCopyWith<$Res> {
  _$SystemHealthStateCopyWithImpl(this._self, this._then);

  final SystemHealthState _self;
  final $Res Function(SystemHealthState) _then;

/// Create a copy of SystemHealthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? globalHealthScore = null,Object? systemStorageUsed = null,Object? outdatedCount = null,Object? reclaimableSpace = null,Object? doctorWarningsCount = null,Object? doctorErrorsCount = null,Object? doctorIssues = null,Object? orphanedDependenciesCount = null,}) {
  return _then(_self.copyWith(
globalHealthScore: null == globalHealthScore ? _self.globalHealthScore : globalHealthScore // ignore: cast_nullable_to_non_nullable
as int,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,outdatedCount: null == outdatedCount ? _self.outdatedCount : outdatedCount // ignore: cast_nullable_to_non_nullable
as int,reclaimableSpace: null == reclaimableSpace ? _self.reclaimableSpace : reclaimableSpace // ignore: cast_nullable_to_non_nullable
as String,doctorWarningsCount: null == doctorWarningsCount ? _self.doctorWarningsCount : doctorWarningsCount // ignore: cast_nullable_to_non_nullable
as int,doctorErrorsCount: null == doctorErrorsCount ? _self.doctorErrorsCount : doctorErrorsCount // ignore: cast_nullable_to_non_nullable
as int,doctorIssues: null == doctorIssues ? _self.doctorIssues : doctorIssues // ignore: cast_nullable_to_non_nullable
as List<String>,orphanedDependenciesCount: null == orphanedDependenciesCount ? _self.orphanedDependenciesCount : orphanedDependenciesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SystemHealthState].
extension SystemHealthStatePatterns on SystemHealthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SystemHealthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SystemHealthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SystemHealthState value)  $default,){
final _that = this;
switch (_that) {
case _SystemHealthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SystemHealthState value)?  $default,){
final _that = this;
switch (_that) {
case _SystemHealthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int globalHealthScore,  String systemStorageUsed,  int outdatedCount,  String reclaimableSpace,  int doctorWarningsCount,  int doctorErrorsCount,  List<String> doctorIssues,  int orphanedDependenciesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SystemHealthState() when $default != null:
return $default(_that.globalHealthScore,_that.systemStorageUsed,_that.outdatedCount,_that.reclaimableSpace,_that.doctorWarningsCount,_that.doctorErrorsCount,_that.doctorIssues,_that.orphanedDependenciesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int globalHealthScore,  String systemStorageUsed,  int outdatedCount,  String reclaimableSpace,  int doctorWarningsCount,  int doctorErrorsCount,  List<String> doctorIssues,  int orphanedDependenciesCount)  $default,) {final _that = this;
switch (_that) {
case _SystemHealthState():
return $default(_that.globalHealthScore,_that.systemStorageUsed,_that.outdatedCount,_that.reclaimableSpace,_that.doctorWarningsCount,_that.doctorErrorsCount,_that.doctorIssues,_that.orphanedDependenciesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int globalHealthScore,  String systemStorageUsed,  int outdatedCount,  String reclaimableSpace,  int doctorWarningsCount,  int doctorErrorsCount,  List<String> doctorIssues,  int orphanedDependenciesCount)?  $default,) {final _that = this;
switch (_that) {
case _SystemHealthState() when $default != null:
return $default(_that.globalHealthScore,_that.systemStorageUsed,_that.outdatedCount,_that.reclaimableSpace,_that.doctorWarningsCount,_that.doctorErrorsCount,_that.doctorIssues,_that.orphanedDependenciesCount);case _:
  return null;

}
}

}

/// @nodoc


class _SystemHealthState implements SystemHealthState {
  const _SystemHealthState({this.globalHealthScore = 100, this.systemStorageUsed = '0 B', this.outdatedCount = 0, this.reclaimableSpace = '', this.doctorWarningsCount = 0, this.doctorErrorsCount = 0, final  List<String> doctorIssues = const [], this.orphanedDependenciesCount = 0}): _doctorIssues = doctorIssues;
  

@override@JsonKey() final  int globalHealthScore;
@override@JsonKey() final  String systemStorageUsed;
@override@JsonKey() final  int outdatedCount;
@override@JsonKey() final  String reclaimableSpace;
@override@JsonKey() final  int doctorWarningsCount;
@override@JsonKey() final  int doctorErrorsCount;
 final  List<String> _doctorIssues;
@override@JsonKey() List<String> get doctorIssues {
  if (_doctorIssues is EqualUnmodifiableListView) return _doctorIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doctorIssues);
}

@override@JsonKey() final  int orphanedDependenciesCount;

/// Create a copy of SystemHealthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemHealthStateCopyWith<_SystemHealthState> get copyWith => __$SystemHealthStateCopyWithImpl<_SystemHealthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemHealthState&&(identical(other.globalHealthScore, globalHealthScore) || other.globalHealthScore == globalHealthScore)&&(identical(other.systemStorageUsed, systemStorageUsed) || other.systemStorageUsed == systemStorageUsed)&&(identical(other.outdatedCount, outdatedCount) || other.outdatedCount == outdatedCount)&&(identical(other.reclaimableSpace, reclaimableSpace) || other.reclaimableSpace == reclaimableSpace)&&(identical(other.doctorWarningsCount, doctorWarningsCount) || other.doctorWarningsCount == doctorWarningsCount)&&(identical(other.doctorErrorsCount, doctorErrorsCount) || other.doctorErrorsCount == doctorErrorsCount)&&const DeepCollectionEquality().equals(other._doctorIssues, _doctorIssues)&&(identical(other.orphanedDependenciesCount, orphanedDependenciesCount) || other.orphanedDependenciesCount == orphanedDependenciesCount));
}


@override
int get hashCode => Object.hash(runtimeType,globalHealthScore,systemStorageUsed,outdatedCount,reclaimableSpace,doctorWarningsCount,doctorErrorsCount,const DeepCollectionEquality().hash(_doctorIssues),orphanedDependenciesCount);

@override
String toString() {
  return 'SystemHealthState(globalHealthScore: $globalHealthScore, systemStorageUsed: $systemStorageUsed, outdatedCount: $outdatedCount, reclaimableSpace: $reclaimableSpace, doctorWarningsCount: $doctorWarningsCount, doctorErrorsCount: $doctorErrorsCount, doctorIssues: $doctorIssues, orphanedDependenciesCount: $orphanedDependenciesCount)';
}


}

/// @nodoc
abstract mixin class _$SystemHealthStateCopyWith<$Res> implements $SystemHealthStateCopyWith<$Res> {
  factory _$SystemHealthStateCopyWith(_SystemHealthState value, $Res Function(_SystemHealthState) _then) = __$SystemHealthStateCopyWithImpl;
@override @useResult
$Res call({
 int globalHealthScore, String systemStorageUsed, int outdatedCount, String reclaimableSpace, int doctorWarningsCount, int doctorErrorsCount, List<String> doctorIssues, int orphanedDependenciesCount
});




}
/// @nodoc
class __$SystemHealthStateCopyWithImpl<$Res>
    implements _$SystemHealthStateCopyWith<$Res> {
  __$SystemHealthStateCopyWithImpl(this._self, this._then);

  final _SystemHealthState _self;
  final $Res Function(_SystemHealthState) _then;

/// Create a copy of SystemHealthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? globalHealthScore = null,Object? systemStorageUsed = null,Object? outdatedCount = null,Object? reclaimableSpace = null,Object? doctorWarningsCount = null,Object? doctorErrorsCount = null,Object? doctorIssues = null,Object? orphanedDependenciesCount = null,}) {
  return _then(_SystemHealthState(
globalHealthScore: null == globalHealthScore ? _self.globalHealthScore : globalHealthScore // ignore: cast_nullable_to_non_nullable
as int,systemStorageUsed: null == systemStorageUsed ? _self.systemStorageUsed : systemStorageUsed // ignore: cast_nullable_to_non_nullable
as String,outdatedCount: null == outdatedCount ? _self.outdatedCount : outdatedCount // ignore: cast_nullable_to_non_nullable
as int,reclaimableSpace: null == reclaimableSpace ? _self.reclaimableSpace : reclaimableSpace // ignore: cast_nullable_to_non_nullable
as String,doctorWarningsCount: null == doctorWarningsCount ? _self.doctorWarningsCount : doctorWarningsCount // ignore: cast_nullable_to_non_nullable
as int,doctorErrorsCount: null == doctorErrorsCount ? _self.doctorErrorsCount : doctorErrorsCount // ignore: cast_nullable_to_non_nullable
as int,doctorIssues: null == doctorIssues ? _self._doctorIssues : doctorIssues // ignore: cast_nullable_to_non_nullable
as List<String>,orphanedDependenciesCount: null == orphanedDependenciesCount ? _self.orphanedDependenciesCount : orphanedDependenciesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
