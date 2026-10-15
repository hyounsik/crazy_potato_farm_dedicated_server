// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raid_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RaidRulesData {

/// Game time one run `step` covers.
 int get stepMillis; PlayerRulesData get player; int get bagSlots;/// How close the player must stand to open a pile or a gathering spot.
 double get pickupRadius; FoodRulesData get food;/// The weapon every run starts with, until equipment exists.
 String get startWeapon;/// How long an enemy keeps chasing whoever hit it, even out of sight.
 double get enemyAlertSeconds; CompanionRulesData get companion;
/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RaidRulesDataCopyWith<RaidRulesData> get copyWith => _$RaidRulesDataCopyWithImpl<RaidRulesData>(this as RaidRulesData, _$identity);

  /// Serializes this RaidRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RaidRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RaidRulesData&&(identical(other.stepMillis, _this.stepMillis) || other.stepMillis == _this.stepMillis)&&(identical(other.player, _this.player) || other.player == _this.player)&&(identical(other.bagSlots, _this.bagSlots) || other.bagSlots == _this.bagSlots)&&(identical(other.pickupRadius, _this.pickupRadius) || other.pickupRadius == _this.pickupRadius)&&(identical(other.food, _this.food) || other.food == _this.food)&&(identical(other.startWeapon, _this.startWeapon) || other.startWeapon == _this.startWeapon)&&(identical(other.enemyAlertSeconds, _this.enemyAlertSeconds) || other.enemyAlertSeconds == _this.enemyAlertSeconds)&&(identical(other.companion, _this.companion) || other.companion == _this.companion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RaidRulesData;
  return Object.hash(runtimeType,_this.stepMillis,_this.player,_this.bagSlots,_this.pickupRadius,_this.food,_this.startWeapon,_this.enemyAlertSeconds,_this.companion);
}

@override
String toString() {
  final _this = this as RaidRulesData;
  return 'RaidRulesData(stepMillis: ${_this.stepMillis}, player: ${_this.player}, bagSlots: ${_this.bagSlots}, pickupRadius: ${_this.pickupRadius}, food: ${_this.food}, startWeapon: ${_this.startWeapon}, enemyAlertSeconds: ${_this.enemyAlertSeconds}, companion: ${_this.companion})';
}


}

/// @nodoc
abstract mixin class $RaidRulesDataCopyWith<$Res>  {
  factory $RaidRulesDataCopyWith(RaidRulesData value, $Res Function(RaidRulesData) _then) = _$RaidRulesDataCopyWithImpl;
@useResult
$Res call({
 int stepMillis, PlayerRulesData player, int bagSlots, double pickupRadius, FoodRulesData food, String startWeapon, double enemyAlertSeconds, CompanionRulesData companion
});


$PlayerRulesDataCopyWith<$Res> get player;$FoodRulesDataCopyWith<$Res> get food;$CompanionRulesDataCopyWith<$Res> get companion;

}
/// @nodoc
class _$RaidRulesDataCopyWithImpl<$Res>
    implements $RaidRulesDataCopyWith<$Res> {
  _$RaidRulesDataCopyWithImpl(this._self, this._then);

  final RaidRulesData _self;
  final $Res Function(RaidRulesData) _then;

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepMillis = null,Object? player = null,Object? bagSlots = null,Object? pickupRadius = null,Object? food = null,Object? startWeapon = null,Object? enemyAlertSeconds = null,Object? companion = null,}) {
  return _then(RaidRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRulesData,bagSlots: null == bagSlots ? _self.bagSlots : bagSlots // ignore: cast_nullable_to_non_nullable
as int,pickupRadius: null == pickupRadius ? _self.pickupRadius : pickupRadius // ignore: cast_nullable_to_non_nullable
as double,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodRulesData,startWeapon: null == startWeapon ? _self.startWeapon : startWeapon // ignore: cast_nullable_to_non_nullable
as String,enemyAlertSeconds: null == enemyAlertSeconds ? _self.enemyAlertSeconds : enemyAlertSeconds // ignore: cast_nullable_to_non_nullable
as double,companion: null == companion ? _self.companion : companion // ignore: cast_nullable_to_non_nullable
as CompanionRulesData,
  ));
}
/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerRulesDataCopyWith<$Res> get player {
  
  return $PlayerRulesDataCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodRulesDataCopyWith<$Res> get food {
  
  return $FoodRulesDataCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanionRulesDataCopyWith<$Res> get companion {
  
  return $CompanionRulesDataCopyWith<$Res>(_self.companion, (value) {
    return _then(_self.copyWith(companion: value));
  });
}
}


/// Adds pattern-matching-related methods to [RaidRulesData].
extension RaidRulesDataPatterns on RaidRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RaidRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RaidRulesData value)  $default,){
final _that = this;
switch (_that) {
case _RaidRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RaidRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepMillis,  PlayerRulesData player,  int bagSlots,  double pickupRadius,  FoodRulesData food,  String startWeapon,  double enemyAlertSeconds,  CompanionRulesData companion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
return $default(_that.stepMillis,_that.player,_that.bagSlots,_that.pickupRadius,_that.food,_that.startWeapon,_that.enemyAlertSeconds,_that.companion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepMillis,  PlayerRulesData player,  int bagSlots,  double pickupRadius,  FoodRulesData food,  String startWeapon,  double enemyAlertSeconds,  CompanionRulesData companion)  $default,) {final _that = this;
switch (_that) {
case _RaidRulesData():
return $default(_that.stepMillis,_that.player,_that.bagSlots,_that.pickupRadius,_that.food,_that.startWeapon,_that.enemyAlertSeconds,_that.companion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepMillis,  PlayerRulesData player,  int bagSlots,  double pickupRadius,  FoodRulesData food,  String startWeapon,  double enemyAlertSeconds,  CompanionRulesData companion)?  $default,) {final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
return $default(_that.stepMillis,_that.player,_that.bagSlots,_that.pickupRadius,_that.food,_that.startWeapon,_that.enemyAlertSeconds,_that.companion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RaidRulesData implements RaidRulesData {
  const _RaidRulesData({required this.stepMillis, required this.player, required this.bagSlots, required this.pickupRadius, required this.food, required this.startWeapon, required this.enemyAlertSeconds, required this.companion});
  factory _RaidRulesData.fromJson(Map<String, dynamic> json) => _$RaidRulesDataFromJson(json);

/// Game time one run `step` covers.
@override final  int stepMillis;
@override final  PlayerRulesData player;
@override final  int bagSlots;
/// How close the player must stand to open a pile or a gathering spot.
@override final  double pickupRadius;
@override final  FoodRulesData food;
/// The weapon every run starts with, until equipment exists.
@override final  String startWeapon;
/// How long an enemy keeps chasing whoever hit it, even out of sight.
@override final  double enemyAlertSeconds;
@override final  CompanionRulesData companion;

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RaidRulesDataCopyWith<_RaidRulesData> get copyWith => __$RaidRulesDataCopyWithImpl<_RaidRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RaidRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RaidRulesData&&(identical(other.stepMillis, stepMillis) || other.stepMillis == stepMillis)&&(identical(other.player, player) || other.player == player)&&(identical(other.bagSlots, bagSlots) || other.bagSlots == bagSlots)&&(identical(other.pickupRadius, pickupRadius) || other.pickupRadius == pickupRadius)&&(identical(other.food, food) || other.food == food)&&(identical(other.startWeapon, startWeapon) || other.startWeapon == startWeapon)&&(identical(other.enemyAlertSeconds, enemyAlertSeconds) || other.enemyAlertSeconds == enemyAlertSeconds)&&(identical(other.companion, companion) || other.companion == companion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stepMillis,player,bagSlots,pickupRadius,food,startWeapon,enemyAlertSeconds,companion);
}

@override
String toString() {
    return 'RaidRulesData(stepMillis: $stepMillis, player: $player, bagSlots: $bagSlots, pickupRadius: $pickupRadius, food: $food, startWeapon: $startWeapon, enemyAlertSeconds: $enemyAlertSeconds, companion: $companion)';
}


}

/// @nodoc
abstract mixin class _$RaidRulesDataCopyWith<$Res> implements $RaidRulesDataCopyWith<$Res> {
  factory _$RaidRulesDataCopyWith(_RaidRulesData value, $Res Function(_RaidRulesData) _then) = __$RaidRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int stepMillis, PlayerRulesData player, int bagSlots, double pickupRadius, FoodRulesData food, String startWeapon, double enemyAlertSeconds, CompanionRulesData companion
});


@override $PlayerRulesDataCopyWith<$Res> get player;@override $FoodRulesDataCopyWith<$Res> get food;@override $CompanionRulesDataCopyWith<$Res> get companion;

}
/// @nodoc
class __$RaidRulesDataCopyWithImpl<$Res>
    implements _$RaidRulesDataCopyWith<$Res> {
  __$RaidRulesDataCopyWithImpl(this._self, this._then);

  final _RaidRulesData _self;
  final $Res Function(_RaidRulesData) _then;

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepMillis = null,Object? player = null,Object? bagSlots = null,Object? pickupRadius = null,Object? food = null,Object? startWeapon = null,Object? enemyAlertSeconds = null,Object? companion = null,}) {
  return _then(_RaidRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRulesData,bagSlots: null == bagSlots ? _self.bagSlots : bagSlots // ignore: cast_nullable_to_non_nullable
as int,pickupRadius: null == pickupRadius ? _self.pickupRadius : pickupRadius // ignore: cast_nullable_to_non_nullable
as double,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodRulesData,startWeapon: null == startWeapon ? _self.startWeapon : startWeapon // ignore: cast_nullable_to_non_nullable
as String,enemyAlertSeconds: null == enemyAlertSeconds ? _self.enemyAlertSeconds : enemyAlertSeconds // ignore: cast_nullable_to_non_nullable
as double,companion: null == companion ? _self.companion : companion // ignore: cast_nullable_to_non_nullable
as CompanionRulesData,
  ));
}

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerRulesDataCopyWith<$Res> get player {
  
  return $PlayerRulesDataCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodRulesDataCopyWith<$Res> get food {
  
  return $FoodRulesDataCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanionRulesDataCopyWith<$Res> get companion {
  
  return $CompanionRulesDataCopyWith<$Res>(_self.companion, (value) {
    return _then(_self.copyWith(companion: value));
  });
}
}


/// @nodoc
mixin _$PlayerRulesData {

 double get speed; double get radius; double get maxHp;/// Health starts refilling this long after the last hit.
 double get regenDelaySeconds; double get regenPerSecond;/// How far the player sees; enemy sight is a share of it.
 double get sight; double get dashDistance; double get dashSeconds; double get dashCooldownSeconds;
/// Create a copy of PlayerRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerRulesDataCopyWith<PlayerRulesData> get copyWith => _$PlayerRulesDataCopyWithImpl<PlayerRulesData>(this as PlayerRulesData, _$identity);

  /// Serializes this PlayerRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlayerRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerRulesData&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.regenDelaySeconds, _this.regenDelaySeconds) || other.regenDelaySeconds == _this.regenDelaySeconds)&&(identical(other.regenPerSecond, _this.regenPerSecond) || other.regenPerSecond == _this.regenPerSecond)&&(identical(other.sight, _this.sight) || other.sight == _this.sight)&&(identical(other.dashDistance, _this.dashDistance) || other.dashDistance == _this.dashDistance)&&(identical(other.dashSeconds, _this.dashSeconds) || other.dashSeconds == _this.dashSeconds)&&(identical(other.dashCooldownSeconds, _this.dashCooldownSeconds) || other.dashCooldownSeconds == _this.dashCooldownSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlayerRulesData;
  return Object.hash(runtimeType,_this.speed,_this.radius,_this.maxHp,_this.regenDelaySeconds,_this.regenPerSecond,_this.sight,_this.dashDistance,_this.dashSeconds,_this.dashCooldownSeconds);
}

@override
String toString() {
  final _this = this as PlayerRulesData;
  return 'PlayerRulesData(speed: ${_this.speed}, radius: ${_this.radius}, maxHp: ${_this.maxHp}, regenDelaySeconds: ${_this.regenDelaySeconds}, regenPerSecond: ${_this.regenPerSecond}, sight: ${_this.sight}, dashDistance: ${_this.dashDistance}, dashSeconds: ${_this.dashSeconds}, dashCooldownSeconds: ${_this.dashCooldownSeconds})';
}


}

