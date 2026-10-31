// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'building_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuildingData {

 String get id;/// Tiles taken along x and y.
 int get width; int get height;/// The potato type this building unlocks and looks after, if any. Every
/// building of the type adds its capacity to the type's limit.
 PotatoType? get houses;/// Whether it shows in the build menu. The house comes with the farm.
 bool get buildable;/// Whether it can be demolished. The house cannot; the potato cellar
/// only while empty.
 bool get removable;/// Whether a farm has at most one (the potato cellar).
 bool get single;/// Whether it waits until every other buildable kind stands on the farm
/// (2026-10-31, 사용자: the seed lab).
 bool get needsAll;/// What it does when lit, for totems.
 TotemData? get totem;/// Level 1 first. Level 1's cost is the cost to build; each later
/// level's cost is the cost to upgrade to it.
 List<BuildingLevelData> get levels;
/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingDataCopyWith<BuildingData> get copyWith => _$BuildingDataCopyWithImpl<BuildingData>(this as BuildingData, _$identity);

  /// Serializes this BuildingData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuildingData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.houses, _this.houses) || other.houses == _this.houses)&&(identical(other.buildable, _this.buildable) || other.buildable == _this.buildable)&&(identical(other.removable, _this.removable) || other.removable == _this.removable)&&(identical(other.single, _this.single) || other.single == _this.single)&&(identical(other.needsAll, _this.needsAll) || other.needsAll == _this.needsAll)&&(identical(other.totem, _this.totem) || other.totem == _this.totem)&&const DeepCollectionEquality().equals(other.levels, _this.levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuildingData;
  return Object.hash(runtimeType,_this.id,_this.width,_this.height,_this.houses,_this.buildable,_this.removable,_this.single,_this.needsAll,_this.totem,const DeepCollectionEquality().hash(_this.levels));
}

@override
String toString() {
  final _this = this as BuildingData;
  return 'BuildingData(id: ${_this.id}, width: ${_this.width}, height: ${_this.height}, houses: ${_this.houses}, buildable: ${_this.buildable}, removable: ${_this.removable}, single: ${_this.single}, needsAll: ${_this.needsAll}, totem: ${_this.totem}, levels: ${_this.levels})';
}


}

