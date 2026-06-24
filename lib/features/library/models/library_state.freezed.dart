// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InspectorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectorState()';
}


}

/// @nodoc
class $InspectorStateCopyWith<$Res>  {
$InspectorStateCopyWith(InspectorState _, $Res Function(InspectorState) __);
}


/// Adds pattern-matching-related methods to [InspectorState].
extension InspectorStatePatterns on InspectorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InspectorStateEmpty value)?  empty,TResult Function( InspectorStateTap value)?  tap,TResult Function( InspectorStatePackage value)?  package,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InspectorStateEmpty() when empty != null:
return empty(_that);case InspectorStateTap() when tap != null:
return tap(_that);case InspectorStatePackage() when package != null:
return package(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InspectorStateEmpty value)  empty,required TResult Function( InspectorStateTap value)  tap,required TResult Function( InspectorStatePackage value)  package,}){
final _that = this;
switch (_that) {
case InspectorStateEmpty():
return empty(_that);case InspectorStateTap():
return tap(_that);case InspectorStatePackage():
return package(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InspectorStateEmpty value)?  empty,TResult? Function( InspectorStateTap value)?  tap,TResult? Function( InspectorStatePackage value)?  package,}){
final _that = this;
switch (_that) {
case InspectorStateEmpty() when empty != null:
return empty(_that);case InspectorStateTap() when tap != null:
return tap(_that);case InspectorStatePackage() when package != null:
return package(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( TapModel tap,  List<PackageItemState> packages)?  tap,TResult Function( dynamic packageModel,  String name,  String version,  String description,  String installPath,  List<String> dependencies,  bool isDeprecated,  bool isOutdated,  List<String> missingDeps,  bool isMissingDeps,  bool isDisabled,  bool isCask,  bool isInstalled,  String? tapName,  String formattedInstalledSize,  String formattedInstallDate)?  package,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InspectorStateEmpty() when empty != null:
return empty();case InspectorStateTap() when tap != null:
return tap(_that.tap,_that.packages);case InspectorStatePackage() when package != null:
return package(_that.packageModel,_that.name,_that.version,_that.description,_that.installPath,_that.dependencies,_that.isDeprecated,_that.isOutdated,_that.missingDeps,_that.isMissingDeps,_that.isDisabled,_that.isCask,_that.isInstalled,_that.tapName,_that.formattedInstalledSize,_that.formattedInstallDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( TapModel tap,  List<PackageItemState> packages)  tap,required TResult Function( dynamic packageModel,  String name,  String version,  String description,  String installPath,  List<String> dependencies,  bool isDeprecated,  bool isOutdated,  List<String> missingDeps,  bool isMissingDeps,  bool isDisabled,  bool isCask,  bool isInstalled,  String? tapName,  String formattedInstalledSize,  String formattedInstallDate)  package,}) {final _that = this;
switch (_that) {
case InspectorStateEmpty():
return empty();case InspectorStateTap():
return tap(_that.tap,_that.packages);case InspectorStatePackage():
return package(_that.packageModel,_that.name,_that.version,_that.description,_that.installPath,_that.dependencies,_that.isDeprecated,_that.isOutdated,_that.missingDeps,_that.isMissingDeps,_that.isDisabled,_that.isCask,_that.isInstalled,_that.tapName,_that.formattedInstalledSize,_that.formattedInstallDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( TapModel tap,  List<PackageItemState> packages)?  tap,TResult? Function( dynamic packageModel,  String name,  String version,  String description,  String installPath,  List<String> dependencies,  bool isDeprecated,  bool isOutdated,  List<String> missingDeps,  bool isMissingDeps,  bool isDisabled,  bool isCask,  bool isInstalled,  String? tapName,  String formattedInstalledSize,  String formattedInstallDate)?  package,}) {final _that = this;
switch (_that) {
case InspectorStateEmpty() when empty != null:
return empty();case InspectorStateTap() when tap != null:
return tap(_that.tap,_that.packages);case InspectorStatePackage() when package != null:
return package(_that.packageModel,_that.name,_that.version,_that.description,_that.installPath,_that.dependencies,_that.isDeprecated,_that.isOutdated,_that.missingDeps,_that.isMissingDeps,_that.isDisabled,_that.isCask,_that.isInstalled,_that.tapName,_that.formattedInstalledSize,_that.formattedInstallDate);case _:
  return null;

}
}

}

/// @nodoc


class InspectorStateEmpty implements InspectorState {
  const InspectorStateEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectorStateEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InspectorState.empty()';
}


}




/// @nodoc


class InspectorStateTap implements InspectorState {
  const InspectorStateTap({required this.tap, required final  List<PackageItemState> packages}): _packages = packages;
  

 final  TapModel tap;
 final  List<PackageItemState> _packages;
 List<PackageItemState> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of InspectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectorStateTapCopyWith<InspectorStateTap> get copyWith => _$InspectorStateTapCopyWithImpl<InspectorStateTap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectorStateTap&&(identical(other.tap, tap) || other.tap == tap)&&const DeepCollectionEquality().equals(other._packages, _packages));
}


