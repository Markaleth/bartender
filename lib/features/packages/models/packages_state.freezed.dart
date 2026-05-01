// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PackagesState {

 String get searchQuery; FetchState<List<CaskModel>> get casksData; FetchState<List<FormulaModel>> get formulaeData; FetchState<List<dynamic>> get trendingData; List<PackageOperation> get operationsQueue; List<dynamic> get paginatedPackages;
/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackagesStateCopyWith<PackagesState> get copyWith => _$PackagesStateCopyWithImpl<PackagesState>(this as PackagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackagesState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.casksData, casksData) || other.casksData == casksData)&&(identical(other.formulaeData, formulaeData) || other.formulaeData == formulaeData)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&const DeepCollectionEquality().equals(other.operationsQueue, operationsQueue)&&const DeepCollectionEquality().equals(other.paginatedPackages, paginatedPackages));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,casksData,formulaeData,trendingData,const DeepCollectionEquality().hash(operationsQueue),const DeepCollectionEquality().hash(paginatedPackages));

@override
String toString() {
  return 'PackagesState(searchQuery: $searchQuery, casksData: $casksData, formulaeData: $formulaeData, trendingData: $trendingData, operationsQueue: $operationsQueue, paginatedPackages: $paginatedPackages)';
}


}

/// @nodoc
abstract mixin class $PackagesStateCopyWith<$Res>  {
  factory $PackagesStateCopyWith(PackagesState value, $Res Function(PackagesState) _then) = _$PackagesStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, FetchState<List<CaskModel>> casksData, FetchState<List<FormulaModel>> formulaeData, FetchState<List<dynamic>> trendingData, List<PackageOperation> operationsQueue, List<dynamic> paginatedPackages
});


$FetchStateCopyWith<List<CaskModel>, $Res> get casksData;$FetchStateCopyWith<List<FormulaModel>, $Res> get formulaeData;$FetchStateCopyWith<List<dynamic>, $Res> get trendingData;

}
/// @nodoc
class _$PackagesStateCopyWithImpl<$Res>
    implements $PackagesStateCopyWith<$Res> {
  _$PackagesStateCopyWithImpl(this._self, this._then);

  final PackagesState _self;
  final $Res Function(PackagesState) _then;

/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? casksData = null,Object? formulaeData = null,Object? trendingData = null,Object? operationsQueue = null,Object? paginatedPackages = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,casksData: null == casksData ? _self.casksData : casksData // ignore: cast_nullable_to_non_nullable
as FetchState<List<CaskModel>>,formulaeData: null == formulaeData ? _self.formulaeData : formulaeData // ignore: cast_nullable_to_non_nullable
as FetchState<List<FormulaModel>>,trendingData: null == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as FetchState<List<dynamic>>,operationsQueue: null == operationsQueue ? _self.operationsQueue : operationsQueue // ignore: cast_nullable_to_non_nullable
as List<PackageOperation>,paginatedPackages: null == paginatedPackages ? _self.paginatedPackages : paginatedPackages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<CaskModel>, $Res> get casksData {
  
  return $FetchStateCopyWith<List<CaskModel>, $Res>(_self.casksData, (value) {
    return _then(_self.copyWith(casksData: value));
  });
}/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<FormulaModel>, $Res> get formulaeData {
  
  return $FetchStateCopyWith<List<FormulaModel>, $Res>(_self.formulaeData, (value) {
    return _then(_self.copyWith(formulaeData: value));
  });
}/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<dynamic>, $Res> get trendingData {
  
  return $FetchStateCopyWith<List<dynamic>, $Res>(_self.trendingData, (value) {
    return _then(_self.copyWith(trendingData: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackagesState].
extension PackagesStatePatterns on PackagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackagesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackagesState value)  $default,){
final _that = this;
switch (_that) {
case _PackagesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackagesState value)?  $default,){
final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  FetchState<List<CaskModel>> casksData,  FetchState<List<FormulaModel>> formulaeData,  FetchState<List<dynamic>> trendingData,  List<PackageOperation> operationsQueue,  List<dynamic> paginatedPackages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
return $default(_that.searchQuery,_that.casksData,_that.formulaeData,_that.trendingData,_that.operationsQueue,_that.paginatedPackages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  FetchState<List<CaskModel>> casksData,  FetchState<List<FormulaModel>> formulaeData,  FetchState<List<dynamic>> trendingData,  List<PackageOperation> operationsQueue,  List<dynamic> paginatedPackages)  $default,) {final _that = this;
switch (_that) {
case _PackagesState():
return $default(_that.searchQuery,_that.casksData,_that.formulaeData,_that.trendingData,_that.operationsQueue,_that.paginatedPackages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  FetchState<List<CaskModel>> casksData,  FetchState<List<FormulaModel>> formulaeData,  FetchState<List<dynamic>> trendingData,  List<PackageOperation> operationsQueue,  List<dynamic> paginatedPackages)?  $default,) {final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
return $default(_that.searchQuery,_that.casksData,_that.formulaeData,_that.trendingData,_that.operationsQueue,_that.paginatedPackages);case _:
  return null;

}
}

}

/// @nodoc


class _PackagesState implements PackagesState {
  const _PackagesState({this.searchQuery = '', this.casksData = const FetchState.loading(), this.formulaeData = const FetchState.loading(), this.trendingData = const FetchState.loading(), final  List<PackageOperation> operationsQueue = const [], final  List<dynamic> paginatedPackages = const []}): _operationsQueue = operationsQueue,_paginatedPackages = paginatedPackages;
  

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  FetchState<List<CaskModel>> casksData;
@override@JsonKey() final  FetchState<List<FormulaModel>> formulaeData;
@override@JsonKey() final  FetchState<List<dynamic>> trendingData;
 final  List<PackageOperation> _operationsQueue;
@override@JsonKey() List<PackageOperation> get operationsQueue {
  if (_operationsQueue is EqualUnmodifiableListView) return _operationsQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operationsQueue);
}

 final  List<dynamic> _paginatedPackages;
@override@JsonKey() List<dynamic> get paginatedPackages {
  if (_paginatedPackages is EqualUnmodifiableListView) return _paginatedPackages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paginatedPackages);
}


/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackagesStateCopyWith<_PackagesState> get copyWith => __$PackagesStateCopyWithImpl<_PackagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackagesState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.casksData, casksData) || other.casksData == casksData)&&(identical(other.formulaeData, formulaeData) || other.formulaeData == formulaeData)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&const DeepCollectionEquality().equals(other._operationsQueue, _operationsQueue)&&const DeepCollectionEquality().equals(other._paginatedPackages, _paginatedPackages));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,casksData,formulaeData,trendingData,const DeepCollectionEquality().hash(_operationsQueue),const DeepCollectionEquality().hash(_paginatedPackages));