/// @nodoc
abstract mixin class $BuildingDataCopyWith<$Res>  {
  factory $BuildingDataCopyWith(BuildingData value, $Res Function(BuildingData) _then) = _$BuildingDataCopyWithImpl;
@useResult
$Res call({
 String id, int width, int height, PotatoType? houses, bool buildable, bool removable, bool single, bool needsAll, TotemData? totem, List<BuildingLevelData> levels
});


$TotemDataCopyWith<$Res>? get totem;

}
/// @nodoc
class _$BuildingDataCopyWithImpl<$Res>
    implements $BuildingDataCopyWith<$Res> {
  _$BuildingDataCopyWithImpl(this._self, this._then);

  final BuildingData _self;
  final $Res Function(BuildingData) _then;

/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? width = null,Object? height = null,Object? houses = freezed,Object? buildable = null,Object? removable = null,Object? single = null,Object? needsAll = null,Object? totem = freezed,Object? levels = null,}) {
  return _then(BuildingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,houses: freezed == houses ? _self.houses : houses // ignore: cast_nullable_to_non_nullable
as PotatoType?,buildable: null == buildable ? _self.buildable : buildable // ignore: cast_nullable_to_non_nullable
as bool,removable: null == removable ? _self.removable : removable // ignore: cast_nullable_to_non_nullable
as bool,single: null == single ? _self.single : single // ignore: cast_nullable_to_non_nullable
as bool,needsAll: null == needsAll ? _self.needsAll : needsAll // ignore: cast_nullable_to_non_nullable
as bool,totem: freezed == totem ? _self.totem : totem // ignore: cast_nullable_to_non_nullable
as TotemData?,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<BuildingLevelData>,
  ));
}
/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemDataCopyWith<$Res>? get totem {
    if (_self.totem == null) {
    return null;
  }

  return $TotemDataCopyWith<$Res>(_self.totem!, (value) {
    return _then(_self.copyWith(totem: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuildingData].
extension BuildingDataPatterns on BuildingData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildingData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildingData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildingData value)  $default,){
final _that = this;
switch (_that) {
case _BuildingData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildingData value)?  $default,){
final _that = this;
switch (_that) {
case _BuildingData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int width,  int height,  PotatoType? houses,  bool buildable,  bool removable,  bool single,  bool needsAll,  TotemData? totem,  List<BuildingLevelData> levels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingData() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.houses,_that.buildable,_that.removable,_that.single,_that.needsAll,_that.totem,_that.levels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int width,  int height,  PotatoType? houses,  bool buildable,  bool removable,  bool single,  bool needsAll,  TotemData? totem,  List<BuildingLevelData> levels)  $default,) {final _that = this;
switch (_that) {
case _BuildingData():
return $default(_that.id,_that.width,_that.height,_that.houses,_that.buildable,_that.removable,_that.single,_that.needsAll,_that.totem,_that.levels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int width,  int height,  PotatoType? houses,  bool buildable,  bool removable,  bool single,  bool needsAll,  TotemData? totem,  List<BuildingLevelData> levels)?  $default,) {final _that = this;
switch (_that) {
case _BuildingData() when $default != null:
return $default(_that.id,_that.width,_that.height,_that.houses,_that.buildable,_that.removable,_that.single,_that.needsAll,_that.totem,_that.levels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingData implements BuildingData {
  const _BuildingData({required this.id, required this.width, required this.height, this.houses, this.buildable = true, this.removable = true, this.single = false, this.needsAll = false, this.totem, required  List<BuildingLevelData> levels}): _levels = levels;
  factory _BuildingData.fromJson(Map<String, dynamic> json) => _$BuildingDataFromJson(json);

@override final  String id;
/// Tiles taken along x and y.
@override final  int width;
@override final  int height;
/// The potato type this building unlocks and looks after, if any. Every
/// building of the type adds its capacity to the type's limit.
@override final  PotatoType? houses;
/// Whether it shows in the build menu. The house comes with the farm.
@override@JsonKey() final  bool buildable;
/// Whether it can be demolished. The house cannot; the potato cellar
/// only while empty.
@override@JsonKey() final  bool removable;
/// Whether a farm has at most one (the potato cellar).
@override@JsonKey() final  bool single;
/// Whether it waits until every other buildable kind stands on the farm
/// (2026-10-31, 사용자: the seed lab).
@override@JsonKey() final  bool needsAll;
/// What it does when lit, for totems.
@override final  TotemData? totem;
/// Level 1 first. Level 1's cost is the cost to build; each later
/// level's cost is the cost to upgrade to it.
 final  List<BuildingLevelData> _levels;
/// Level 1 first. Level 1's cost is the cost to build; each later
/// level's cost is the cost to upgrade to it.
@override List<BuildingLevelData> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}


/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildingDataCopyWith<_BuildingData> get copyWith => __$BuildingDataCopyWithImpl<_BuildingData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingData&&(identical(other.id, id) || other.id == id)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.houses, houses) || other.houses == houses)&&(identical(other.buildable, buildable) || other.buildable == buildable)&&(identical(other.removable, removable) || other.removable == removable)&&(identical(other.single, single) || other.single == single)&&(identical(other.needsAll, needsAll) || other.needsAll == needsAll)&&(identical(other.totem, totem) || other.totem == totem)&&const DeepCollectionEquality().equals(other.levels, _levels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,width,height,houses,buildable,removable,single,needsAll,totem,const DeepCollectionEquality().hash(_levels));
}

@override
String toString() {
    return 'BuildingData(id: $id, width: $width, height: $height, houses: $houses, buildable: $buildable, removable: $removable, single: $single, needsAll: $needsAll, totem: $totem, levels: $levels)';
}


}

/// @nodoc
abstract mixin class _$BuildingDataCopyWith<$Res> implements $BuildingDataCopyWith<$Res> {
  factory _$BuildingDataCopyWith(_BuildingData value, $Res Function(_BuildingData) _then) = __$BuildingDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int width, int height, PotatoType? houses, bool buildable, bool removable, bool single, bool needsAll, TotemData? totem, List<BuildingLevelData> levels
});


@override $TotemDataCopyWith<$Res>? get totem;

}
/// @nodoc
class __$BuildingDataCopyWithImpl<$Res>
    implements _$BuildingDataCopyWith<$Res> {
  __$BuildingDataCopyWithImpl(this._self, this._then);

  final _BuildingData _self;
  final $Res Function(_BuildingData) _then;

/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? width = null,Object? height = null,Object? houses = freezed,Object? buildable = null,Object? removable = null,Object? single = null,Object? needsAll = null,Object? totem = freezed,Object? levels = null,}) {
  return _then(_BuildingData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,houses: freezed == houses ? _self.houses : houses // ignore: cast_nullable_to_non_nullable
as PotatoType?,buildable: null == buildable ? _self.buildable : buildable // ignore: cast_nullable_to_non_nullable
as bool,removable: null == removable ? _self.removable : removable // ignore: cast_nullable_to_non_nullable
as bool,single: null == single ? _self.single : single // ignore: cast_nullable_to_non_nullable
as bool,needsAll: null == needsAll ? _self.needsAll : needsAll // ignore: cast_nullable_to_non_nullable
as bool,totem: freezed == totem ? _self.totem : totem // ignore: cast_nullable_to_non_nullable
as TotemData?,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<BuildingLevelData>,
  ));
}

