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

 String get id; String get packageId;// e.g., 'google-chrome' or 'wget'
 PackageType get type; OperationType get operation; OperationStatus get status; bool get isArchived; String? get errorMessage; String? get customUrl;
/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationTaskCopyWith<OperationTask> get copyWith => _$OperationTaskCopyWithImpl<OperationTask>(this as OperationTask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationTask&&(identical(other.id, id) || other.id == id)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.status, status) || other.status == status)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.customUrl, customUrl) || other.customUrl == customUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,packageId,type,operation,status,isArchived,errorMessage,customUrl);

@override
String toString() {
  return 'OperationTask(id: $id, packageId: $packageId, type: $type, operation: $operation, status: $status, isArchived: $isArchived, errorMessage: $errorMessage, customUrl: $customUrl)';
}


}

/// @nodoc
abstract mixin class $OperationTaskCopyWith<$Res>  {
  factory $OperationTaskCopyWith(OperationTask value, $Res Function(OperationTask) _then) = _$OperationTaskCopyWithImpl;
@useResult
$Res call({
 String id, String packageId, PackageType type, OperationType operation, OperationStatus status, bool isArchived, String? errorMessage, String? customUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? packageId = null,Object? type = null,Object? operation = null,Object? status = null,Object? isArchived = null,Object? errorMessage = freezed,Object? customUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatus,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,customUrl: freezed == customUrl ? _self.customUrl : customUrl // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String packageId,  PackageType type,  OperationType operation,  OperationStatus status,  bool isArchived,  String? errorMessage,  String? customUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
return $default(_that.id,_that.packageId,_that.type,_that.operation,_that.status,_that.isArchived,_that.errorMessage,_that.customUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String packageId,  PackageType type,  OperationType operation,  OperationStatus status,  bool isArchived,  String? errorMessage,  String? customUrl)  $default,) {final _that = this;
switch (_that) {
case _OperationTask():
return $default(_that.id,_that.packageId,_that.type,_that.operation,_that.status,_that.isArchived,_that.errorMessage,_that.customUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String packageId,  PackageType type,  OperationType operation,  OperationStatus status,  bool isArchived,  String? errorMessage,  String? customUrl)?  $default,) {final _that = this;
switch (_that) {
case _OperationTask() when $default != null:
return $default(_that.id,_that.packageId,_that.type,_that.operation,_that.status,_that.isArchived,_that.errorMessage,_that.customUrl);case _:
  return null;

}
}

}

/// @nodoc


class _OperationTask implements OperationTask {
  const _OperationTask({required this.id, required this.packageId, required this.type, required this.operation, this.status = OperationStatus.queued, this.isArchived = false, this.errorMessage, this.customUrl});
  

@override final  String id;
@override final  String packageId;
// e.g., 'google-chrome' or 'wget'
@override final  PackageType type;
@override final  OperationType operation;
@override@JsonKey() final  OperationStatus status;
@override@JsonKey() final  bool isArchived;
@override final  String? errorMessage;
@override final  String? customUrl;

/// Create a copy of OperationTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationTaskCopyWith<_OperationTask> get copyWith => __$OperationTaskCopyWithImpl<_OperationTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationTask&&(identical(other.id, id) || other.id == id)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.status, status) || other.status == status)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.customUrl, customUrl) || other.customUrl == customUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,packageId,type,operation,status,isArchived,errorMessage,customUrl);

@override
String toString() {
  return 'OperationTask(id: $id, packageId: $packageId, type: $type, operation: $operation, status: $status, isArchived: $isArchived, errorMessage: $errorMessage, customUrl: $customUrl)';
}


}

/// @nodoc
abstract mixin class _$OperationTaskCopyWith<$Res> implements $OperationTaskCopyWith<$Res> {
  factory _$OperationTaskCopyWith(_OperationTask value, $Res Function(_OperationTask) _then) = __$OperationTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String packageId, PackageType type, OperationType operation, OperationStatus status, bool isArchived, String? errorMessage, String? customUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? packageId = null,Object? type = null,Object? operation = null,Object? status = null,Object? isArchived = null,Object? errorMessage = freezed,Object? customUrl = freezed,}) {
  return _then(_OperationTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatus,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,customUrl: freezed == customUrl ? _self.customUrl : customUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
