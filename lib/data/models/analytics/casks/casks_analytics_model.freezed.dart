// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casks_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CasksAnalyticsResponse {

 String get category;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_count') int get totalCount;@JsonKey(name: 'formulae') Map<String, List<CaskAnalyticsItem>> get casks;
/// Create a copy of CasksAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasksAnalyticsResponseCopyWith<CasksAnalyticsResponse> get copyWith => _$CasksAnalyticsResponseCopyWithImpl<CasksAnalyticsResponse>(this as CasksAnalyticsResponse, _$identity);

  /// Serializes this CasksAnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasksAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.casks, casks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(casks));

@override
String toString() {
  return 'CasksAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, casks: $casks)';
}


}

/// @nodoc
abstract mixin class $CasksAnalyticsResponseCopyWith<$Res>  {
  factory $CasksAnalyticsResponseCopyWith(CasksAnalyticsResponse value, $Res Function(CasksAnalyticsResponse) _then) = _$CasksAnalyticsResponseCopyWithImpl;
@useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'formulae') Map<String, List<CaskAnalyticsItem>> casks
});




}
/// @nodoc
class _$CasksAnalyticsResponseCopyWithImpl<$Res>
    implements $CasksAnalyticsResponseCopyWith<$Res> {
  _$CasksAnalyticsResponseCopyWithImpl(this._self, this._then);

  final CasksAnalyticsResponse _self;
  final $Res Function(CasksAnalyticsResponse) _then;

/// Create a copy of CasksAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? casks = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,casks: null == casks ? _self.casks : casks // ignore: cast_nullable_to_non_nullable
as Map<String, List<CaskAnalyticsItem>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CasksAnalyticsResponse].
extension CasksAnalyticsResponsePatterns on CasksAnalyticsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CasksAnalyticsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CasksAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CasksAnalyticsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CasksAnalyticsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CasksAnalyticsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CasksAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'formulae')  Map<String, List<CaskAnalyticsItem>> casks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CasksAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.casks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'formulae')  Map<String, List<CaskAnalyticsItem>> casks)  $default,) {final _that = this;
switch (_that) {
case _CasksAnalyticsResponse():
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.casks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount, @JsonKey(name: 'formulae')  Map<String, List<CaskAnalyticsItem>> casks)?  $default,) {final _that = this;
switch (_that) {
case _CasksAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.casks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CasksAnalyticsResponse implements CasksAnalyticsResponse {
  const _CasksAnalyticsResponse({required this.category, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_count') required this.totalCount, @JsonKey(name: 'formulae') required final  Map<String, List<CaskAnalyticsItem>> casks}): _casks = casks;
  factory _CasksAnalyticsResponse.fromJson(Map<String, dynamic> json) => _$CasksAnalyticsResponseFromJson(json);

@override final  String category;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_count') final  int totalCount;
 final  Map<String, List<CaskAnalyticsItem>> _casks;
@override@JsonKey(name: 'formulae') Map<String, List<CaskAnalyticsItem>> get casks {
  if (_casks is EqualUnmodifiableMapView) return _casks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_casks);
}


/// Create a copy of CasksAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CasksAnalyticsResponseCopyWith<_CasksAnalyticsResponse> get copyWith => __$CasksAnalyticsResponseCopyWithImpl<_CasksAnalyticsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CasksAnalyticsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CasksAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._casks, _casks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(_casks));

@override
String toString() {
  return 'CasksAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, casks: $casks)';
}


}

/// @nodoc
abstract mixin class _$CasksAnalyticsResponseCopyWith<$Res> implements $CasksAnalyticsResponseCopyWith<$Res> {
  factory _$CasksAnalyticsResponseCopyWith(_CasksAnalyticsResponse value, $Res Function(_CasksAnalyticsResponse) _then) = __$CasksAnalyticsResponseCopyWithImpl;
@override @useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount,@JsonKey(name: 'formulae') Map<String, List<CaskAnalyticsItem>> casks
});




}
/// @nodoc
class __$CasksAnalyticsResponseCopyWithImpl<$Res>
    implements _$CasksAnalyticsResponseCopyWith<$Res> {
  __$CasksAnalyticsResponseCopyWithImpl(this._self, this._then);

  final _CasksAnalyticsResponse _self;
  final $Res Function(_CasksAnalyticsResponse) _then;

/// Create a copy of CasksAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? casks = null,}) {
  return _then(_CasksAnalyticsResponse(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,casks: null == casks ? _self._casks : casks // ignore: cast_nullable_to_non_nullable
as Map<String, List<CaskAnalyticsItem>>,
  ));
}


}