/// Create a copy of BuildingData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TotemDataCopyWith<$Res>? get totem {
    if (_self.totem == null) {
    return null;
  }

  return $TotemDataCopyWith<$Res>(_self.totem!, (value) {
    return _then(_self.copyWith(totem: value));
  });
}
}


/// @nodoc
mixin _$BuildingLevelData {

/// Baby potatoes paid to reach this level.
 int get cost;/// Potatoes of the housed type this building adds to the limit.
 int get capacity;/// Dead potatoes this building keeps for reviving (graveyards).
 int get graves;/// Potatoes this building keeps out of the fields (the potato cellar,
/// called the fridge in code).
 int get stores;/// Field tiles this building adds to the house's share (2026-10-28,
/// field offices). Fields may cover no more tiles than the farm looks
/// after (`FarmRulesData.fieldTiles` and these together).
 int get fieldTiles;/// Totems this building adds to the farm's limit (2026-10-30, 사용자:
/// the giant totem).
 int get totems;
/// Create a copy of BuildingLevelData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingLevelDataCopyWith<BuildingLevelData> get copyWith => _$BuildingLevelDataCopyWithImpl<BuildingLevelData>(this as BuildingLevelData, _$identity);

  /// Serializes this BuildingLevelData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuildingLevelData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingLevelData&&(identical(other.cost, _this.cost) || other.cost == _this.cost)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.graves, _this.graves) || other.graves == _this.graves)&&(identical(other.stores, _this.stores) || other.stores == _this.stores)&&(identical(other.fieldTiles, _this.fieldTiles) || other.fieldTiles == _this.fieldTiles)&&(identical(other.totems, _this.totems) || other.totems == _this.totems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuildingLevelData;
  return Object.hash(runtimeType,_this.cost,_this.capacity,_this.graves,_this.stores,_this.fieldTiles,_this.totems);
}

@override
String toString() {
  final _this = this as BuildingLevelData;
  return 'BuildingLevelData(cost: ${_this.cost}, capacity: ${_this.capacity}, graves: ${_this.graves}, stores: ${_this.stores}, fieldTiles: ${_this.fieldTiles}, totems: ${_this.totems})';
}


}

