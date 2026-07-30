// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PackageListItemState {

 String get id; String get name; String? get description; String get version; String? get homepage; bool get isInstalled; bool get isCask; bool get isDeprecated; bool get isSupported; PackageGridMatrixState get gridModel;
/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageListItemStateCopyWith<PackageListItemState> get copyWith => _$PackageListItemStateCopyWithImpl<PackageListItemState>(this as PackageListItemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageListItemState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.isCask, isCask) || other.isCask == isCask)&&(identical(other.isDeprecated, isDeprecated) || other.isDeprecated == isDeprecated)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.gridModel, gridModel) || other.gridModel == gridModel));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,version,homepage,isInstalled,isCask,isDeprecated,isSupported,gridModel);

@override
String toString() {
  return 'PackageListItemState(id: $id, name: $name, description: $description, version: $version, homepage: $homepage, isInstalled: $isInstalled, isCask: $isCask, isDeprecated: $isDeprecated, isSupported: $isSupported, gridModel: $gridModel)';
}


}

/// @nodoc
abstract mixin class $PackageListItemStateCopyWith<$Res>  {
  factory $PackageListItemStateCopyWith(PackageListItemState value, $Res Function(PackageListItemState) _then) = _$PackageListItemStateCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String version, String? homepage, bool isInstalled, bool isCask, bool isDeprecated, bool isSupported, PackageGridMatrixState gridModel
});


$PackageGridMatrixStateCopyWith<$Res> get gridModel;

}
/// @nodoc
class _$PackageListItemStateCopyWithImpl<$Res>
    implements $PackageListItemStateCopyWith<$Res> {
  _$PackageListItemStateCopyWithImpl(this._self, this._then);

  final PackageListItemState _self;
  final $Res Function(PackageListItemState) _then;

/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? version = null,Object? homepage = freezed,Object? isInstalled = null,Object? isCask = null,Object? isDeprecated = null,Object? isSupported = null,Object? gridModel = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,isDeprecated: null == isDeprecated ? _self.isDeprecated : isDeprecated // ignore: cast_nullable_to_non_nullable
as bool,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,gridModel: null == gridModel ? _self.gridModel : gridModel // ignore: cast_nullable_to_non_nullable
as PackageGridMatrixState,
  ));
}
/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageGridMatrixStateCopyWith<$Res> get gridModel {
  
  return $PackageGridMatrixStateCopyWith<$Res>(_self.gridModel, (value) {
    return _then(_self.copyWith(gridModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageListItemState].
extension PackageListItemStatePatterns on PackageListItemState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageListItemState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageListItemState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageListItemState value)  $default,){
final _that = this;
switch (_that) {
case _PackageListItemState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageListItemState value)?  $default,){
final _that = this;
switch (_that) {
case _PackageListItemState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String version,  String? homepage,  bool isInstalled,  bool isCask,  bool isDeprecated,  bool isSupported,  PackageGridMatrixState gridModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageListItemState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.version,_that.homepage,_that.isInstalled,_that.isCask,_that.isDeprecated,_that.isSupported,_that.gridModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String version,  String? homepage,  bool isInstalled,  bool isCask,  bool isDeprecated,  bool isSupported,  PackageGridMatrixState gridModel)  $default,) {final _that = this;
switch (_that) {
case _PackageListItemState():
return $default(_that.id,_that.name,_that.description,_that.version,_that.homepage,_that.isInstalled,_that.isCask,_that.isDeprecated,_that.isSupported,_that.gridModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String version,  String? homepage,  bool isInstalled,  bool isCask,  bool isDeprecated,  bool isSupported,  PackageGridMatrixState gridModel)?  $default,) {final _that = this;
switch (_that) {
case _PackageListItemState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.version,_that.homepage,_that.isInstalled,_that.isCask,_that.isDeprecated,_that.isSupported,_that.gridModel);case _:
  return null;

}
}

}

/// @nodoc


class _PackageListItemState extends PackageListItemState {
  const _PackageListItemState({required this.id, required this.name, required this.description, required this.version, required this.homepage, required this.isInstalled, required this.isCask, required this.isDeprecated, required this.isSupported, required this.gridModel}): super._();
  

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String version;
@override final  String? homepage;
@override final  bool isInstalled;
@override final  bool isCask;
@override final  bool isDeprecated;
@override final  bool isSupported;
@override final  PackageGridMatrixState gridModel;

/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageListItemStateCopyWith<_PackageListItemState> get copyWith => __$PackageListItemStateCopyWithImpl<_PackageListItemState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageListItemState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.version, version) || other.version == version)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.isCask, isCask) || other.isCask == isCask)&&(identical(other.isDeprecated, isDeprecated) || other.isDeprecated == isDeprecated)&&(identical(other.isSupported, isSupported) || other.isSupported == isSupported)&&(identical(other.gridModel, gridModel) || other.gridModel == gridModel));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,version,homepage,isInstalled,isCask,isDeprecated,isSupported,gridModel);

