// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'formulae_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormulaeAnalyticsResponse {

 String get category;@JsonKey(name: 'total_items') int get totalItems;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String get endDate;@JsonKey(name: 'total_count') int get totalCount; Map<String, List<FormulaAnalyticsItem>> get formulae;
/// Create a copy of FormulaeAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaeAnalyticsResponseCopyWith<FormulaeAnalyticsResponse> get copyWith => _$FormulaeAnalyticsResponseCopyWithImpl<FormulaeAnalyticsResponse>(this as FormulaeAnalyticsResponse, _$identity);

  /// Serializes this FormulaeAnalyticsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaeAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other.formulae, formulae));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(formulae));

@override
String toString() {
  return 'FormulaeAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, formulae: $formulae)';
}


}

/// @nodoc
abstract mixin class $FormulaeAnalyticsResponseCopyWith<$Res>  {
  factory $FormulaeAnalyticsResponseCopyWith(FormulaeAnalyticsResponse value, $Res Function(FormulaeAnalyticsResponse) _then) = _$FormulaeAnalyticsResponseCopyWithImpl;
@useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, Map<String, List<FormulaAnalyticsItem>> formulae
});




}
/// @nodoc
class _$FormulaeAnalyticsResponseCopyWithImpl<$Res>
    implements $FormulaeAnalyticsResponseCopyWith<$Res> {
  _$FormulaeAnalyticsResponseCopyWithImpl(this._self, this._then);

  final FormulaeAnalyticsResponse _self;
  final $Res Function(FormulaeAnalyticsResponse) _then;

/// Create a copy of FormulaeAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? formulae = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,formulae: null == formulae ? _self.formulae : formulae // ignore: cast_nullable_to_non_nullable
as Map<String, List<FormulaAnalyticsItem>>,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaeAnalyticsResponse].
extension FormulaeAnalyticsResponsePatterns on FormulaeAnalyticsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaeAnalyticsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaeAnalyticsResponse value)  $default,){
final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaeAnalyticsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, List<FormulaAnalyticsItem>> formulae)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.formulae);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, List<FormulaAnalyticsItem>> formulae)  $default,) {final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse():
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.formulae);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category, @JsonKey(name: 'total_items')  int totalItems, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String endDate, @JsonKey(name: 'total_count')  int totalCount,  Map<String, List<FormulaAnalyticsItem>> formulae)?  $default,) {final _that = this;
switch (_that) {
case _FormulaeAnalyticsResponse() when $default != null:
return $default(_that.category,_that.totalItems,_that.startDate,_that.endDate,_that.totalCount,_that.formulae);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaeAnalyticsResponse implements FormulaeAnalyticsResponse {
  const _FormulaeAnalyticsResponse({required this.category, @JsonKey(name: 'total_items') required this.totalItems, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'total_count') required this.totalCount, required final  Map<String, List<FormulaAnalyticsItem>> formulae}): _formulae = formulae;
  factory _FormulaeAnalyticsResponse.fromJson(Map<String, dynamic> json) => _$FormulaeAnalyticsResponseFromJson(json);

@override final  String category;
@override@JsonKey(name: 'total_items') final  int totalItems;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String endDate;
@override@JsonKey(name: 'total_count') final  int totalCount;
 final  Map<String, List<FormulaAnalyticsItem>> _formulae;
@override Map<String, List<FormulaAnalyticsItem>> get formulae {
  if (_formulae is EqualUnmodifiableMapView) return _formulae;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_formulae);
}


/// Create a copy of FormulaeAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaeAnalyticsResponseCopyWith<_FormulaeAnalyticsResponse> get copyWith => __$FormulaeAnalyticsResponseCopyWithImpl<_FormulaeAnalyticsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaeAnalyticsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaeAnalyticsResponse&&(identical(other.category, category) || other.category == category)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&const DeepCollectionEquality().equals(other._formulae, _formulae));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,totalItems,startDate,endDate,totalCount,const DeepCollectionEquality().hash(_formulae));

@override
String toString() {
  return 'FormulaeAnalyticsResponse(category: $category, totalItems: $totalItems, startDate: $startDate, endDate: $endDate, totalCount: $totalCount, formulae: $formulae)';
}


}

