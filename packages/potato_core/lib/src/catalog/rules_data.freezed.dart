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

 FarmRulesData get farm; PotatoRulesData get potatoes; NewFarmData get newFarm; RaidRulesData get raid;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RulesData&&(identical(other.farm, _this.farm) || other.farm == _this.farm)&&(identical(other.potatoes, _this.potatoes) || other.potatoes == _this.potatoes)&&(identical(other.newFarm, _this.newFarm) || other.newFarm == _this.newFarm)&&(identical(other.raid, _this.raid) || other.raid == _this.raid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RulesData;
  return Object.hash(runtimeType,_this.farm,_this.potatoes,_this.newFarm,_this.raid);
}

@override
String toString() {
  final _this = this as RulesData;
  return 'RulesData(farm: ${_this.farm}, potatoes: ${_this.potatoes}, newFarm: ${_this.newFarm}, raid: ${_this.raid})';
}


}

/// @nodoc
abstract mixin class $RulesDataCopyWith<$Res>  {
  factory $RulesDataCopyWith(RulesData value, $Res Function(RulesData) _then) = _$RulesDataCopyWithImpl;
@useResult
$Res call({
 FarmRulesData farm, PotatoRulesData potatoes, NewFarmData newFarm, RaidRulesData raid
});


$FarmRulesDataCopyWith<$Res> get farm;$PotatoRulesDataCopyWith<$Res> get potatoes;$NewFarmDataCopyWith<$Res> get newFarm;$RaidRulesDataCopyWith<$Res> get raid;

}
/// @nodoc
class _$RulesDataCopyWithImpl<$Res>
    implements $RulesDataCopyWith<$Res> {
  _$RulesDataCopyWithImpl(this._self, this._then);

  final RulesData _self;
  final $Res Function(RulesData) _then;

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? farm = null,Object? potatoes = null,Object? newFarm = null,Object? raid = null,}) {
  return _then(RulesData(
farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as FarmRulesData,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as PotatoRulesData,newFarm: null == newFarm ? _self.newFarm : newFarm // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FarmRulesData farm,  PotatoRulesData potatoes,  NewFarmData newFarm,  RaidRulesData raid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RulesData() when $default != null:
return $default(_that.farm,_that.potatoes,_that.newFarm,_that.raid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FarmRulesData farm,  PotatoRulesData potatoes,  NewFarmData newFarm,  RaidRulesData raid)  $default,) {final _that = this;
switch (_that) {
case _RulesData():
return $default(_that.farm,_that.potatoes,_that.newFarm,_that.raid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FarmRulesData farm,  PotatoRulesData potatoes,  NewFarmData newFarm,  RaidRulesData raid)?  $default,) {final _that = this;
switch (_that) {
case _RulesData() when $default != null:
return $default(_that.farm,_that.potatoes,_that.newFarm,_that.raid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RulesData implements RulesData {
  const _RulesData({required this.farm, required this.potatoes, required this.newFarm, required this.raid});
  factory _RulesData.fromJson(Map<String, dynamic> json) => _$RulesDataFromJson(json);

@override final  FarmRulesData farm;
@override final  PotatoRulesData potatoes;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RulesData&&(identical(other.farm, farm) || other.farm == farm)&&(identical(other.potatoes, potatoes) || other.potatoes == potatoes)&&(identical(other.newFarm, newFarm) || other.newFarm == newFarm)&&(identical(other.raid, raid) || other.raid == raid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,farm,potatoes,newFarm,raid);
}

@override
String toString() {
    return 'RulesData(farm: $farm, potatoes: $potatoes, newFarm: $newFarm, raid: $raid)';
}


}

/// @nodoc
abstract mixin class _$RulesDataCopyWith<$Res> implements $RulesDataCopyWith<$Res> {
  factory _$RulesDataCopyWith(_RulesData value, $Res Function(_RulesData) _then) = __$RulesDataCopyWithImpl;
@override @useResult
$Res call({
 FarmRulesData farm, PotatoRulesData potatoes, NewFarmData newFarm, RaidRulesData raid
});


@override $FarmRulesDataCopyWith<$Res> get farm;@override $PotatoRulesDataCopyWith<$Res> get potatoes;@override $NewFarmDataCopyWith<$Res> get newFarm;@override $RaidRulesDataCopyWith<$Res> get raid;

}
/// @nodoc
class __$RulesDataCopyWithImpl<$Res>
    implements _$RulesDataCopyWith<$Res> {
  __$RulesDataCopyWithImpl(this._self, this._then);

  final _RulesData _self;
  final $Res Function(_RulesData) _then;

/// Create a copy of RulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? farm = null,Object? potatoes = null,Object? newFarm = null,Object? raid = null,}) {
  return _then(_RulesData(
farm: null == farm ? _self.farm : farm // ignore: cast_nullable_to_non_nullable
as FarmRulesData,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as PotatoRulesData,newFarm: null == newFarm ? _self.newFarm : newFarm // ignore: cast_nullable_to_non_nullable
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
 int get fieldMaxSize;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmRulesData&&(identical(other.stepMillis, _this.stepMillis) || other.stepMillis == _this.stepMillis)&&(identical(other.offlineCapMinutes, _this.offlineCapMinutes) || other.offlineCapMinutes == _this.offlineCapMinutes)&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.fieldMaxSize, _this.fieldMaxSize) || other.fieldMaxSize == _this.fieldMaxSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmRulesData;
  return Object.hash(runtimeType,_this.stepMillis,_this.offlineCapMinutes,_this.size,_this.fieldMaxSize);
}

@override
String toString() {
  final _this = this as FarmRulesData;
  return 'FarmRulesData(stepMillis: ${_this.stepMillis}, offlineCapMinutes: ${_this.offlineCapMinutes}, size: ${_this.size}, fieldMaxSize: ${_this.fieldMaxSize})';
}


}

/// @nodoc
abstract mixin class $FarmRulesDataCopyWith<$Res>  {
  factory $FarmRulesDataCopyWith(FarmRulesData value, $Res Function(FarmRulesData) _then) = _$FarmRulesDataCopyWithImpl;
@useResult
$Res call({
 int stepMillis, int offlineCapMinutes, int size, int fieldMaxSize
});




}
/// @nodoc
class _$FarmRulesDataCopyWithImpl<$Res>
    implements $FarmRulesDataCopyWith<$Res> {
  _$FarmRulesDataCopyWithImpl(this._self, this._then);

  final FarmRulesData _self;
  final $Res Function(FarmRulesData) _then;

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepMillis = null,Object? offlineCapMinutes = null,Object? size = null,Object? fieldMaxSize = null,}) {
  return _then(FarmRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,offlineCapMinutes: null == offlineCapMinutes ? _self.offlineCapMinutes : offlineCapMinutes // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,fieldMaxSize: null == fieldMaxSize ? _self.fieldMaxSize : fieldMaxSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize)  $default,) {final _that = this;
switch (_that) {
case _FarmRulesData():
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepMillis,  int offlineCapMinutes,  int size,  int fieldMaxSize)?  $default,) {final _that = this;
switch (_that) {
case _FarmRulesData() when $default != null:
return $default(_that.stepMillis,_that.offlineCapMinutes,_that.size,_that.fieldMaxSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FarmRulesData extends FarmRulesData {
  const _FarmRulesData({required this.stepMillis, required this.offlineCapMinutes, required this.size, required this.fieldMaxSize}): super._();
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmRulesData&&(identical(other.stepMillis, stepMillis) || other.stepMillis == stepMillis)&&(identical(other.offlineCapMinutes, offlineCapMinutes) || other.offlineCapMinutes == offlineCapMinutes)&&(identical(other.size, size) || other.size == size)&&(identical(other.fieldMaxSize, fieldMaxSize) || other.fieldMaxSize == fieldMaxSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stepMillis,offlineCapMinutes,size,fieldMaxSize);
}

@override
String toString() {
    return 'FarmRulesData(stepMillis: $stepMillis, offlineCapMinutes: $offlineCapMinutes, size: $size, fieldMaxSize: $fieldMaxSize)';
}


}

/// @nodoc
abstract mixin class _$FarmRulesDataCopyWith<$Res> implements $FarmRulesDataCopyWith<$Res> {
  factory _$FarmRulesDataCopyWith(_FarmRulesData value, $Res Function(_FarmRulesData) _then) = __$FarmRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int stepMillis, int offlineCapMinutes, int size, int fieldMaxSize
});




}
/// @nodoc
class __$FarmRulesDataCopyWithImpl<$Res>
    implements _$FarmRulesDataCopyWith<$Res> {
  __$FarmRulesDataCopyWithImpl(this._self, this._then);

  final _FarmRulesData _self;
  final $Res Function(_FarmRulesData) _then;

/// Create a copy of FarmRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepMillis = null,Object? offlineCapMinutes = null,Object? size = null,Object? fieldMaxSize = null,}) {
  return _then(_FarmRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,offlineCapMinutes: null == offlineCapMinutes ? _self.offlineCapMinutes : offlineCapMinutes // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,fieldMaxSize: null == fieldMaxSize ? _self.fieldMaxSize : fieldMaxSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PotatoRulesData {

/// Chance that the seed a dead potato leaves is one grade lower.
 double get gradeDropChance;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoRulesData&&(identical(other.gradeDropChance, _this.gradeDropChance) || other.gradeDropChance == _this.gradeDropChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoRulesData;
  return Object.hash(runtimeType,_this.gradeDropChance);
}

@override
String toString() {
  final _this = this as PotatoRulesData;
  return 'PotatoRulesData(gradeDropChance: ${_this.gradeDropChance})';
}


}

/// @nodoc
abstract mixin class $PotatoRulesDataCopyWith<$Res>  {
  factory $PotatoRulesDataCopyWith(PotatoRulesData value, $Res Function(PotatoRulesData) _then) = _$PotatoRulesDataCopyWithImpl;
@useResult
$Res call({
 double gradeDropChance
});




}
/// @nodoc
class _$PotatoRulesDataCopyWithImpl<$Res>
    implements $PotatoRulesDataCopyWith<$Res> {
  _$PotatoRulesDataCopyWithImpl(this._self, this._then);

  final PotatoRulesData _self;
  final $Res Function(PotatoRulesData) _then;

/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gradeDropChance = null,}) {
  return _then(PotatoRulesData(
gradeDropChance: null == gradeDropChance ? _self.gradeDropChance : gradeDropChance // ignore: cast_nullable_to_non_nullable
as double,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double gradeDropChance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
return $default(_that.gradeDropChance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double gradeDropChance)  $default,) {final _that = this;
switch (_that) {
case _PotatoRulesData():
return $default(_that.gradeDropChance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double gradeDropChance)?  $default,) {final _that = this;
switch (_that) {
case _PotatoRulesData() when $default != null:
return $default(_that.gradeDropChance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoRulesData implements PotatoRulesData {
  const _PotatoRulesData({required this.gradeDropChance});
  factory _PotatoRulesData.fromJson(Map<String, dynamic> json) => _$PotatoRulesDataFromJson(json);

/// Chance that the seed a dead potato leaves is one grade lower.
@override final  double gradeDropChance;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoRulesData&&(identical(other.gradeDropChance, gradeDropChance) || other.gradeDropChance == gradeDropChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,gradeDropChance);
}

@override
String toString() {
    return 'PotatoRulesData(gradeDropChance: $gradeDropChance)';
}


}

/// @nodoc
abstract mixin class _$PotatoRulesDataCopyWith<$Res> implements $PotatoRulesDataCopyWith<$Res> {
  factory _$PotatoRulesDataCopyWith(_PotatoRulesData value, $Res Function(_PotatoRulesData) _then) = __$PotatoRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double gradeDropChance
});




}
/// @nodoc
class __$PotatoRulesDataCopyWithImpl<$Res>
    implements _$PotatoRulesDataCopyWith<$Res> {
  __$PotatoRulesDataCopyWithImpl(this._self, this._then);

  final _PotatoRulesData _self;
  final $Res Function(_PotatoRulesData) _then;

/// Create a copy of PotatoRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gradeDropChance = null,}) {
  return _then(_PotatoRulesData(
gradeDropChance: null == gradeDropChance ? _self.gradeDropChance : gradeDropChance // ignore: cast_nullable_to_non_nullable
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

 PotatoType get type; Grade get grade; int get count;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedStackData&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeedStackData;
  return Object.hash(runtimeType,_this.type,_this.grade,_this.count);
}

@override
String toString() {
  final _this = this as SeedStackData;
  return 'SeedStackData(type: ${_this.type}, grade: ${_this.grade}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $SeedStackDataCopyWith<$Res>  {
  factory $SeedStackDataCopyWith(SeedStackData value, $Res Function(SeedStackData) _then) = _$SeedStackDataCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade, int count
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,Object? count = null,}) {
  return _then(SeedStackData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
return $default(_that.type,_that.grade,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int count)  $default,) {final _that = this;
switch (_that) {
case _SeedStackData():
return $default(_that.type,_that.grade,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  Grade grade,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SeedStackData() when $default != null:
return $default(_that.type,_that.grade,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeedStackData implements SeedStackData {
  const _SeedStackData({required this.type, required this.grade, required this.count});
  factory _SeedStackData.fromJson(Map<String, dynamic> json) => _$SeedStackDataFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;
@override final  int count;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedStackData&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade,count);
}

@override
String toString() {
    return 'SeedStackData(type: $type, grade: $grade, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SeedStackDataCopyWith<$Res> implements $SeedStackDataCopyWith<$Res> {
  factory _$SeedStackDataCopyWith(_SeedStackData value, $Res Function(_SeedStackData) _then) = __$SeedStackDataCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade, int count
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,Object? count = null,}) {
  return _then(_SeedStackData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
