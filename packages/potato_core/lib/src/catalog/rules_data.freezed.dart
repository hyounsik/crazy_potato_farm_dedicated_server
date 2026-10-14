// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rules_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RulesData {

 FarmRulesData get farm; PotatoRulesData get potatoes; PestRulesData get pests; NewFarmData get newFarm; RaidRulesData get raid;
/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RulesDataCopyWith<RulesData> get copyWith => _$RulesDataCopyWithImpl<RulesData>(this as RulesData, _$identity);

  /// Serializes this RulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RulesData&&(identical(other.farm, _this.farm) || other.farm == _this.farm)&&(identical(other.potatoes, _this.potatoes) || other.potatoes == _this.potatoes)&&(identical(other.pests, _this.pests) || other.pests == _this.pests)&&(identical(other.newFarm, _this.newFarm) || other.newFarm == _this.newFarm)&&(identical(other.raid, _this.raid) || other.raid == _this.raid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RulesData;
  return Object.hash(runtimeType,_this.farm,_this.potatoes,_this.pests,_this.newFarm,_this.raid);
}

@override
String toString() {
  final _this = this as RulesData;
  return 'RulesData(farm: ${_this.farm}, potatoes: ${_this.potatoes}, pests: ${_this.pests}, newFarm: ${_this.newFarm}, raid: ${_this.raid})';
}


}

