// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryAnalyticsResponse {

 String get category;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_count') int get totalCount; List<CategoryAnalyticsItem> get items;
/// Create a copy of CategoryAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryAnalyticsResponseCopyWith<CategoryAnalyticsResponse> get copyWith => _$CategoryAnalyticsResponseCopyWithImpl<CategoryAnalyticsResponse>(this as CategoryAnalyticsResponse, _$identity);

  /// Serializes this CategoryAnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CategoryAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items)';
}


}

/// @nodoc
abstract mixin class $CategoryAnalyticsResponseCopyWith<$Res>  {
  factory $CategoryAnalyticsResponseCopyWith(CategoryAnalyticsResponse value, $Res Function(CategoryAnalyticsResponse) _then) = _$CategoryAnalyticsResponseCopyWithImpl;
@useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, List<CategoryAnalyticsItem> items
});




}
/// @nodoc
class _$CategoryAnalyticsResponseCopyWithImpl<$Res>
    implements $CategoryAnalyticsResponseCopyWith<$Res> {
  _$CategoryAnalyticsResponseCopyWithImpl(this._self, this._then);

  final CategoryAnalyticsResponse _self;
  final $Res Function(CategoryAnalyticsResponse) _then;

/// Create a copy of CategoryAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CategoryAnalyticsItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryAnalyticsResponse].
extension CategoryAnalyticsResponsePatterns on CategoryAnalyticsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryAnalyticsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryAnalyticsResponse value)  $default,){
final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryAnalyticsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<CategoryAnalyticsItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<CategoryAnalyticsItem> items)  $default,) {final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse():
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<CategoryAnalyticsItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CategoryAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryAnalyticsResponse implements CategoryAnalyticsResponse {
  const _CategoryAnalyticsResponse({required this.category, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_count') required this.totalCount, required final  List<CategoryAnalyticsItem> items}): _items = items;
  factory _CategoryAnalyticsResponse.fromJson(Map<String, dynamic> json) => _$CategoryAnalyticsResponseFromJson(json);

@override final  String category;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_count') final  int totalCount;
 final  List<CategoryAnalyticsItem> _items;
@override List<CategoryAnalyticsItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CategoryAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryAnalyticsResponseCopyWith<_CategoryAnalyticsResponse> get copyWith => __$CategoryAnalyticsResponseCopyWithImpl<_CategoryAnalyticsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryAnalyticsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CategoryAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CategoryAnalyticsResponseCopyWith<$Res> implements $CategoryAnalyticsResponseCopyWith<$Res> {
  factory _$CategoryAnalyticsResponseCopyWith(_CategoryAnalyticsResponse value, $Res Function(_CategoryAnalyticsResponse) _then) = __$CategoryAnalyticsResponseCopyWithImpl;
@override @useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, List<CategoryAnalyticsItem> items
});




}
/// @nodoc
class __$CategoryAnalyticsResponseCopyWithImpl<$Res>
    implements _$CategoryAnalyticsResponseCopyWith<$Res> {
  __$CategoryAnalyticsResponseCopyWithImpl(this._self, this._then);

  final _CategoryAnalyticsResponse _self;
  final $Res Function(_CategoryAnalyticsResponse) _then;

/// Create a copy of CategoryAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = null,}) {
  return _then(_CategoryAnalyticsResponse(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CategoryAnalyticsItem>,
  ));
}


}


/// @nodoc
mixin _$CategoryAnalyticsItem {

 int? get number; String? get formula; String? get cask; String get count; String? get percent;
/// Create a copy of CategoryAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryAnalyticsItemCopyWith<CategoryAnalyticsItem> get copyWith => _$CategoryAnalyticsItemCopyWithImpl<CategoryAnalyticsItem>(this as CategoryAnalyticsItem, _$identity);

  /// Serializes this CategoryAnalyticsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,cask,count,percent);

@override
String toString() {
  return 'CategoryAnalyticsItem(number: $number, formula: $formula, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $CategoryAnalyticsItemCopyWith<$Res>  {
  factory $CategoryAnalyticsItemCopyWith(CategoryAnalyticsItem value, $Res Function(CategoryAnalyticsItem) _then) = _$CategoryAnalyticsItemCopyWithImpl;
@useResult
$Res call({
 int? number, String? formula, String? cask, String count, String? percent
});




}
/// @nodoc
class _$CategoryAnalyticsItemCopyWithImpl<$Res>
    implements $CategoryAnalyticsItemCopyWith<$Res> {
  _$CategoryAnalyticsItemCopyWithImpl(this._self, this._then);

  final CategoryAnalyticsItem _self;
  final $Res Function(CategoryAnalyticsItem) _then;

/// Create a copy of CategoryAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? formula = freezed,Object? cask = freezed,Object? count = null,Object? percent = freezed,}) {
  return _then(_self.copyWith(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,formula: freezed == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String?,cask: freezed == cask ? _self.cask : cask // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryAnalyticsItem].
extension CategoryAnalyticsItemPatterns on CategoryAnalyticsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryAnalyticsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryAnalyticsItem value)  $default,){
final _that = this;
switch (_that) {
case _CategoryAnalyticsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryAnalyticsItem value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? number,  String? formula,  String? cask,  String count,  String? percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryAnalyticsItem() when $default != null:
return $default(_that.number,_that.formula,_that.cask,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? number,  String? formula,  String? cask,  String count,  String? percent)  $default,) {final _that = this;
switch (_that) {
case _CategoryAnalyticsItem():
return $default(_that.number,_that.formula,_that.cask,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? number,  String? formula,  String? cask,  String count,  String? percent)?  $default,) {final _that = this;
switch (_that) {
case _CategoryAnalyticsItem() when $default != null:
return $default(_that.number,_that.formula,_that.cask,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryAnalyticsItem implements CategoryAnalyticsItem {
  const _CategoryAnalyticsItem({this.number, this.formula, this.cask, required this.count, this.percent});
  factory _CategoryAnalyticsItem.fromJson(Map<String, dynamic> json) => _$CategoryAnalyticsItemFromJson(json);

@override final  int? number;
@override final  String? formula;
@override final  String? cask;
@override final  String count;
@override final  String? percent;

/// Create a copy of CategoryAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryAnalyticsItemCopyWith<_CategoryAnalyticsItem> get copyWith => __$CategoryAnalyticsItemCopyWithImpl<_CategoryAnalyticsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryAnalyticsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,cask,count,percent);

@override
String toString() {
  return 'CategoryAnalyticsItem(number: $number, formula: $formula, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$CategoryAnalyticsItemCopyWith<$Res> implements $CategoryAnalyticsItemCopyWith<$Res> {
  factory _$CategoryAnalyticsItemCopyWith(_CategoryAnalyticsItem value, $Res Function(_CategoryAnalyticsItem) _then) = __$CategoryAnalyticsItemCopyWithImpl;
@override @useResult
$Res call({
 int? number, String? formula, String? cask, String count, String? percent
});




}
/// @nodoc
class __$CategoryAnalyticsItemCopyWithImpl<$Res>
    implements _$CategoryAnalyticsItemCopyWith<$Res> {
  __$CategoryAnalyticsItemCopyWithImpl(this._self, this._then);

  final _CategoryAnalyticsItem _self;
  final $Res Function(_CategoryAnalyticsItem) _then;

/// Create a copy of CategoryAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? formula = freezed,Object? cask = freezed,Object? count = null,Object? percent = freezed,}) {
  return _then(_CategoryAnalyticsItem(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,formula: freezed == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String?,cask: freezed == cask ? _self.cask : cask // ignore: cast_nullable_to_non_nullable
as String?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