/// @nodoc
abstract mixin class $BuildingLevelDataCopyWith<$Res>  {
  factory $BuildingLevelDataCopyWith(BuildingLevelData value, $Res Function(BuildingLevelData) _then) = _$BuildingLevelDataCopyWithImpl;
@useResult
$Res call({
 int cost, int capacity, int graves, int stores, int fieldTiles, int totems
});




}
/// @nodoc
class _$BuildingLevelDataCopyWithImpl<$Res>
    implements $BuildingLevelDataCopyWith<$Res> {
  _$BuildingLevelDataCopyWithImpl(this._self, this._then);

  final BuildingLevelData _self;
  final $Res Function(BuildingLevelData) _then;

/// Create a copy of BuildingLevelData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cost = null,Object? capacity = null,Object? graves = null,Object? stores = null,Object? fieldTiles = null,Object? totems = null,}) {
  return _then(BuildingLevelData(
cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,graves: null == graves ? _self.graves : graves // ignore: cast_nullable_to_non_nullable
as int,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as int,fieldTiles: null == fieldTiles ? _self.fieldTiles : fieldTiles // ignore: cast_nullable_to_non_nullable
as int,totems: null == totems ? _self.totems : totems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildingLevelData].
extension BuildingLevelDataPatterns on BuildingLevelData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildingLevelData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildingLevelData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildingLevelData value)  $default,){
final _that = this;
switch (_that) {
case _BuildingLevelData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildingLevelData value)?  $default,){
final _that = this;
switch (_that) {
case _BuildingLevelData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cost,  int capacity,  int graves,  int stores,  int fieldTiles,  int totems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingLevelData() when $default != null:
return $default(_that.cost,_that.capacity,_that.graves,_that.stores,_that.fieldTiles,_that.totems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cost,  int capacity,  int graves,  int stores,  int fieldTiles,  int totems)  $default,) {final _that = this;
switch (_that) {
case _BuildingLevelData():
return $default(_that.cost,_that.capacity,_that.graves,_that.stores,_that.fieldTiles,_that.totems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cost,  int capacity,  int graves,  int stores,  int fieldTiles,  int totems)?  $default,) {final _that = this;
switch (_that) {
case _BuildingLevelData() when $default != null:
return $default(_that.cost,_that.capacity,_that.graves,_that.stores,_that.fieldTiles,_that.totems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingLevelData implements BuildingLevelData {
  const _BuildingLevelData({required this.cost, this.capacity = 0, this.graves = 0, this.stores = 0, this.fieldTiles = 0, this.totems = 0});
  factory _BuildingLevelData.fromJson(Map<String, dynamic> json) => _$BuildingLevelDataFromJson(json);

/// Baby potatoes paid to reach this level.
@override final  int cost;
/// Potatoes of the housed type this building adds to the limit.
@override@JsonKey() final  int capacity;
/// Dead potatoes this building keeps for reviving (graveyards).
@override@JsonKey() final  int graves;
/// Potatoes this building keeps out of the fields (the potato cellar,
/// called the fridge in code).
@override@JsonKey() final  int stores;
/// Field tiles this building adds to the house's share (2026-10-28,
/// field offices). Fields may cover no more tiles than the farm looks
/// after (`FarmRulesData.fieldTiles` and these together).
@override@JsonKey() final  int fieldTiles;
/// Totems this building adds to the farm's limit (2026-10-30, 사용자:
/// the giant totem).
@override@JsonKey() final  int totems;

/// Create a copy of BuildingLevelData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildingLevelDataCopyWith<_BuildingLevelData> get copyWith => __$BuildingLevelDataCopyWithImpl<_BuildingLevelData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingLevelDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingLevelData&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.graves, graves) || other.graves == graves)&&(identical(other.stores, stores) || other.stores == stores)&&(identical(other.fieldTiles, fieldTiles) || other.fieldTiles == fieldTiles)&&(identical(other.totems, totems) || other.totems == totems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,cost,capacity,graves,stores,fieldTiles,totems);
}

@override
String toString() {
    return 'BuildingLevelData(cost: $cost, capacity: $capacity, graves: $graves, stores: $stores, fieldTiles: $fieldTiles, totems: $totems)';
}


}

/// @nodoc
abstract mixin class _$BuildingLevelDataCopyWith<$Res> implements $BuildingLevelDataCopyWith<$Res> {
  factory _$BuildingLevelDataCopyWith(_BuildingLevelData value, $Res Function(_BuildingLevelData) _then) = __$BuildingLevelDataCopyWithImpl;
@override @useResult
$Res call({
 int cost, int capacity, int graves, int stores, int fieldTiles, int totems
});




}
/// @nodoc
class __$BuildingLevelDataCopyWithImpl<$Res>
    implements _$BuildingLevelDataCopyWith<$Res> {
  __$BuildingLevelDataCopyWithImpl(this._self, this._then);

  final _BuildingLevelData _self;
  final $Res Function(_BuildingLevelData) _then;

/// Create a copy of BuildingLevelData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cost = null,Object? capacity = null,Object? graves = null,Object? stores = null,Object? fieldTiles = null,Object? totems = null,}) {
  return _then(_BuildingLevelData(
cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,graves: null == graves ? _self.graves : graves // ignore: cast_nullable_to_non_nullable
as int,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as int,fieldTiles: null == fieldTiles ? _self.fieldTiles : fieldTiles // ignore: cast_nullable_to_non_nullable
as int,totems: null == totems ? _self.totems : totems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TotemData {

/// Farm stat ids (see `FarmStat`).
 List<String> get stats;/// +0.2 raises them by 20%, -0.3 lowers them by 30%.
 double get percent; int get seconds; int get cooldownSeconds;/// Baby potatoes it takes to light it.
 int get food;
/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemDataCopyWith<TotemData> get copyWith => _$TotemDataCopyWithImpl<TotemData>(this as TotemData, _$identity);

  /// Serializes this TotemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TotemData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemData&&const DeepCollectionEquality().equals(other.stats, _this.stats)&&(identical(other.percent, _this.percent) || other.percent == _this.percent)&&(identical(other.seconds, _this.seconds) || other.seconds == _this.seconds)&&(identical(other.cooldownSeconds, _this.cooldownSeconds) || other.cooldownSeconds == _this.cooldownSeconds)&&(identical(other.food, _this.food) || other.food == _this.food));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TotemData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.stats),_this.percent,_this.seconds,_this.cooldownSeconds,_this.food);
}

@override
String toString() {
  final _this = this as TotemData;
  return 'TotemData(stats: ${_this.stats}, percent: ${_this.percent}, seconds: ${_this.seconds}, cooldownSeconds: ${_this.cooldownSeconds}, food: ${_this.food})';
}


}

/// @nodoc
abstract mixin class $TotemDataCopyWith<$Res>  {
  factory $TotemDataCopyWith(TotemData value, $Res Function(TotemData) _then) = _$TotemDataCopyWithImpl;
@useResult
$Res call({
 List<String> stats, double percent, int seconds, int cooldownSeconds, int food
});




}
/// @nodoc
class _$TotemDataCopyWithImpl<$Res>
    implements $TotemDataCopyWith<$Res> {
  _$TotemDataCopyWithImpl(this._self, this._then);

  final TotemData _self;
  final $Res Function(TotemData) _then;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = null,Object? percent = null,Object? seconds = null,Object? cooldownSeconds = null,Object? food = null,}) {
  return _then(TotemData(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<String>,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TotemData].
extension TotemDataPatterns on TotemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotemData value)  $default,){
final _that = this;
switch (_that) {
case _TotemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotemData value)?  $default,){
final _that = this;
switch (_that) {
case _TotemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> stats,  double percent,  int seconds,  int cooldownSeconds,  int food)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotemData() when $default != null:
return $default(_that.stats,_that.percent,_that.seconds,_that.cooldownSeconds,_that.food);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> stats,  double percent,  int seconds,  int cooldownSeconds,  int food)  $default,) {final _that = this;
switch (_that) {
case _TotemData():
return $default(_that.stats,_that.percent,_that.seconds,_that.cooldownSeconds,_that.food);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> stats,  double percent,  int seconds,  int cooldownSeconds,  int food)?  $default,) {final _that = this;
switch (_that) {
case _TotemData() when $default != null:
return $default(_that.stats,_that.percent,_that.seconds,_that.cooldownSeconds,_that.food);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotemData implements TotemData {
  const _TotemData({required  List<String> stats, required this.percent, required this.seconds, required this.cooldownSeconds, required this.food}): _stats = stats;
  factory _TotemData.fromJson(Map<String, dynamic> json) => _$TotemDataFromJson(json);

/// Farm stat ids (see `FarmStat`).
 final  List<String> _stats;
/// Farm stat ids (see `FarmStat`).
@override List<String> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}

/// +0.2 raises them by 20%, -0.3 lowers them by 30%.
@override final  double percent;
@override final  int seconds;
@override final  int cooldownSeconds;
/// Baby potatoes it takes to light it.
@override final  int food;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotemDataCopyWith<_TotemData> get copyWith => __$TotemDataCopyWithImpl<_TotemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotemData&&const DeepCollectionEquality().equals(other.stats, _stats)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.seconds, seconds) || other.seconds == seconds)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.food, food) || other.food == food));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_stats),percent,seconds,cooldownSeconds,food);
}

@override
String toString() {
    return 'TotemData(stats: $stats, percent: $percent, seconds: $seconds, cooldownSeconds: $cooldownSeconds, food: $food)';
}


}

/// @nodoc
abstract mixin class _$TotemDataCopyWith<$Res> implements $TotemDataCopyWith<$Res> {
  factory _$TotemDataCopyWith(_TotemData value, $Res Function(_TotemData) _then) = __$TotemDataCopyWithImpl;
@override @useResult
$Res call({
 List<String> stats, double percent, int seconds, int cooldownSeconds, int food
});




}
/// @nodoc
class __$TotemDataCopyWithImpl<$Res>
    implements _$TotemDataCopyWith<$Res> {
  __$TotemDataCopyWithImpl(this._self, this._then);

  final _TotemData _self;
  final $Res Function(_TotemData) _then;

/// Create a copy of TotemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? percent = null,Object? seconds = null,Object? cooldownSeconds = null,Object? food = null,}) {
  return _then(_TotemData(
stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<String>,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as int,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