@override
int get hashCode => Object.hash(runtimeType,tap,const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'InspectorState.tap(tap: $tap, packages: $packages)';
}


}

/// @nodoc
abstract mixin class $InspectorStateTapCopyWith<$Res> implements $InspectorStateCopyWith<$Res> {
  factory $InspectorStateTapCopyWith(InspectorStateTap value, $Res Function(InspectorStateTap) _then) = _$InspectorStateTapCopyWithImpl;
@useResult
$Res call({
 TapModel tap, List<PackageItemState> packages
});


$TapModelCopyWith<$Res> get tap;

}
/// @nodoc
class _$InspectorStateTapCopyWithImpl<$Res>
    implements $InspectorStateTapCopyWith<$Res> {
  _$InspectorStateTapCopyWithImpl(this._self, this._then);

  final InspectorStateTap _self;
  final $Res Function(InspectorStateTap) _then;

/// Create a copy of InspectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tap = null,Object? packages = null,}) {
  return _then(InspectorStateTap(
tap: null == tap ? _self.tap : tap // ignore: cast_nullable_to_non_nullable
as TapModel,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageItemState>,
  ));
}

/// Create a copy of InspectorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TapModelCopyWith<$Res> get tap {
  
  return $TapModelCopyWith<$Res>(_self.tap, (value) {
    return _then(_self.copyWith(tap: value));
  });
}
}

/// @nodoc


class InspectorStatePackage implements InspectorState {
  const InspectorStatePackage({required this.packageModel, required this.name, required this.version, required this.description, required this.installPath, required final  List<String> dependencies, required this.isDeprecated, required this.isOutdated, required final  List<String> missingDeps, required this.isMissingDeps, required this.isDisabled, required this.isCask, required this.isInstalled, required this.tapName, required this.formattedInstalledSize, required this.formattedInstallDate}): _dependencies = dependencies,_missingDeps = missingDeps;
  

 final  dynamic packageModel;
 final  String name;
 final  String version;
 final  String description;
 final  String installPath;
 final  List<String> _dependencies;
 List<String> get dependencies {
  if (_dependencies is EqualUnmodifiableListView) return _dependencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dependencies);
}

 final  bool isDeprecated;
 final  bool isOutdated;
 final  List<String> _missingDeps;
 List<String> get missingDeps {
  if (_missingDeps is EqualUnmodifiableListView) return _missingDeps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingDeps);
}

 final  bool isMissingDeps;
 final  bool isDisabled;
 final  bool isCask;
 final  bool isInstalled;
 final  String? tapName;
 final  String formattedInstalledSize;
 final  String formattedInstallDate;

/// Create a copy of InspectorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InspectorStatePackageCopyWith<InspectorStatePackage> get copyWith => _$InspectorStatePackageCopyWithImpl<InspectorStatePackage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InspectorStatePackage&&const DeepCollectionEquality().equals(other.packageModel, packageModel)&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.description, description) || other.description == description)&&(identical(other.installPath, installPath) || other.installPath == installPath)&&const DeepCollectionEquality().equals(other._dependencies, _dependencies)&&(identical(other.isDeprecated, isDeprecated) || other.isDeprecated == isDeprecated)&&(identical(other.isOutdated, isOutdated) || other.isOutdated == isOutdated)&&const DeepCollectionEquality().equals(other._missingDeps, _missingDeps)&&(identical(other.isMissingDeps, isMissingDeps) || other.isMissingDeps == isMissingDeps)&&(identical(other.isDisabled, isDisabled) || other.isDisabled == isDisabled)&&(identical(other.isCask, isCask) || other.isCask == isCask)&&(identical(other.isInstalled, isInstalled) || other.isInstalled == isInstalled)&&(identical(other.tapName, tapName) || other.tapName == tapName)&&(identical(other.formattedInstalledSize, formattedInstalledSize) || other.formattedInstalledSize == formattedInstalledSize)&&(identical(other.formattedInstallDate, formattedInstallDate) || other.formattedInstallDate == formattedInstallDate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packageModel),name,version,description,installPath,const DeepCollectionEquality().hash(_dependencies),isDeprecated,isOutdated,const DeepCollectionEquality().hash(_missingDeps),isMissingDeps,isDisabled,isCask,isInstalled,tapName,formattedInstalledSize,formattedInstallDate);