/// @nodoc
mixin _$CaskAnalyticsItem {

 int? get number; String get cask; String get count; String? get percent;
/// Create a copy of CaskAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaskAnalyticsItemCopyWith<CaskAnalyticsItem> get copyWith => _$CaskAnalyticsItemCopyWithImpl<CaskAnalyticsItem>(this as CaskAnalyticsItem, _$identity);

  /// Serializes this CaskAnalyticsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaskAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,cask,count,percent);

@override
String toString() {
  return 'CaskAnalyticsItem(number: $number, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $CaskAnalyticsItemCopyWith<$Res>  {
  factory $CaskAnalyticsItemCopyWith(CaskAnalyticsItem value, $Res Function(CaskAnalyticsItem) _then) = _$CaskAnalyticsItemCopyWithImpl;
@useResult
$Res call({
 int? number, String cask, String count, String? percent
});




}
/// @nodoc
class _$CaskAnalyticsItemCopyWithImpl<$Res>
    implements $CaskAnalyticsItemCopyWith<$Res> {
  _$CaskAnalyticsItemCopyWithImpl(this._self, this._then);

  final CaskAnalyticsItem _self;
  final $Res Function(CaskAnalyticsItem) _then;

/// Create a copy of CaskAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? cask = null,Object? count = null,Object? percent = freezed,}) {
  return _then(_self.copyWith(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,cask: null == cask ? _self.cask : cask // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CaskAnalyticsItem].
extension CaskAnalyticsItemPatterns on CaskAnalyticsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaskAnalyticsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaskAnalyticsItem value)  $default,){
final _that = this;
switch (_that) {
case _CaskAnalyticsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaskAnalyticsItem value)?  $default,){
final _that = this;
switch (_that) {
case _CaskAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? number,  String cask,  String count,  String? percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskAnalyticsItem() when $default != null:
return $default(_that.number,_that.cask,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? number,  String cask,  String count,  String? percent)  $default,) {final _that = this;
switch (_that) {
case _CaskAnalyticsItem():
return $default(_that.number,_that.cask,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? number,  String cask,  String count,  String? percent)?  $default,) {final _that = this;
switch (_that) {
case _CaskAnalyticsItem() when $default != null:
return $default(_that.number,_that.cask,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaskAnalyticsItem implements CaskAnalyticsItem {
  const _CaskAnalyticsItem({this.number, required this.cask, required this.count, this.percent});
  factory _CaskAnalyticsItem.fromJson(Map<String, dynamic> json) => _$CaskAnalyticsItemFromJson(json);

@override final  int? number;
@override final  String cask;
@override final  String count;
@override final  String? percent;

/// Create a copy of CaskAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskAnalyticsItemCopyWith<_CaskAnalyticsItem> get copyWith => __$CaskAnalyticsItemCopyWithImpl<_CaskAnalyticsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaskAnalyticsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,cask,count,percent);

@override
String toString() {
  return 'CaskAnalyticsItem(number: $number, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$CaskAnalyticsItemCopyWith<$Res> implements $CaskAnalyticsItemCopyWith<$Res> {
  factory _$CaskAnalyticsItemCopyWith(_CaskAnalyticsItem value, $Res Function(_CaskAnalyticsItem) _then) = __$CaskAnalyticsItemCopyWithImpl;
@override @useResult
$Res call({
 int? number, String cask, String count, String? percent
});




}
/// @nodoc
class __$CaskAnalyticsItemCopyWithImpl<$Res>
    implements _$CaskAnalyticsItemCopyWith<$Res> {
  __$CaskAnalyticsItemCopyWithImpl(this._self, this._then);

  final _CaskAnalyticsItem _self;
  final $Res Function(_CaskAnalyticsItem) _then;

/// Create a copy of CaskAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? cask = null,Object? count = null,Object? percent = freezed,}) {
  return _then(_CaskAnalyticsItem(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,cask: null == cask ? _self.cask : cask // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