@override
String toString() {
  return 'PackageListItemState(id: $id, name: $name, description: $description, version: $version, homepage: $homepage, isInstalled: $isInstalled, isCask: $isCask, isDeprecated: $isDeprecated, isSupported: $isSupported, gridModel: $gridModel)';
}


}

/// @nodoc
abstract mixin class _$PackageListItemStateCopyWith<$Res> implements $PackageListItemStateCopyWith<$Res> {
  factory _$PackageListItemStateCopyWith(_PackageListItemState value, $Res Function(_PackageListItemState) _then) = __$PackageListItemStateCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String version, String? homepage, bool isInstalled, bool isCask, bool isDeprecated, bool isSupported, PackageGridMatrixState gridModel
});


@override $PackageGridMatrixStateCopyWith<$Res> get gridModel;

}
/// @nodoc
class __$PackageListItemStateCopyWithImpl<$Res>
    implements _$PackageListItemStateCopyWith<$Res> {
  __$PackageListItemStateCopyWithImpl(this._self, this._then);

  final _PackageListItemState _self;
  final $Res Function(_PackageListItemState) _then;

/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? version = null,Object? homepage = freezed,Object? isInstalled = null,Object? isCask = null,Object? isDeprecated = null,Object? isSupported = null,Object? gridModel = null,}) {
  return _then(_PackageListItemState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,isDeprecated: null == isDeprecated ? _self.isDeprecated : isDeprecated // ignore: cast_nullable_to_non_nullable
as bool,isSupported: null == isSupported ? _self.isSupported : isSupported // ignore: cast_nullable_to_non_nullable
as bool,gridModel: null == gridModel ? _self.gridModel : gridModel // ignore: cast_nullable_to_non_nullable
as PackageGridMatrixState,
  ));
}

/// Create a copy of PackageListItemState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageGridMatrixStateCopyWith<$Res> get gridModel {
  
  return $PackageGridMatrixStateCopyWith<$Res>(_self.gridModel, (value) {
    return _then(_self.copyWith(gridModel: value));
  });
}
}

/// @nodoc
mixin _$PackageGridMatrixState {

 String? get homepage; String get archs; String get version; String get typeAndTap; String get fullTag; String get formattedInstalls;
/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageGridMatrixStateCopyWith<PackageGridMatrixState> get copyWith => _$PackageGridMatrixStateCopyWithImpl<PackageGridMatrixState>(this as PackageGridMatrixState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageGridMatrixState&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.archs, archs) || other.archs == archs)&&(identical(other.version, version) || other.version == version)&&(identical(other.typeAndTap, typeAndTap) || other.typeAndTap == typeAndTap)&&(identical(other.fullTag, fullTag) || other.fullTag == fullTag)&&(identical(other.formattedInstalls, formattedInstalls) || other.formattedInstalls == formattedInstalls));
}


@override
int get hashCode => Object.hash(runtimeType,homepage,archs,version,typeAndTap,fullTag,formattedInstalls);

@override
String toString() {
  return 'PackageGridMatrixState(homepage: $homepage, archs: $archs, version: $version, typeAndTap: $typeAndTap, fullTag: $fullTag, formattedInstalls: $formattedInstalls)';
}


}

