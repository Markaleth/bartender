// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PackageOperation {

 String get packageId;// e.g., 'google-chrome' or 'wget'
 PackageType get type; OperationStatus get status; String? get errorMessage;
/// Create a copy of PackageOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageOperationCopyWith<PackageOperation> get copyWith => _$PackageOperationCopyWithImpl<PackageOperation>(this as PackageOperation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageOperation&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,packageId,type,status,errorMessage);

@override
String toString() {
  return 'PackageOperation(packageId: $packageId, type: $type, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PackageOperationCopyWith<$Res>  {
  factory $PackageOperationCopyWith(PackageOperation value, $Res Function(PackageOperation) _then) = _$PackageOperationCopyWithImpl;
@useResult
$Res call({
 String packageId, PackageType type, OperationStatus status, String? errorMessage
});




}
/// @nodoc
class _$PackageOperationCopyWithImpl<$Res>
    implements $PackageOperationCopyWith<$Res> {
  _$PackageOperationCopyWithImpl(this._self, this._then);

  final PackageOperation _self;
  final $Res Function(PackageOperation) _then;

/// Create a copy of PackageOperation
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


/// Adds pattern-matching-related methods to [PackageOperation].
extension PackageOperationPatterns on PackageOperation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageOperation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageOperation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageOperation value)  $default,){
final _that = this;
switch (_that) {
case _PackageOperation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageOperation value)?  $default,){
final _that = this;
switch (_that) {
case _PackageOperation() when $default != null:
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
case _PackageOperation() when $default != null:
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
case _PackageOperation():
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
case _PackageOperation() when $default != null:
return $default(_that.packageId,_that.type,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PackageOperation implements PackageOperation {
  const _PackageOperation({required this.packageId, required this.type, this.status = OperationStatus.queued, this.errorMessage});
  

@override final  String packageId;
// e.g., 'google-chrome' or 'wget'
@override final  PackageType type;
@override@JsonKey() final  OperationStatus status;
@override final  String? errorMessage;

/// Create a copy of PackageOperation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageOperationCopyWith<_PackageOperation> get copyWith => __$PackageOperationCopyWithImpl<_PackageOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageOperation&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,packageId,type,status,errorMessage);

@override
String toString() {
  return 'PackageOperation(packageId: $packageId, type: $type, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PackageOperationCopyWith<$Res> implements $PackageOperationCopyWith<$Res> {
  factory _$PackageOperationCopyWith(_PackageOperation value, $Res Function(_PackageOperation) _then) = __$PackageOperationCopyWithImpl;
@override @useResult
$Res call({
 String packageId, PackageType type, OperationStatus status, String? errorMessage
});




}
/// @nodoc
class __$PackageOperationCopyWithImpl<$Res>
    implements _$PackageOperationCopyWith<$Res> {
  __$PackageOperationCopyWithImpl(this._self, this._then);

  final _PackageOperation _self;
  final $Res Function(_PackageOperation) _then;

/// Create a copy of PackageOperation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageId = null,Object? type = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_PackageOperation(
packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PackageType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OperationStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
