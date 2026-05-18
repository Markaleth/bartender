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

 String get searchQuery; PackageTypeFilter get packageType; FetchState<List<dynamic>> get trendingData; bool get isSyncingBackground; List<dynamic> get paginatedPackages; String? get expandedPackageId; List<TapModel> get taps;
/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackagesStateCopyWith<PackagesState> get copyWith => _$PackagesStateCopyWithImpl<PackagesState>(this as PackagesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackagesState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&(identical(other.isSyncingBackground, isSyncingBackground) || other.isSyncingBackground == isSyncingBackground)&&const DeepCollectionEquality().equals(other.paginatedPackages, paginatedPackages)&&(identical(other.expandedPackageId, expandedPackageId) || other.expandedPackageId == expandedPackageId)&&const DeepCollectionEquality().equals(other.taps, taps));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,packageType,trendingData,isSyncingBackground,const DeepCollectionEquality().hash(paginatedPackages),expandedPackageId,const DeepCollectionEquality().hash(taps));

@override
String toString() {
  return 'PackagesState(searchQuery: $searchQuery, packageType: $packageType, trendingData: $trendingData, isSyncingBackground: $isSyncingBackground, paginatedPackages: $paginatedPackages, expandedPackageId: $expandedPackageId, taps: $taps)';
}


}

/// @nodoc
abstract mixin class $PackagesStateCopyWith<$Res>  {
  factory $PackagesStateCopyWith(PackagesState value, $Res Function(PackagesState) _then) = _$PackagesStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, PackageTypeFilter packageType, FetchState<List<dynamic>> trendingData, bool isSyncingBackground, List<dynamic> paginatedPackages, String? expandedPackageId, List<TapModel> taps
});


$FetchStateCopyWith<List<dynamic>, $Res> get trendingData;

}
/// @nodoc
class _$PackagesStateCopyWithImpl<$Res>
    implements $PackagesStateCopyWith<$Res> {
  _$PackagesStateCopyWithImpl(this._self, this._then);

  final PackagesState _self;
  final $Res Function(PackagesState) _then;

/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? packageType = null,Object? trendingData = null,Object? isSyncingBackground = null,Object? paginatedPackages = null,Object? expandedPackageId = freezed,Object? taps = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as PackageTypeFilter,trendingData: null == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as FetchState<List<dynamic>>,isSyncingBackground: null == isSyncingBackground ? _self.isSyncingBackground : isSyncingBackground // ignore: cast_nullable_to_non_nullable
as bool,paginatedPackages: null == paginatedPackages ? _self.paginatedPackages : paginatedPackages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,expandedPackageId: freezed == expandedPackageId ? _self.expandedPackageId : expandedPackageId // ignore: cast_nullable_to_non_nullable
as String?,taps: null == taps ? _self.taps : taps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,
  ));
}
/// Create a copy of PackagesState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  PackageTypeFilter packageType,  FetchState<List<dynamic>> trendingData,  bool isSyncingBackground,  List<dynamic> paginatedPackages,  String? expandedPackageId,  List<TapModel> taps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
return $default(_that.searchQuery,_that.packageType,_that.trendingData,_that.isSyncingBackground,_that.paginatedPackages,_that.expandedPackageId,_that.taps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  PackageTypeFilter packageType,  FetchState<List<dynamic>> trendingData,  bool isSyncingBackground,  List<dynamic> paginatedPackages,  String? expandedPackageId,  List<TapModel> taps)  $default,) {final _that = this;
switch (_that) {
case _PackagesState():
return $default(_that.searchQuery,_that.packageType,_that.trendingData,_that.isSyncingBackground,_that.paginatedPackages,_that.expandedPackageId,_that.taps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  PackageTypeFilter packageType,  FetchState<List<dynamic>> trendingData,  bool isSyncingBackground,  List<dynamic> paginatedPackages,  String? expandedPackageId,  List<TapModel> taps)?  $default,) {final _that = this;
switch (_that) {
case _PackagesState() when $default != null:
return $default(_that.searchQuery,_that.packageType,_that.trendingData,_that.isSyncingBackground,_that.paginatedPackages,_that.expandedPackageId,_that.taps);case _:
  return null;

}
}

}

