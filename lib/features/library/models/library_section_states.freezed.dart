// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_section_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TapSectionState {

 TapModel get tapModel; String get tapName; String get installPath; bool get isExpanded; bool get isSelected; List<PackageItemState> get packages;
/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TapSectionStateCopyWith<TapSectionState> get copyWith => _$TapSectionStateCopyWithImpl<TapSectionState>(this as TapSectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TapSectionState&&(identical(other.tapModel, tapModel) || other.tapModel == tapModel)&&(identical(other.tapName, tapName) || other.tapName == tapName)&&(identical(other.installPath, installPath) || other.installPath == installPath)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&const DeepCollectionEquality().equals(other.packages, packages));
}


@override
int get hashCode => Object.hash(runtimeType,tapModel,tapName,installPath,isExpanded,isSelected,const DeepCollectionEquality().hash(packages));

@override
String toString() {
  return 'TapSectionState(tapModel: $tapModel, tapName: $tapName, installPath: $installPath, isExpanded: $isExpanded, isSelected: $isSelected, packages: $packages)';
}


}

/// @nodoc
abstract mixin class $TapSectionStateCopyWith<$Res>  {
  factory $TapSectionStateCopyWith(TapSectionState value, $Res Function(TapSectionState) _then) = _$TapSectionStateCopyWithImpl;
@useResult
$Res call({
 TapModel tapModel, String tapName, String installPath, bool isExpanded, bool isSelected, List<PackageItemState> packages
});


$TapModelCopyWith<$Res> get tapModel;

}
/// @nodoc
class _$TapSectionStateCopyWithImpl<$Res>
    implements $TapSectionStateCopyWith<$Res> {
  _$TapSectionStateCopyWithImpl(this._self, this._then);

  final TapSectionState _self;
  final $Res Function(TapSectionState) _then;

/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tapModel = null,Object? tapName = null,Object? installPath = null,Object? isExpanded = null,Object? isSelected = null,Object? packages = null,}) {
  return _then(_self.copyWith(
tapModel: null == tapModel ? _self.tapModel : tapModel // ignore: cast_nullable_to_non_nullable
as TapModel,tapName: null == tapName ? _self.tapName : tapName // ignore: cast_nullable_to_non_nullable
as String,installPath: null == installPath ? _self.installPath : installPath // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageItemState>,
  ));
}
/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TapModelCopyWith<$Res> get tapModel {
  
  return $TapModelCopyWith<$Res>(_self.tapModel, (value) {
    return _then(_self.copyWith(tapModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [TapSectionState].
extension TapSectionStatePatterns on TapSectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TapSectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TapSectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TapSectionState value)  $default,){
final _that = this;
switch (_that) {
case _TapSectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TapSectionState value)?  $default,){
final _that = this;
switch (_that) {
case _TapSectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TapModel tapModel,  String tapName,  String installPath,  bool isExpanded,  bool isSelected,  List<PackageItemState> packages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TapSectionState() when $default != null:
return $default(_that.tapModel,_that.tapName,_that.installPath,_that.isExpanded,_that.isSelected,_that.packages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TapModel tapModel,  String tapName,  String installPath,  bool isExpanded,  bool isSelected,  List<PackageItemState> packages)  $default,) {final _that = this;
switch (_that) {
case _TapSectionState():
return $default(_that.tapModel,_that.tapName,_that.installPath,_that.isExpanded,_that.isSelected,_that.packages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TapModel tapModel,  String tapName,  String installPath,  bool isExpanded,  bool isSelected,  List<PackageItemState> packages)?  $default,) {final _that = this;
switch (_that) {
case _TapSectionState() when $default != null:
return $default(_that.tapModel,_that.tapName,_that.installPath,_that.isExpanded,_that.isSelected,_that.packages);case _:
  return null;

}
}

}

/// @nodoc


class _TapSectionState implements TapSectionState {
  const _TapSectionState({required this.tapModel, required this.tapName, required this.installPath, required this.isExpanded, required this.isSelected, required final  List<PackageItemState> packages}): _packages = packages;
  

@override final  TapModel tapModel;
@override final  String tapName;
@override final  String installPath;
@override final  bool isExpanded;
@override final  bool isSelected;
 final  List<PackageItemState> _packages;
@override List<PackageItemState> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TapSectionStateCopyWith<_TapSectionState> get copyWith => __$TapSectionStateCopyWithImpl<_TapSectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TapSectionState&&(identical(other.tapModel, tapModel) || other.tapModel == tapModel)&&(identical(other.tapName, tapName) || other.tapName == tapName)&&(identical(other.installPath, installPath) || other.installPath == installPath)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&const DeepCollectionEquality().equals(other._packages, _packages));
}


@override
int get hashCode => Object.hash(runtimeType,tapModel,tapName,installPath,isExpanded,isSelected,const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'TapSectionState(tapModel: $tapModel, tapName: $tapName, installPath: $installPath, isExpanded: $isExpanded, isSelected: $isSelected, packages: $packages)';
}


}

/// @nodoc
abstract mixin class _$TapSectionStateCopyWith<$Res> implements $TapSectionStateCopyWith<$Res> {
  factory _$TapSectionStateCopyWith(_TapSectionState value, $Res Function(_TapSectionState) _then) = __$TapSectionStateCopyWithImpl;
@override @useResult
$Res call({
 TapModel tapModel, String tapName, String installPath, bool isExpanded, bool isSelected, List<PackageItemState> packages
});


@override $TapModelCopyWith<$Res> get tapModel;

}
/// @nodoc
class __$TapSectionStateCopyWithImpl<$Res>
    implements _$TapSectionStateCopyWith<$Res> {
  __$TapSectionStateCopyWithImpl(this._self, this._then);

  final _TapSectionState _self;
  final $Res Function(_TapSectionState) _then;

/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tapModel = null,Object? tapName = null,Object? installPath = null,Object? isExpanded = null,Object? isSelected = null,Object? packages = null,}) {
  return _then(_TapSectionState(
tapModel: null == tapModel ? _self.tapModel : tapModel // ignore: cast_nullable_to_non_nullable
as TapModel,tapName: null == tapName ? _self.tapName : tapName // ignore: cast_nullable_to_non_nullable
as String,installPath: null == installPath ? _self.installPath : installPath // ignore: cast_nullable_to_non_nullable
as String,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageItemState>,
  ));
}

/// Create a copy of TapSectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TapModelCopyWith<$Res> get tapModel {
  
  return $TapModelCopyWith<$Res>(_self.tapModel, (value) {
    return _then(_self.copyWith(tapModel: value));
  });
}
}