/// @nodoc
abstract mixin class $PackageGridMatrixStateCopyWith<$Res>  {
  factory $PackageGridMatrixStateCopyWith(PackageGridMatrixState value, $Res Function(PackageGridMatrixState) _then) = _$PackageGridMatrixStateCopyWithImpl;
@useResult
$Res call({
 String? homepage, String archs, String version, String typeAndTap, String fullTag, String formattedInstalls
});




}
/// @nodoc
class _$PackageGridMatrixStateCopyWithImpl<$Res>
    implements $PackageGridMatrixStateCopyWith<$Res> {
  _$PackageGridMatrixStateCopyWithImpl(this._self, this._then);

  final PackageGridMatrixState _self;
  final $Res Function(PackageGridMatrixState) _then;

/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? homepage = freezed,Object? archs = null,Object? version = null,Object? typeAndTap = null,Object? fullTag = null,Object? formattedInstalls = null,}) {
  return _then(_self.copyWith(
homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,archs: null == archs ? _self.archs : archs // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,typeAndTap: null == typeAndTap ? _self.typeAndTap : typeAndTap // ignore: cast_nullable_to_non_nullable
as String,fullTag: null == fullTag ? _self.fullTag : fullTag // ignore: cast_nullable_to_non_nullable
as String,formattedInstalls: null == formattedInstalls ? _self.formattedInstalls : formattedInstalls // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageGridMatrixState].
extension PackageGridMatrixStatePatterns on PackageGridMatrixState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CaskGrid value)?  cask,TResult Function( _FormulaGrid value)?  formula,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaskGrid() when cask != null:
return cask(_that);case _FormulaGrid() when formula != null:
return formula(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CaskGrid value)  cask,required TResult Function( _FormulaGrid value)  formula,}){
final _that = this;
switch (_that) {
case _CaskGrid():
return cask(_that);case _FormulaGrid():
return formula(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CaskGrid value)?  cask,TResult? Function( _FormulaGrid value)?  formula,}){
final _that = this;
switch (_that) {
case _CaskGrid() when cask != null:
return cask(_that);case _FormulaGrid() when formula != null:
return formula(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  bool autoUpdates,  String artifactType)?  cask,TResult Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  String license,  bool isBottle)?  formula,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaskGrid() when cask != null:
return cask(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.autoUpdates,_that.artifactType);case _FormulaGrid() when formula != null:
return formula(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.license,_that.isBottle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  bool autoUpdates,  String artifactType)  cask,required TResult Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  String license,  bool isBottle)  formula,}) {final _that = this;
switch (_that) {
case _CaskGrid():
return cask(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.autoUpdates,_that.artifactType);case _FormulaGrid():
return formula(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.license,_that.isBottle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  bool autoUpdates,  String artifactType)?  cask,TResult? Function( String? homepage,  String archs,  String version,  String typeAndTap,  String fullTag,  String formattedInstalls,  String license,  bool isBottle)?  formula,}) {final _that = this;
switch (_that) {
case _CaskGrid() when cask != null:
return cask(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.autoUpdates,_that.artifactType);case _FormulaGrid() when formula != null:
return formula(_that.homepage,_that.archs,_that.version,_that.typeAndTap,_that.fullTag,_that.formattedInstalls,_that.license,_that.isBottle);case _:
  return null;

}
}

}

/// @nodoc


class _CaskGrid extends PackageGridMatrixState {
  const _CaskGrid({required this.homepage, required this.archs, required this.version, required this.typeAndTap, required this.fullTag, required this.formattedInstalls, required this.autoUpdates, required this.artifactType}): super._();
  

@override final  String? homepage;
@override final  String archs;
@override final  String version;
@override final  String typeAndTap;
@override final  String fullTag;
@override final  String formattedInstalls;
 final  bool autoUpdates;
 final  String artifactType;

/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaskGridCopyWith<_CaskGrid> get copyWith => __$CaskGridCopyWithImpl<_CaskGrid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaskGrid&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.archs, archs) || other.archs == archs)&&(identical(other.version, version) || other.version == version)&&(identical(other.typeAndTap, typeAndTap) || other.typeAndTap == typeAndTap)&&(identical(other.fullTag, fullTag) || other.fullTag == fullTag)&&(identical(other.formattedInstalls, formattedInstalls) || other.formattedInstalls == formattedInstalls)&&(identical(other.autoUpdates, autoUpdates) || other.autoUpdates == autoUpdates)&&(identical(other.artifactType, artifactType) || other.artifactType == artifactType));
}


@override
int get hashCode => Object.hash(runtimeType,homepage,archs,version,typeAndTap,fullTag,formattedInstalls,autoUpdates,artifactType);

@override
String toString() {
  return 'PackageGridMatrixState.cask(homepage: $homepage, archs: $archs, version: $version, typeAndTap: $typeAndTap, fullTag: $fullTag, formattedInstalls: $formattedInstalls, autoUpdates: $autoUpdates, artifactType: $artifactType)';
}


}