@override
String toString() {
  return 'InspectorState.package(packageModel: $packageModel, name: $name, version: $version, description: $description, installPath: $installPath, dependencies: $dependencies, isDeprecated: $isDeprecated, isOutdated: $isOutdated, missingDeps: $missingDeps, isMissingDeps: $isMissingDeps, isDisabled: $isDisabled, isCask: $isCask, isInstalled: $isInstalled, tapName: $tapName, formattedInstalledSize: $formattedInstalledSize, formattedInstallDate: $formattedInstallDate)';
}


}

/// @nodoc
abstract mixin class $InspectorStatePackageCopyWith<$Res> implements $InspectorStateCopyWith<$Res> {
  factory $InspectorStatePackageCopyWith(InspectorStatePackage value, $Res Function(InspectorStatePackage) _then) = _$InspectorStatePackageCopyWithImpl;
@useResult
$Res call({
 dynamic packageModel, String name, String version, String description, String installPath, List<String> dependencies, bool isDeprecated, bool isOutdated, List<String> missingDeps, bool isMissingDeps, bool isDisabled, bool isCask, bool isInstalled, String? tapName, String formattedInstalledSize, String formattedInstallDate
});




}
/// @nodoc
class _$InspectorStatePackageCopyWithImpl<$Res>
    implements $InspectorStatePackageCopyWith<$Res> {
  _$InspectorStatePackageCopyWithImpl(this._self, this._then);

  final InspectorStatePackage _self;
  final $Res Function(InspectorStatePackage) _then;

/// Create a copy of InspectorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packageModel = freezed,Object? name = null,Object? version = null,Object? description = null,Object? installPath = null,Object? dependencies = null,Object? isDeprecated = null,Object? isOutdated = null,Object? missingDeps = null,Object? isMissingDeps = null,Object? isDisabled = null,Object? isCask = null,Object? isInstalled = null,Object? tapName = freezed,Object? formattedInstalledSize = null,Object? formattedInstallDate = null,}) {
  return _then(InspectorStatePackage(
packageModel: freezed == packageModel ? _self.packageModel : packageModel // ignore: cast_nullable_to_non_nullable
as dynamic,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,installPath: null == installPath ? _self.installPath : installPath // ignore: cast_nullable_to_non_nullable
as String,dependencies: null == dependencies ? _self._dependencies : dependencies // ignore: cast_nullable_to_non_nullable
as List<String>,isDeprecated: null == isDeprecated ? _self.isDeprecated : isDeprecated // ignore: cast_nullable_to_non_nullable
as bool,isOutdated: null == isOutdated ? _self.isOutdated : isOutdated // ignore: cast_nullable_to_non_nullable
as bool,missingDeps: null == missingDeps ? _self._missingDeps : missingDeps // ignore: cast_nullable_to_non_nullable
as List<String>,isMissingDeps: null == isMissingDeps ? _self.isMissingDeps : isMissingDeps // ignore: cast_nullable_to_non_nullable
as bool,isDisabled: null == isDisabled ? _self.isDisabled : isDisabled // ignore: cast_nullable_to_non_nullable
as bool,isCask: null == isCask ? _self.isCask : isCask // ignore: cast_nullable_to_non_nullable
as bool,isInstalled: null == isInstalled ? _self.isInstalled : isInstalled // ignore: cast_nullable_to_non_nullable
as bool,tapName: freezed == tapName ? _self.tapName : tapName // ignore: cast_nullable_to_non_nullable
as String?,formattedInstalledSize: null == formattedInstalledSize ? _self.formattedInstalledSize : formattedInstalledSize // ignore: cast_nullable_to_non_nullable
as String,formattedInstallDate: null == formattedInstallDate ? _self.formattedInstallDate : formattedInstallDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$LibraryState {

 bool get isLoading; List<FormulaModel> get installedFormulae; List<CaskModel> get installedCasks; List<TapModel> get installedTaps; dynamic get selectedPackage; String get brewPrefix; bool get isSyncing; String get filterQuery; Set<String> get expandedTaps;
/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryStateCopyWith<LibraryState> get copyWith => _$LibraryStateCopyWithImpl<LibraryState>(this as LibraryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.installedFormulae, installedFormulae)&&const DeepCollectionEquality().equals(other.installedCasks, installedCasks)&&const DeepCollectionEquality().equals(other.installedTaps, installedTaps)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.filterQuery, filterQuery) || other.filterQuery == filterQuery)&&const DeepCollectionEquality().equals(other.expandedTaps, expandedTaps));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(installedFormulae),const DeepCollectionEquality().hash(installedCasks),const DeepCollectionEquality().hash(installedTaps),const DeepCollectionEquality().hash(selectedPackage),brewPrefix,isSyncing,filterQuery,const DeepCollectionEquality().hash(expandedTaps));

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, installedTaps: $installedTaps, selectedPackage: $selectedPackage, brewPrefix: $brewPrefix, isSyncing: $isSyncing, filterQuery: $filterQuery, expandedTaps: $expandedTaps)';
}


}