/// @nodoc
mixin _$PackageItemState {

 dynamic get package;// original model (FormulaModel or CaskModel)
 String get title; String get version; bool get isCask; bool get isHealthy; bool get isSelected;
/// Create a copy of PackageItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageItemStateCopyWith<PackageItemState> get copyWith => _$PackageItemStateCopyWithImpl<PackageItemState>(this as PackageItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageItemState&&const DeepCollectionEquality().equals(other.package, package)&&(identical(other.title, title) || other.title == title)&&(identical(other.version, version) || other.version == version)&&(identical(other.isCask, isCask) || other.isCask == isCask)&&(identical(other.isHealthy, isHealthy) || other.isHealthy == isHealthy)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(package),title,version,isCask,isHealthy,isSelected);

@override
String toString() {
  return 'PackageItemState(package: $package, title: $title, version: $version, isCask: $isCask, isHealthy: $isHealthy, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $PackageItemStateCopyWith<$Res>  {
  factory $PackageItemStateCopyWith(PackageItemState value, $Res Function(PackageItemState) _then) = _$PackageItemStateCopyWithImpl;
@useResult
$Res call({
 dynamic package, String title, String version, bool isCask, bool isHealthy, bool isSelected
});




}
/// @nodoc
class _$PackageItemStateCopyWithImpl<$Res>
    implements $PackageItemStateCopyWith<$Res> {
  _$PackageItemStateCopyWithImpl(this._self, this._then);

  final PackageItemState _self;
  final $Res Function(PackageItemState) _then;

/// Create a copy of PackageItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? package = freezed,Object? title = null,Object? version = null,Object? isCask = null,Object? isHealthy = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as dynamic,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,isHealthy: null == isHealthy ? _self.isHealthy : isHealthy // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageItemState].
extension PackageItemStatePatterns on PackageItemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageItemState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageItemState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageItemState value)  $default,){
final _that = this;
switch (_that) {
case _PackageItemState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageItemState value)?  $default,){
final _that = this;
switch (_that) {
case _PackageItemState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic package,  String title,  String version,  bool isCask,  bool isHealthy,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageItemState() when $default != null:
return $default(_that.package,_that.title,_that.version,_that.isCask,_that.isHealthy,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic package,  String title,  String version,  bool isCask,  bool isHealthy,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _PackageItemState():
return $default(_that.package,_that.title,_that.version,_that.isCask,_that.isHealthy,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic package,  String title,  String version,  bool isCask,  bool isHealthy,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _PackageItemState() when $default != null:
return $default(_that.package,_that.title,_that.version,_that.isCask,_that.isHealthy,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc


class _PackageItemState implements PackageItemState {
  const _PackageItemState({required this.package, required this.title, required this.version, required this.isCask, required this.isHealthy, required this.isSelected});
  

@override final  dynamic package;
// original model (FormulaModel or CaskModel)
@override final  String title;
@override final  String version;
@override final  bool isCask;
@override final  bool isHealthy;
@override final  bool isSelected;

/// Create a copy of PackageItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageItemStateCopyWith<_PackageItemState> get copyWith => __$PackageItemStateCopyWithImpl<_PackageItemState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageItemState&&const DeepCollectionEquality().equals(other.package, package)&&(identical(other.title, title) || other.title == title)&&(identical(other.version, version) || other.version == version)&&(identical(other.isCask, isCask) || other.isCask == isCask)&&(identical(other.isHealthy, isHealthy) || other.isHealthy == isHealthy)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(package),title,version,isCask,isHealthy,isSelected);

@override
String toString() {
  return 'PackageItemState(package: $package, title: $title, version: $version, isCask: $isCask, isHealthy: $isHealthy, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$PackageItemStateCopyWith<$Res> implements $PackageItemStateCopyWith<$Res> {
  factory _$PackageItemStateCopyWith(_PackageItemState value, $Res Function(_PackageItemState) _then) = __$PackageItemStateCopyWithImpl;
@override @useResult
$Res call({
 dynamic package, String title, String version, bool isCask, bool isHealthy, bool isSelected
});




}
/// @nodoc
class __$PackageItemStateCopyWithImpl<$Res>
    implements _$PackageItemStateCopyWith<$Res> {
  __$PackageItemStateCopyWithImpl(this._self, this._then);

  final _PackageItemState _self;
  final $Res Function(_PackageItemState) _then;

/// Create a copy of PackageItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? package = freezed,Object? title = null,Object? version = null,Object? isCask = null,Object? isHealthy = null,Object? isSelected = null,}) {
  return _then(_PackageItemState(
package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as dynamic,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,isHealthy: null == isHealthy ? _self.isHealthy : isHealthy // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
