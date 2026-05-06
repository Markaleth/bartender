// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationTask {

 String get packageId;// e.g., 'google-chrome' or 'wget'
 PackageType get type; OperationStatus get status; String? get errorMessage;
/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationTaskCopyWith<OperationTask> get copyWith => _$OperationTaskCopyWithImpl<OperationTask>(this as OperationTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationTask&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,packageId,type,status,errorMessage);

@override
String toString() {
  return 'OperationTask(packageId: $packageId, type: $type, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OperationTaskCopyWith<$Res>  {
  factory $OperationTaskCopyWith(OperationTask value, $Res Function(OperationTask) _then) = _$OperationTaskCopyWithImpl;
@useResult
$Res call({
 String packageId, PackageType type, OperationStatus status, String? errorMessage
});




}
/// @nodoc
class _$OperationTaskCopyWithImpl<$Res>
    implements $OperationTaskCopyWith<$Res> {
  _$OperationTaskCopyWithImpl(this._self, this._then);

  final OperationTask _self;
  final $Res Function(OperationTask) _then;

/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageId = null,Object? type = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationTask].
extension OperationTaskPatterns on OperationTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationTask value)  $default,){
final _that = this;
switch (_that) {
case _OperationTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationTask value)?  $default,){
final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageId,  PackageType type,  OperationStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
return $default(_that.packageId,_that.type,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageId,  PackageType type,  OperationStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OperationTask():
return $default(_that.packageId,_that.type,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageId,  PackageType type,  OperationStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
return $default(_that.packageId,_that.type,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OperationTask implements OperationTask {
  const _OperationTask({required this.packageId, required this.type, this.status = OperationStatus.queued, this.errorMessage});
  

@override final  String packageId;
// e.g., 'google-chrome' or 'wget'
@override final  PackageType type;
@override@JsonKey() final  OperationStatus status;
@override final  String? errorMessage;

/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationTaskCopyWith<_OperationTask> get copyWith => __$OperationTaskCopyWithImpl<_OperationTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationTask&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,packageId,type,status,errorMessage);

@override
String toString() {
  return 'OperationTask(packageId: $packageId, type: $type, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OperationTaskCopyWith<$Res> implements $OperationTaskCopyWith<$Res> {
  factory _$OperationTaskCopyWith(_OperationTask value, $Res Function(_OperationTask) _then) = __$OperationTaskCopyWithImpl;
@override @useResult
$Res call({
 String packageId, PackageType type, OperationStatus status, String? errorMessage
});




}
/// @nodoc
class __$OperationTaskCopyWithImpl<$Res>
    implements _$OperationTaskCopyWith<$Res> {
  __$OperationTaskCopyWithImpl(this._self, this._then);

  final _OperationTask _self;
  final $Res Function(_OperationTask) _then;

/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageId = null,Object? type = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_OperationTask(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