/// @nodoc
abstract mixin class _$CaskGridCopyWith<$Res> implements $PackageGridMatrixStateCopyWith<$Res> {
  factory _$CaskGridCopyWith(_CaskGrid value, $Res Function(_CaskGrid) _then) = __$CaskGridCopyWithImpl;
@override @useResult
$Res call({
 String? homepage, String archs, String version, String typeAndTap, String fullTag, String formattedInstalls, bool autoUpdates, String artifactType
});




}
/// @nodoc
class __$CaskGridCopyWithImpl<$Res>
    implements _$CaskGridCopyWith<$Res> {
  __$CaskGridCopyWithImpl(this._self, this._then);

  final _CaskGrid _self;
  final $Res Function(_CaskGrid) _then;

/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homepage = freezed,Object? archs = null,Object? version = null,Object? typeAndTap = null,Object? fullTag = null,Object? formattedInstalls = null,Object? autoUpdates = null,Object? artifactType = null,}) {
  return _then(_CaskGrid(
homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,archs: null == archs ? _self.archs : archs // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,typeAndTap: null == typeAndTap ? _self.typeAndTap : typeAndTap // ignore: cast_nullable_to_non_nullable
as String,fullTag: null == fullTag ? _self.fullTag : fullTag // ignore: cast_nullable_to_non_nullable
as String,formattedInstalls: null == formattedInstalls ? _self.formattedInstalls : formattedInstalls // ignore: cast_nullable_to_non_nullable
as String,autoUpdates: null == autoUpdates ? _self.autoUpdates : autoUpdates // ignore: cast_nullable_to_non_nullable
as bool,artifactType: null == artifactType ? _self.artifactType : artifactType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FormulaGrid extends PackageGridMatrixState {
  const _FormulaGrid({required this.homepage, required this.archs, required this.version, required this.typeAndTap, required this.fullTag, required this.formattedInstalls, required this.license, required this.isBottle}): super._();
  

@override final  String? homepage;
@override final  String archs;
@override final  String version;
@override final  String typeAndTap;
@override final  String fullTag;
@override final  String formattedInstalls;
 final  String license;
 final  bool isBottle;

/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FormulaGridCopyWith<_FormulaGrid> get copyWith => __$FormulaGridCopyWithImpl<_FormulaGrid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormulaGrid&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.archs, archs) || other.archs == archs)&&(identical(other.version, version) || other.version == version)&&(identical(other.typeAndTap, typeAndTap) || other.typeAndTap == typeAndTap)&&(identical(other.fullTag, fullTag) || other.fullTag == fullTag)&&(identical(other.formattedInstalls, formattedInstalls) || other.formattedInstalls == formattedInstalls)&&(identical(other.license, license) || other.license == license)&&(identical(other.isBottle, isBottle) || other.isBottle == isBottle));
}


@override
int get hashCode => Object.hash(runtimeType,homepage,archs,version,typeAndTap,fullTag,formattedInstalls,license,isBottle);

@override
String toString() {
  return 'PackageGridMatrixState.formula(homepage: $homepage, archs: $archs, version: $version, typeAndTap: $typeAndTap, fullTag: $fullTag, formattedInstalls: $formattedInstalls, license: $license, isBottle: $isBottle)';
}


}

/// @nodoc
abstract mixin class _$FormulaGridCopyWith<$Res> implements $PackageGridMatrixStateCopyWith<$Res> {
  factory _$FormulaGridCopyWith(_FormulaGrid value, $Res Function(_FormulaGrid) _then) = __$FormulaGridCopyWithImpl;
@override @useResult
$Res call({
 String? homepage, String archs, String version, String typeAndTap, String fullTag, String formattedInstalls, String license, bool isBottle
});




}
/// @nodoc
class __$FormulaGridCopyWithImpl<$Res>
    implements _$FormulaGridCopyWith<$Res> {
  __$FormulaGridCopyWithImpl(this._self, this._then);

  final _FormulaGrid _self;
  final $Res Function(_FormulaGrid) _then;

/// Create a copy of PackageGridMatrixState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? homepage = freezed,Object? archs = null,Object? version = null,Object? typeAndTap = null,Object? fullTag = null,Object? formattedInstalls = null,Object? license = null,Object? isBottle = null,}) {
  return _then(_FormulaGrid(
homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,archs: null == archs ? _self.archs : archs // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,typeAndTap: null == typeAndTap ? _self.typeAndTap : typeAndTap // ignore: cast_nullable_to_non_nullable
as String,fullTag: null == fullTag ? _self.fullTag : fullTag // ignore: cast_nullable_to_non_nullable
as String,formattedInstalls: null == formattedInstalls ? _self.formattedInstalls : formattedInstalls // ignore: cast_nullable_to_non_nullable
as String,license: null == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String,isBottle: null == isBottle ? _self.isBottle : isBottle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