/// @nodoc


class _PackagesState extends PackagesState {
  const _PackagesState({this.searchQuery = '', this.packageType = PackageTypeFilter.all, this.trendingData = const FetchState.loading(), this.isSyncingBackground = false, final  List<dynamic> paginatedPackages = const [], this.expandedPackageId, final  List<TapModel> taps = const []}): _paginatedPackages = paginatedPackages,_taps = taps,super._();
  

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  PackageTypeFilter packageType;
@override@JsonKey() final  FetchState<List<dynamic>> trendingData;
@override@JsonKey() final  bool isSyncingBackground;
 final  List<dynamic> _paginatedPackages;
@override@JsonKey() List<dynamic> get paginatedPackages {
  if (_paginatedPackages is EqualUnmodifiableListView) return _paginatedPackages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paginatedPackages);
}

@override final  String? expandedPackageId;
 final  List<TapModel> _taps;
@override@JsonKey() List<TapModel> get taps {
  if (_taps is EqualUnmodifiableListView) return _taps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_taps);
}


/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackagesStateCopyWith<_PackagesState> get copyWith => __$PackagesStateCopyWithImpl<_PackagesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackagesState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.trendingData, trendingData) || other.trendingData == trendingData)&&(identical(other.isSyncingBackground, isSyncingBackground) || other.isSyncingBackground == isSyncingBackground)&&const DeepCollectionEquality().equals(other._paginatedPackages, _paginatedPackages)&&(identical(other.expandedPackageId, expandedPackageId) || other.expandedPackageId == expandedPackageId)&&const DeepCollectionEquality().equals(other._taps, _taps));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,packageType,trendingData,isSyncingBackground,const DeepCollectionEquality().hash(_paginatedPackages),expandedPackageId,const DeepCollectionEquality().hash(_taps));

@override
String toString() {
  return 'PackagesState(searchQuery: $searchQuery, packageType: $packageType, trendingData: $trendingData, isSyncingBackground: $isSyncingBackground, paginatedPackages: $paginatedPackages, expandedPackageId: $expandedPackageId, taps: $taps)';
}


}

/// @nodoc
abstract mixin class _$PackagesStateCopyWith<$Res> implements $PackagesStateCopyWith<$Res> {
  factory _$PackagesStateCopyWith(_PackagesState value, $Res Function(_PackagesState) _then) = __$PackagesStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, PackageTypeFilter packageType, FetchState<List<dynamic>> trendingData, bool isSyncingBackground, List<dynamic> paginatedPackages, String? expandedPackageId, List<TapModel> taps
});


@override $FetchStateCopyWith<List<dynamic>, $Res> get trendingData;

}
/// @nodoc
class __$PackagesStateCopyWithImpl<$Res>
    implements _$PackagesStateCopyWith<$Res> {
  __$PackagesStateCopyWithImpl(this._self, this._then);

  final _PackagesState _self;
  final $Res Function(_PackagesState) _then;

/// Create a copy of PackagesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? packageType = null,Object? trendingData = null,Object? isSyncingBackground = null,Object? paginatedPackages = null,Object? expandedPackageId = freezed,Object? taps = null,}) {
  return _then(_PackagesState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as PackageTypeFilter,trendingData: null == trendingData ? _self.trendingData : trendingData // ignore: cast_nullable_to_non_nullable
as FetchState<List<dynamic>>,isSyncingBackground: null == isSyncingBackground ? _self.isSyncingBackground : isSyncingBackground // ignore: cast_nullable_to_non_nullable
as bool,paginatedPackages: null == paginatedPackages ? _self._paginatedPackages : paginatedPackages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,expandedPackageId: freezed == expandedPackageId ? _self.expandedPackageId : expandedPackageId // ignore: cast_nullable_to_non_nullable
as String?,taps: null == taps ? _self._taps : taps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,
  ));
}

/// Create a copy of PackagesState
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