/// @nodoc
abstract mixin class $LibraryStateCopyWith<$Res>  {
  factory $LibraryStateCopyWith(LibraryState value, $Res Function(LibraryState) _then) = _$LibraryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, List<TapModel> installedTaps, dynamic selectedPackage, String brewPrefix, bool isSyncing, String filterQuery, Set<String> expandedTaps
});




}
/// @nodoc
class _$LibraryStateCopyWithImpl<$Res>
    implements $LibraryStateCopyWith<$Res> {
  _$LibraryStateCopyWithImpl(this._self, this._then);

  final LibraryState _self;
  final $Res Function(LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? installedTaps = null,Object? selectedPackage = freezed,Object? brewPrefix = null,Object? isSyncing = null,Object? filterQuery = null,Object? expandedTaps = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self.installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self.installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,installedTaps: null == installedTaps ? _self.installedTaps : installedTaps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,filterQuery: null == filterQuery ? _self.filterQuery : filterQuery // ignore: cast_nullable_to_non_nullable
as String,expandedTaps: null == expandedTaps ? _self.expandedTaps : expandedTaps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LibraryState].
extension LibraryStatePatterns on LibraryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryState value)  $default,){
final _that = this;
switch (_that) {
case _LibraryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryState value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)  $default,) {final _that = this;
switch (_that) {
case _LibraryState():
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<FormulaModel> installedFormulae,  List<CaskModel> installedCasks,  List<TapModel> installedTaps,  dynamic selectedPackage,  String brewPrefix,  bool isSyncing,  String filterQuery,  Set<String> expandedTaps)?  $default,) {final _that = this;
switch (_that) {
case _LibraryState() when $default != null:
return $default(_that.isLoading,_that.installedFormulae,_that.installedCasks,_that.installedTaps,_that.selectedPackage,_that.brewPrefix,_that.isSyncing,_that.filterQuery,_that.expandedTaps);case _:
  return null;

}
}

}

/// @nodoc


class _LibraryState extends LibraryState {
  const _LibraryState({this.isLoading = true, final  List<FormulaModel> installedFormulae = const [], final  List<CaskModel> installedCasks = const [], final  List<TapModel> installedTaps = const [], this.selectedPackage, this.brewPrefix = '/opt/homebrew', this.isSyncing = false, this.filterQuery = '', final  Set<String> expandedTaps = const <String>{}}): _installedFormulae = installedFormulae,_installedCasks = installedCasks,_installedTaps = installedTaps,_expandedTaps = expandedTaps,super._();
  

@override@JsonKey() final  bool isLoading;
 final  List<FormulaModel> _installedFormulae;
@override@JsonKey() List<FormulaModel> get installedFormulae {
  if (_installedFormulae is EqualUnmodifiableListView) return _installedFormulae;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedFormulae);
}

 final  List<CaskModel> _installedCasks;
