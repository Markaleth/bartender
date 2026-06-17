// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 HomeTab get selectedTab; String? get localVersion; bool get updateAvailable; bool get isCheckingForUpdates;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion)&&(identical(other.updateAvailable, updateAvailable) || other.updateAvailable == updateAvailable)&&(identical(other.isCheckingForUpdates, isCheckingForUpdates) || other.isCheckingForUpdates == isCheckingForUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,localVersion,updateAvailable,isCheckingForUpdates);

@override
String toString() {
  return 'HomeState(selectedTab: $selectedTab, localVersion: $localVersion, updateAvailable: $updateAvailable, isCheckingForUpdates: $isCheckingForUpdates)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeTab selectedTab, String? localVersion, bool updateAvailable, bool isCheckingForUpdates
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? localVersion = freezed,Object? updateAvailable = null,Object? isCheckingForUpdates = null,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as HomeTab,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as String?,updateAvailable: null == updateAvailable ? _self.updateAvailable : updateAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCheckingForUpdates: null == isCheckingForUpdates ? _self.isCheckingForUpdates : isCheckingForUpdates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeTab selectedTab,  String? localVersion,  bool updateAvailable,  bool isCheckingForUpdates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.selectedTab,_that.localVersion,_that.updateAvailable,_that.isCheckingForUpdates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeTab selectedTab,  String? localVersion,  bool updateAvailable,  bool isCheckingForUpdates)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.selectedTab,_that.localVersion,_that.updateAvailable,_that.isCheckingForUpdates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeTab selectedTab,  String? localVersion,  bool updateAvailable,  bool isCheckingForUpdates)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.selectedTab,_that.localVersion,_that.updateAvailable,_that.isCheckingForUpdates);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.selectedTab = HomeTab.browse, this.localVersion, this.updateAvailable = false, this.isCheckingForUpdates = false});
  

@override@JsonKey() final  HomeTab selectedTab;
@override final  String? localVersion;
@override@JsonKey() final  bool updateAvailable;
@override@JsonKey() final  bool isCheckingForUpdates;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&(identical(other.localVersion, localVersion) || other.localVersion == localVersion)&&(identical(other.updateAvailable, updateAvailable) || other.updateAvailable == updateAvailable)&&(identical(other.isCheckingForUpdates, isCheckingForUpdates) || other.isCheckingForUpdates == isCheckingForUpdates));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,localVersion,updateAvailable,isCheckingForUpdates);

@override
String toString() {
  return 'HomeState(selectedTab: $selectedTab, localVersion: $localVersion, updateAvailable: $updateAvailable, isCheckingForUpdates: $isCheckingForUpdates)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeTab selectedTab, String? localVersion, bool updateAvailable, bool isCheckingForUpdates
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? localVersion = freezed,Object? updateAvailable = null,Object? isCheckingForUpdates = null,}) {
  return _then(_HomeState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as HomeTab,localVersion: freezed == localVersion ? _self.localVersion : localVersion // ignore: cast_nullable_to_non_nullable
as String?,updateAvailable: null == updateAvailable ? _self.updateAvailable : updateAvailable // ignore: cast_nullable_to_non_nullable
as bool,isCheckingForUpdates: null == isCheckingForUpdates ? _self.isCheckingForUpdates : isCheckingForUpdates // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