/// @nodoc
abstract mixin class $RulesDataCopyWith<$Res>  {
  factory $RulesDataCopyWith(RulesData value, $Res Function(RulesData) _then) = _$RulesDataCopyWithImpl;
@useResult
$Res call({
 FarmRulesData farm, PotatoRulesData potatoes, PestRulesData pests, NewFarmData newFarm, RaidRulesData raid
});


$FarmRulesDataCopyWith<$Res> get farm;$PotatoRulesDataCopyWith<$Res> get potatoes;$PestRulesDataCopyWith<$Res> get pests;$NewFarmDataCopyWith<$Res> get newFarm;$RaidRulesDataCopyWith<$Res> get raid;

}
/// @nodoc
class _$RulesDataCopyWithImpl<$Res>
    implements $RulesDataCopyWith<$Res> {
  _$RulesDataCopyWithImpl(this._self, this._then);

  final RulesData _self;
  final $Res Function(RulesData) _then;

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? farm = null,Object? potatoes = null,Object? pests = null,Object? newFarm = null,Object? raid = null,}) {
  return _then(RulesData(
farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as FarmRulesData,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as PotatoRulesData,pests: null == pests ? _self.pests : pests // ignore: cast_nullable_to_non_nullable
as PestRulesData,newFarm: null == newFarm ? _self.newFarm : newFarm // ignore: cast_nullable_to_non_nullable
as NewFarmData,raid: null == raid ? _self.raid : raid // ignore: cast_nullable_to_non_nullable
as RaidRulesData,
  ));
}
/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FarmRulesDataCopyWith<$Res> get farm {
  
  return $FarmRulesDataCopyWith<$Res>(_self.farm, (value) {
    return _then(_self.copyWith(farm: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoRulesDataCopyWith<$Res> get potatoes {
  
  return $PotatoRulesDataCopyWith<$Res>(_self.potatoes, (value) {
    return _then(_self.copyWith(potatoes: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestRulesDataCopyWith<$Res> get pests {
  
  return $PestRulesDataCopyWith<$Res>(_self.pests, (value) {
    return _then(_self.copyWith(pests: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewFarmDataCopyWith<$Res> get newFarm {
  
  return $NewFarmDataCopyWith<$Res>(_self.newFarm, (value) {
    return _then(_self.copyWith(newFarm: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RaidRulesDataCopyWith<$Res> get raid {
  
  return $RaidRulesDataCopyWith<$Res>(_self.raid, (value) {
    return _then(_self.copyWith(raid: value));
  });
}
}


/// Adds pattern-matching-related methods to [RulesData].
extension RulesDataPatterns on RulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RulesData value)  $default,){
final _that = this;
switch (_that) {
case _RulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RulesData value)?  $default,){
final _that = this;
switch (_that) {
case _RulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FarmRulesData farm,  PotatoRulesData potatoes,  PestRulesData pests,  NewFarmData newFarm,  RaidRulesData raid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RulesData() when $default != null:
return $default(_that.farm,_that.potatoes,_that.pests,_that.newFarm,_that.raid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FarmRulesData farm,  PotatoRulesData potatoes,  PestRulesData pests,  NewFarmData newFarm,  RaidRulesData raid)  $default,) {final _that = this;
switch (_that) {
case _RulesData():
return $default(_that.farm,_that.potatoes,_that.pests,_that.newFarm,_that.raid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FarmRulesData farm,  PotatoRulesData potatoes,  PestRulesData pests,  NewFarmData newFarm,  RaidRulesData raid)?  $default,) {final _that = this;
switch (_that) {
case _RulesData() when $default != null:
return $default(_that.farm,_that.potatoes,_that.pests,_that.newFarm,_that.raid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RulesData implements RulesData {
  const _RulesData({required this.farm, required this.potatoes, required this.pests, required this.newFarm, required this.raid});
  factory _RulesData.fromJson(Map<String, dynamic> json) => _$RulesDataFromJson(json);

@override final  FarmRulesData farm;
@override final  PotatoRulesData potatoes;
@override final  PestRulesData pests;
@override final  NewFarmData newFarm;
@override final  RaidRulesData raid;

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RulesDataCopyWith<_RulesData> get copyWith => __$RulesDataCopyWithImpl<_RulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RulesData&&(identical(other.farm, farm) || other.farm == farm)&&(identical(other.potatoes, potatoes) || other.potatoes == potatoes)&&(identical(other.pests, pests) || other.pests == pests)&&(identical(other.newFarm, newFarm) || other.newFarm == newFarm)&&(identical(other.raid, raid) || other.raid == raid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,farm,potatoes,pests,newFarm,raid);
}

@override
String toString() {
    return 'RulesData(farm: $farm, potatoes: $potatoes, pests: $pests, newFarm: $newFarm, raid: $raid)';
}


}

/// @nodoc
abstract mixin class _$RulesDataCopyWith<$Res> implements $RulesDataCopyWith<$Res> {
  factory _$RulesDataCopyWith(_RulesData value, $Res Function(_RulesData) _then) = __$RulesDataCopyWithImpl;
@override @useResult
$Res call({
 FarmRulesData farm, PotatoRulesData potatoes, PestRulesData pests, NewFarmData newFarm, RaidRulesData raid
});


@override $FarmRulesDataCopyWith<$Res> get farm;@override $PotatoRulesDataCopyWith<$Res> get potatoes;@override $PestRulesDataCopyWith<$Res> get pests;@override $NewFarmDataCopyWith<$Res> get newFarm;@override $RaidRulesDataCopyWith<$Res> get raid;

}
/// @nodoc
class __$RulesDataCopyWithImpl<$Res>
    implements _$RulesDataCopyWith<$Res> {
  __$RulesDataCopyWithImpl(this._self, this._then);

  final _RulesData _self;
  final $Res Function(_RulesData) _then;

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? farm = null,Object? potatoes = null,Object? pests = null,Object? newFarm = null,Object? raid = null,}) {
  return _then(_RulesData(
farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as FarmRulesData,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as PotatoRulesData,pests: null == pests ? _self.pests : pests // ignore: cast_nullable_to_non_nullable
as PestRulesData,newFarm: null == newFarm ? _self.newFarm : newFarm // ignore: cast_nullable_to_non_nullable
as NewFarmData,raid: null == raid ? _self.raid : raid // ignore: cast_nullable_to_non_nullable
as RaidRulesData,
  ));
}

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FarmRulesDataCopyWith<$Res> get farm {
  
  return $FarmRulesDataCopyWith<$Res>(_self.farm, (value) {
    return _then(_self.copyWith(farm: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoRulesDataCopyWith<$Res> get potatoes {
  
  return $PotatoRulesDataCopyWith<$Res>(_self.potatoes, (value) {
    return _then(_self.copyWith(potatoes: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestRulesDataCopyWith<$Res> get pests {
  
  return $PestRulesDataCopyWith<$Res>(_self.pests, (value) {
    return _then(_self.copyWith(pests: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NewFarmDataCopyWith<$Res> get newFarm {
  
  return $NewFarmDataCopyWith<$Res>(_self.newFarm, (value) {
    return _then(_self.copyWith(newFarm: value));
  });
}/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RaidRulesDataCopyWith<$Res> get raid {
  
  return $RaidRulesDataCopyWith<$Res>(_self.raid, (value) {
    return _then(_self.copyWith(raid: value));
  });
}
}


/// @nodoc
mixin _$FarmRulesData {

/// Game time one farm `step` covers, both while the app runs and when
/// catching up after it was closed.
 int get stepMillis;/// Longest time away that still counts when catching up. Time past it is
/// treated as paused.
 int get offlineCapMinutes;/// Tiles along one side of the square farm.
 int get size;/// Tiles along the longer side of the largest field.
 int get fieldMaxSize;/// Baby potatoes a new 1x1 field costs.
 int get fieldFood;/// Baby potatoes each tile past the first adds to a new field's cost.
 int get fieldTileFood;/// The part of the farm that can be built on. Fixed until locked blocks
/// can be opened.
 TileRect get openArea;
/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FarmRulesDataCopyWith<FarmRulesData> get copyWith => _$FarmRulesDataCopyWithImpl<FarmRulesData>(this as FarmRulesData, _$identity);

  /// Serializes this FarmRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FarmRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmRulesData&&(identical(other.stepMillis, _this.stepMillis) || other.stepMillis == _this.stepMillis)&&(identical(other.offlineCapMinutes, _this.offlineCapMinutes) || other.offlineCapMinutes == _this.offlineCapMinutes)&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.fieldMaxSize, _this.fieldMaxSize) || other.fieldMaxSize == _this.fieldMaxSize)&&(identical(other.fieldFood, _this.fieldFood) || other.fieldFood == _this.fieldFood)&&(identical(other.fieldTileFood, _this.fieldTileFood) || other.fieldTileFood == _this.fieldTileFood)&&(identical(other.openArea, _this.openArea) || other.openArea == _this.openArea));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmRulesData;
  return Object.hash(runtimeType,_this.stepMillis,_this.offlineCapMinutes,_this.size,_this.fieldMaxSize,_this.fieldFood,_this.fieldTileFood,_this.openArea);
}

@override
String toString() {
  final _this = this as FarmRulesData;
  return 'FarmRulesData(stepMillis: ${_this.stepMillis}, offlineCapMinutes: ${_this.offlineCapMinutes}, size: ${_this.size}, fieldMaxSize: ${_this.fieldMaxSize}, fieldFood: ${_this.fieldFood}, fieldTileFood: ${_this.fieldTileFood}, openArea: ${_this.openArea})';
}


}

/// @nodoc
abstract mixin class $FarmRulesDataCopyWith<$Res>  {
  factory $FarmRulesDataCopyWith(FarmRulesData value, $Res Function(FarmRulesData) _then) = _$FarmRulesDataCopyWithImpl;
@useResult
$Res call({
 int stepMillis, int offlineCapMinutes, int size, int fieldMaxSize, int fieldFood, int fieldTileFood, TileRect openArea
});


$TileRectCopyWith<$Res> get openArea;

}
/// @nodoc
class _$FarmRulesDataCopyWithImpl<$Res>
    implements $FarmRulesDataCopyWith<$Res> {
  _$FarmRulesDataCopyWithImpl(this._self, this._then);

  final FarmRulesData _self;
  final $Res Function(FarmRulesData) _then;

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepMillis = null,Object? offlineCapMinutes = null,Object? size = null,Object? fieldMaxSize = null,Object? fieldFood = null,Object? fieldTileFood = null,Object? openArea = null,}) {
  return _then(FarmRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,offlineCapMinutes: null == offlineCapMinutes ? _self.offlineCapMinutes : offlineCapMinutes // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,fieldMaxSize: null == fieldMaxSize ? _self.fieldMaxSize : fieldMaxSize // ignore: cast_nullable_to_non_nullable
as int,fieldFood: null == fieldFood ? _self.fieldFood : fieldFood // ignore: cast_nullable_to_non_nullable
as int,fieldTileFood: null == fieldTileFood ? _self.fieldTileFood : fieldTileFood // ignore: cast_nullable_to_non_nullable
as int,openArea: null == openArea ? _self.openArea : openArea // ignore: cast_nullable_to_non_nullable
as TileRect,
  ));
}
/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res> get openArea {
  
  return $TileRectCopyWith<$Res>(_self.openArea, (value) {
    return _then(_self.copyWith(openArea: value));
  });
}
}


/// Adds pattern-matching-related methods to [FarmRulesData].
extension FarmRulesDataPatterns on FarmRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FarmRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FarmRulesData value)  $default,){
final _that = this;
switch (_that) {
case _FarmRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FarmRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize,  int fieldFood,  int fieldTileFood,  TileRect openArea)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize,_that.fieldFood,_that.fieldTileFood,_that.openArea);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize,  int fieldFood,  int fieldTileFood,  TileRect openArea)  $default,) {final _that = this;
switch (_that) {
case _FarmRulesData():
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize,_that.fieldFood,_that.fieldTileFood,_that.openArea);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize,  int fieldFood,  int fieldTileFood,  TileRect openArea)?  $default,) {final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize,_that.fieldFood,_that.fieldTileFood,_that.openArea);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FarmRulesData extends FarmRulesData {
  const _FarmRulesData({required this.stepMillis, required this.offlineCapMinutes, required this.size, required this.fieldMaxSize, required this.fieldFood, required this.fieldTileFood, required this.openArea}): super._();
  factory _FarmRulesData.fromJson(Map<String, dynamic> json) => _$FarmRulesDataFromJson(json);

/// Game time one farm `step` covers, both while the app runs and when
/// catching up after it was closed.
@override final  int stepMillis;
/// Longest time away that still counts when catching up. Time past it is
/// treated as paused.
@override final  int offlineCapMinutes;
/// Tiles along one side of the square farm.
@override final  int size;
/// Tiles along the longer side of the largest field.
@override final  int fieldMaxSize;
/// Baby potatoes a new 1x1 field costs.
@override final  int fieldFood;
/// Baby potatoes each tile past the first adds to a new field's cost.
@override final  int fieldTileFood;
/// The part of the farm that can be built on. Fixed until locked blocks
/// can be opened.
@override final  TileRect openArea;

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FarmRulesDataCopyWith<_FarmRulesData> get copyWith => __$FarmRulesDataCopyWithImpl<_FarmRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FarmRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmRulesData&&(identical(other.stepMillis, stepMillis) || other.stepMillis == stepMillis)&&(identical(other.offlineCapMinutes, offlineCapMinutes) || other.offlineCapMinutes == offlineCapMinutes)&&(identical(other.size, size) || other.size == size)&&(identical(other.fieldMaxSize, fieldMaxSize) || other.fieldMaxSize == fieldMaxSize)&&(identical(other.fieldFood, fieldFood) || other.fieldFood == fieldFood)&&(identical(other.fieldTileFood, fieldTileFood) || other.fieldTileFood == fieldTileFood)&&(identical(other.openArea, openArea) || other.openArea == openArea));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stepMillis,offlineCapMinutes,size,fieldMaxSize,fieldFood,fieldTileFood,openArea);
}

@override
String toString() {
    return 'FarmRulesData(stepMillis: $stepMillis, offlineCapMinutes: $offlineCapMinutes, size: $size, fieldMaxSize: $fieldMaxSize, fieldFood: $fieldFood, fieldTileFood: $fieldTileFood, openArea: $openArea)';
}


}

/// @nodoc
abstract mixin class _$FarmRulesDataCopyWith<$Res> implements $FarmRulesDataCopyWith<$Res> {
  factory _$FarmRulesDataCopyWith(_FarmRulesData value, $Res Function(_FarmRulesData) _then) = __$FarmRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int stepMillis, int offlineCapMinutes, int size, int fieldMaxSize, int fieldFood, int fieldTileFood, TileRect openArea
});


@override $TileRectCopyWith<$Res> get openArea;

}
/// @nodoc
class __$FarmRulesDataCopyWithImpl<$Res>
    implements _$FarmRulesDataCopyWith<$Res> {
  __$FarmRulesDataCopyWithImpl(this._self, this._then);

  final _FarmRulesData _self;
  final $Res Function(_FarmRulesData) _then;

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepMillis = null,Object? offlineCapMinutes = null,Object? size = null,Object? fieldMaxSize = null,Object? fieldFood = null,Object? fieldTileFood = null,Object? openArea = null,}) {
  return _then(_FarmRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,offlineCapMinutes: null == offlineCapMinutes ? _self.offlineCapMinutes : offlineCapMinutes // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,fieldMaxSize: null == fieldMaxSize ? _self.fieldMaxSize : fieldMaxSize // ignore: cast_nullable_to_non_nullable
as int,fieldFood: null == fieldFood ? _self.fieldFood : fieldFood // ignore: cast_nullable_to_non_nullable
as int,fieldTileFood: null == fieldTileFood ? _self.fieldTileFood : fieldTileFood // ignore: cast_nullable_to_non_nullable
as int,openArea: null == openArea ? _self.openArea : openArea // ignore: cast_nullable_to_non_nullable
as TileRect,
  ));
}

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res> get openArea {
  
  return $TileRectCopyWith<$Res>(_self.openArea, (value) {
    return _then(_self.copyWith(openArea: value));
  });
}
}


/// @nodoc
mixin _$PotatoRulesData {

/// Chance that the seed a dead potato leaves is one grade lower.
 double get gradeDropChance;/// Baby potatoes it costs to revive a dead potato as a seed, by its
/// grade.
 Map<Grade, int> get reviveFood;/// Game time between two upkeep payments. A multiple of the farm step.
 int get upkeepEverySeconds;/// How hard a weak (unfed) potato works, in percent: guards walk and
/// clear pests, and breeding potatoes raise grades, at this rate.
 int get weakPercent;/// Chance that a seed planted in a field with a grown breeding potato
/// comes up one grade higher.
 double get breedingGradeUpChance; GuardRulesData get guards; FridgeRulesData get fridge;/// Chance that harvesting a field also gives a normal seed of the type
/// planted most there, before abilities raise it.
 double get harvestRareChance; LevelRulesData get level;/// How each combat style changes guards on the farm.
 Map<CombatStyle, CombatStyleData> get combatStyles;
/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoRulesDataCopyWith<PotatoRulesData> get copyWith => _$PotatoRulesDataCopyWithImpl<PotatoRulesData>(this as PotatoRulesData, _$identity);

  /// Serializes this PotatoRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PotatoRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoRulesData&&(identical(other.gradeDropChance, _this.gradeDropChance) || other.gradeDropChance == _this.gradeDropChance)&&const DeepCollectionEquality().equals(other.reviveFood, _this.reviveFood)&&(identical(other.upkeepEverySeconds, _this.upkeepEverySeconds) || other.upkeepEverySeconds == _this.upkeepEverySeconds)&&(identical(other.weakPercent, _this.weakPercent) || other.weakPercent == _this.weakPercent)&&(identical(other.breedingGradeUpChance, _this.breedingGradeUpChance) || other.breedingGradeUpChance == _this.breedingGradeUpChance)&&(identical(other.guards, _this.guards) || other.guards == _this.guards)&&(identical(other.fridge, _this.fridge) || other.fridge == _this.fridge)&&(identical(other.harvestRareChance, _this.harvestRareChance) || other.harvestRareChance == _this.harvestRareChance)&&(identical(other.level, _this.level) || other.level == _this.level)&&const DeepCollectionEquality().equals(other.combatStyles, _this.combatStyles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoRulesData;
  return Object.hash(runtimeType,_this.gradeDropChance,const DeepCollectionEquality().hash(_this.reviveFood),_this.upkeepEverySeconds,_this.weakPercent,_this.breedingGradeUpChance,_this.guards,_this.fridge,_this.harvestRareChance,_this.level,const DeepCollectionEquality().hash(_this.combatStyles));
}

@override
String toString() {
  final _this = this as PotatoRulesData;
  return 'PotatoRulesData(gradeDropChance: ${_this.gradeDropChance}, reviveFood: ${_this.reviveFood}, upkeepEverySeconds: ${_this.upkeepEverySeconds}, weakPercent: ${_this.weakPercent}, breedingGradeUpChance: ${_this.breedingGradeUpChance}, guards: ${_this.guards}, fridge: ${_this.fridge}, harvestRareChance: ${_this.harvestRareChance}, level: ${_this.level}, combatStyles: ${_this.combatStyles})';
}


}

/// @nodoc
abstract mixin class $PotatoRulesDataCopyWith<$Res>  {
  factory $PotatoRulesDataCopyWith(PotatoRulesData value, $Res Function(PotatoRulesData) _then) = _$PotatoRulesDataCopyWithImpl;
@useResult
$Res call({
 double gradeDropChance, Map<Grade, int> reviveFood, int upkeepEverySeconds, int weakPercent, double breedingGradeUpChance, GuardRulesData guards, FridgeRulesData fridge, double harvestRareChance, LevelRulesData level, Map<CombatStyle, CombatStyleData> combatStyles
});


$GuardRulesDataCopyWith<$Res> get guards;$FridgeRulesDataCopyWith<$Res> get fridge;$LevelRulesDataCopyWith<$Res> get level;

}
/// @nodoc
class _$PotatoRulesDataCopyWithImpl<$Res>
    implements $PotatoRulesDataCopyWith<$Res> {
  _$PotatoRulesDataCopyWithImpl(this._self, this._then);

  final PotatoRulesData _self;
  final $Res Function(PotatoRulesData) _then;

/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gradeDropChance = null,Object? reviveFood = null,Object? upkeepEverySeconds = null,Object? weakPercent = null,Object? breedingGradeUpChance = null,Object? guards = null,Object? fridge = null,Object? harvestRareChance = null,Object? level = null,Object? combatStyles = null,}) {
  return _then(PotatoRulesData(
gradeDropChance: null == gradeDropChance ? _self.gradeDropChance : gradeDropChance // ignore: cast_nullable_to_non_nullable
as double,reviveFood: null == reviveFood ? _self.reviveFood : reviveFood // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,upkeepEverySeconds: null == upkeepEverySeconds ? _self.upkeepEverySeconds : upkeepEverySeconds // ignore: cast_nullable_to_non_nullable
as int,weakPercent: null == weakPercent ? _self.weakPercent : weakPercent // ignore: cast_nullable_to_non_nullable
as int,breedingGradeUpChance: null == breedingGradeUpChance ? _self.breedingGradeUpChance : breedingGradeUpChance // ignore: cast_nullable_to_non_nullable
as double,guards: null == guards ? _self.guards : guards // ignore: cast_nullable_to_non_nullable
as GuardRulesData,fridge: null == fridge ? _self.fridge : fridge // ignore: cast_nullable_to_non_nullable
as FridgeRulesData,harvestRareChance: null == harvestRareChance ? _self.harvestRareChance : harvestRareChance // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LevelRulesData,combatStyles: null == combatStyles ? _self.combatStyles : combatStyles // ignore: cast_nullable_to_non_nullable
as Map<CombatStyle, CombatStyleData>,
  ));
}
/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuardRulesDataCopyWith<$Res> get guards {
  
  return $GuardRulesDataCopyWith<$Res>(_self.guards, (value) {
    return _then(_self.copyWith(guards: value));
  });
}/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FridgeRulesDataCopyWith<$Res> get fridge {
  
  return $FridgeRulesDataCopyWith<$Res>(_self.fridge, (value) {
    return _then(_self.copyWith(fridge: value));
  });
}/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelRulesDataCopyWith<$Res> get level {
  
  return $LevelRulesDataCopyWith<$Res>(_self.level, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// Adds pattern-matching-related methods to [PotatoRulesData].
extension PotatoRulesDataPatterns on PotatoRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PotatoRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PotatoRulesData value)  $default,){
final _that = this;
switch (_that) {
case _PotatoRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PotatoRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double gradeDropChance,  Map<Grade, int> reviveFood,  int upkeepEverySeconds,  int weakPercent,  double breedingGradeUpChance,  GuardRulesData guards,  FridgeRulesData fridge,  double harvestRareChance,  LevelRulesData level,  Map<CombatStyle, CombatStyleData> combatStyles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
return $default(_that.gradeDropChance,_that.reviveFood,_that.upkeepEverySeconds,_that.weakPercent,_that.breedingGradeUpChance,_that.guards,_that.fridge,_that.harvestRareChance,_that.level,_that.combatStyles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double gradeDropChance,  Map<Grade, int> reviveFood,  int upkeepEverySeconds,  int weakPercent,  double breedingGradeUpChance,  GuardRulesData guards,  FridgeRulesData fridge,  double harvestRareChance,  LevelRulesData level,  Map<CombatStyle, CombatStyleData> combatStyles)  $default,) {final _that = this;
switch (_that) {
case _PotatoRulesData():
return $default(_that.gradeDropChance,_that.reviveFood,_that.upkeepEverySeconds,_that.weakPercent,_that.breedingGradeUpChance,_that.guards,_that.fridge,_that.harvestRareChance,_that.level,_that.combatStyles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double gradeDropChance,  Map<Grade, int> reviveFood,  int upkeepEverySeconds,  int weakPercent,  double breedingGradeUpChance,  GuardRulesData guards,  FridgeRulesData fridge,  double harvestRareChance,  LevelRulesData level,  Map<CombatStyle, CombatStyleData> combatStyles)?  $default,) {final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
return $default(_that.gradeDropChance,_that.reviveFood,_that.upkeepEverySeconds,_that.weakPercent,_that.breedingGradeUpChance,_that.guards,_that.fridge,_that.harvestRareChance,_that.level,_that.combatStyles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoRulesData implements PotatoRulesData {
  const _PotatoRulesData({required this.gradeDropChance, required  Map<Grade, int> reviveFood, required this.upkeepEverySeconds, required this.weakPercent, required this.breedingGradeUpChance, required this.guards, required this.fridge, required this.harvestRareChance, required this.level, required  Map<CombatStyle, CombatStyleData> combatStyles}): _reviveFood = reviveFood,_combatStyles = combatStyles;
  factory _PotatoRulesData.fromJson(Map<String, dynamic> json) => _$PotatoRulesDataFromJson(json);

/// Chance that the seed a dead potato leaves is one grade lower.
@override final  double gradeDropChance;
/// Baby potatoes it costs to revive a dead potato as a seed, by its
/// grade.
 final  Map<Grade, int> _reviveFood;
/// Baby potatoes it costs to revive a dead potato as a seed, by its
/// grade.
@override Map<Grade, int> get reviveFood {
  if (_reviveFood is EqualUnmodifiableMapView) return _reviveFood;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_reviveFood);
}

/// Game time between two upkeep payments. A multiple of the farm step.
@override final  int upkeepEverySeconds;
/// How hard a weak (unfed) potato works, in percent: guards walk and
/// clear pests, and breeding potatoes raise grades, at this rate.
@override final  int weakPercent;
/// Chance that a seed planted in a field with a grown breeding potato
/// comes up one grade higher.
@override final  double breedingGradeUpChance;
@override final  GuardRulesData guards;
@override final  FridgeRulesData fridge;
/// Chance that harvesting a field also gives a normal seed of the type
/// planted most there, before abilities raise it.
@override final  double harvestRareChance;
@override final  LevelRulesData level;
/// How each combat style changes guards on the farm.
 final  Map<CombatStyle, CombatStyleData> _combatStyles;
/// How each combat style changes guards on the farm.
@override Map<CombatStyle, CombatStyleData> get combatStyles {
  if (_combatStyles is EqualUnmodifiableMapView) return _combatStyles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_combatStyles);
}


/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PotatoRulesDataCopyWith<_PotatoRulesData> get copyWith => __$PotatoRulesDataCopyWithImpl<_PotatoRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoRulesData&&(identical(other.gradeDropChance, gradeDropChance) || other.gradeDropChance == gradeDropChance)&&const DeepCollectionEquality().equals(other.reviveFood, _reviveFood)&&(identical(other.upkeepEverySeconds, upkeepEverySeconds) || other.upkeepEverySeconds == upkeepEverySeconds)&&(identical(other.weakPercent, weakPercent) || other.weakPercent == weakPercent)&&(identical(other.breedingGradeUpChance, breedingGradeUpChance) || other.breedingGradeUpChance == breedingGradeUpChance)&&(identical(other.guards, guards) || other.guards == guards)&&(identical(other.fridge, fridge) || other.fridge == fridge)&&(identical(other.harvestRareChance, harvestRareChance) || other.harvestRareChance == harvestRareChance)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.combatStyles, _combatStyles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gradeDropChance,const DeepCollectionEquality().hash(_reviveFood),upkeepEverySeconds,weakPercent,breedingGradeUpChance,guards,fridge,harvestRareChance,level,const DeepCollectionEquality().hash(_combatStyles));
}

@override
String toString() {
    return 'PotatoRulesData(gradeDropChance: $gradeDropChance, reviveFood: $reviveFood, upkeepEverySeconds: $upkeepEverySeconds, weakPercent: $weakPercent, breedingGradeUpChance: $breedingGradeUpChance, guards: $guards, fridge: $fridge, harvestRareChance: $harvestRareChance, level: $level, combatStyles: $combatStyles)';
}


}

/// @nodoc
abstract mixin class _$PotatoRulesDataCopyWith<$Res> implements $PotatoRulesDataCopyWith<$Res> {
  factory _$PotatoRulesDataCopyWith(_PotatoRulesData value, $Res Function(_PotatoRulesData) _then) = __$PotatoRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double gradeDropChance, Map<Grade, int> reviveFood, int upkeepEverySeconds, int weakPercent, double breedingGradeUpChance, GuardRulesData guards, FridgeRulesData fridge, double harvestRareChance, LevelRulesData level, Map<CombatStyle, CombatStyleData> combatStyles
});


@override $GuardRulesDataCopyWith<$Res> get guards;@override $FridgeRulesDataCopyWith<$Res> get fridge;@override $LevelRulesDataCopyWith<$Res> get level;

}
/// @nodoc
class __$PotatoRulesDataCopyWithImpl<$Res>
    implements _$PotatoRulesDataCopyWith<$Res> {
  __$PotatoRulesDataCopyWithImpl(this._self, this._then);

  final _PotatoRulesData _self;
  final $Res Function(_PotatoRulesData) _then;

/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gradeDropChance = null,Object? reviveFood = null,Object? upkeepEverySeconds = null,Object? weakPercent = null,Object? breedingGradeUpChance = null,Object? guards = null,Object? fridge = null,Object? harvestRareChance = null,Object? level = null,Object? combatStyles = null,}) {
  return _then(_PotatoRulesData(
gradeDropChance: null == gradeDropChance ? _self.gradeDropChance : gradeDropChance // ignore: cast_nullable_to_non_nullable
as double,reviveFood: null == reviveFood ? _self._reviveFood : reviveFood // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,upkeepEverySeconds: null == upkeepEverySeconds ? _self.upkeepEverySeconds : upkeepEverySeconds // ignore: cast_nullable_to_non_nullable
as int,weakPercent: null == weakPercent ? _self.weakPercent : weakPercent // ignore: cast_nullable_to_non_nullable
as int,breedingGradeUpChance: null == breedingGradeUpChance ? _self.breedingGradeUpChance : breedingGradeUpChance // ignore: cast_nullable_to_non_nullable
as double,guards: null == guards ? _self.guards : guards // ignore: cast_nullable_to_non_nullable
as GuardRulesData,fridge: null == fridge ? _self.fridge : fridge // ignore: cast_nullable_to_non_nullable
as FridgeRulesData,harvestRareChance: null == harvestRareChance ? _self.harvestRareChance : harvestRareChance // ignore: cast_nullable_to_non_nullable
as double,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as LevelRulesData,combatStyles: null == combatStyles ? _self._combatStyles : combatStyles // ignore: cast_nullable_to_non_nullable
as Map<CombatStyle, CombatStyleData>,
  ));
}

/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuardRulesDataCopyWith<$Res> get guards {
  
  return $GuardRulesDataCopyWith<$Res>(_self.guards, (value) {
    return _then(_self.copyWith(guards: value));
  });
}/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FridgeRulesDataCopyWith<$Res> get fridge {
  
  return $FridgeRulesDataCopyWith<$Res>(_self.fridge, (value) {
    return _then(_self.copyWith(fridge: value));
  });
}/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LevelRulesDataCopyWith<$Res> get level {
  
  return $LevelRulesDataCopyWith<$Res>(_self.level, (value) {
    return _then(_self.copyWith(level: value));
  });
}
}


/// @nodoc
mixin _$LevelRulesData {

 int get foodYieldPermille; int get gradeUpChancePermille; int get upkeepPermille;/// How much stronger a buff potato's abilities get.
 int get buffPowerPermille;
/// Create a copy of LevelRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LevelRulesDataCopyWith<LevelRulesData> get copyWith => _$LevelRulesDataCopyWithImpl<LevelRulesData>(this as LevelRulesData, _$identity);

  /// Serializes this LevelRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LevelRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LevelRulesData&&(identical(other.foodYieldPermille, _this.foodYieldPermille) || other.foodYieldPermille == _this.foodYieldPermille)&&(identical(other.gradeUpChancePermille, _this.gradeUpChancePermille) || other.gradeUpChancePermille == _this.gradeUpChancePermille)&&(identical(other.upkeepPermille, _this.upkeepPermille) || other.upkeepPermille == _this.upkeepPermille)&&(identical(other.buffPowerPermille, _this.buffPowerPermille) || other.buffPowerPermille == _this.buffPowerPermille));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LevelRulesData;
  return Object.hash(runtimeType,_this.foodYieldPermille,_this.gradeUpChancePermille,_this.upkeepPermille,_this.buffPowerPermille);
}

@override
String toString() {
  final _this = this as LevelRulesData;
  return 'LevelRulesData(foodYieldPermille: ${_this.foodYieldPermille}, gradeUpChancePermille: ${_this.gradeUpChancePermille}, upkeepPermille: ${_this.upkeepPermille}, buffPowerPermille: ${_this.buffPowerPermille})';
}


}

/// @nodoc
abstract mixin class $LevelRulesDataCopyWith<$Res>  {
  factory $LevelRulesDataCopyWith(LevelRulesData value, $Res Function(LevelRulesData) _then) = _$LevelRulesDataCopyWithImpl;
@useResult
$Res call({
 int foodYieldPermille, int gradeUpChancePermille, int upkeepPermille, int buffPowerPermille
});




}
/// @nodoc
class _$LevelRulesDataCopyWithImpl<$Res>
    implements $LevelRulesDataCopyWith<$Res> {
  _$LevelRulesDataCopyWithImpl(this._self, this._then);

  final LevelRulesData _self;
  final $Res Function(LevelRulesData) _then;

/// Create a copy of LevelRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodYieldPermille = null,Object? gradeUpChancePermille = null,Object? upkeepPermille = null,Object? buffPowerPermille = null,}) {
  return _then(LevelRulesData(
foodYieldPermille: null == foodYieldPermille ? _self.foodYieldPermille : foodYieldPermille // ignore: cast_nullable_to_non_nullable
as int,gradeUpChancePermille: null == gradeUpChancePermille ? _self.gradeUpChancePermille : gradeUpChancePermille // ignore: cast_nullable_to_non_nullable
as int,upkeepPermille: null == upkeepPermille ? _self.upkeepPermille : upkeepPermille // ignore: cast_nullable_to_non_nullable
as int,buffPowerPermille: null == buffPowerPermille ? _self.buffPowerPermille : buffPowerPermille // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LevelRulesData].
extension LevelRulesDataPatterns on LevelRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LevelRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LevelRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LevelRulesData value)  $default,){
final _that = this;
switch (_that) {
case _LevelRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LevelRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _LevelRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int foodYieldPermille,  int gradeUpChancePermille,  int upkeepPermille,  int buffPowerPermille)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LevelRulesData() when $default != null:
return $default(_that.foodYieldPermille,_that.gradeUpChancePermille,_that.upkeepPermille,_that.buffPowerPermille);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int foodYieldPermille,  int gradeUpChancePermille,  int upkeepPermille,  int buffPowerPermille)  $default,) {final _that = this;
switch (_that) {
case _LevelRulesData():
return $default(_that.foodYieldPermille,_that.gradeUpChancePermille,_that.upkeepPermille,_that.buffPowerPermille);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int foodYieldPermille,  int gradeUpChancePermille,  int upkeepPermille,  int buffPowerPermille)?  $default,) {final _that = this;
switch (_that) {
case _LevelRulesData() when $default != null:
return $default(_that.foodYieldPermille,_that.gradeUpChancePermille,_that.upkeepPermille,_that.buffPowerPermille);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LevelRulesData implements LevelRulesData {
  const _LevelRulesData({required this.foodYieldPermille, required this.gradeUpChancePermille, required this.upkeepPermille, required this.buffPowerPermille});
  factory _LevelRulesData.fromJson(Map<String, dynamic> json) => _$LevelRulesDataFromJson(json);

@override final  int foodYieldPermille;
@override final  int gradeUpChancePermille;
@override final  int upkeepPermille;
/// How much stronger a buff potato's abilities get.
@override final  int buffPowerPermille;

/// Create a copy of LevelRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LevelRulesDataCopyWith<_LevelRulesData> get copyWith => __$LevelRulesDataCopyWithImpl<_LevelRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LevelRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LevelRulesData&&(identical(other.foodYieldPermille, foodYieldPermille) || other.foodYieldPermille == foodYieldPermille)&&(identical(other.gradeUpChancePermille, gradeUpChancePermille) || other.gradeUpChancePermille == gradeUpChancePermille)&&(identical(other.upkeepPermille, upkeepPermille) || other.upkeepPermille == upkeepPermille)&&(identical(other.buffPowerPermille, buffPowerPermille) || other.buffPowerPermille == buffPowerPermille));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,foodYieldPermille,gradeUpChancePermille,upkeepPermille,buffPowerPermille);
}

@override
String toString() {
    return 'LevelRulesData(foodYieldPermille: $foodYieldPermille, gradeUpChancePermille: $gradeUpChancePermille, upkeepPermille: $upkeepPermille, buffPowerPermille: $buffPowerPermille)';
}


}

/// @nodoc
abstract mixin class _$LevelRulesDataCopyWith<$Res> implements $LevelRulesDataCopyWith<$Res> {
  factory _$LevelRulesDataCopyWith(_LevelRulesData value, $Res Function(_LevelRulesData) _then) = __$LevelRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int foodYieldPermille, int gradeUpChancePermille, int upkeepPermille, int buffPowerPermille
});




}
/// @nodoc
class __$LevelRulesDataCopyWithImpl<$Res>
    implements _$LevelRulesDataCopyWith<$Res> {
  __$LevelRulesDataCopyWithImpl(this._self, this._then);

  final _LevelRulesData _self;
  final $Res Function(_LevelRulesData) _then;

/// Create a copy of LevelRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodYieldPermille = null,Object? gradeUpChancePermille = null,Object? upkeepPermille = null,Object? buffPowerPermille = null,}) {
  return _then(_LevelRulesData(
foodYieldPermille: null == foodYieldPermille ? _self.foodYieldPermille : foodYieldPermille // ignore: cast_nullable_to_non_nullable
as int,gradeUpChancePermille: null == gradeUpChancePermille ? _self.gradeUpChancePermille : gradeUpChancePermille // ignore: cast_nullable_to_non_nullable
as int,upkeepPermille: null == upkeepPermille ? _self.upkeepPermille : upkeepPermille // ignore: cast_nullable_to_non_nullable
as int,buffPowerPermille: null == buffPowerPermille ? _self.buffPowerPermille : buffPowerPermille // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CombatStyleData {

/// Walking pace on the farm, in percent of the base.
 int get walkPercent;
/// Create a copy of CombatStyleData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CombatStyleDataCopyWith<CombatStyleData> get copyWith => _$CombatStyleDataCopyWithImpl<CombatStyleData>(this as CombatStyleData, _$identity);

  /// Serializes this CombatStyleData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CombatStyleData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CombatStyleData&&(identical(other.walkPercent, _this.walkPercent) || other.walkPercent == _this.walkPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CombatStyleData;
  return Object.hash(runtimeType,_this.walkPercent);
}

@override
String toString() {
  final _this = this as CombatStyleData;
  return 'CombatStyleData(walkPercent: ${_this.walkPercent})';
}


}

/// @nodoc
abstract mixin class $CombatStyleDataCopyWith<$Res>  {
  factory $CombatStyleDataCopyWith(CombatStyleData value, $Res Function(CombatStyleData) _then) = _$CombatStyleDataCopyWithImpl;
@useResult
$Res call({
 int walkPercent
});




}
/// @nodoc
class _$CombatStyleDataCopyWithImpl<$Res>
    implements $CombatStyleDataCopyWith<$Res> {
  _$CombatStyleDataCopyWithImpl(this._self, this._then);

  final CombatStyleData _self;
  final $Res Function(CombatStyleData) _then;

/// Create a copy of CombatStyleData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walkPercent = null,}) {
  return _then(CombatStyleData(
walkPercent: null == walkPercent ? _self.walkPercent : walkPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CombatStyleData].
extension CombatStyleDataPatterns on CombatStyleData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CombatStyleData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CombatStyleData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CombatStyleData value)  $default,){
final _that = this;
switch (_that) {
case _CombatStyleData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CombatStyleData value)?  $default,){
final _that = this;
switch (_that) {
case _CombatStyleData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int walkPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CombatStyleData() when $default != null:
return $default(_that.walkPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int walkPercent)  $default,) {final _that = this;
switch (_that) {
case _CombatStyleData():
return $default(_that.walkPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int walkPercent)?  $default,) {final _that = this;
switch (_that) {
case _CombatStyleData() when $default != null:
return $default(_that.walkPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CombatStyleData implements CombatStyleData {
  const _CombatStyleData({required this.walkPercent});
  factory _CombatStyleData.fromJson(Map<String, dynamic> json) => _$CombatStyleDataFromJson(json);

/// Walking pace on the farm, in percent of the base.
@override final  int walkPercent;

/// Create a copy of CombatStyleData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CombatStyleDataCopyWith<_CombatStyleData> get copyWith => __$CombatStyleDataCopyWithImpl<_CombatStyleData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CombatStyleDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CombatStyleData&&(identical(other.walkPercent, walkPercent) || other.walkPercent == walkPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,walkPercent);
}

@override
String toString() {
    return 'CombatStyleData(walkPercent: $walkPercent)';
}


}

/// @nodoc
abstract mixin class _$CombatStyleDataCopyWith<$Res> implements $CombatStyleDataCopyWith<$Res> {
  factory _$CombatStyleDataCopyWith(_CombatStyleData value, $Res Function(_CombatStyleData) _then) = __$CombatStyleDataCopyWithImpl;
@override @useResult
$Res call({
 int walkPercent
});




}
/// @nodoc
class __$CombatStyleDataCopyWithImpl<$Res>
    implements _$CombatStyleDataCopyWith<$Res> {
  __$CombatStyleDataCopyWithImpl(this._self, this._then);

  final _CombatStyleData _self;
  final $Res Function(_CombatStyleData) _then;

/// Create a copy of CombatStyleData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walkPercent = null,}) {
  return _then(_CombatStyleData(
walkPercent: null == walkPercent ? _self.walkPercent : walkPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GuardRulesData {

/// Game time to walk one tile.
 int get walkMillisPerTile;
/// Create a copy of GuardRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardRulesDataCopyWith<GuardRulesData> get copyWith => _$GuardRulesDataCopyWithImpl<GuardRulesData>(this as GuardRulesData, _$identity);

  /// Serializes this GuardRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GuardRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardRulesData&&(identical(other.walkMillisPerTile, _this.walkMillisPerTile) || other.walkMillisPerTile == _this.walkMillisPerTile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GuardRulesData;
  return Object.hash(runtimeType,_this.walkMillisPerTile);
}

@override
String toString() {
  final _this = this as GuardRulesData;
  return 'GuardRulesData(walkMillisPerTile: ${_this.walkMillisPerTile})';
}


}

/// @nodoc
abstract mixin class $GuardRulesDataCopyWith<$Res>  {
  factory $GuardRulesDataCopyWith(GuardRulesData value, $Res Function(GuardRulesData) _then) = _$GuardRulesDataCopyWithImpl;
@useResult
$Res call({
 int walkMillisPerTile
});




}
/// @nodoc
class _$GuardRulesDataCopyWithImpl<$Res>
    implements $GuardRulesDataCopyWith<$Res> {
  _$GuardRulesDataCopyWithImpl(this._self, this._then);

  final GuardRulesData _self;
  final $Res Function(GuardRulesData) _then;

/// Create a copy of GuardRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walkMillisPerTile = null,}) {
  return _then(GuardRulesData(
walkMillisPerTile: null == walkMillisPerTile ? _self.walkMillisPerTile : walkMillisPerTile // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GuardRulesData].
extension GuardRulesDataPatterns on GuardRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuardRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuardRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuardRulesData value)  $default,){
final _that = this;
switch (_that) {
case _GuardRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuardRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _GuardRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int walkMillisPerTile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardRulesData() when $default != null:
return $default(_that.walkMillisPerTile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int walkMillisPerTile)  $default,) {final _that = this;
switch (_that) {
case _GuardRulesData():
return $default(_that.walkMillisPerTile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int walkMillisPerTile)?  $default,) {final _that = this;
switch (_that) {
case _GuardRulesData() when $default != null:
return $default(_that.walkMillisPerTile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuardRulesData implements GuardRulesData {
  const _GuardRulesData({required this.walkMillisPerTile});
  factory _GuardRulesData.fromJson(Map<String, dynamic> json) => _$GuardRulesDataFromJson(json);

/// Game time to walk one tile.
@override final  int walkMillisPerTile;

/// Create a copy of GuardRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardRulesDataCopyWith<_GuardRulesData> get copyWith => __$GuardRulesDataCopyWithImpl<_GuardRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuardRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardRulesData&&(identical(other.walkMillisPerTile, walkMillisPerTile) || other.walkMillisPerTile == walkMillisPerTile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,walkMillisPerTile);
}

@override
String toString() {
    return 'GuardRulesData(walkMillisPerTile: $walkMillisPerTile)';
}


}

/// @nodoc
abstract mixin class _$GuardRulesDataCopyWith<$Res> implements $GuardRulesDataCopyWith<$Res> {
  factory _$GuardRulesDataCopyWith(_GuardRulesData value, $Res Function(_GuardRulesData) _then) = __$GuardRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int walkMillisPerTile
});




}
/// @nodoc
class __$GuardRulesDataCopyWithImpl<$Res>
    implements _$GuardRulesDataCopyWith<$Res> {
  __$GuardRulesDataCopyWithImpl(this._self, this._then);

  final _GuardRulesData _self;
  final $Res Function(_GuardRulesData) _then;

/// Create a copy of GuardRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walkMillisPerTile = null,}) {
  return _then(_GuardRulesData(
walkMillisPerTile: null == walkMillisPerTile ? _self.walkMillisPerTile : walkMillisPerTile // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FridgeRulesData {

/// Potatoes it holds. Companions coming home may go past it.
 int get size;/// How fast life runs out inside, in percent of normal.
 int get agingPercent;
/// Create a copy of FridgeRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FridgeRulesDataCopyWith<FridgeRulesData> get copyWith => _$FridgeRulesDataCopyWithImpl<FridgeRulesData>(this as FridgeRulesData, _$identity);

  /// Serializes this FridgeRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FridgeRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FridgeRulesData&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.agingPercent, _this.agingPercent) || other.agingPercent == _this.agingPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FridgeRulesData;
  return Object.hash(runtimeType,_this.size,_this.agingPercent);
}

@override
String toString() {
  final _this = this as FridgeRulesData;
  return 'FridgeRulesData(size: ${_this.size}, agingPercent: ${_this.agingPercent})';
}


}

/// @nodoc
abstract mixin class $FridgeRulesDataCopyWith<$Res>  {
  factory $FridgeRulesDataCopyWith(FridgeRulesData value, $Res Function(FridgeRulesData) _then) = _$FridgeRulesDataCopyWithImpl;
@useResult
$Res call({
 int size, int agingPercent
});




}
/// @nodoc
class _$FridgeRulesDataCopyWithImpl<$Res>
    implements $FridgeRulesDataCopyWith<$Res> {
  _$FridgeRulesDataCopyWithImpl(this._self, this._then);

  final FridgeRulesData _self;
  final $Res Function(FridgeRulesData) _then;

/// Create a copy of FridgeRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? agingPercent = null,}) {
  return _then(FridgeRulesData(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,agingPercent: null == agingPercent ? _self.agingPercent : agingPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FridgeRulesData].
extension FridgeRulesDataPatterns on FridgeRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FridgeRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FridgeRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FridgeRulesData value)  $default,){
final _that = this;
switch (_that) {
case _FridgeRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FridgeRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _FridgeRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  int agingPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FridgeRulesData() when $default != null:
return $default(_that.size,_that.agingPercent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  int agingPercent)  $default,) {final _that = this;
switch (_that) {
case _FridgeRulesData():
return $default(_that.size,_that.agingPercent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  int agingPercent)?  $default,) {final _that = this;
switch (_that) {
case _FridgeRulesData() when $default != null:
return $default(_that.size,_that.agingPercent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FridgeRulesData implements FridgeRulesData {
  const _FridgeRulesData({required this.size, required this.agingPercent});
  factory _FridgeRulesData.fromJson(Map<String, dynamic> json) => _$FridgeRulesDataFromJson(json);

/// Potatoes it holds. Companions coming home may go past it.
@override final  int size;
/// How fast life runs out inside, in percent of normal.
@override final  int agingPercent;

/// Create a copy of FridgeRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FridgeRulesDataCopyWith<_FridgeRulesData> get copyWith => __$FridgeRulesDataCopyWithImpl<_FridgeRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FridgeRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FridgeRulesData&&(identical(other.size, size) || other.size == size)&&(identical(other.agingPercent, agingPercent) || other.agingPercent == agingPercent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,size,agingPercent);
}

@override
String toString() {
    return 'FridgeRulesData(size: $size, agingPercent: $agingPercent)';
}


}

/// @nodoc
abstract mixin class _$FridgeRulesDataCopyWith<$Res> implements $FridgeRulesDataCopyWith<$Res> {
  factory _$FridgeRulesDataCopyWith(_FridgeRulesData value, $Res Function(_FridgeRulesData) _then) = __$FridgeRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int size, int agingPercent
});




}
/// @nodoc
class __$FridgeRulesDataCopyWithImpl<$Res>
    implements _$FridgeRulesDataCopyWith<$Res> {
  __$FridgeRulesDataCopyWithImpl(this._self, this._then);

  final _FridgeRulesData _self;
  final $Res Function(_FridgeRulesData) _then;

/// Create a copy of FridgeRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? agingPercent = null,}) {
  return _then(_FridgeRulesData(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,agingPercent: null == agingPercent ? _self.agingPercent : agingPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PestRulesData {

/// Game time between two rolls for new pests. A multiple of the farm
/// step.
 int get checkEverySeconds; BugRulesData get bug; BlightRulesData get blight;/// Taps in a row that clear a pest by hand.
 int get taps;/// What clearing a pest gives.
 PestRewardData get reward;
/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PestRulesDataCopyWith<PestRulesData> get copyWith => _$PestRulesDataCopyWithImpl<PestRulesData>(this as PestRulesData, _$identity);

  /// Serializes this PestRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PestRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PestRulesData&&(identical(other.checkEverySeconds, _this.checkEverySeconds) || other.checkEverySeconds == _this.checkEverySeconds)&&(identical(other.bug, _this.bug) || other.bug == _this.bug)&&(identical(other.blight, _this.blight) || other.blight == _this.blight)&&(identical(other.taps, _this.taps) || other.taps == _this.taps)&&(identical(other.reward, _this.reward) || other.reward == _this.reward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PestRulesData;
  return Object.hash(runtimeType,_this.checkEverySeconds,_this.bug,_this.blight,_this.taps,_this.reward);
}

@override
String toString() {
  final _this = this as PestRulesData;
  return 'PestRulesData(checkEverySeconds: ${_this.checkEverySeconds}, bug: ${_this.bug}, blight: ${_this.blight}, taps: ${_this.taps}, reward: ${_this.reward})';
}


}

/// @nodoc
abstract mixin class $PestRulesDataCopyWith<$Res>  {
  factory $PestRulesDataCopyWith(PestRulesData value, $Res Function(PestRulesData) _then) = _$PestRulesDataCopyWithImpl;
@useResult
$Res call({
 int checkEverySeconds, BugRulesData bug, BlightRulesData blight, int taps, PestRewardData reward
});


$BugRulesDataCopyWith<$Res> get bug;$BlightRulesDataCopyWith<$Res> get blight;$PestRewardDataCopyWith<$Res> get reward;

}
/// @nodoc
class _$PestRulesDataCopyWithImpl<$Res>
    implements $PestRulesDataCopyWith<$Res> {
  _$PestRulesDataCopyWithImpl(this._self, this._then);

  final PestRulesData _self;
  final $Res Function(PestRulesData) _then;

/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkEverySeconds = null,Object? bug = null,Object? blight = null,Object? taps = null,Object? reward = null,}) {
  return _then(PestRulesData(
checkEverySeconds: null == checkEverySeconds ? _self.checkEverySeconds : checkEverySeconds // ignore: cast_nullable_to_non_nullable
as int,bug: null == bug ? _self.bug : bug // ignore: cast_nullable_to_non_nullable
as BugRulesData,blight: null == blight ? _self.blight : blight // ignore: cast_nullable_to_non_nullable
as BlightRulesData,taps: null == taps ? _self.taps : taps // ignore: cast_nullable_to_non_nullable
as int,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as PestRewardData,
  ));
}
/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BugRulesDataCopyWith<$Res> get bug {
  
  return $BugRulesDataCopyWith<$Res>(_self.bug, (value) {
    return _then(_self.copyWith(bug: value));
  });
}/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlightRulesDataCopyWith<$Res> get blight {
  
  return $BlightRulesDataCopyWith<$Res>(_self.blight, (value) {
    return _then(_self.copyWith(blight: value));
  });
}/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestRewardDataCopyWith<$Res> get reward {
  
  return $PestRewardDataCopyWith<$Res>(_self.reward, (value) {
    return _then(_self.copyWith(reward: value));
  });
}
}


/// Adds pattern-matching-related methods to [PestRulesData].
extension PestRulesDataPatterns on PestRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PestRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PestRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PestRulesData value)  $default,){
final _that = this;
switch (_that) {
case _PestRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PestRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _PestRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int checkEverySeconds,  BugRulesData bug,  BlightRulesData blight,  int taps,  PestRewardData reward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PestRulesData() when $default != null:
return $default(_that.checkEverySeconds,_that.bug,_that.blight,_that.taps,_that.reward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int checkEverySeconds,  BugRulesData bug,  BlightRulesData blight,  int taps,  PestRewardData reward)  $default,) {final _that = this;
switch (_that) {
case _PestRulesData():
return $default(_that.checkEverySeconds,_that.bug,_that.blight,_that.taps,_that.reward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int checkEverySeconds,  BugRulesData bug,  BlightRulesData blight,  int taps,  PestRewardData reward)?  $default,) {final _that = this;
switch (_that) {
case _PestRulesData() when $default != null:
return $default(_that.checkEverySeconds,_that.bug,_that.blight,_that.taps,_that.reward);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PestRulesData implements PestRulesData {
  const _PestRulesData({required this.checkEverySeconds, required this.bug, required this.blight, required this.taps, required this.reward});
  factory _PestRulesData.fromJson(Map<String, dynamic> json) => _$PestRulesDataFromJson(json);

/// Game time between two rolls for new pests. A multiple of the farm
/// step.
@override final  int checkEverySeconds;
@override final  BugRulesData bug;
@override final  BlightRulesData blight;
/// Taps in a row that clear a pest by hand.
@override final  int taps;
/// What clearing a pest gives.
@override final  PestRewardData reward;

/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PestRulesDataCopyWith<_PestRulesData> get copyWith => __$PestRulesDataCopyWithImpl<_PestRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PestRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PestRulesData&&(identical(other.checkEverySeconds, checkEverySeconds) || other.checkEverySeconds == checkEverySeconds)&&(identical(other.bug, bug) || other.bug == bug)&&(identical(other.blight, blight) || other.blight == blight)&&(identical(other.taps, taps) || other.taps == taps)&&(identical(other.reward, reward) || other.reward == reward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,checkEverySeconds,bug,blight,taps,reward);
}

@override
String toString() {
    return 'PestRulesData(checkEverySeconds: $checkEverySeconds, bug: $bug, blight: $blight, taps: $taps, reward: $reward)';
}


}

/// @nodoc
abstract mixin class _$PestRulesDataCopyWith<$Res> implements $PestRulesDataCopyWith<$Res> {
  factory _$PestRulesDataCopyWith(_PestRulesData value, $Res Function(_PestRulesData) _then) = __$PestRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int checkEverySeconds, BugRulesData bug, BlightRulesData blight, int taps, PestRewardData reward
});


@override $BugRulesDataCopyWith<$Res> get bug;@override $BlightRulesDataCopyWith<$Res> get blight;@override $PestRewardDataCopyWith<$Res> get reward;

}
/// @nodoc
class __$PestRulesDataCopyWithImpl<$Res>
    implements _$PestRulesDataCopyWith<$Res> {
  __$PestRulesDataCopyWithImpl(this._self, this._then);

  final _PestRulesData _self;
  final $Res Function(_PestRulesData) _then;

/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkEverySeconds = null,Object? bug = null,Object? blight = null,Object? taps = null,Object? reward = null,}) {
  return _then(_PestRulesData(
checkEverySeconds: null == checkEverySeconds ? _self.checkEverySeconds : checkEverySeconds // ignore: cast_nullable_to_non_nullable
as int,bug: null == bug ? _self.bug : bug // ignore: cast_nullable_to_non_nullable
as BugRulesData,blight: null == blight ? _self.blight : blight // ignore: cast_nullable_to_non_nullable
as BlightRulesData,taps: null == taps ? _self.taps : taps // ignore: cast_nullable_to_non_nullable
as int,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as PestRewardData,
  ));
}

/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BugRulesDataCopyWith<$Res> get bug {
  
  return $BugRulesDataCopyWith<$Res>(_self.bug, (value) {
    return _then(_self.copyWith(bug: value));
  });
}/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BlightRulesDataCopyWith<$Res> get blight {
  
  return $BlightRulesDataCopyWith<$Res>(_self.blight, (value) {
    return _then(_self.copyWith(blight: value));
  });
}/// Create a copy of PestRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestRewardDataCopyWith<$Res> get reward {
  
  return $PestRewardDataCopyWith<$Res>(_self.reward, (value) {
    return _then(_self.copyWith(reward: value));
  });
}
}


/// @nodoc
mixin _$BugRulesData {

/// Chance per check for each stored baby potato in the field.
 double get chancePerStored;/// The chance never goes past this, however much is stored.
 double get chanceMax;/// Game time between two bites.
 int get eatEverySeconds;/// Baby potatoes eaten per bite.
 int get eatAmount;/// Game time one guard at full strength needs to clear it.
 int get clearSeconds;
/// Create a copy of BugRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BugRulesDataCopyWith<BugRulesData> get copyWith => _$BugRulesDataCopyWithImpl<BugRulesData>(this as BugRulesData, _$identity);

  /// Serializes this BugRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BugRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BugRulesData&&(identical(other.chancePerStored, _this.chancePerStored) || other.chancePerStored == _this.chancePerStored)&&(identical(other.chanceMax, _this.chanceMax) || other.chanceMax == _this.chanceMax)&&(identical(other.eatEverySeconds, _this.eatEverySeconds) || other.eatEverySeconds == _this.eatEverySeconds)&&(identical(other.eatAmount, _this.eatAmount) || other.eatAmount == _this.eatAmount)&&(identical(other.clearSeconds, _this.clearSeconds) || other.clearSeconds == _this.clearSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BugRulesData;
  return Object.hash(runtimeType,_this.chancePerStored,_this.chanceMax,_this.eatEverySeconds,_this.eatAmount,_this.clearSeconds);
}

@override
String toString() {
  final _this = this as BugRulesData;
  return 'BugRulesData(chancePerStored: ${_this.chancePerStored}, chanceMax: ${_this.chanceMax}, eatEverySeconds: ${_this.eatEverySeconds}, eatAmount: ${_this.eatAmount}, clearSeconds: ${_this.clearSeconds})';
}


}

/// @nodoc
abstract mixin class $BugRulesDataCopyWith<$Res>  {
  factory $BugRulesDataCopyWith(BugRulesData value, $Res Function(BugRulesData) _then) = _$BugRulesDataCopyWithImpl;
@useResult
$Res call({
 double chancePerStored, double chanceMax, int eatEverySeconds, int eatAmount, int clearSeconds
});




}
/// @nodoc
class _$BugRulesDataCopyWithImpl<$Res>
    implements $BugRulesDataCopyWith<$Res> {
  _$BugRulesDataCopyWithImpl(this._self, this._then);

  final BugRulesData _self;
  final $Res Function(BugRulesData) _then;

/// Create a copy of BugRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chancePerStored = null,Object? chanceMax = null,Object? eatEverySeconds = null,Object? eatAmount = null,Object? clearSeconds = null,}) {
  return _then(BugRulesData(
chancePerStored: null == chancePerStored ? _self.chancePerStored : chancePerStored // ignore: cast_nullable_to_non_nullable
as double,chanceMax: null == chanceMax ? _self.chanceMax : chanceMax // ignore: cast_nullable_to_non_nullable
as double,eatEverySeconds: null == eatEverySeconds ? _self.eatEverySeconds : eatEverySeconds // ignore: cast_nullable_to_non_nullable
as int,eatAmount: null == eatAmount ? _self.eatAmount : eatAmount // ignore: cast_nullable_to_non_nullable
as int,clearSeconds: null == clearSeconds ? _self.clearSeconds : clearSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BugRulesData].
extension BugRulesDataPatterns on BugRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BugRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BugRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BugRulesData value)  $default,){
final _that = this;
switch (_that) {
case _BugRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BugRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _BugRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double chancePerStored,  double chanceMax,  int eatEverySeconds,  int eatAmount,  int clearSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BugRulesData() when $default != null:
return $default(_that.chancePerStored,_that.chanceMax,_that.eatEverySeconds,_that.eatAmount,_that.clearSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double chancePerStored,  double chanceMax,  int eatEverySeconds,  int eatAmount,  int clearSeconds)  $default,) {final _that = this;
switch (_that) {
case _BugRulesData():
return $default(_that.chancePerStored,_that.chanceMax,_that.eatEverySeconds,_that.eatAmount,_that.clearSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double chancePerStored,  double chanceMax,  int eatEverySeconds,  int eatAmount,  int clearSeconds)?  $default,) {final _that = this;
switch (_that) {
case _BugRulesData() when $default != null:
return $default(_that.chancePerStored,_that.chanceMax,_that.eatEverySeconds,_that.eatAmount,_that.clearSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BugRulesData implements BugRulesData {
  const _BugRulesData({required this.chancePerStored, required this.chanceMax, required this.eatEverySeconds, required this.eatAmount, required this.clearSeconds});
  factory _BugRulesData.fromJson(Map<String, dynamic> json) => _$BugRulesDataFromJson(json);

/// Chance per check for each stored baby potato in the field.
@override final  double chancePerStored;
/// The chance never goes past this, however much is stored.
@override final  double chanceMax;
/// Game time between two bites.
@override final  int eatEverySeconds;
/// Baby potatoes eaten per bite.
@override final  int eatAmount;
/// Game time one guard at full strength needs to clear it.
@override final  int clearSeconds;

/// Create a copy of BugRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BugRulesDataCopyWith<_BugRulesData> get copyWith => __$BugRulesDataCopyWithImpl<_BugRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BugRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BugRulesData&&(identical(other.chancePerStored, chancePerStored) || other.chancePerStored == chancePerStored)&&(identical(other.chanceMax, chanceMax) || other.chanceMax == chanceMax)&&(identical(other.eatEverySeconds, eatEverySeconds) || other.eatEverySeconds == eatEverySeconds)&&(identical(other.eatAmount, eatAmount) || other.eatAmount == eatAmount)&&(identical(other.clearSeconds, clearSeconds) || other.clearSeconds == clearSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chancePerStored,chanceMax,eatEverySeconds,eatAmount,clearSeconds);
}

@override
String toString() {
    return 'BugRulesData(chancePerStored: $chancePerStored, chanceMax: $chanceMax, eatEverySeconds: $eatEverySeconds, eatAmount: $eatAmount, clearSeconds: $clearSeconds)';
}


}

/// @nodoc
abstract mixin class _$BugRulesDataCopyWith<$Res> implements $BugRulesDataCopyWith<$Res> {
  factory _$BugRulesDataCopyWith(_BugRulesData value, $Res Function(_BugRulesData) _then) = __$BugRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double chancePerStored, double chanceMax, int eatEverySeconds, int eatAmount, int clearSeconds
});




}
/// @nodoc
class __$BugRulesDataCopyWithImpl<$Res>
    implements _$BugRulesDataCopyWith<$Res> {
  __$BugRulesDataCopyWithImpl(this._self, this._then);

  final _BugRulesData _self;
  final $Res Function(_BugRulesData) _then;

/// Create a copy of BugRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chancePerStored = null,Object? chanceMax = null,Object? eatEverySeconds = null,Object? eatAmount = null,Object? clearSeconds = null,}) {
  return _then(_BugRulesData(
chancePerStored: null == chancePerStored ? _self.chancePerStored : chancePerStored // ignore: cast_nullable_to_non_nullable
as double,chanceMax: null == chanceMax ? _self.chanceMax : chanceMax // ignore: cast_nullable_to_non_nullable
as double,eatEverySeconds: null == eatEverySeconds ? _self.eatEverySeconds : eatEverySeconds // ignore: cast_nullable_to_non_nullable
as int,eatAmount: null == eatAmount ? _self.eatAmount : eatAmount // ignore: cast_nullable_to_non_nullable
as int,clearSeconds: null == clearSeconds ? _self.clearSeconds : clearSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BlightRulesData {

/// Chance per check for a field with at least one potato.
 double get chance;/// Extra life used, in percent of the time passing: 100 doubles aging.
 int get extraAgingPercent;/// Game time one guard at full strength needs to clear it.
 int get clearSeconds;
/// Create a copy of BlightRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlightRulesDataCopyWith<BlightRulesData> get copyWith => _$BlightRulesDataCopyWithImpl<BlightRulesData>(this as BlightRulesData, _$identity);

  /// Serializes this BlightRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BlightRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlightRulesData&&(identical(other.chance, _this.chance) || other.chance == _this.chance)&&(identical(other.extraAgingPercent, _this.extraAgingPercent) || other.extraAgingPercent == _this.extraAgingPercent)&&(identical(other.clearSeconds, _this.clearSeconds) || other.clearSeconds == _this.clearSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BlightRulesData;
  return Object.hash(runtimeType,_this.chance,_this.extraAgingPercent,_this.clearSeconds);
}

@override
String toString() {
  final _this = this as BlightRulesData;
  return 'BlightRulesData(chance: ${_this.chance}, extraAgingPercent: ${_this.extraAgingPercent}, clearSeconds: ${_this.clearSeconds})';
}


}

/// @nodoc
abstract mixin class $BlightRulesDataCopyWith<$Res>  {
  factory $BlightRulesDataCopyWith(BlightRulesData value, $Res Function(BlightRulesData) _then) = _$BlightRulesDataCopyWithImpl;
@useResult
$Res call({
 double chance, int extraAgingPercent, int clearSeconds
});




}
/// @nodoc
class _$BlightRulesDataCopyWithImpl<$Res>
    implements $BlightRulesDataCopyWith<$Res> {
  _$BlightRulesDataCopyWithImpl(this._self, this._then);

  final BlightRulesData _self;
  final $Res Function(BlightRulesData) _then;

/// Create a copy of BlightRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chance = null,Object? extraAgingPercent = null,Object? clearSeconds = null,}) {
  return _then(BlightRulesData(
chance: null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,extraAgingPercent: null == extraAgingPercent ? _self.extraAgingPercent : extraAgingPercent // ignore: cast_nullable_to_non_nullable
as int,clearSeconds: null == clearSeconds ? _self.clearSeconds : clearSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlightRulesData].
extension BlightRulesDataPatterns on BlightRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlightRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlightRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlightRulesData value)  $default,){
final _that = this;
switch (_that) {
case _BlightRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlightRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _BlightRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double chance,  int extraAgingPercent,  int clearSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlightRulesData() when $default != null:
return $default(_that.chance,_that.extraAgingPercent,_that.clearSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double chance,  int extraAgingPercent,  int clearSeconds)  $default,) {final _that = this;
switch (_that) {
case _BlightRulesData():
return $default(_that.chance,_that.extraAgingPercent,_that.clearSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double chance,  int extraAgingPercent,  int clearSeconds)?  $default,) {final _that = this;
switch (_that) {
case _BlightRulesData() when $default != null:
return $default(_that.chance,_that.extraAgingPercent,_that.clearSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlightRulesData implements BlightRulesData {
  const _BlightRulesData({required this.chance, required this.extraAgingPercent, required this.clearSeconds});
  factory _BlightRulesData.fromJson(Map<String, dynamic> json) => _$BlightRulesDataFromJson(json);

/// Chance per check for a field with at least one potato.
@override final  double chance;
/// Extra life used, in percent of the time passing: 100 doubles aging.
@override final  int extraAgingPercent;
/// Game time one guard at full strength needs to clear it.
@override final  int clearSeconds;

/// Create a copy of BlightRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlightRulesDataCopyWith<_BlightRulesData> get copyWith => __$BlightRulesDataCopyWithImpl<_BlightRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlightRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlightRulesData&&(identical(other.chance, chance) || other.chance == chance)&&(identical(other.extraAgingPercent, extraAgingPercent) || other.extraAgingPercent == extraAgingPercent)&&(identical(other.clearSeconds, clearSeconds) || other.clearSeconds == clearSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chance,extraAgingPercent,clearSeconds);
}

@override
String toString() {
    return 'BlightRulesData(chance: $chance, extraAgingPercent: $extraAgingPercent, clearSeconds: $clearSeconds)';
}


}

/// @nodoc
abstract mixin class _$BlightRulesDataCopyWith<$Res> implements $BlightRulesDataCopyWith<$Res> {
  factory _$BlightRulesDataCopyWith(_BlightRulesData value, $Res Function(_BlightRulesData) _then) = __$BlightRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double chance, int extraAgingPercent, int clearSeconds
});




}
/// @nodoc
class __$BlightRulesDataCopyWithImpl<$Res>
    implements _$BlightRulesDataCopyWith<$Res> {
  __$BlightRulesDataCopyWithImpl(this._self, this._then);

  final _BlightRulesData _self;
  final $Res Function(_BlightRulesData) _then;

/// Create a copy of BlightRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chance = null,Object? extraAgingPercent = null,Object? clearSeconds = null,}) {
  return _then(_BlightRulesData(
chance: null == chance ? _self.chance : chance // ignore: cast_nullable_to_non_nullable
as double,extraAgingPercent: null == extraAgingPercent ? _self.extraAgingPercent : extraAgingPercent // ignore: cast_nullable_to_non_nullable
as int,clearSeconds: null == clearSeconds ? _self.clearSeconds : clearSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PestRewardData {

 int get foodMin; int get foodMax;/// Chance of a normal seed of the type most planted in the field.
 double get seedChance;
/// Create a copy of PestRewardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PestRewardDataCopyWith<PestRewardData> get copyWith => _$PestRewardDataCopyWithImpl<PestRewardData>(this as PestRewardData, _$identity);

  /// Serializes this PestRewardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PestRewardData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PestRewardData&&(identical(other.foodMin, _this.foodMin) || other.foodMin == _this.foodMin)&&(identical(other.foodMax, _this.foodMax) || other.foodMax == _this.foodMax)&&(identical(other.seedChance, _this.seedChance) || other.seedChance == _this.seedChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PestRewardData;
  return Object.hash(runtimeType,_this.foodMin,_this.foodMax,_this.seedChance);
}

@override
String toString() {
  final _this = this as PestRewardData;
  return 'PestRewardData(foodMin: ${_this.foodMin}, foodMax: ${_this.foodMax}, seedChance: ${_this.seedChance})';
}


}

/// @nodoc
abstract mixin class $PestRewardDataCopyWith<$Res>  {
  factory $PestRewardDataCopyWith(PestRewardData value, $Res Function(PestRewardData) _then) = _$PestRewardDataCopyWithImpl;
@useResult
$Res call({
 int foodMin, int foodMax, double seedChance
});




}
/// @nodoc
class _$PestRewardDataCopyWithImpl<$Res>
    implements $PestRewardDataCopyWith<$Res> {
  _$PestRewardDataCopyWithImpl(this._self, this._then);

  final PestRewardData _self;
  final $Res Function(PestRewardData) _then;

/// Create a copy of PestRewardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodMin = null,Object? foodMax = null,Object? seedChance = null,}) {
  return _then(PestRewardData(
foodMin: null == foodMin ? _self.foodMin : foodMin // ignore: cast_nullable_to_non_nullable
as int,foodMax: null == foodMax ? _self.foodMax : foodMax // ignore: cast_nullable_to_non_nullable
as int,seedChance: null == seedChance ? _self.seedChance : seedChance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PestRewardData].
extension PestRewardDataPatterns on PestRewardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PestRewardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PestRewardData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PestRewardData value)  $default,){
final _that = this;
switch (_that) {
case _PestRewardData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PestRewardData value)?  $default,){
final _that = this;
switch (_that) {
case _PestRewardData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int foodMin,  int foodMax,  double seedChance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PestRewardData() when $default != null:
return $default(_that.foodMin,_that.foodMax,_that.seedChance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int foodMin,  int foodMax,  double seedChance)  $default,) {final _that = this;
switch (_that) {
case _PestRewardData():
return $default(_that.foodMin,_that.foodMax,_that.seedChance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int foodMin,  int foodMax,  double seedChance)?  $default,) {final _that = this;
switch (_that) {
case _PestRewardData() when $default != null:
return $default(_that.foodMin,_that.foodMax,_that.seedChance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PestRewardData implements PestRewardData {
  const _PestRewardData({required this.foodMin, required this.foodMax, required this.seedChance});
  factory _PestRewardData.fromJson(Map<String, dynamic> json) => _$PestRewardDataFromJson(json);

@override final  int foodMin;
@override final  int foodMax;
/// Chance of a normal seed of the type most planted in the field.
@override final  double seedChance;

/// Create a copy of PestRewardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PestRewardDataCopyWith<_PestRewardData> get copyWith => __$PestRewardDataCopyWithImpl<_PestRewardData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PestRewardDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PestRewardData&&(identical(other.foodMin, foodMin) || other.foodMin == foodMin)&&(identical(other.foodMax, foodMax) || other.foodMax == foodMax)&&(identical(other.seedChance, seedChance) || other.seedChance == seedChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,foodMin,foodMax,seedChance);
}

@override
String toString() {
    return 'PestRewardData(foodMin: $foodMin, foodMax: $foodMax, seedChance: $seedChance)';
}


}

/// @nodoc
abstract mixin class _$PestRewardDataCopyWith<$Res> implements $PestRewardDataCopyWith<$Res> {
  factory _$PestRewardDataCopyWith(_PestRewardData value, $Res Function(_PestRewardData) _then) = __$PestRewardDataCopyWithImpl;
@override @useResult
$Res call({
 int foodMin, int foodMax, double seedChance
});




}
/// @nodoc
class __$PestRewardDataCopyWithImpl<$Res>
    implements _$PestRewardDataCopyWith<$Res> {
  __$PestRewardDataCopyWithImpl(this._self, this._then);

  final _PestRewardData _self;
  final $Res Function(_PestRewardData) _then;

/// Create a copy of PestRewardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodMin = null,Object? foodMax = null,Object? seedChance = null,}) {
  return _then(_PestRewardData(
foodMin: null == foodMin ? _self.foodMin : foodMin // ignore: cast_nullable_to_non_nullable
as int,foodMax: null == foodMax ? _self.foodMax : foodMax // ignore: cast_nullable_to_non_nullable
as int,seedChance: null == seedChance ? _self.seedChance : seedChance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$NewFarmData {

/// Baby potatoes.
 int get food; List<TileRect> get fields; List<SeedStackData> get seeds;
/// Create a copy of NewFarmData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewFarmDataCopyWith<NewFarmData> get copyWith => _$NewFarmDataCopyWithImpl<NewFarmData>(this as NewFarmData, _$identity);

  /// Serializes this NewFarmData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NewFarmData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewFarmData&&(identical(other.food, _this.food) || other.food == _this.food)&&const DeepCollectionEquality().equals(other.fields, _this.fields)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NewFarmData;
  return Object.hash(runtimeType,_this.food,const DeepCollectionEquality().hash(_this.fields),const DeepCollectionEquality().hash(_this.seeds));
}

@override
String toString() {
  final _this = this as NewFarmData;
  return 'NewFarmData(food: ${_this.food}, fields: ${_this.fields}, seeds: ${_this.seeds})';
}


}

/// @nodoc
abstract mixin class $NewFarmDataCopyWith<$Res>  {
  factory $NewFarmDataCopyWith(NewFarmData value, $Res Function(NewFarmData) _then) = _$NewFarmDataCopyWithImpl;
@useResult
$Res call({
 int food, List<TileRect> fields, List<SeedStackData> seeds
});




}
/// @nodoc
class _$NewFarmDataCopyWithImpl<$Res>
    implements $NewFarmDataCopyWith<$Res> {
  _$NewFarmDataCopyWithImpl(this._self, this._then);

  final NewFarmData _self;
  final $Res Function(NewFarmData) _then;

/// Create a copy of NewFarmData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? food = null,Object? fields = null,Object? seeds = null,}) {
  return _then(NewFarmData(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<TileRect>,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewFarmData].
extension NewFarmDataPatterns on NewFarmData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewFarmData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewFarmData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewFarmData value)  $default,){
final _that = this;
switch (_that) {
case _NewFarmData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewFarmData value)?  $default,){
final _that = this;
switch (_that) {
case _NewFarmData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int food,  List<TileRect> fields,  List<SeedStackData> seeds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewFarmData() when $default != null:
return $default(_that.food,_that.fields,_that.seeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int food,  List<TileRect> fields,  List<SeedStackData> seeds)  $default,) {final _that = this;
switch (_that) {
case _NewFarmData():
return $default(_that.food,_that.fields,_that.seeds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int food,  List<TileRect> fields,  List<SeedStackData> seeds)?  $default,) {final _that = this;
switch (_that) {
case _NewFarmData() when $default != null:
return $default(_that.food,_that.fields,_that.seeds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewFarmData implements NewFarmData {
  const _NewFarmData({required this.food, required  List<TileRect> fields, required  List<SeedStackData> seeds}): _fields = fields,_seeds = seeds;
  factory _NewFarmData.fromJson(Map<String, dynamic> json) => _$NewFarmDataFromJson(json);

/// Baby potatoes.
@override final  int food;
 final  List<TileRect> _fields;
@override List<TileRect> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

 final  List<SeedStackData> _seeds;
@override List<SeedStackData> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


/// Create a copy of NewFarmData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewFarmDataCopyWith<_NewFarmData> get copyWith => __$NewFarmDataCopyWithImpl<_NewFarmData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewFarmDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewFarmData&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.fields, _fields)&&const DeepCollectionEquality().equals(other.seeds, _seeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_fields),const DeepCollectionEquality().hash(_seeds));
}

@override
String toString() {
    return 'NewFarmData(food: $food, fields: $fields, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class _$NewFarmDataCopyWith<$Res> implements $NewFarmDataCopyWith<$Res> {
  factory _$NewFarmDataCopyWith(_NewFarmData value, $Res Function(_NewFarmData) _then) = __$NewFarmDataCopyWithImpl;
@override @useResult
$Res call({
 int food, List<TileRect> fields, List<SeedStackData> seeds
});




}
/// @nodoc
class __$NewFarmDataCopyWithImpl<$Res>
    implements _$NewFarmDataCopyWith<$Res> {
  __$NewFarmDataCopyWithImpl(this._self, this._then);

  final _NewFarmData _self;
  final $Res Function(_NewFarmData) _then;

/// Create a copy of NewFarmData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? food = null,Object? fields = null,Object? seeds = null,}) {
  return _then(_NewFarmData(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<TileRect>,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,
  ));
}


}


/// @nodoc
mixin _$SeedStackData {

 PotatoType get type; Grade get grade; int get count; int get level;/// A fixed first ability (an id in the type's own pool), instead of one
/// rolled by hidden rarity.
 String? get ability;/// A fixed combat style, instead of a random one. Combat seeds only.
 CombatStyle? get style;
/// Create a copy of SeedStackData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedStackDataCopyWith<SeedStackData> get copyWith => _$SeedStackDataCopyWithImpl<SeedStackData>(this as SeedStackData, _$identity);

  /// Serializes this SeedStackData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SeedStackData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedStackData&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.ability, _this.ability) || other.ability == _this.ability)&&(identical(other.style, _this.style) || other.style == _this.style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeedStackData;
  return Object.hash(runtimeType,_this.type,_this.grade,_this.count,_this.level,_this.ability,_this.style);
}

@override
String toString() {
  final _this = this as SeedStackData;
  return 'SeedStackData(type: ${_this.type}, grade: ${_this.grade}, count: ${_this.count}, level: ${_this.level}, ability: ${_this.ability}, style: ${_this.style})';
}


}

/// @nodoc
abstract mixin class $SeedStackDataCopyWith<$Res>  {
  factory $SeedStackDataCopyWith(SeedStackData value, $Res Function(SeedStackData) _then) = _$SeedStackDataCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade, int count, int level, String? ability, CombatStyle? style
});




}
/// @nodoc
class _$SeedStackDataCopyWithImpl<$Res>
    implements $SeedStackDataCopyWith<$Res> {
  _$SeedStackDataCopyWithImpl(this._self, this._then);

  final SeedStackData _self;
  final $Res Function(SeedStackData) _then;

/// Create a copy of SeedStackData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,Object? count = null,Object? level = null,Object? ability = freezed,Object? style = freezed,}) {
  return _then(SeedStackData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ability: freezed == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedStackData].
extension SeedStackDataPatterns on SeedStackData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedStackData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedStackData value)  $default,){
final _that = this;
switch (_that) {
case _SeedStackData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedStackData value)?  $default,){
final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int count,  int level,  String? ability,  CombatStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
return $default(_that.type,_that.grade,_that.count,_that.level,_that.ability,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int count,  int level,  String? ability,  CombatStyle? style)  $default,) {final _that = this;
switch (_that) {
case _SeedStackData():
return $default(_that.type,_that.grade,_that.count,_that.level,_that.ability,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  Grade grade,  int count,  int level,  String? ability,  CombatStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
return $default(_that.type,_that.grade,_that.count,_that.level,_that.ability,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeedStackData implements SeedStackData {
  const _SeedStackData({required this.type, required this.grade, required this.count, required this.level, this.ability, this.style});
  factory _SeedStackData.fromJson(Map<String, dynamic> json) => _$SeedStackDataFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;
@override final  int count;
@override final  int level;
/// A fixed first ability (an id in the type's own pool), instead of one
/// rolled by hidden rarity.
@override final  String? ability;
/// A fixed combat style, instead of a random one. Combat seeds only.
@override final  CombatStyle? style;

/// Create a copy of SeedStackData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedStackDataCopyWith<_SeedStackData> get copyWith => __$SeedStackDataCopyWithImpl<_SeedStackData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedStackDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedStackData&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.count, count) || other.count == count)&&(identical(other.level, level) || other.level == level)&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade,count,level,ability,style);
}

@override
String toString() {
    return 'SeedStackData(type: $type, grade: $grade, count: $count, level: $level, ability: $ability, style: $style)';
}


}

/// @nodoc
abstract mixin class _$SeedStackDataCopyWith<$Res> implements $SeedStackDataCopyWith<$Res> {
  factory _$SeedStackDataCopyWith(_SeedStackData value, $Res Function(_SeedStackData) _then) = __$SeedStackDataCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade, int count, int level, String? ability, CombatStyle? style
});




}
/// @nodoc
class __$SeedStackDataCopyWithImpl<$Res>
    implements _$SeedStackDataCopyWith<$Res> {
  __$SeedStackDataCopyWithImpl(this._self, this._then);

  final _SeedStackData _self;
  final $Res Function(_SeedStackData) _then;

/// Create a copy of SeedStackData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,Object? count = null,Object? level = null,Object? ability = freezed,Object? style = freezed,}) {
  return _then(_SeedStackData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ability: freezed == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
  ));
}


}

// dart format on
