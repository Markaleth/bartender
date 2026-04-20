// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsResponse {

 String get category;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_count') int get totalCount; List<AnalyticsItem>? get items; Map<String, List<AnalyticsItem>>? get formulae;
/// Create a copy of AnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsResponseCopyWith<AnalyticsResponse> get copyWith => _$AnalyticsResponseCopyWithImpl<AnalyticsResponse>(this as AnalyticsResponse, _$identity);

  /// Serializes this AnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.formulae, formulae));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(formulae));

@override
String toString() {
  return 'AnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items, formulae: $formulae)';
}


}

/// @nodoc
abstract mixin class $AnalyticsResponseCopyWith<$Res>  {
  factory $AnalyticsResponseCopyWith(AnalyticsResponse value, $Res Function(AnalyticsResponse) _then) = _$AnalyticsResponseCopyWithImpl;
@useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, List<AnalyticsItem>? items, Map<String, List<AnalyticsItem>>? formulae
});




}
/// @nodoc
class _$AnalyticsResponseCopyWithImpl<$Res>
    implements $AnalyticsResponseCopyWith<$Res> {
  _$AnalyticsResponseCopyWithImpl(this._self, this._then);

  final AnalyticsResponse _self;
  final $Res Function(AnalyticsResponse) _then;

/// Create a copy of AnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = freezed,Object? formulae = freezed,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AnalyticsItem>?,formulae: freezed == formulae ? _self.formulae : formulae // ignore: cast_nullable_to_non_nullable
as Map<String, List<AnalyticsItem>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsResponse].
extension AnalyticsResponsePatterns on AnalyticsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsResponse value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<AnalyticsItem>? items,  Map<String, List<AnalyticsItem>>? formulae)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items,_that.formulae);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<AnalyticsItem>? items,  Map<String, List<AnalyticsItem>>? formulae)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsResponse():
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items,_that.formulae);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  List<AnalyticsItem>? items,  Map<String, List<AnalyticsItem>>? formulae)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.items,_that.formulae);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsResponse implements AnalyticsResponse {
  const _AnalyticsResponse({required this.category, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_count') required this.totalCount, final  List<AnalyticsItem>? items, final  Map<String, List<AnalyticsItem>>? formulae}): _items = items,_formulae = formulae;
  factory _AnalyticsResponse.fromJson(Map<String, dynamic> json) => _$AnalyticsResponseFromJson(json);

@override final  String category;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_count') final  int totalCount;
 final  List<AnalyticsItem>? _items;
@override List<AnalyticsItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, List<AnalyticsItem>>? _formulae;
@override Map<String, List<AnalyticsItem>>? get formulae {
  final value = _formulae;
  if (value == null) return null;
  if (_formulae is EqualUnmodifiableMapView) return _formulae;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsResponseCopyWith<_AnalyticsResponse> get copyWith => __$AnalyticsResponseCopyWithImpl<_AnalyticsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._formulae, _formulae));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_formulae));

@override
String toString() {
  return 'AnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, items: $items, formulae: $formulae)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsResponseCopyWith<$Res> implements $AnalyticsResponseCopyWith<$Res> {
  factory _$AnalyticsResponseCopyWith(_AnalyticsResponse value, $Res Function(_AnalyticsResponse) _then) = __$AnalyticsResponseCopyWithImpl;
@override @useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, List<AnalyticsItem>? items, Map<String, List<AnalyticsItem>>? formulae
});




}
/// @nodoc
class __$AnalyticsResponseCopyWithImpl<$Res>
    implements _$AnalyticsResponseCopyWith<$Res> {
  __$AnalyticsResponseCopyWithImpl(this._self, this._then);

  final _AnalyticsResponse _self;
  final $Res Function(_AnalyticsResponse) _then;

/// Create a copy of AnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? items = freezed,Object? formulae = freezed,}) {
  return _then(_AnalyticsResponse(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AnalyticsItem>?,formulae: freezed == formulae ? _self._formulae : formulae // ignore: cast_nullable_to_non_nullable
as Map<String, List<AnalyticsItem>>?,
  ));
}


}


/// @nodoc
mixin _$AnalyticsItem {

 int? get number; String? get formula; String? get cask; String get count; String? get percent;
/// Create a copy of AnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsItemCopyWith<AnalyticsItem> get copyWith => _$AnalyticsItemCopyWithImpl<AnalyticsItem>(this as AnalyticsItem, _$identity);

  /// Serializes this AnalyticsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,cask,count,percent);

@override
String toString() {
  return 'AnalyticsItem(number: $number, formula: $formula, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $AnalyticsItemCopyWith<$Res>  {
  factory $AnalyticsItemCopyWith(AnalyticsItem value, $Res Function(AnalyticsItem) _then) = _$AnalyticsItemCopyWithImpl;
@useResult
$Res call({
 int? number, String? formula, String? cask, String count, String? percent
});




}
/// @nodoc
class _$AnalyticsItemCopyWithImpl<$Res>
    implements $AnalyticsItemCopyWith<$Res> {
  _$AnalyticsItemCopyWithImpl(this._self, this._then);

  final AnalyticsItem _self;
  final $Res Function(AnalyticsItem) _then;

/// Create a copy of AnalyticsItem
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


/// Adds pattern-matching-related methods to [AnalyticsItem].
extension AnalyticsItemPatterns on AnalyticsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsItem value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsItem value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsItem() when $default != null:
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
case _AnalyticsItem() when $default != null:
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
case _AnalyticsItem():
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
case _AnalyticsItem() when $default != null:
return $default(_that.number,_that.formula,_that.cask,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsItem implements AnalyticsItem {
  const _AnalyticsItem({this.number, this.formula, this.cask, required this.count, this.percent});
  factory _AnalyticsItem.fromJson(Map<String, dynamic> json) => _$AnalyticsItemFromJson(json);

@override final  int? number;
@override final  String? formula;
@override final  String? cask;
@override final  String count;
@override final  String? percent;

/// Create a copy of AnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsItemCopyWith<_AnalyticsItem> get copyWith => __$AnalyticsItemCopyWithImpl<_AnalyticsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.cask, cask) || other.cask == cask)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,cask,count,percent);

@override
String toString() {
  return 'AnalyticsItem(number: $number, formula: $formula, cask: $cask, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsItemCopyWith<$Res> implements $AnalyticsItemCopyWith<$Res> {
  factory _$AnalyticsItemCopyWith(_AnalyticsItem value, $Res Function(_AnalyticsItem) _then) = __$AnalyticsItemCopyWithImpl;
@override @useResult
$Res call({
 int? number, String? formula, String? cask, String count, String? percent
});




}
/// @nodoc
class __$AnalyticsItemCopyWithImpl<$Res>
    implements _$AnalyticsItemCopyWith<$Res> {
  __$AnalyticsItemCopyWithImpl(this._self, this._then);

  final _AnalyticsItem _self;
  final $Res Function(_AnalyticsItem) _then;

/// Create a copy of AnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? formula = freezed,Object? cask = freezed,Object? count = null,Object? percent = freezed,}) {
  return _then(_AnalyticsItem(
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