/// @nodoc
abstract mixin class $PlayerRulesDataCopyWith<$Res>  {
  factory $PlayerRulesDataCopyWith(PlayerRulesData value, $Res Function(PlayerRulesData) _then) = _$PlayerRulesDataCopyWithImpl;
@useResult
$Res call({
 double speed, double radius, double maxHp, double regenDelaySeconds, double regenPerSecond, double sight, double dashDistance, double dashSeconds, double dashCooldownSeconds
});




}
/// @nodoc
class _$PlayerRulesDataCopyWithImpl<$Res>
    implements $PlayerRulesDataCopyWith<$Res> {
  _$PlayerRulesDataCopyWithImpl(this._self, this._then);

  final PlayerRulesData _self;
  final $Res Function(PlayerRulesData) _then;

/// Create a copy of PlayerRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,Object? radius = null,Object? maxHp = null,Object? regenDelaySeconds = null,Object? regenPerSecond = null,Object? sight = null,Object? dashDistance = null,Object? dashSeconds = null,Object? dashCooldownSeconds = null,}) {
  return _then(PlayerRulesData(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,regenDelaySeconds: null == regenDelaySeconds ? _self.regenDelaySeconds : regenDelaySeconds // ignore: cast_nullable_to_non_nullable
as double,regenPerSecond: null == regenPerSecond ? _self.regenPerSecond : regenPerSecond // ignore: cast_nullable_to_non_nullable
as double,sight: null == sight ? _self.sight : sight // ignore: cast_nullable_to_non_nullable
as double,dashDistance: null == dashDistance ? _self.dashDistance : dashDistance // ignore: cast_nullable_to_non_nullable
as double,dashSeconds: null == dashSeconds ? _self.dashSeconds : dashSeconds // ignore: cast_nullable_to_non_nullable
as double,dashCooldownSeconds: null == dashCooldownSeconds ? _self.dashCooldownSeconds : dashCooldownSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerRulesData].
extension PlayerRulesDataPatterns on PlayerRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerRulesData value)  $default,){
final _that = this;
switch (_that) {
case _PlayerRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed,  double radius,  double maxHp,  double regenDelaySeconds,  double regenPerSecond,  double sight,  double dashDistance,  double dashSeconds,  double dashCooldownSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerRulesData() when $default != null:
return $default(_that.speed,_that.radius,_that.maxHp,_that.regenDelaySeconds,_that.regenPerSecond,_that.sight,_that.dashDistance,_that.dashSeconds,_that.dashCooldownSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed,  double radius,  double maxHp,  double regenDelaySeconds,  double regenPerSecond,  double sight,  double dashDistance,  double dashSeconds,  double dashCooldownSeconds)  $default,) {final _that = this;
switch (_that) {
case _PlayerRulesData():
return $default(_that.speed,_that.radius,_that.maxHp,_that.regenDelaySeconds,_that.regenPerSecond,_that.sight,_that.dashDistance,_that.dashSeconds,_that.dashCooldownSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed,  double radius,  double maxHp,  double regenDelaySeconds,  double regenPerSecond,  double sight,  double dashDistance,  double dashSeconds,  double dashCooldownSeconds)?  $default,) {final _that = this;
switch (_that) {
case _PlayerRulesData() when $default != null:
return $default(_that.speed,_that.radius,_that.maxHp,_that.regenDelaySeconds,_that.regenPerSecond,_that.sight,_that.dashDistance,_that.dashSeconds,_that.dashCooldownSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerRulesData implements PlayerRulesData {
  const _PlayerRulesData({required this.speed, required this.radius, required this.maxHp, required this.regenDelaySeconds, required this.regenPerSecond, required this.sight, required this.dashDistance, required this.dashSeconds, required this.dashCooldownSeconds});
  factory _PlayerRulesData.fromJson(Map<String, dynamic> json) => _$PlayerRulesDataFromJson(json);

@override final  double speed;
@override final  double radius;
@override final  double maxHp;
/// Health starts refilling this long after the last hit.
@override final  double regenDelaySeconds;
@override final  double regenPerSecond;
/// How far the player sees; enemy sight is a share of it.
@override final  double sight;
@override final  double dashDistance;
@override final  double dashSeconds;
@override final  double dashCooldownSeconds;

/// Create a copy of PlayerRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerRulesDataCopyWith<_PlayerRulesData> get copyWith => __$PlayerRulesDataCopyWithImpl<_PlayerRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerRulesData&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.regenDelaySeconds, regenDelaySeconds) || other.regenDelaySeconds == regenDelaySeconds)&&(identical(other.regenPerSecond, regenPerSecond) || other.regenPerSecond == regenPerSecond)&&(identical(other.sight, sight) || other.sight == sight)&&(identical(other.dashDistance, dashDistance) || other.dashDistance == dashDistance)&&(identical(other.dashSeconds, dashSeconds) || other.dashSeconds == dashSeconds)&&(identical(other.dashCooldownSeconds, dashCooldownSeconds) || other.dashCooldownSeconds == dashCooldownSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,speed,radius,maxHp,regenDelaySeconds,regenPerSecond,sight,dashDistance,dashSeconds,dashCooldownSeconds);
}

@override
String toString() {
    return 'PlayerRulesData(speed: $speed, radius: $radius, maxHp: $maxHp, regenDelaySeconds: $regenDelaySeconds, regenPerSecond: $regenPerSecond, sight: $sight, dashDistance: $dashDistance, dashSeconds: $dashSeconds, dashCooldownSeconds: $dashCooldownSeconds)';
}


}

/// @nodoc
abstract mixin class _$PlayerRulesDataCopyWith<$Res> implements $PlayerRulesDataCopyWith<$Res> {
  factory _$PlayerRulesDataCopyWith(_PlayerRulesData value, $Res Function(_PlayerRulesData) _then) = __$PlayerRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double speed, double radius, double maxHp, double regenDelaySeconds, double regenPerSecond, double sight, double dashDistance, double dashSeconds, double dashCooldownSeconds
});




}
/// @nodoc
class __$PlayerRulesDataCopyWithImpl<$Res>
    implements _$PlayerRulesDataCopyWith<$Res> {
  __$PlayerRulesDataCopyWithImpl(this._self, this._then);

  final _PlayerRulesData _self;
  final $Res Function(_PlayerRulesData) _then;

/// Create a copy of PlayerRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,Object? radius = null,Object? maxHp = null,Object? regenDelaySeconds = null,Object? regenPerSecond = null,Object? sight = null,Object? dashDistance = null,Object? dashSeconds = null,Object? dashCooldownSeconds = null,}) {
  return _then(_PlayerRulesData(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,regenDelaySeconds: null == regenDelaySeconds ? _self.regenDelaySeconds : regenDelaySeconds // ignore: cast_nullable_to_non_nullable
as double,regenPerSecond: null == regenPerSecond ? _self.regenPerSecond : regenPerSecond // ignore: cast_nullable_to_non_nullable
as double,sight: null == sight ? _self.sight : sight // ignore: cast_nullable_to_non_nullable
as double,dashDistance: null == dashDistance ? _self.dashDistance : dashDistance // ignore: cast_nullable_to_non_nullable
as double,dashSeconds: null == dashSeconds ? _self.dashSeconds : dashSeconds // ignore: cast_nullable_to_non_nullable
as double,dashCooldownSeconds: null == dashCooldownSeconds ? _self.dashCooldownSeconds : dashCooldownSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$FoodRulesData {

/// The item eaten (an [ItemKind.food] item).
 String get item; double get perSecond;/// Eaten on top while health refills.
 double get regenExtraPerSecond;/// Speed share while hungry (no food in the bag).
 double get hungrySpeedMultiplier;/// Hungry this long, the run ends and the player returns with the bag.
 double get hungryReturnSeconds;
/// Create a copy of FoodRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodRulesDataCopyWith<FoodRulesData> get copyWith => _$FoodRulesDataCopyWithImpl<FoodRulesData>(this as FoodRulesData, _$identity);

  /// Serializes this FoodRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FoodRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodRulesData&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.perSecond, _this.perSecond) || other.perSecond == _this.perSecond)&&(identical(other.regenExtraPerSecond, _this.regenExtraPerSecond) || other.regenExtraPerSecond == _this.regenExtraPerSecond)&&(identical(other.hungrySpeedMultiplier, _this.hungrySpeedMultiplier) || other.hungrySpeedMultiplier == _this.hungrySpeedMultiplier)&&(identical(other.hungryReturnSeconds, _this.hungryReturnSeconds) || other.hungryReturnSeconds == _this.hungryReturnSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FoodRulesData;
  return Object.hash(runtimeType,_this.item,_this.perSecond,_this.regenExtraPerSecond,_this.hungrySpeedMultiplier,_this.hungryReturnSeconds);
}

@override
String toString() {
  final _this = this as FoodRulesData;
  return 'FoodRulesData(item: ${_this.item}, perSecond: ${_this.perSecond}, regenExtraPerSecond: ${_this.regenExtraPerSecond}, hungrySpeedMultiplier: ${_this.hungrySpeedMultiplier}, hungryReturnSeconds: ${_this.hungryReturnSeconds})';
}


}

/// @nodoc
abstract mixin class $FoodRulesDataCopyWith<$Res>  {
  factory $FoodRulesDataCopyWith(FoodRulesData value, $Res Function(FoodRulesData) _then) = _$FoodRulesDataCopyWithImpl;
@useResult
$Res call({
 String item, double perSecond, double regenExtraPerSecond, double hungrySpeedMultiplier, double hungryReturnSeconds
});




}
/// @nodoc
class _$FoodRulesDataCopyWithImpl<$Res>
    implements $FoodRulesDataCopyWith<$Res> {
  _$FoodRulesDataCopyWithImpl(this._self, this._then);

  final FoodRulesData _self;
  final $Res Function(FoodRulesData) _then;

/// Create a copy of FoodRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? perSecond = null,Object? regenExtraPerSecond = null,Object? hungrySpeedMultiplier = null,Object? hungryReturnSeconds = null,}) {
  return _then(FoodRulesData(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,perSecond: null == perSecond ? _self.perSecond : perSecond // ignore: cast_nullable_to_non_nullable
as double,regenExtraPerSecond: null == regenExtraPerSecond ? _self.regenExtraPerSecond : regenExtraPerSecond // ignore: cast_nullable_to_non_nullable
as double,hungrySpeedMultiplier: null == hungrySpeedMultiplier ? _self.hungrySpeedMultiplier : hungrySpeedMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryReturnSeconds: null == hungryReturnSeconds ? _self.hungryReturnSeconds : hungryReturnSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodRulesData].
extension FoodRulesDataPatterns on FoodRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodRulesData value)  $default,){
final _that = this;
switch (_that) {
case _FoodRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _FoodRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item,  double perSecond,  double regenExtraPerSecond,  double hungrySpeedMultiplier,  double hungryReturnSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodRulesData() when $default != null:
return $default(_that.item,_that.perSecond,_that.regenExtraPerSecond,_that.hungrySpeedMultiplier,_that.hungryReturnSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item,  double perSecond,  double regenExtraPerSecond,  double hungrySpeedMultiplier,  double hungryReturnSeconds)  $default,) {final _that = this;
switch (_that) {
case _FoodRulesData():
return $default(_that.item,_that.perSecond,_that.regenExtraPerSecond,_that.hungrySpeedMultiplier,_that.hungryReturnSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item,  double perSecond,  double regenExtraPerSecond,  double hungrySpeedMultiplier,  double hungryReturnSeconds)?  $default,) {final _that = this;
switch (_that) {
case _FoodRulesData() when $default != null:
return $default(_that.item,_that.perSecond,_that.regenExtraPerSecond,_that.hungrySpeedMultiplier,_that.hungryReturnSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodRulesData implements FoodRulesData {
  const _FoodRulesData({required this.item, required this.perSecond, required this.regenExtraPerSecond, required this.hungrySpeedMultiplier, required this.hungryReturnSeconds});
  factory _FoodRulesData.fromJson(Map<String, dynamic> json) => _$FoodRulesDataFromJson(json);

/// The item eaten (an [ItemKind.food] item).
@override final  String item;
@override final  double perSecond;
/// Eaten on top while health refills.
@override final  double regenExtraPerSecond;
/// Speed share while hungry (no food in the bag).
@override final  double hungrySpeedMultiplier;
/// Hungry this long, the run ends and the player returns with the bag.
@override final  double hungryReturnSeconds;

/// Create a copy of FoodRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodRulesDataCopyWith<_FoodRulesData> get copyWith => __$FoodRulesDataCopyWithImpl<_FoodRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodRulesData&&(identical(other.item, item) || other.item == item)&&(identical(other.perSecond, perSecond) || other.perSecond == perSecond)&&(identical(other.regenExtraPerSecond, regenExtraPerSecond) || other.regenExtraPerSecond == regenExtraPerSecond)&&(identical(other.hungrySpeedMultiplier, hungrySpeedMultiplier) || other.hungrySpeedMultiplier == hungrySpeedMultiplier)&&(identical(other.hungryReturnSeconds, hungryReturnSeconds) || other.hungryReturnSeconds == hungryReturnSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item,perSecond,regenExtraPerSecond,hungrySpeedMultiplier,hungryReturnSeconds);
}

@override
String toString() {
    return 'FoodRulesData(item: $item, perSecond: $perSecond, regenExtraPerSecond: $regenExtraPerSecond, hungrySpeedMultiplier: $hungrySpeedMultiplier, hungryReturnSeconds: $hungryReturnSeconds)';
}


}

/// @nodoc
abstract mixin class _$FoodRulesDataCopyWith<$Res> implements $FoodRulesDataCopyWith<$Res> {
  factory _$FoodRulesDataCopyWith(_FoodRulesData value, $Res Function(_FoodRulesData) _then) = __$FoodRulesDataCopyWithImpl;
@override @useResult
$Res call({
 String item, double perSecond, double regenExtraPerSecond, double hungrySpeedMultiplier, double hungryReturnSeconds
});




}
/// @nodoc
class __$FoodRulesDataCopyWithImpl<$Res>
    implements _$FoodRulesDataCopyWith<$Res> {
  __$FoodRulesDataCopyWithImpl(this._self, this._then);

  final _FoodRulesData _self;
  final $Res Function(_FoodRulesData) _then;

/// Create a copy of FoodRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? perSecond = null,Object? regenExtraPerSecond = null,Object? hungrySpeedMultiplier = null,Object? hungryReturnSeconds = null,}) {
  return _then(_FoodRulesData(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,perSecond: null == perSecond ? _self.perSecond : perSecond // ignore: cast_nullable_to_non_nullable
as double,regenExtraPerSecond: null == regenExtraPerSecond ? _self.regenExtraPerSecond : regenExtraPerSecond // ignore: cast_nullable_to_non_nullable
as double,hungrySpeedMultiplier: null == hungrySpeedMultiplier ? _self.hungrySpeedMultiplier : hungrySpeedMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryReturnSeconds: null == hungryReturnSeconds ? _self.hungryReturnSeconds : hungryReturnSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CompanionRulesData {

 double get maxHp; double get radius;/// Speed share of the player's.
 double get speedMultiplier; double get followDistance;/// Farther than this from the player, a companion runs to catch up.
 double get catchUpDistance; double get regenDelaySeconds;/// Share of max health refilled per second.
 double get regenPercentPerSecond;/// Food eaten per second by each companion while it heals.
 double get regenFoodPerSecond;/// Food a food potato makes per second.
 double get producePerSecond;/// How far from the player combat potatoes take on enemies: in attack
/// mode any enemy, in defense mode only those going for the party.
 double get attackRange; double get defenseRange;/// How each combat style fights. Other potatoes use [maxHp] and
/// [speedMultiplier] and do not fight.
 Map<CombatStyle, CompanionStyleData> get styles;/// What each level adds to a companion's health and attack, in
/// thousandths: 30 means +3% per level.
 int get levelHpPermille; int get levelAttackPermille;/// Enemies this close to a potato that calls them come for it.
 double get aggroPulseRange;
/// Create a copy of CompanionRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanionRulesDataCopyWith<CompanionRulesData> get copyWith => _$CompanionRulesDataCopyWithImpl<CompanionRulesData>(this as CompanionRulesData, _$identity);

  /// Serializes this CompanionRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompanionRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanionRulesData&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.speedMultiplier, _this.speedMultiplier) || other.speedMultiplier == _this.speedMultiplier)&&(identical(other.followDistance, _this.followDistance) || other.followDistance == _this.followDistance)&&(identical(other.catchUpDistance, _this.catchUpDistance) || other.catchUpDistance == _this.catchUpDistance)&&(identical(other.regenDelaySeconds, _this.regenDelaySeconds) || other.regenDelaySeconds == _this.regenDelaySeconds)&&(identical(other.regenPercentPerSecond, _this.regenPercentPerSecond) || other.regenPercentPerSecond == _this.regenPercentPerSecond)&&(identical(other.regenFoodPerSecond, _this.regenFoodPerSecond) || other.regenFoodPerSecond == _this.regenFoodPerSecond)&&(identical(other.producePerSecond, _this.producePerSecond) || other.producePerSecond == _this.producePerSecond)&&(identical(other.attackRange, _this.attackRange) || other.attackRange == _this.attackRange)&&(identical(other.defenseRange, _this.defenseRange) || other.defenseRange == _this.defenseRange)&&const DeepCollectionEquality().equals(other.styles, _this.styles)&&(identical(other.levelHpPermille, _this.levelHpPermille) || other.levelHpPermille == _this.levelHpPermille)&&(identical(other.levelAttackPermille, _this.levelAttackPermille) || other.levelAttackPermille == _this.levelAttackPermille)&&(identical(other.aggroPulseRange, _this.aggroPulseRange) || other.aggroPulseRange == _this.aggroPulseRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompanionRulesData;
  return Object.hash(runtimeType,_this.maxHp,_this.radius,_this.speedMultiplier,_this.followDistance,_this.catchUpDistance,_this.regenDelaySeconds,_this.regenPercentPerSecond,_this.regenFoodPerSecond,_this.producePerSecond,_this.attackRange,_this.defenseRange,const DeepCollectionEquality().hash(_this.styles),_this.levelHpPermille,_this.levelAttackPermille,_this.aggroPulseRange);
}

@override
String toString() {
  final _this = this as CompanionRulesData;
  return 'CompanionRulesData(maxHp: ${_this.maxHp}, radius: ${_this.radius}, speedMultiplier: ${_this.speedMultiplier}, followDistance: ${_this.followDistance}, catchUpDistance: ${_this.catchUpDistance}, regenDelaySeconds: ${_this.regenDelaySeconds}, regenPercentPerSecond: ${_this.regenPercentPerSecond}, regenFoodPerSecond: ${_this.regenFoodPerSecond}, producePerSecond: ${_this.producePerSecond}, attackRange: ${_this.attackRange}, defenseRange: ${_this.defenseRange}, styles: ${_this.styles}, levelHpPermille: ${_this.levelHpPermille}, levelAttackPermille: ${_this.levelAttackPermille}, aggroPulseRange: ${_this.aggroPulseRange})';
}


}

/// @nodoc
abstract mixin class $CompanionRulesDataCopyWith<$Res>  {
  factory $CompanionRulesDataCopyWith(CompanionRulesData value, $Res Function(CompanionRulesData) _then) = _$CompanionRulesDataCopyWithImpl;
@useResult
$Res call({
 double maxHp, double radius, double speedMultiplier, double followDistance, double catchUpDistance, double regenDelaySeconds, double regenPercentPerSecond, double regenFoodPerSecond, double producePerSecond, double attackRange, double defenseRange, Map<CombatStyle, CompanionStyleData> styles, int levelHpPermille, int levelAttackPermille, double aggroPulseRange
});




}
/// @nodoc
class _$CompanionRulesDataCopyWithImpl<$Res>
    implements $CompanionRulesDataCopyWith<$Res> {
  _$CompanionRulesDataCopyWithImpl(this._self, this._then);

  final CompanionRulesData _self;
  final $Res Function(CompanionRulesData) _then;

/// Create a copy of CompanionRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxHp = null,Object? radius = null,Object? speedMultiplier = null,Object? followDistance = null,Object? catchUpDistance = null,Object? regenDelaySeconds = null,Object? regenPercentPerSecond = null,Object? regenFoodPerSecond = null,Object? producePerSecond = null,Object? attackRange = null,Object? defenseRange = null,Object? styles = null,Object? levelHpPermille = null,Object? levelAttackPermille = null,Object? aggroPulseRange = null,}) {
  return _then(CompanionRulesData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,followDistance: null == followDistance ? _self.followDistance : followDistance // ignore: cast_nullable_to_non_nullable
as double,catchUpDistance: null == catchUpDistance ? _self.catchUpDistance : catchUpDistance // ignore: cast_nullable_to_non_nullable
as double,regenDelaySeconds: null == regenDelaySeconds ? _self.regenDelaySeconds : regenDelaySeconds // ignore: cast_nullable_to_non_nullable
as double,regenPercentPerSecond: null == regenPercentPerSecond ? _self.regenPercentPerSecond : regenPercentPerSecond // ignore: cast_nullable_to_non_nullable
as double,regenFoodPerSecond: null == regenFoodPerSecond ? _self.regenFoodPerSecond : regenFoodPerSecond // ignore: cast_nullable_to_non_nullable
as double,producePerSecond: null == producePerSecond ? _self.producePerSecond : producePerSecond // ignore: cast_nullable_to_non_nullable
as double,attackRange: null == attackRange ? _self.attackRange : attackRange // ignore: cast_nullable_to_non_nullable
as double,defenseRange: null == defenseRange ? _self.defenseRange : defenseRange // ignore: cast_nullable_to_non_nullable
as double,styles: null == styles ? _self.styles : styles // ignore: cast_nullable_to_non_nullable
as Map<CombatStyle, CompanionStyleData>,levelHpPermille: null == levelHpPermille ? _self.levelHpPermille : levelHpPermille // ignore: cast_nullable_to_non_nullable
as int,levelAttackPermille: null == levelAttackPermille ? _self.levelAttackPermille : levelAttackPermille // ignore: cast_nullable_to_non_nullable
as int,aggroPulseRange: null == aggroPulseRange ? _self.aggroPulseRange : aggroPulseRange // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanionRulesData].
extension CompanionRulesDataPatterns on CompanionRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanionRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanionRulesData value)  $default,){
final _that = this;
switch (_that) {
case _CompanionRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanionRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)  $default,) {final _that = this;
switch (_that) {
case _CompanionRulesData():
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)?  $default,) {final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanionRulesData implements CompanionRulesData {
  const _CompanionRulesData({required this.maxHp, required this.radius, required this.speedMultiplier, required this.followDistance, required this.catchUpDistance, required this.regenDelaySeconds, required this.regenPercentPerSecond, required this.regenFoodPerSecond, required this.producePerSecond, required this.attackRange, required this.defenseRange, required  Map<CombatStyle, CompanionStyleData> styles, required this.levelHpPermille, required this.levelAttackPermille, required this.aggroPulseRange}): _styles = styles;
  factory _CompanionRulesData.fromJson(Map<String, dynamic> json) => _$CompanionRulesDataFromJson(json);

@override final  double maxHp;
@override final  double radius;
/// Speed share of the player's.
@override final  double speedMultiplier;
@override final  double followDistance;
/// Farther than this from the player, a companion runs to catch up.
@override final  double catchUpDistance;
@override final  double regenDelaySeconds;
/// Share of max health refilled per second.
@override final  double regenPercentPerSecond;
/// Food eaten per second by each companion while it heals.
@override final  double regenFoodPerSecond;
/// Food a food potato makes per second.
@override final  double producePerSecond;
/// How far from the player combat potatoes take on enemies: in attack
/// mode any enemy, in defense mode only those going for the party.
@override final  double attackRange;
@override final  double defenseRange;
/// How each combat style fights. Other potatoes use [maxHp] and
/// [speedMultiplier] and do not fight.
 final  Map<CombatStyle, CompanionStyleData> _styles;
/// How each combat style fights. Other potatoes use [maxHp] and
/// [speedMultiplier] and do not fight.
@override Map<CombatStyle, CompanionStyleData> get styles {
  if (_styles is EqualUnmodifiableMapView) return _styles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_styles);
}

/// What each level adds to a companion's health and attack, in
/// thousandths: 30 means +3% per level.
@override final  int levelHpPermille;
@override final  int levelAttackPermille;
/// Enemies this close to a potato that calls them come for it.
@override final  double aggroPulseRange;

/// Create a copy of CompanionRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanionRulesDataCopyWith<_CompanionRulesData> get copyWith => __$CompanionRulesDataCopyWithImpl<_CompanionRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanionRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanionRulesData&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.speedMultiplier, speedMultiplier) || other.speedMultiplier == speedMultiplier)&&(identical(other.followDistance, followDistance) || other.followDistance == followDistance)&&(identical(other.catchUpDistance, catchUpDistance) || other.catchUpDistance == catchUpDistance)&&(identical(other.regenDelaySeconds, regenDelaySeconds) || other.regenDelaySeconds == regenDelaySeconds)&&(identical(other.regenPercentPerSecond, regenPercentPerSecond) || other.regenPercentPerSecond == regenPercentPerSecond)&&(identical(other.regenFoodPerSecond, regenFoodPerSecond) || other.regenFoodPerSecond == regenFoodPerSecond)&&(identical(other.producePerSecond, producePerSecond) || other.producePerSecond == producePerSecond)&&(identical(other.attackRange, attackRange) || other.attackRange == attackRange)&&(identical(other.defenseRange, defenseRange) || other.defenseRange == defenseRange)&&const DeepCollectionEquality().equals(other.styles, _styles)&&(identical(other.levelHpPermille, levelHpPermille) || other.levelHpPermille == levelHpPermille)&&(identical(other.levelAttackPermille, levelAttackPermille) || other.levelAttackPermille == levelAttackPermille)&&(identical(other.aggroPulseRange, aggroPulseRange) || other.aggroPulseRange == aggroPulseRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,maxHp,radius,speedMultiplier,followDistance,catchUpDistance,regenDelaySeconds,regenPercentPerSecond,regenFoodPerSecond,producePerSecond,attackRange,defenseRange,const DeepCollectionEquality().hash(_styles),levelHpPermille,levelAttackPermille,aggroPulseRange);
}

@override
String toString() {
    return 'CompanionRulesData(maxHp: $maxHp, radius: $radius, speedMultiplier: $speedMultiplier, followDistance: $followDistance, catchUpDistance: $catchUpDistance, regenDelaySeconds: $regenDelaySeconds, regenPercentPerSecond: $regenPercentPerSecond, regenFoodPerSecond: $regenFoodPerSecond, producePerSecond: $producePerSecond, attackRange: $attackRange, defenseRange: $defenseRange, styles: $styles, levelHpPermille: $levelHpPermille, levelAttackPermille: $levelAttackPermille, aggroPulseRange: $aggroPulseRange)';
}


}

/// @nodoc
abstract mixin class _$CompanionRulesDataCopyWith<$Res> implements $CompanionRulesDataCopyWith<$Res> {
  factory _$CompanionRulesDataCopyWith(_CompanionRulesData value, $Res Function(_CompanionRulesData) _then) = __$CompanionRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double maxHp, double radius, double speedMultiplier, double followDistance, double catchUpDistance, double regenDelaySeconds, double regenPercentPerSecond, double regenFoodPerSecond, double producePerSecond, double attackRange, double defenseRange, Map<CombatStyle, CompanionStyleData> styles, int levelHpPermille, int levelAttackPermille, double aggroPulseRange
});




}
/// @nodoc
class __$CompanionRulesDataCopyWithImpl<$Res>
    implements _$CompanionRulesDataCopyWith<$Res> {
  __$CompanionRulesDataCopyWithImpl(this._self, this._then);

  final _CompanionRulesData _self;
  final $Res Function(_CompanionRulesData) _then;

/// Create a copy of CompanionRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxHp = null,Object? radius = null,Object? speedMultiplier = null,Object? followDistance = null,Object? catchUpDistance = null,Object? regenDelaySeconds = null,Object? regenPercentPerSecond = null,Object? regenFoodPerSecond = null,Object? producePerSecond = null,Object? attackRange = null,Object? defenseRange = null,Object? styles = null,Object? levelHpPermille = null,Object? levelAttackPermille = null,Object? aggroPulseRange = null,}) {
  return _then(_CompanionRulesData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,followDistance: null == followDistance ? _self.followDistance : followDistance // ignore: cast_nullable_to_non_nullable
as double,catchUpDistance: null == catchUpDistance ? _self.catchUpDistance : catchUpDistance // ignore: cast_nullable_to_non_nullable
as double,regenDelaySeconds: null == regenDelaySeconds ? _self.regenDelaySeconds : regenDelaySeconds // ignore: cast_nullable_to_non_nullable
as double,regenPercentPerSecond: null == regenPercentPerSecond ? _self.regenPercentPerSecond : regenPercentPerSecond // ignore: cast_nullable_to_non_nullable
as double,regenFoodPerSecond: null == regenFoodPerSecond ? _self.regenFoodPerSecond : regenFoodPerSecond // ignore: cast_nullable_to_non_nullable
as double,producePerSecond: null == producePerSecond ? _self.producePerSecond : producePerSecond // ignore: cast_nullable_to_non_nullable
as double,attackRange: null == attackRange ? _self.attackRange : attackRange // ignore: cast_nullable_to_non_nullable
as double,defenseRange: null == defenseRange ? _self.defenseRange : defenseRange // ignore: cast_nullable_to_non_nullable
as double,styles: null == styles ? _self._styles : styles // ignore: cast_nullable_to_non_nullable
as Map<CombatStyle, CompanionStyleData>,levelHpPermille: null == levelHpPermille ? _self.levelHpPermille : levelHpPermille // ignore: cast_nullable_to_non_nullable
as int,levelAttackPermille: null == levelAttackPermille ? _self.levelAttackPermille : levelAttackPermille // ignore: cast_nullable_to_non_nullable
as int,aggroPulseRange: null == aggroPulseRange ? _self.aggroPulseRange : aggroPulseRange // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CompanionStyleData {

 double get maxHp; double get damage;/// Seconds between attacks.
 double get interval;/// Speed share of the player's.
 double get speedMultiplier;/// The gap it keeps: melee next to the enemy, ranged back from it,
/// guard this far out from the player toward the enemy.
 double get preferredDistance; double get reach; double get range; double get bulletSpeed;
/// Create a copy of CompanionStyleData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanionStyleDataCopyWith<CompanionStyleData> get copyWith => _$CompanionStyleDataCopyWithImpl<CompanionStyleData>(this as CompanionStyleData, _$identity);

  /// Serializes this CompanionStyleData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CompanionStyleData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanionStyleData&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.interval, _this.interval) || other.interval == _this.interval)&&(identical(other.speedMultiplier, _this.speedMultiplier) || other.speedMultiplier == _this.speedMultiplier)&&(identical(other.preferredDistance, _this.preferredDistance) || other.preferredDistance == _this.preferredDistance)&&(identical(other.reach, _this.reach) || other.reach == _this.reach)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.bulletSpeed, _this.bulletSpeed) || other.bulletSpeed == _this.bulletSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompanionStyleData;
  return Object.hash(runtimeType,_this.maxHp,_this.damage,_this.interval,_this.speedMultiplier,_this.preferredDistance,_this.reach,_this.range,_this.bulletSpeed);
}

@override
String toString() {
  final _this = this as CompanionStyleData;
  return 'CompanionStyleData(maxHp: ${_this.maxHp}, damage: ${_this.damage}, interval: ${_this.interval}, speedMultiplier: ${_this.speedMultiplier}, preferredDistance: ${_this.preferredDistance}, reach: ${_this.reach}, range: ${_this.range}, bulletSpeed: ${_this.bulletSpeed})';
}


}

/// @nodoc
abstract mixin class $CompanionStyleDataCopyWith<$Res>  {
  factory $CompanionStyleDataCopyWith(CompanionStyleData value, $Res Function(CompanionStyleData) _then) = _$CompanionStyleDataCopyWithImpl;
@useResult
$Res call({
 double maxHp, double damage, double interval, double speedMultiplier, double preferredDistance, double reach, double range, double bulletSpeed
});




}
/// @nodoc
class _$CompanionStyleDataCopyWithImpl<$Res>
    implements $CompanionStyleDataCopyWith<$Res> {
  _$CompanionStyleDataCopyWithImpl(this._self, this._then);

  final CompanionStyleData _self;
  final $Res Function(CompanionStyleData) _then;

/// Create a copy of CompanionStyleData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maxHp = null,Object? damage = null,Object? interval = null,Object? speedMultiplier = null,Object? preferredDistance = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,}) {
  return _then(CompanionStyleData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,preferredDistance: null == preferredDistance ? _self.preferredDistance : preferredDistance // ignore: cast_nullable_to_non_nullable
as double,reach: null == reach ? _self.reach : reach // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanionStyleData].
extension CompanionStyleDataPatterns on CompanionStyleData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanionStyleData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanionStyleData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanionStyleData value)  $default,){
final _that = this;
switch (_that) {
case _CompanionStyleData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanionStyleData value)?  $default,){
final _that = this;
switch (_that) {
case _CompanionStyleData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double maxHp,  double damage,  double interval,  double speedMultiplier,  double preferredDistance,  double reach,  double range,  double bulletSpeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanionStyleData() when $default != null:
return $default(_that.maxHp,_that.damage,_that.interval,_that.speedMultiplier,_that.preferredDistance,_that.reach,_that.range,_that.bulletSpeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double maxHp,  double damage,  double interval,  double speedMultiplier,  double preferredDistance,  double reach,  double range,  double bulletSpeed)  $default,) {final _that = this;
switch (_that) {
case _CompanionStyleData():
return $default(_that.maxHp,_that.damage,_that.interval,_that.speedMultiplier,_that.preferredDistance,_that.reach,_that.range,_that.bulletSpeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double maxHp,  double damage,  double interval,  double speedMultiplier,  double preferredDistance,  double reach,  double range,  double bulletSpeed)?  $default,) {final _that = this;
switch (_that) {
case _CompanionStyleData() when $default != null:
return $default(_that.maxHp,_that.damage,_that.interval,_that.speedMultiplier,_that.preferredDistance,_that.reach,_that.range,_that.bulletSpeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanionStyleData implements CompanionStyleData {
  const _CompanionStyleData({required this.maxHp, required this.damage, required this.interval, required this.speedMultiplier, required this.preferredDistance, this.reach = 0.0, this.range = 0.0, this.bulletSpeed = 0.0});
  factory _CompanionStyleData.fromJson(Map<String, dynamic> json) => _$CompanionStyleDataFromJson(json);

@override final  double maxHp;
@override final  double damage;
/// Seconds between attacks.
@override final  double interval;
/// Speed share of the player's.
@override final  double speedMultiplier;
/// The gap it keeps: melee next to the enemy, ranged back from it,
/// guard this far out from the player toward the enemy.
@override final  double preferredDistance;
@override@JsonKey() final  double reach;
@override@JsonKey() final  double range;
@override@JsonKey() final  double bulletSpeed;

/// Create a copy of CompanionStyleData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanionStyleDataCopyWith<_CompanionStyleData> get copyWith => __$CompanionStyleDataCopyWithImpl<_CompanionStyleData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanionStyleDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanionStyleData&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.speedMultiplier, speedMultiplier) || other.speedMultiplier == speedMultiplier)&&(identical(other.preferredDistance, preferredDistance) || other.preferredDistance == preferredDistance)&&(identical(other.reach, reach) || other.reach == reach)&&(identical(other.range, range) || other.range == range)&&(identical(other.bulletSpeed, bulletSpeed) || other.bulletSpeed == bulletSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,maxHp,damage,interval,speedMultiplier,preferredDistance,reach,range,bulletSpeed);
}

@override
String toString() {
    return 'CompanionStyleData(maxHp: $maxHp, damage: $damage, interval: $interval, speedMultiplier: $speedMultiplier, preferredDistance: $preferredDistance, reach: $reach, range: $range, bulletSpeed: $bulletSpeed)';
}


}

/// @nodoc
abstract mixin class _$CompanionStyleDataCopyWith<$Res> implements $CompanionStyleDataCopyWith<$Res> {
  factory _$CompanionStyleDataCopyWith(_CompanionStyleData value, $Res Function(_CompanionStyleData) _then) = __$CompanionStyleDataCopyWithImpl;
@override @useResult
$Res call({
 double maxHp, double damage, double interval, double speedMultiplier, double preferredDistance, double reach, double range, double bulletSpeed
});




}
/// @nodoc
class __$CompanionStyleDataCopyWithImpl<$Res>
    implements _$CompanionStyleDataCopyWith<$Res> {
  __$CompanionStyleDataCopyWithImpl(this._self, this._then);

  final _CompanionStyleData _self;
  final $Res Function(_CompanionStyleData) _then;

/// Create a copy of CompanionStyleData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maxHp = null,Object? damage = null,Object? interval = null,Object? speedMultiplier = null,Object? preferredDistance = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,}) {
  return _then(_CompanionStyleData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,preferredDistance: null == preferredDistance ? _self.preferredDistance : preferredDistance // ignore: cast_nullable_to_non_nullable
as double,reach: null == reach ? _self.reach : reach // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$WeaponData {

 String get id;/// Auto-aim reach.
 double get range;/// Seconds between shots.
 double get interval; double get damage; double get bulletSpeed;/// Shots per trigger, fanned evenly over [spreadDegrees]; a single shot
/// wobbles randomly within it.
 int get pellets; double get spreadDegrees;/// Seconds of aiming at one target before a shot; switching targets
/// starts over. Zero fires right away.
 double get aimSeconds;
/// Create a copy of WeaponData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeaponDataCopyWith<WeaponData> get copyWith => _$WeaponDataCopyWithImpl<WeaponData>(this as WeaponData, _$identity);

  /// Serializes this WeaponData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeaponData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeaponData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.interval, _this.interval) || other.interval == _this.interval)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.bulletSpeed, _this.bulletSpeed) || other.bulletSpeed == _this.bulletSpeed)&&(identical(other.pellets, _this.pellets) || other.pellets == _this.pellets)&&(identical(other.spreadDegrees, _this.spreadDegrees) || other.spreadDegrees == _this.spreadDegrees)&&(identical(other.aimSeconds, _this.aimSeconds) || other.aimSeconds == _this.aimSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeaponData;
  return Object.hash(runtimeType,_this.id,_this.range,_this.interval,_this.damage,_this.bulletSpeed,_this.pellets,_this.spreadDegrees,_this.aimSeconds);
}

@override
String toString() {
  final _this = this as WeaponData;
  return 'WeaponData(id: ${_this.id}, range: ${_this.range}, interval: ${_this.interval}, damage: ${_this.damage}, bulletSpeed: ${_this.bulletSpeed}, pellets: ${_this.pellets}, spreadDegrees: ${_this.spreadDegrees}, aimSeconds: ${_this.aimSeconds})';
}


}

/// @nodoc
abstract mixin class $WeaponDataCopyWith<$Res>  {
  factory $WeaponDataCopyWith(WeaponData value, $Res Function(WeaponData) _then) = _$WeaponDataCopyWithImpl;
@useResult
$Res call({
 String id, double range, double interval, double damage, double bulletSpeed, int pellets, double spreadDegrees, double aimSeconds
});




}
/// @nodoc
class _$WeaponDataCopyWithImpl<$Res>
    implements $WeaponDataCopyWith<$Res> {
  _$WeaponDataCopyWithImpl(this._self, this._then);

  final WeaponData _self;
  final $Res Function(WeaponData) _then;

/// Create a copy of WeaponData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? range = null,Object? interval = null,Object? damage = null,Object? bulletSpeed = null,Object? pellets = null,Object? spreadDegrees = null,Object? aimSeconds = null,}) {
  return _then(WeaponData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,pellets: null == pellets ? _self.pellets : pellets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,aimSeconds: null == aimSeconds ? _self.aimSeconds : aimSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WeaponData].
extension WeaponDataPatterns on WeaponData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeaponData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeaponData value)  $default,){
final _that = this;
switch (_that) {
case _WeaponData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeaponData value)?  $default,){
final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds)  $default,) {final _that = this;
switch (_that) {
case _WeaponData():
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds)?  $default,) {final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeaponData implements WeaponData {
  const _WeaponData({required this.id, required this.range, required this.interval, required this.damage, required this.bulletSpeed, this.pellets = 1, this.spreadDegrees = 0.0, this.aimSeconds = 0.0});
  factory _WeaponData.fromJson(Map<String, dynamic> json) => _$WeaponDataFromJson(json);

@override final  String id;
/// Auto-aim reach.
@override final  double range;
/// Seconds between shots.
@override final  double interval;
@override final  double damage;
@override final  double bulletSpeed;
/// Shots per trigger, fanned evenly over [spreadDegrees]; a single shot
/// wobbles randomly within it.
@override@JsonKey() final  int pellets;
@override@JsonKey() final  double spreadDegrees;
/// Seconds of aiming at one target before a shot; switching targets
/// starts over. Zero fires right away.
@override@JsonKey() final  double aimSeconds;

/// Create a copy of WeaponData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeaponDataCopyWith<_WeaponData> get copyWith => __$WeaponDataCopyWithImpl<_WeaponData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeaponDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeaponData&&(identical(other.id, id) || other.id == id)&&(identical(other.range, range) || other.range == range)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.bulletSpeed, bulletSpeed) || other.bulletSpeed == bulletSpeed)&&(identical(other.pellets, pellets) || other.pellets == pellets)&&(identical(other.spreadDegrees, spreadDegrees) || other.spreadDegrees == spreadDegrees)&&(identical(other.aimSeconds, aimSeconds) || other.aimSeconds == aimSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,range,interval,damage,bulletSpeed,pellets,spreadDegrees,aimSeconds);
}

@override
String toString() {
    return 'WeaponData(id: $id, range: $range, interval: $interval, damage: $damage, bulletSpeed: $bulletSpeed, pellets: $pellets, spreadDegrees: $spreadDegrees, aimSeconds: $aimSeconds)';
}


}

/// @nodoc
abstract mixin class _$WeaponDataCopyWith<$Res> implements $WeaponDataCopyWith<$Res> {
  factory _$WeaponDataCopyWith(_WeaponData value, $Res Function(_WeaponData) _then) = __$WeaponDataCopyWithImpl;
@override @useResult
$Res call({
 String id, double range, double interval, double damage, double bulletSpeed, int pellets, double spreadDegrees, double aimSeconds
});




}
/// @nodoc
class __$WeaponDataCopyWithImpl<$Res>
    implements _$WeaponDataCopyWith<$Res> {
  __$WeaponDataCopyWithImpl(this._self, this._then);

  final _WeaponData _self;
  final $Res Function(_WeaponData) _then;

/// Create a copy of WeaponData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? range = null,Object? interval = null,Object? damage = null,Object? bulletSpeed = null,Object? pellets = null,Object? spreadDegrees = null,Object? aimSeconds = null,}) {
  return _then(_WeaponData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,pellets: null == pellets ? _self.pellets : pellets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,aimSeconds: null == aimSeconds ? _self.aimSeconds : aimSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$EnemyData {

 String get id; EnemyTemper get temper; EnemyAttack get attack; double get maxHp; double get radius; double get damage; double get attackInterval;/// Melee: gap between bodies within which it hits.
 double get reach;/// Ranged: shooting distance.
 double get range; double get bulletSpeed;
/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnemyDataCopyWith<EnemyData> get copyWith => _$EnemyDataCopyWithImpl<EnemyData>(this as EnemyData, _$identity);

  /// Serializes this EnemyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EnemyData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnemyData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.temper, _this.temper) || other.temper == _this.temper)&&(identical(other.attack, _this.attack) || other.attack == _this.attack)&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.attackInterval, _this.attackInterval) || other.attackInterval == _this.attackInterval)&&(identical(other.reach, _this.reach) || other.reach == _this.reach)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.bulletSpeed, _this.bulletSpeed) || other.bulletSpeed == _this.bulletSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EnemyData;
  return Object.hash(runtimeType,_this.id,_this.temper,_this.attack,_this.maxHp,_this.radius,_this.damage,_this.attackInterval,_this.reach,_this.range,_this.bulletSpeed);
}

@override
String toString() {
  final _this = this as EnemyData;
  return 'EnemyData(id: ${_this.id}, temper: ${_this.temper}, attack: ${_this.attack}, maxHp: ${_this.maxHp}, radius: ${_this.radius}, damage: ${_this.damage}, attackInterval: ${_this.attackInterval}, reach: ${_this.reach}, range: ${_this.range}, bulletSpeed: ${_this.bulletSpeed})';
}


}

/// @nodoc
abstract mixin class $EnemyDataCopyWith<$Res>  {
  factory $EnemyDataCopyWith(EnemyData value, $Res Function(EnemyData) _then) = _$EnemyDataCopyWithImpl;
@useResult
$Res call({
 String id, EnemyTemper temper, EnemyAttack attack, double maxHp, double radius, double damage, double attackInterval, double reach, double range, double bulletSpeed
});




}
/// @nodoc
class _$EnemyDataCopyWithImpl<$Res>
    implements $EnemyDataCopyWith<$Res> {
  _$EnemyDataCopyWithImpl(this._self, this._then);

  final EnemyData _self;
  final $Res Function(EnemyData) _then;

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? temper = null,Object? attack = null,Object? maxHp = null,Object? radius = null,Object? damage = null,Object? attackInterval = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,}) {
  return _then(EnemyData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,temper: null == temper ? _self.temper : temper // ignore: cast_nullable_to_non_nullable
as EnemyTemper,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as EnemyAttack,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,attackInterval: null == attackInterval ? _self.attackInterval : attackInterval // ignore: cast_nullable_to_non_nullable
as double,reach: null == reach ? _self.reach : reach // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EnemyData].
extension EnemyDataPatterns on EnemyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnemyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnemyData value)  $default,){
final _that = this;
switch (_that) {
case _EnemyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnemyData value)?  $default,){
final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed)  $default,) {final _that = this;
switch (_that) {
case _EnemyData():
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed)?  $default,) {final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnemyData implements EnemyData {
  const _EnemyData({required this.id, required this.temper, required this.attack, required this.maxHp, required this.radius, required this.damage, required this.attackInterval, this.reach = 0.0, this.range = 0.0, this.bulletSpeed = 0.0});
  factory _EnemyData.fromJson(Map<String, dynamic> json) => _$EnemyDataFromJson(json);

@override final  String id;
@override final  EnemyTemper temper;
@override final  EnemyAttack attack;
@override final  double maxHp;
@override final  double radius;
@override final  double damage;
@override final  double attackInterval;
/// Melee: gap between bodies within which it hits.
@override@JsonKey() final  double reach;
/// Ranged: shooting distance.
@override@JsonKey() final  double range;
@override@JsonKey() final  double bulletSpeed;

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnemyDataCopyWith<_EnemyData> get copyWith => __$EnemyDataCopyWithImpl<_EnemyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnemyDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnemyData&&(identical(other.id, id) || other.id == id)&&(identical(other.temper, temper) || other.temper == temper)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.attackInterval, attackInterval) || other.attackInterval == attackInterval)&&(identical(other.reach, reach) || other.reach == reach)&&(identical(other.range, range) || other.range == range)&&(identical(other.bulletSpeed, bulletSpeed) || other.bulletSpeed == bulletSpeed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,temper,attack,maxHp,radius,damage,attackInterval,reach,range,bulletSpeed);
}

@override
String toString() {
    return 'EnemyData(id: $id, temper: $temper, attack: $attack, maxHp: $maxHp, radius: $radius, damage: $damage, attackInterval: $attackInterval, reach: $reach, range: $range, bulletSpeed: $bulletSpeed)';
}


}

/// @nodoc
abstract mixin class _$EnemyDataCopyWith<$Res> implements $EnemyDataCopyWith<$Res> {
  factory _$EnemyDataCopyWith(_EnemyData value, $Res Function(_EnemyData) _then) = __$EnemyDataCopyWithImpl;
@override @useResult
$Res call({
 String id, EnemyTemper temper, EnemyAttack attack, double maxHp, double radius, double damage, double attackInterval, double reach, double range, double bulletSpeed
});




}
/// @nodoc
class __$EnemyDataCopyWithImpl<$Res>
    implements _$EnemyDataCopyWith<$Res> {
  __$EnemyDataCopyWithImpl(this._self, this._then);

  final _EnemyData _self;
  final $Res Function(_EnemyData) _then;

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? temper = null,Object? attack = null,Object? maxHp = null,Object? radius = null,Object? damage = null,Object? attackInterval = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,}) {
  return _then(_EnemyData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,temper: null == temper ? _self.temper : temper // ignore: cast_nullable_to_non_nullable
as EnemyTemper,attack: null == attack ? _self.attack : attack // ignore: cast_nullable_to_non_nullable
as EnemyAttack,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,attackInterval: null == attackInterval ? _self.attackInterval : attackInterval // ignore: cast_nullable_to_non_nullable
as double,reach: null == reach ? _self.reach : reach // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ZoneData {

 String get id;/// The region score: the level of the seeds found here.
 int get score; MapRecipe get map; ZoneEnemiesData get enemies; ZoneGatheringData get gathering; ZoneDropsData get drops;/// Set for a danger zone: leaving takes an open exit and a signal, and
/// failing loses what was brought. Null for a safe zone.
 ZoneDangerData? get danger;
/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneDataCopyWith<ZoneData> get copyWith => _$ZoneDataCopyWithImpl<ZoneData>(this as ZoneData, _$identity);

  /// Serializes this ZoneData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.map, _this.map) || other.map == _this.map)&&(identical(other.enemies, _this.enemies) || other.enemies == _this.enemies)&&(identical(other.gathering, _this.gathering) || other.gathering == _this.gathering)&&(identical(other.drops, _this.drops) || other.drops == _this.drops)&&(identical(other.danger, _this.danger) || other.danger == _this.danger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneData;
  return Object.hash(runtimeType,_this.id,_this.score,_this.map,_this.enemies,_this.gathering,_this.drops,_this.danger);
}

@override
String toString() {
  final _this = this as ZoneData;
  return 'ZoneData(id: ${_this.id}, score: ${_this.score}, map: ${_this.map}, enemies: ${_this.enemies}, gathering: ${_this.gathering}, drops: ${_this.drops}, danger: ${_this.danger})';
}


}

/// @nodoc
abstract mixin class $ZoneDataCopyWith<$Res>  {
  factory $ZoneDataCopyWith(ZoneData value, $Res Function(ZoneData) _then) = _$ZoneDataCopyWithImpl;
@useResult
$Res call({
 String id, int score, MapRecipe map, ZoneEnemiesData enemies, ZoneGatheringData gathering, ZoneDropsData drops, ZoneDangerData? danger
});


$MapRecipeCopyWith<$Res> get map;$ZoneEnemiesDataCopyWith<$Res> get enemies;$ZoneGatheringDataCopyWith<$Res> get gathering;$ZoneDropsDataCopyWith<$Res> get drops;$ZoneDangerDataCopyWith<$Res>? get danger;

}
/// @nodoc
class _$ZoneDataCopyWithImpl<$Res>
    implements $ZoneDataCopyWith<$Res> {
  _$ZoneDataCopyWithImpl(this._self, this._then);

  final ZoneData _self;
  final $Res Function(ZoneData) _then;

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? score = null,Object? map = null,Object? enemies = null,Object? gathering = null,Object? drops = null,Object? danger = freezed,}) {
  return _then(ZoneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as MapRecipe,enemies: null == enemies ? _self.enemies : enemies // ignore: cast_nullable_to_non_nullable
as ZoneEnemiesData,gathering: null == gathering ? _self.gathering : gathering // ignore: cast_nullable_to_non_nullable
as ZoneGatheringData,drops: null == drops ? _self.drops : drops // ignore: cast_nullable_to_non_nullable
as ZoneDropsData,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as ZoneDangerData?,
  ));
}
/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapRecipeCopyWith<$Res> get map {
  
  return $MapRecipeCopyWith<$Res>(_self.map, (value) {
    return _then(_self.copyWith(map: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneEnemiesDataCopyWith<$Res> get enemies {
  
  return $ZoneEnemiesDataCopyWith<$Res>(_self.enemies, (value) {
    return _then(_self.copyWith(enemies: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneGatheringDataCopyWith<$Res> get gathering {
  
  return $ZoneGatheringDataCopyWith<$Res>(_self.gathering, (value) {
    return _then(_self.copyWith(gathering: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneDropsDataCopyWith<$Res> get drops {
  
  return $ZoneDropsDataCopyWith<$Res>(_self.drops, (value) {
    return _then(_self.copyWith(drops: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneDangerDataCopyWith<$Res>? get danger {
    if (_self.danger == null) {
    return null;
  }

  return $ZoneDangerDataCopyWith<$Res>(_self.danger!, (value) {
    return _then(_self.copyWith(danger: value));
  });
}
}


/// Adds pattern-matching-related methods to [ZoneData].
extension ZoneDataPatterns on ZoneData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int score,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
return $default(_that.id,_that.score,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int score,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger)  $default,) {final _that = this;
switch (_that) {
case _ZoneData():
return $default(_that.id,_that.score,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int score,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger)?  $default,) {final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
return $default(_that.id,_that.score,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneData implements ZoneData {
  const _ZoneData({required this.id, required this.score, required this.map, required this.enemies, required this.gathering, required this.drops, this.danger});
  factory _ZoneData.fromJson(Map<String, dynamic> json) => _$ZoneDataFromJson(json);

@override final  String id;
/// The region score: the level of the seeds found here.
@override final  int score;
@override final  MapRecipe map;
@override final  ZoneEnemiesData enemies;
@override final  ZoneGatheringData gathering;
@override final  ZoneDropsData drops;
/// Set for a danger zone: leaving takes an open exit and a signal, and
/// failing loses what was brought. Null for a safe zone.
@override final  ZoneDangerData? danger;

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneDataCopyWith<_ZoneData> get copyWith => __$ZoneDataCopyWithImpl<_ZoneData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneData&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.map, map) || other.map == map)&&(identical(other.enemies, enemies) || other.enemies == enemies)&&(identical(other.gathering, gathering) || other.gathering == gathering)&&(identical(other.drops, drops) || other.drops == drops)&&(identical(other.danger, danger) || other.danger == danger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,score,map,enemies,gathering,drops,danger);
}

@override
String toString() {
    return 'ZoneData(id: $id, score: $score, map: $map, enemies: $enemies, gathering: $gathering, drops: $drops, danger: $danger)';
}


}

/// @nodoc
abstract mixin class _$ZoneDataCopyWith<$Res> implements $ZoneDataCopyWith<$Res> {
  factory _$ZoneDataCopyWith(_ZoneData value, $Res Function(_ZoneData) _then) = __$ZoneDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int score, MapRecipe map, ZoneEnemiesData enemies, ZoneGatheringData gathering, ZoneDropsData drops, ZoneDangerData? danger
});


@override $MapRecipeCopyWith<$Res> get map;@override $ZoneEnemiesDataCopyWith<$Res> get enemies;@override $ZoneGatheringDataCopyWith<$Res> get gathering;@override $ZoneDropsDataCopyWith<$Res> get drops;@override $ZoneDangerDataCopyWith<$Res>? get danger;

}
/// @nodoc
class __$ZoneDataCopyWithImpl<$Res>
    implements _$ZoneDataCopyWith<$Res> {
  __$ZoneDataCopyWithImpl(this._self, this._then);

  final _ZoneData _self;
  final $Res Function(_ZoneData) _then;

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? score = null,Object? map = null,Object? enemies = null,Object? gathering = null,Object? drops = null,Object? danger = freezed,}) {
  return _then(_ZoneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as MapRecipe,enemies: null == enemies ? _self.enemies : enemies // ignore: cast_nullable_to_non_nullable
as ZoneEnemiesData,gathering: null == gathering ? _self.gathering : gathering // ignore: cast_nullable_to_non_nullable
as ZoneGatheringData,drops: null == drops ? _self.drops : drops // ignore: cast_nullable_to_non_nullable
as ZoneDropsData,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as ZoneDangerData?,
  ));
}

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapRecipeCopyWith<$Res> get map {
  
  return $MapRecipeCopyWith<$Res>(_self.map, (value) {
    return _then(_self.copyWith(map: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneEnemiesDataCopyWith<$Res> get enemies {
  
  return $ZoneEnemiesDataCopyWith<$Res>(_self.enemies, (value) {
    return _then(_self.copyWith(enemies: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneGatheringDataCopyWith<$Res> get gathering {
  
  return $ZoneGatheringDataCopyWith<$Res>(_self.gathering, (value) {
    return _then(_self.copyWith(gathering: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneDropsDataCopyWith<$Res> get drops {
  
  return $ZoneDropsDataCopyWith<$Res>(_self.drops, (value) {
    return _then(_self.copyWith(drops: value));
  });
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneDangerDataCopyWith<$Res>? get danger {
    if (_self.danger == null) {
    return null;
  }

  return $ZoneDangerDataCopyWith<$Res>(_self.danger!, (value) {
    return _then(_self.copyWith(danger: value));
  });
}
}


/// @nodoc
mixin _$ZoneEnemiesData {

/// Lone enemies, each picked by weight from [kinds].
 int get count; List<WeightedEnemyData> get kinds;/// Groups standing close together.
 int get packs; int get packSizeMin; int get packSizeMax; List<String> get packKinds;/// No enemy starts closer than this to the entry.
 double get keepAway;/// Shares of the player's sight and speed.
 double get sightMultiplier; double get speedMultiplier;/// Shares of each kind's health and damage: the same enemies, stronger
/// in harder zones.
 double get hpMultiplier; double get damageMultiplier;
/// Create a copy of ZoneEnemiesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneEnemiesDataCopyWith<ZoneEnemiesData> get copyWith => _$ZoneEnemiesDataCopyWithImpl<ZoneEnemiesData>(this as ZoneEnemiesData, _$identity);

  /// Serializes this ZoneEnemiesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneEnemiesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneEnemiesData&&(identical(other.count, _this.count) || other.count == _this.count)&&const DeepCollectionEquality().equals(other.kinds, _this.kinds)&&(identical(other.packs, _this.packs) || other.packs == _this.packs)&&(identical(other.packSizeMin, _this.packSizeMin) || other.packSizeMin == _this.packSizeMin)&&(identical(other.packSizeMax, _this.packSizeMax) || other.packSizeMax == _this.packSizeMax)&&const DeepCollectionEquality().equals(other.packKinds, _this.packKinds)&&(identical(other.keepAway, _this.keepAway) || other.keepAway == _this.keepAway)&&(identical(other.sightMultiplier, _this.sightMultiplier) || other.sightMultiplier == _this.sightMultiplier)&&(identical(other.speedMultiplier, _this.speedMultiplier) || other.speedMultiplier == _this.speedMultiplier)&&(identical(other.hpMultiplier, _this.hpMultiplier) || other.hpMultiplier == _this.hpMultiplier)&&(identical(other.damageMultiplier, _this.damageMultiplier) || other.damageMultiplier == _this.damageMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneEnemiesData;
  return Object.hash(runtimeType,_this.count,const DeepCollectionEquality().hash(_this.kinds),_this.packs,_this.packSizeMin,_this.packSizeMax,const DeepCollectionEquality().hash(_this.packKinds),_this.keepAway,_this.sightMultiplier,_this.speedMultiplier,_this.hpMultiplier,_this.damageMultiplier);
}

@override
String toString() {
  final _this = this as ZoneEnemiesData;
  return 'ZoneEnemiesData(count: ${_this.count}, kinds: ${_this.kinds}, packs: ${_this.packs}, packSizeMin: ${_this.packSizeMin}, packSizeMax: ${_this.packSizeMax}, packKinds: ${_this.packKinds}, keepAway: ${_this.keepAway}, sightMultiplier: ${_this.sightMultiplier}, speedMultiplier: ${_this.speedMultiplier}, hpMultiplier: ${_this.hpMultiplier}, damageMultiplier: ${_this.damageMultiplier})';
}


}

/// @nodoc
abstract mixin class $ZoneEnemiesDataCopyWith<$Res>  {
  factory $ZoneEnemiesDataCopyWith(ZoneEnemiesData value, $Res Function(ZoneEnemiesData) _then) = _$ZoneEnemiesDataCopyWithImpl;
@useResult
$Res call({
 int count, List<WeightedEnemyData> kinds, int packs, int packSizeMin, int packSizeMax, List<String> packKinds, double keepAway, double sightMultiplier, double speedMultiplier, double hpMultiplier, double damageMultiplier
});




}
/// @nodoc
class _$ZoneEnemiesDataCopyWithImpl<$Res>
    implements $ZoneEnemiesDataCopyWith<$Res> {
  _$ZoneEnemiesDataCopyWithImpl(this._self, this._then);

  final ZoneEnemiesData _self;
  final $Res Function(ZoneEnemiesData) _then;

/// Create a copy of ZoneEnemiesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? kinds = null,Object? packs = null,Object? packSizeMin = null,Object? packSizeMax = null,Object? packKinds = null,Object? keepAway = null,Object? sightMultiplier = null,Object? speedMultiplier = null,Object? hpMultiplier = null,Object? damageMultiplier = null,}) {
  return _then(ZoneEnemiesData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,kinds: null == kinds ? _self.kinds : kinds // ignore: cast_nullable_to_non_nullable
as List<WeightedEnemyData>,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,packSizeMin: null == packSizeMin ? _self.packSizeMin : packSizeMin // ignore: cast_nullable_to_non_nullable
as int,packSizeMax: null == packSizeMax ? _self.packSizeMax : packSizeMax // ignore: cast_nullable_to_non_nullable
as int,packKinds: null == packKinds ? _self.packKinds : packKinds // ignore: cast_nullable_to_non_nullable
as List<String>,keepAway: null == keepAway ? _self.keepAway : keepAway // ignore: cast_nullable_to_non_nullable
as double,sightMultiplier: null == sightMultiplier ? _self.sightMultiplier : sightMultiplier // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,hpMultiplier: null == hpMultiplier ? _self.hpMultiplier : hpMultiplier // ignore: cast_nullable_to_non_nullable
as double,damageMultiplier: null == damageMultiplier ? _self.damageMultiplier : damageMultiplier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneEnemiesData].
extension ZoneEnemiesDataPatterns on ZoneEnemiesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneEnemiesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneEnemiesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneEnemiesData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneEnemiesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneEnemiesData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneEnemiesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  List<WeightedEnemyData> kinds,  int packs,  int packSizeMin,  int packSizeMax,  List<String> packKinds,  double keepAway,  double sightMultiplier,  double speedMultiplier,  double hpMultiplier,  double damageMultiplier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneEnemiesData() when $default != null:
return $default(_that.count,_that.kinds,_that.packs,_that.packSizeMin,_that.packSizeMax,_that.packKinds,_that.keepAway,_that.sightMultiplier,_that.speedMultiplier,_that.hpMultiplier,_that.damageMultiplier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  List<WeightedEnemyData> kinds,  int packs,  int packSizeMin,  int packSizeMax,  List<String> packKinds,  double keepAway,  double sightMultiplier,  double speedMultiplier,  double hpMultiplier,  double damageMultiplier)  $default,) {final _that = this;
switch (_that) {
case _ZoneEnemiesData():
return $default(_that.count,_that.kinds,_that.packs,_that.packSizeMin,_that.packSizeMax,_that.packKinds,_that.keepAway,_that.sightMultiplier,_that.speedMultiplier,_that.hpMultiplier,_that.damageMultiplier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  List<WeightedEnemyData> kinds,  int packs,  int packSizeMin,  int packSizeMax,  List<String> packKinds,  double keepAway,  double sightMultiplier,  double speedMultiplier,  double hpMultiplier,  double damageMultiplier)?  $default,) {final _that = this;
switch (_that) {
case _ZoneEnemiesData() when $default != null:
return $default(_that.count,_that.kinds,_that.packs,_that.packSizeMin,_that.packSizeMax,_that.packKinds,_that.keepAway,_that.sightMultiplier,_that.speedMultiplier,_that.hpMultiplier,_that.damageMultiplier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneEnemiesData implements ZoneEnemiesData {
  const _ZoneEnemiesData({required this.count, required  List<WeightedEnemyData> kinds, this.packs = 0, this.packSizeMin = 0, this.packSizeMax = 0,  List<String> packKinds = const <String>[], required this.keepAway, required this.sightMultiplier, required this.speedMultiplier, this.hpMultiplier = 1.0, this.damageMultiplier = 1.0}): _kinds = kinds,_packKinds = packKinds;
  factory _ZoneEnemiesData.fromJson(Map<String, dynamic> json) => _$ZoneEnemiesDataFromJson(json);

/// Lone enemies, each picked by weight from [kinds].
@override final  int count;
 final  List<WeightedEnemyData> _kinds;
@override List<WeightedEnemyData> get kinds {
  if (_kinds is EqualUnmodifiableListView) return _kinds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_kinds);
}

/// Groups standing close together.
@override@JsonKey() final  int packs;
@override@JsonKey() final  int packSizeMin;
@override@JsonKey() final  int packSizeMax;
 final  List<String> _packKinds;
@override@JsonKey() List<String> get packKinds {
  if (_packKinds is EqualUnmodifiableListView) return _packKinds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packKinds);
}

/// No enemy starts closer than this to the entry.
@override final  double keepAway;
/// Shares of the player's sight and speed.
@override final  double sightMultiplier;
@override final  double speedMultiplier;
/// Shares of each kind's health and damage: the same enemies, stronger
/// in harder zones.
@override@JsonKey() final  double hpMultiplier;
@override@JsonKey() final  double damageMultiplier;

/// Create a copy of ZoneEnemiesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneEnemiesDataCopyWith<_ZoneEnemiesData> get copyWith => __$ZoneEnemiesDataCopyWithImpl<_ZoneEnemiesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneEnemiesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneEnemiesData&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.kinds, _kinds)&&(identical(other.packs, packs) || other.packs == packs)&&(identical(other.packSizeMin, packSizeMin) || other.packSizeMin == packSizeMin)&&(identical(other.packSizeMax, packSizeMax) || other.packSizeMax == packSizeMax)&&const DeepCollectionEquality().equals(other.packKinds, _packKinds)&&(identical(other.keepAway, keepAway) || other.keepAway == keepAway)&&(identical(other.sightMultiplier, sightMultiplier) || other.sightMultiplier == sightMultiplier)&&(identical(other.speedMultiplier, speedMultiplier) || other.speedMultiplier == speedMultiplier)&&(identical(other.hpMultiplier, hpMultiplier) || other.hpMultiplier == hpMultiplier)&&(identical(other.damageMultiplier, damageMultiplier) || other.damageMultiplier == damageMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,count,const DeepCollectionEquality().hash(_kinds),packs,packSizeMin,packSizeMax,const DeepCollectionEquality().hash(_packKinds),keepAway,sightMultiplier,speedMultiplier,hpMultiplier,damageMultiplier);
}

@override
String toString() {
    return 'ZoneEnemiesData(count: $count, kinds: $kinds, packs: $packs, packSizeMin: $packSizeMin, packSizeMax: $packSizeMax, packKinds: $packKinds, keepAway: $keepAway, sightMultiplier: $sightMultiplier, speedMultiplier: $speedMultiplier, hpMultiplier: $hpMultiplier, damageMultiplier: $damageMultiplier)';
}


}

/// @nodoc
abstract mixin class _$ZoneEnemiesDataCopyWith<$Res> implements $ZoneEnemiesDataCopyWith<$Res> {
  factory _$ZoneEnemiesDataCopyWith(_ZoneEnemiesData value, $Res Function(_ZoneEnemiesData) _then) = __$ZoneEnemiesDataCopyWithImpl;
@override @useResult
$Res call({
 int count, List<WeightedEnemyData> kinds, int packs, int packSizeMin, int packSizeMax, List<String> packKinds, double keepAway, double sightMultiplier, double speedMultiplier, double hpMultiplier, double damageMultiplier
});




}
/// @nodoc
class __$ZoneEnemiesDataCopyWithImpl<$Res>
    implements _$ZoneEnemiesDataCopyWith<$Res> {
  __$ZoneEnemiesDataCopyWithImpl(this._self, this._then);

  final _ZoneEnemiesData _self;
  final $Res Function(_ZoneEnemiesData) _then;

/// Create a copy of ZoneEnemiesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? kinds = null,Object? packs = null,Object? packSizeMin = null,Object? packSizeMax = null,Object? packKinds = null,Object? keepAway = null,Object? sightMultiplier = null,Object? speedMultiplier = null,Object? hpMultiplier = null,Object? damageMultiplier = null,}) {
  return _then(_ZoneEnemiesData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,kinds: null == kinds ? _self._kinds : kinds // ignore: cast_nullable_to_non_nullable
as List<WeightedEnemyData>,packs: null == packs ? _self.packs : packs // ignore: cast_nullable_to_non_nullable
as int,packSizeMin: null == packSizeMin ? _self.packSizeMin : packSizeMin // ignore: cast_nullable_to_non_nullable
as int,packSizeMax: null == packSizeMax ? _self.packSizeMax : packSizeMax // ignore: cast_nullable_to_non_nullable
as int,packKinds: null == packKinds ? _self._packKinds : packKinds // ignore: cast_nullable_to_non_nullable
as List<String>,keepAway: null == keepAway ? _self.keepAway : keepAway // ignore: cast_nullable_to_non_nullable
as double,sightMultiplier: null == sightMultiplier ? _self.sightMultiplier : sightMultiplier // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,hpMultiplier: null == hpMultiplier ? _self.hpMultiplier : hpMultiplier // ignore: cast_nullable_to_non_nullable
as double,damageMultiplier: null == damageMultiplier ? _self.damageMultiplier : damageMultiplier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$WeightedEnemyData {

 String get enemy; int get weight;
/// Create a copy of WeightedEnemyData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightedEnemyDataCopyWith<WeightedEnemyData> get copyWith => _$WeightedEnemyDataCopyWithImpl<WeightedEnemyData>(this as WeightedEnemyData, _$identity);

  /// Serializes this WeightedEnemyData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeightedEnemyData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightedEnemyData&&(identical(other.enemy, _this.enemy) || other.enemy == _this.enemy)&&(identical(other.weight, _this.weight) || other.weight == _this.weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeightedEnemyData;
  return Object.hash(runtimeType,_this.enemy,_this.weight);
}

@override
String toString() {
  final _this = this as WeightedEnemyData;
  return 'WeightedEnemyData(enemy: ${_this.enemy}, weight: ${_this.weight})';
}


}

/// @nodoc
abstract mixin class $WeightedEnemyDataCopyWith<$Res>  {
  factory $WeightedEnemyDataCopyWith(WeightedEnemyData value, $Res Function(WeightedEnemyData) _then) = _$WeightedEnemyDataCopyWithImpl;
@useResult
$Res call({
 String enemy, int weight
});




}
/// @nodoc
class _$WeightedEnemyDataCopyWithImpl<$Res>
    implements $WeightedEnemyDataCopyWith<$Res> {
  _$WeightedEnemyDataCopyWithImpl(this._self, this._then);

  final WeightedEnemyData _self;
  final $Res Function(WeightedEnemyData) _then;

/// Create a copy of WeightedEnemyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enemy = null,Object? weight = null,}) {
  return _then(WeightedEnemyData(
enemy: null == enemy ? _self.enemy : enemy // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightedEnemyData].
extension WeightedEnemyDataPatterns on WeightedEnemyData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightedEnemyData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightedEnemyData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightedEnemyData value)  $default,){
final _that = this;
switch (_that) {
case _WeightedEnemyData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightedEnemyData value)?  $default,){
final _that = this;
switch (_that) {
case _WeightedEnemyData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String enemy,  int weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightedEnemyData() when $default != null:
return $default(_that.enemy,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String enemy,  int weight)  $default,) {final _that = this;
switch (_that) {
case _WeightedEnemyData():
return $default(_that.enemy,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String enemy,  int weight)?  $default,) {final _that = this;
switch (_that) {
case _WeightedEnemyData() when $default != null:
return $default(_that.enemy,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeightedEnemyData implements WeightedEnemyData {
  const _WeightedEnemyData({required this.enemy, required this.weight});
  factory _WeightedEnemyData.fromJson(Map<String, dynamic> json) => _$WeightedEnemyDataFromJson(json);

@override final  String enemy;
@override final  int weight;

/// Create a copy of WeightedEnemyData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightedEnemyDataCopyWith<_WeightedEnemyData> get copyWith => __$WeightedEnemyDataCopyWithImpl<_WeightedEnemyData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeightedEnemyDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightedEnemyData&&(identical(other.enemy, enemy) || other.enemy == enemy)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,enemy,weight);
}

@override
String toString() {
    return 'WeightedEnemyData(enemy: $enemy, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$WeightedEnemyDataCopyWith<$Res> implements $WeightedEnemyDataCopyWith<$Res> {
  factory _$WeightedEnemyDataCopyWith(_WeightedEnemyData value, $Res Function(_WeightedEnemyData) _then) = __$WeightedEnemyDataCopyWithImpl;
@override @useResult
$Res call({
 String enemy, int weight
});




}
/// @nodoc
class __$WeightedEnemyDataCopyWithImpl<$Res>
    implements _$WeightedEnemyDataCopyWith<$Res> {
  __$WeightedEnemyDataCopyWithImpl(this._self, this._then);

  final _WeightedEnemyData _self;
  final $Res Function(_WeightedEnemyData) _then;

/// Create a copy of WeightedEnemyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enemy = null,Object? weight = null,}) {
  return _then(_WeightedEnemyData(
enemy: null == enemy ? _self.enemy : enemy // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ZoneGatheringData {

 int get count;/// Least distance between two spots.
 double get spacing;/// Loot table id.
 String get loot;
/// Create a copy of ZoneGatheringData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneGatheringDataCopyWith<ZoneGatheringData> get copyWith => _$ZoneGatheringDataCopyWithImpl<ZoneGatheringData>(this as ZoneGatheringData, _$identity);

  /// Serializes this ZoneGatheringData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneGatheringData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneGatheringData&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.spacing, _this.spacing) || other.spacing == _this.spacing)&&(identical(other.loot, _this.loot) || other.loot == _this.loot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneGatheringData;
  return Object.hash(runtimeType,_this.count,_this.spacing,_this.loot);
}

@override
String toString() {
  final _this = this as ZoneGatheringData;
  return 'ZoneGatheringData(count: ${_this.count}, spacing: ${_this.spacing}, loot: ${_this.loot})';
}


}

/// @nodoc
abstract mixin class $ZoneGatheringDataCopyWith<$Res>  {
  factory $ZoneGatheringDataCopyWith(ZoneGatheringData value, $Res Function(ZoneGatheringData) _then) = _$ZoneGatheringDataCopyWithImpl;
@useResult
$Res call({
 int count, double spacing, String loot
});




}
/// @nodoc
class _$ZoneGatheringDataCopyWithImpl<$Res>
    implements $ZoneGatheringDataCopyWith<$Res> {
  _$ZoneGatheringDataCopyWithImpl(this._self, this._then);

  final ZoneGatheringData _self;
  final $Res Function(ZoneGatheringData) _then;

/// Create a copy of ZoneGatheringData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? spacing = null,Object? loot = null,}) {
  return _then(ZoneGatheringData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,loot: null == loot ? _self.loot : loot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneGatheringData].
extension ZoneGatheringDataPatterns on ZoneGatheringData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneGatheringData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneGatheringData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneGatheringData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneGatheringData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneGatheringData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneGatheringData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  double spacing,  String loot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneGatheringData() when $default != null:
return $default(_that.count,_that.spacing,_that.loot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  double spacing,  String loot)  $default,) {final _that = this;
switch (_that) {
case _ZoneGatheringData():
return $default(_that.count,_that.spacing,_that.loot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  double spacing,  String loot)?  $default,) {final _that = this;
switch (_that) {
case _ZoneGatheringData() when $default != null:
return $default(_that.count,_that.spacing,_that.loot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneGatheringData implements ZoneGatheringData {
  const _ZoneGatheringData({required this.count, required this.spacing, required this.loot});
  factory _ZoneGatheringData.fromJson(Map<String, dynamic> json) => _$ZoneGatheringDataFromJson(json);

@override final  int count;
/// Least distance between two spots.
@override final  double spacing;
/// Loot table id.
@override final  String loot;

/// Create a copy of ZoneGatheringData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneGatheringDataCopyWith<_ZoneGatheringData> get copyWith => __$ZoneGatheringDataCopyWithImpl<_ZoneGatheringData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneGatheringDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneGatheringData&&(identical(other.count, count) || other.count == count)&&(identical(other.spacing, spacing) || other.spacing == spacing)&&(identical(other.loot, loot) || other.loot == loot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,count,spacing,loot);
}

@override
String toString() {
    return 'ZoneGatheringData(count: $count, spacing: $spacing, loot: $loot)';
}


}

/// @nodoc
abstract mixin class _$ZoneGatheringDataCopyWith<$Res> implements $ZoneGatheringDataCopyWith<$Res> {
  factory _$ZoneGatheringDataCopyWith(_ZoneGatheringData value, $Res Function(_ZoneGatheringData) _then) = __$ZoneGatheringDataCopyWithImpl;
@override @useResult
$Res call({
 int count, double spacing, String loot
});




}
/// @nodoc
class __$ZoneGatheringDataCopyWithImpl<$Res>
    implements _$ZoneGatheringDataCopyWith<$Res> {
  __$ZoneGatheringDataCopyWithImpl(this._self, this._then);

  final _ZoneGatheringData _self;
  final $Res Function(_ZoneGatheringData) _then;

/// Create a copy of ZoneGatheringData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? spacing = null,Object? loot = null,}) {
  return _then(_ZoneGatheringData(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,spacing: null == spacing ? _self.spacing : spacing // ignore: cast_nullable_to_non_nullable
as double,loot: null == loot ? _self.loot : loot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ZoneDangerData {

/// How many of the map's exits open in a run.
 int get openExits;/// Open exits stay hidden until seen; after this long all show.
 double get revealSeconds;/// How close to an exit's centre counts as standing in it.
 double get exitRadius;/// The wait after a signal. It runs out whatever happens; the player
/// leaves only when standing in that exit at zero.
 double get countdownSeconds;/// Aggressive enemies' sight grows during the wait, up to this share at
/// zero.
 double get waitSightMultiplier;/// Health lost per second while hungry. There is no walking home.
 double get hungryDamagePerSecond;
/// Create a copy of ZoneDangerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneDangerDataCopyWith<ZoneDangerData> get copyWith => _$ZoneDangerDataCopyWithImpl<ZoneDangerData>(this as ZoneDangerData, _$identity);

  /// Serializes this ZoneDangerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneDangerData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneDangerData&&(identical(other.openExits, _this.openExits) || other.openExits == _this.openExits)&&(identical(other.revealSeconds, _this.revealSeconds) || other.revealSeconds == _this.revealSeconds)&&(identical(other.exitRadius, _this.exitRadius) || other.exitRadius == _this.exitRadius)&&(identical(other.countdownSeconds, _this.countdownSeconds) || other.countdownSeconds == _this.countdownSeconds)&&(identical(other.waitSightMultiplier, _this.waitSightMultiplier) || other.waitSightMultiplier == _this.waitSightMultiplier)&&(identical(other.hungryDamagePerSecond, _this.hungryDamagePerSecond) || other.hungryDamagePerSecond == _this.hungryDamagePerSecond));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneDangerData;
  return Object.hash(runtimeType,_this.openExits,_this.revealSeconds,_this.exitRadius,_this.countdownSeconds,_this.waitSightMultiplier,_this.hungryDamagePerSecond);
}

@override
String toString() {
  final _this = this as ZoneDangerData;
  return 'ZoneDangerData(openExits: ${_this.openExits}, revealSeconds: ${_this.revealSeconds}, exitRadius: ${_this.exitRadius}, countdownSeconds: ${_this.countdownSeconds}, waitSightMultiplier: ${_this.waitSightMultiplier}, hungryDamagePerSecond: ${_this.hungryDamagePerSecond})';
}


}

/// @nodoc
abstract mixin class $ZoneDangerDataCopyWith<$Res>  {
  factory $ZoneDangerDataCopyWith(ZoneDangerData value, $Res Function(ZoneDangerData) _then) = _$ZoneDangerDataCopyWithImpl;
@useResult
$Res call({
 int openExits, double revealSeconds, double exitRadius, double countdownSeconds, double waitSightMultiplier, double hungryDamagePerSecond
});




}
/// @nodoc
class _$ZoneDangerDataCopyWithImpl<$Res>
    implements $ZoneDangerDataCopyWith<$Res> {
  _$ZoneDangerDataCopyWithImpl(this._self, this._then);

  final ZoneDangerData _self;
  final $Res Function(ZoneDangerData) _then;

/// Create a copy of ZoneDangerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openExits = null,Object? revealSeconds = null,Object? exitRadius = null,Object? countdownSeconds = null,Object? waitSightMultiplier = null,Object? hungryDamagePerSecond = null,}) {
  return _then(ZoneDangerData(
openExits: null == openExits ? _self.openExits : openExits // ignore: cast_nullable_to_non_nullable
as int,revealSeconds: null == revealSeconds ? _self.revealSeconds : revealSeconds // ignore: cast_nullable_to_non_nullable
as double,exitRadius: null == exitRadius ? _self.exitRadius : exitRadius // ignore: cast_nullable_to_non_nullable
as double,countdownSeconds: null == countdownSeconds ? _self.countdownSeconds : countdownSeconds // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryDamagePerSecond: null == hungryDamagePerSecond ? _self.hungryDamagePerSecond : hungryDamagePerSecond // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneDangerData].
extension ZoneDangerDataPatterns on ZoneDangerData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneDangerData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneDangerData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneDangerData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneDangerData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond)  $default,) {final _that = this;
switch (_that) {
case _ZoneDangerData():
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond)?  $default,) {final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneDangerData implements ZoneDangerData {
  const _ZoneDangerData({required this.openExits, required this.revealSeconds, required this.exitRadius, required this.countdownSeconds, required this.waitSightMultiplier, required this.hungryDamagePerSecond});
  factory _ZoneDangerData.fromJson(Map<String, dynamic> json) => _$ZoneDangerDataFromJson(json);

/// How many of the map's exits open in a run.
@override final  int openExits;
/// Open exits stay hidden until seen; after this long all show.
@override final  double revealSeconds;
/// How close to an exit's centre counts as standing in it.
@override final  double exitRadius;
/// The wait after a signal. It runs out whatever happens; the player
/// leaves only when standing in that exit at zero.
@override final  double countdownSeconds;
/// Aggressive enemies' sight grows during the wait, up to this share at
/// zero.
@override final  double waitSightMultiplier;
/// Health lost per second while hungry. There is no walking home.
@override final  double hungryDamagePerSecond;

/// Create a copy of ZoneDangerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneDangerDataCopyWith<_ZoneDangerData> get copyWith => __$ZoneDangerDataCopyWithImpl<_ZoneDangerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneDangerDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneDangerData&&(identical(other.openExits, openExits) || other.openExits == openExits)&&(identical(other.revealSeconds, revealSeconds) || other.revealSeconds == revealSeconds)&&(identical(other.exitRadius, exitRadius) || other.exitRadius == exitRadius)&&(identical(other.countdownSeconds, countdownSeconds) || other.countdownSeconds == countdownSeconds)&&(identical(other.waitSightMultiplier, waitSightMultiplier) || other.waitSightMultiplier == waitSightMultiplier)&&(identical(other.hungryDamagePerSecond, hungryDamagePerSecond) || other.hungryDamagePerSecond == hungryDamagePerSecond));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,openExits,revealSeconds,exitRadius,countdownSeconds,waitSightMultiplier,hungryDamagePerSecond);
}

@override
String toString() {
    return 'ZoneDangerData(openExits: $openExits, revealSeconds: $revealSeconds, exitRadius: $exitRadius, countdownSeconds: $countdownSeconds, waitSightMultiplier: $waitSightMultiplier, hungryDamagePerSecond: $hungryDamagePerSecond)';
}


}

/// @nodoc
abstract mixin class _$ZoneDangerDataCopyWith<$Res> implements $ZoneDangerDataCopyWith<$Res> {
  factory _$ZoneDangerDataCopyWith(_ZoneDangerData value, $Res Function(_ZoneDangerData) _then) = __$ZoneDangerDataCopyWithImpl;
@override @useResult
$Res call({
 int openExits, double revealSeconds, double exitRadius, double countdownSeconds, double waitSightMultiplier, double hungryDamagePerSecond
});




}
/// @nodoc
class __$ZoneDangerDataCopyWithImpl<$Res>
    implements _$ZoneDangerDataCopyWith<$Res> {
  __$ZoneDangerDataCopyWithImpl(this._self, this._then);

  final _ZoneDangerData _self;
  final $Res Function(_ZoneDangerData) _then;

/// Create a copy of ZoneDangerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openExits = null,Object? revealSeconds = null,Object? exitRadius = null,Object? countdownSeconds = null,Object? waitSightMultiplier = null,Object? hungryDamagePerSecond = null,}) {
  return _then(_ZoneDangerData(
openExits: null == openExits ? _self.openExits : openExits // ignore: cast_nullable_to_non_nullable
as int,revealSeconds: null == revealSeconds ? _self.revealSeconds : revealSeconds // ignore: cast_nullable_to_non_nullable
as double,exitRadius: null == exitRadius ? _self.exitRadius : exitRadius // ignore: cast_nullable_to_non_nullable
as double,countdownSeconds: null == countdownSeconds ? _self.countdownSeconds : countdownSeconds // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryDamagePerSecond: null == hungryDamagePerSecond ? _self.hungryDamagePerSecond : hungryDamagePerSecond // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ZoneDropsData {

 double get bundleChance; String get bundle; double get itemChance; String get item;
/// Create a copy of ZoneDropsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneDropsDataCopyWith<ZoneDropsData> get copyWith => _$ZoneDropsDataCopyWithImpl<ZoneDropsData>(this as ZoneDropsData, _$identity);

  /// Serializes this ZoneDropsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneDropsData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneDropsData&&(identical(other.bundleChance, _this.bundleChance) || other.bundleChance == _this.bundleChance)&&(identical(other.bundle, _this.bundle) || other.bundle == _this.bundle)&&(identical(other.itemChance, _this.itemChance) || other.itemChance == _this.itemChance)&&(identical(other.item, _this.item) || other.item == _this.item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneDropsData;
  return Object.hash(runtimeType,_this.bundleChance,_this.bundle,_this.itemChance,_this.item);
}

@override
String toString() {
  final _this = this as ZoneDropsData;
  return 'ZoneDropsData(bundleChance: ${_this.bundleChance}, bundle: ${_this.bundle}, itemChance: ${_this.itemChance}, item: ${_this.item})';
}


}

/// @nodoc
abstract mixin class $ZoneDropsDataCopyWith<$Res>  {
  factory $ZoneDropsDataCopyWith(ZoneDropsData value, $Res Function(ZoneDropsData) _then) = _$ZoneDropsDataCopyWithImpl;
@useResult
$Res call({
 double bundleChance, String bundle, double itemChance, String item
});




}
/// @nodoc
class _$ZoneDropsDataCopyWithImpl<$Res>
    implements $ZoneDropsDataCopyWith<$Res> {
  _$ZoneDropsDataCopyWithImpl(this._self, this._then);

  final ZoneDropsData _self;
  final $Res Function(ZoneDropsData) _then;

/// Create a copy of ZoneDropsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bundleChance = null,Object? bundle = null,Object? itemChance = null,Object? item = null,}) {
  return _then(ZoneDropsData(
bundleChance: null == bundleChance ? _self.bundleChance : bundleChance // ignore: cast_nullable_to_non_nullable
as double,bundle: null == bundle ? _self.bundle : bundle // ignore: cast_nullable_to_non_nullable
as String,itemChance: null == itemChance ? _self.itemChance : itemChance // ignore: cast_nullable_to_non_nullable
as double,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneDropsData].
extension ZoneDropsDataPatterns on ZoneDropsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneDropsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneDropsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneDropsData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneDropsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneDropsData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneDropsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double bundleChance,  String bundle,  double itemChance,  String item)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneDropsData() when $default != null:
return $default(_that.bundleChance,_that.bundle,_that.itemChance,_that.item);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double bundleChance,  String bundle,  double itemChance,  String item)  $default,) {final _that = this;
switch (_that) {
case _ZoneDropsData():
return $default(_that.bundleChance,_that.bundle,_that.itemChance,_that.item);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double bundleChance,  String bundle,  double itemChance,  String item)?  $default,) {final _that = this;
switch (_that) {
case _ZoneDropsData() when $default != null:
return $default(_that.bundleChance,_that.bundle,_that.itemChance,_that.item);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneDropsData implements ZoneDropsData {
  const _ZoneDropsData({required this.bundleChance, required this.bundle, required this.itemChance, required this.item});
  factory _ZoneDropsData.fromJson(Map<String, dynamic> json) => _$ZoneDropsDataFromJson(json);

@override final  double bundleChance;
@override final  String bundle;
@override final  double itemChance;
@override final  String item;

/// Create a copy of ZoneDropsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneDropsDataCopyWith<_ZoneDropsData> get copyWith => __$ZoneDropsDataCopyWithImpl<_ZoneDropsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneDropsDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneDropsData&&(identical(other.bundleChance, bundleChance) || other.bundleChance == bundleChance)&&(identical(other.bundle, bundle) || other.bundle == bundle)&&(identical(other.itemChance, itemChance) || other.itemChance == itemChance)&&(identical(other.item, item) || other.item == item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,bundleChance,bundle,itemChance,item);
}

@override
String toString() {
    return 'ZoneDropsData(bundleChance: $bundleChance, bundle: $bundle, itemChance: $itemChance, item: $item)';
}


}

/// @nodoc
abstract mixin class _$ZoneDropsDataCopyWith<$Res> implements $ZoneDropsDataCopyWith<$Res> {
  factory _$ZoneDropsDataCopyWith(_ZoneDropsData value, $Res Function(_ZoneDropsData) _then) = __$ZoneDropsDataCopyWithImpl;
@override @useResult
$Res call({
 double bundleChance, String bundle, double itemChance, String item
});




}
/// @nodoc
class __$ZoneDropsDataCopyWithImpl<$Res>
    implements _$ZoneDropsDataCopyWith<$Res> {
  __$ZoneDropsDataCopyWithImpl(this._self, this._then);

  final _ZoneDropsData _self;
  final $Res Function(_ZoneDropsData) _then;

/// Create a copy of ZoneDropsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bundleChance = null,Object? bundle = null,Object? itemChance = null,Object? item = null,}) {
  return _then(_ZoneDropsData(
bundleChance: null == bundleChance ? _self.bundleChance : bundleChance // ignore: cast_nullable_to_non_nullable
as double,bundle: null == bundle ? _self.bundle : bundle // ignore: cast_nullable_to_non_nullable
as String,itemChance: null == itemChance ? _self.itemChance : itemChance // ignore: cast_nullable_to_non_nullable
as double,item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