@override@JsonKey() List<CaskModel> get installedCasks {
  if (_installedCasks is EqualUnmodifiableListView) return _installedCasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedCasks);
}

 final  List<TapModel> _installedTaps;
@override@JsonKey() List<TapModel> get installedTaps {
  if (_installedTaps is EqualUnmodifiableListView) return _installedTaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_installedTaps);
}

@override final  dynamic selectedPackage;
@override@JsonKey() final  String brewPrefix;
@override@JsonKey() final  bool isSyncing;
@override@JsonKey() final  String filterQuery;
 final  Set<String> _expandedTaps;
@override@JsonKey() Set<String> get expandedTaps {
  if (_expandedTaps is EqualUnmodifiableSetView) return _expandedTaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedTaps);
}


/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryStateCopyWith<_LibraryState> get copyWith => __$LibraryStateCopyWithImpl<_LibraryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._installedFormulae, _installedFormulae)&&const DeepCollectionEquality().equals(other._installedCasks, _installedCasks)&&const DeepCollectionEquality().equals(other._installedTaps, _installedTaps)&&const DeepCollectionEquality().equals(other.selectedPackage, selectedPackage)&&(identical(other.brewPrefix, brewPrefix) || other.brewPrefix == brewPrefix)&&(identical(other.isSyncing, isSyncing) || other.isSyncing == isSyncing)&&(identical(other.filterQuery, filterQuery) || other.filterQuery == filterQuery)&&const DeepCollectionEquality().equals(other._expandedTaps, _expandedTaps));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_installedFormulae),const DeepCollectionEquality().hash(_installedCasks),const DeepCollectionEquality().hash(_installedTaps),const DeepCollectionEquality().hash(selectedPackage),brewPrefix,isSyncing,filterQuery,const DeepCollectionEquality().hash(_expandedTaps));

@override
String toString() {
  return 'LibraryState(isLoading: $isLoading, installedFormulae: $installedFormulae, installedCasks: $installedCasks, installedTaps: $installedTaps, selectedPackage: $selectedPackage, brewPrefix: $brewPrefix, isSyncing: $isSyncing, filterQuery: $filterQuery, expandedTaps: $expandedTaps)';
}


}

/// @nodoc
abstract mixin class _$LibraryStateCopyWith<$Res> implements $LibraryStateCopyWith<$Res> {
  factory _$LibraryStateCopyWith(_LibraryState value, $Res Function(_LibraryState) _then) = __$LibraryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<FormulaModel> installedFormulae, List<CaskModel> installedCasks, List<TapModel> installedTaps, dynamic selectedPackage, String brewPrefix, bool isSyncing, String filterQuery, Set<String> expandedTaps
});




}
/// @nodoc
class __$LibraryStateCopyWithImpl<$Res>
    implements _$LibraryStateCopyWith<$Res> {
  __$LibraryStateCopyWithImpl(this._self, this._then);

  final _LibraryState _self;
  final $Res Function(_LibraryState) _then;

/// Create a copy of LibraryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? installedFormulae = null,Object? installedCasks = null,Object? installedTaps = null,Object? selectedPackage = freezed,Object? brewPrefix = null,Object? isSyncing = null,Object? filterQuery = null,Object? expandedTaps = null,}) {
  return _then(_LibraryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,installedFormulae: null == installedFormulae ? _self._installedFormulae : installedFormulae // ignore: cast_nullable_to_non_nullable
as List<FormulaModel>,installedCasks: null == installedCasks ? _self._installedCasks : installedCasks // ignore: cast_nullable_to_non_nullable
as List<CaskModel>,installedTaps: null == installedTaps ? _self._installedTaps : installedTaps // ignore: cast_nullable_to_non_nullable
as List<TapModel>,selectedPackage: freezed == selectedPackage ? _self.selectedPackage : selectedPackage // ignore: cast_nullable_to_non_nullable
as dynamic,brewPrefix: null == brewPrefix ? _self.brewPrefix : brewPrefix // ignore: cast_nullable_to_non_nullable
as String,isSyncing: null == isSyncing ? _self.isSyncing : isSyncing // ignore: cast_nullable_to_non_nullable
as bool,filterQuery: null == filterQuery ? _self.filterQuery : filterQuery // ignore: cast_nullable_to_non_nullable
as String,expandedTaps: null == expandedTaps ? _self._expandedTaps : expandedTaps // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