@override
String toString() {
  return 'PackagesState(searchQuery: $searchQuery, casksData: $casksData, formulaeData: $formulaeData, trendingData: $trendingData, operationsQueue: $operationsQueue, paginatedPackages: $paginatedPackages)';
}


}

/// @nodoc
abstract mixin class _$PackagesStateCopyWith<$Res> implements $PackagesStateCopyWith<$Res> {
  factory _$PackagesStateCopyWith(_PackagesState value, $Res Function(_PackagesState) _then) = __$PackagesStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, FetchState<List<CaskModel>> casksData, FetchState<List<FormulaModel>> formulaeData, FetchState<List<dynamic>> trendingData, List<PackageOperation> operationsQueue, List<dynamic> paginatedPackages
});


@override $FetchStateCopyWith<List<CaskModel>, $Res> get casksData;@override $FetchStateCopyWith<List<FormulaModel>, $Res> get formulaeData;@override $FetchStateCopyWith<List<dynamic>, $Res> get trendingData;

}
/// @nodoc
class __$PackagesStateCopyWithImpl<$Res>
    implements _$PackagesStateCopyWith<$Res> {
  __$PackagesStateCopyWithImpl(this._self, this._then);

  final _PackagesState _self;
  final $Res Function(_PackagesState) _then;

/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? casksData = null,Object? formulaeData = null,Object? trendingData = null,Object? operationsQueue = null,Object? paginatedPackages = null,}) {
  return _then(_PackagesState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,casksData: null == casksData ? _self.casksData : casksData // ignore: cast_nullable_to_non_nullable
as FetchState<List<CaskModel>>,formulaeData: null == formulaeData ? _self.formulaeData : formulaeData // ignore: cast_nullable_to_non_nullable
as FetchState<List<FormulaModel>>,trendingData: null == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as FetchState<List<dynamic>>,operationsQueue: null == operationsQueue ? _self._operationsQueue : operationsQueue // ignore: cast_nullable_to_non_nullable
as List<PackageOperation>,paginatedPackages: null == paginatedPackages ? _self._paginatedPackages : paginatedPackages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<CaskModel>, $Res> get casksData {
  
  return $FetchStateCopyWith<List<CaskModel>, $Res>(_self.casksData, (value) {
    return _then(_self.copyWith(casksData: value));
  });
}/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<FormulaModel>, $Res> get formulaeData {
  
  return $FetchStateCopyWith<List<FormulaModel>, $Res>(_self.formulaeData, (value) {
    return _then(_self.copyWith(formulaeData: value));
  });
}/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FetchStateCopyWith<List<dynamic>, $Res> get trendingData {
  
  return $FetchStateCopyWith<List<dynamic>, $Res>(_self.trendingData, (value) {
    return _then(_self.copyWith(trendingData: value));
  });
}
}

// dart format on