/// @nodoc
abstract mixin class _$FormulaeAnalyticsResponseCopyWith<$Res> implements $FormulaeAnalyticsResponseCopyWith<$Res> {
  factory _$FormulaeAnalyticsResponseCopyWith(_FormulaeAnalyticsResponse value, $Res Function(_FormulaeAnalyticsResponse) _then) = __$FormulaeAnalyticsResponseCopyWithImpl;
@override @useResult
$Res call({
 String category,@JsonKey(name: 'total_items') int totalItems,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String endDate,@JsonKey(name: 'total_count') int totalCount, Map<String, List<FormulaAnalyticsItem>> formulae
});




}
/// @nodoc
class __$FormulaeAnalyticsResponseCopyWithImpl<$Res>
    implements _$FormulaeAnalyticsResponseCopyWith<$Res> {
  __$FormulaeAnalyticsResponseCopyWithImpl(this._self, this._then);

  final _FormulaeAnalyticsResponse _self;
  final $Res Function(_FormulaeAnalyticsResponse) _then;

/// Create a copy of FormulaeAnalyticsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? totalItems = null,Object? startDate = null,Object? endDate = null,Object? totalCount = null,Object? formulae = null,}) {
  return _then(_FormulaeAnalyticsResponse(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,formulae: null == formulae ? _self._formulae : formulae // ignore: cast_nullable_to_non_nullable
as Map<String, List<FormulaAnalyticsItem>>,
  ));
}


}


/// @nodoc
mixin _$FormulaAnalyticsItem {

 int? get number; String get formula; String get count; String? get percent;
/// Create a copy of FormulaAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FormulaAnalyticsItemCopyWith<FormulaAnalyticsItem> get copyWith => _$FormulaAnalyticsItemCopyWithImpl<FormulaAnalyticsItem>(this as FormulaAnalyticsItem, _$identity);

  /// Serializes this FormulaAnalyticsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FormulaAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,count,percent);

@override
String toString() {
  return 'FormulaAnalyticsItem(number: $number, formula: $formula, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $FormulaAnalyticsItemCopyWith<$Res>  {
  factory $FormulaAnalyticsItemCopyWith(FormulaAnalyticsItem value, $Res Function(FormulaAnalyticsItem) _then) = _$FormulaAnalyticsItemCopyWithImpl;
@useResult
$Res call({
 int? number, String formula, String count, String? percent
});




}
/// @nodoc
class _$FormulaAnalyticsItemCopyWithImpl<$Res>
    implements $FormulaAnalyticsItemCopyWith<$Res> {
  _$FormulaAnalyticsItemCopyWithImpl(this._self, this._then);

  final FormulaAnalyticsItem _self;
  final $Res Function(FormulaAnalyticsItem) _then;

/// Create a copy of FormulaAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? formula = null,Object? count = null,Object? percent = freezed,}) {
  return _then(_self.copyWith(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FormulaAnalyticsItem].
extension FormulaAnalyticsItemPatterns on FormulaAnalyticsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FormulaAnalyticsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FormulaAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FormulaAnalyticsItem value)  $default,){
final _that = this;
switch (_that) {
case _FormulaAnalyticsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FormulaAnalyticsItem value)?  $default,){
final _that = this;
switch (_that) {
case _FormulaAnalyticsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? number,  String formula,  String count,  String? percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FormulaAnalyticsItem() when $default != null:
return $default(_that.number,_that.formula,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? number,  String formula,  String count,  String? percent)  $default,) {final _that = this;
switch (_that) {
case _FormulaAnalyticsItem():
return $default(_that.number,_that.formula,_that.count,_that.percent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? number,  String formula,  String count,  String? percent)?  $default,) {final _that = this;
switch (_that) {
case _FormulaAnalyticsItem() when $default != null:
return $default(_that.number,_that.formula,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FormulaAnalyticsItem implements FormulaAnalyticsItem {
  const _FormulaAnalyticsItem({this.number, required this.formula, required this.count, this.percent});
  factory _FormulaAnalyticsItem.fromJson(Map<String, dynamic> json) => _$FormulaAnalyticsItemFromJson(json);

@override final  int? number;
@override final  String formula;
@override final  String count;
@override final  String? percent;

/// Create a copy of FormulaAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaAnalyticsItemCopyWith<_FormulaAnalyticsItem> get copyWith => __$FormulaAnalyticsItemCopyWithImpl<_FormulaAnalyticsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FormulaAnalyticsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaAnalyticsItem&&(identical(other.number, number) || other.number == number)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,formula,count,percent);

@override
String toString() {
  return 'FormulaAnalyticsItem(number: $number, formula: $formula, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$FormulaAnalyticsItemCopyWith<$Res> implements $FormulaAnalyticsItemCopyWith<$Res> {
  factory _$FormulaAnalyticsItemCopyWith(_FormulaAnalyticsItem value, $Res Function(_FormulaAnalyticsItem) _then) = __$FormulaAnalyticsItemCopyWithImpl;
@override @useResult
$Res call({
 int? number, String formula, String count, String? percent
});




}
/// @nodoc
class __$FormulaAnalyticsItemCopyWithImpl<$Res>
    implements _$FormulaAnalyticsItemCopyWith<$Res> {
  __$FormulaAnalyticsItemCopyWithImpl(this._self, this._then);

  final _FormulaAnalyticsItem _self;
  final $Res Function(_FormulaAnalyticsItem) _then;

/// Create a copy of FormulaAnalyticsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? formula = null,Object? count = null,Object? percent = freezed,}) {
  return _then(_FormulaAnalyticsItem(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as String,percent: freezed == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
