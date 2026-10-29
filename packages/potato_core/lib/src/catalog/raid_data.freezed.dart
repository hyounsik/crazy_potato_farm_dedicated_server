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
 int get stepMillis; PlayerRulesData get player;/// How close the player must stand to open a pile or a gathering spot.
 double get pickupRadius; FoodRulesData get food;/// How long an enemy keeps chasing whoever hit it, even out of sight.
 double get enemyAlertSeconds; CompanionRulesData get companion; CloneRulesData get clones; PartyRulesData get party;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RaidRulesData&&(identical(other.stepMillis, _this.stepMillis) || other.stepMillis == _this.stepMillis)&&(identical(other.player, _this.player) || other.player == _this.player)&&(identical(other.pickupRadius, _this.pickupRadius) || other.pickupRadius == _this.pickupRadius)&&(identical(other.food, _this.food) || other.food == _this.food)&&(identical(other.enemyAlertSeconds, _this.enemyAlertSeconds) || other.enemyAlertSeconds == _this.enemyAlertSeconds)&&(identical(other.companion, _this.companion) || other.companion == _this.companion)&&(identical(other.clones, _this.clones) || other.clones == _this.clones)&&(identical(other.party, _this.party) || other.party == _this.party));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RaidRulesData;
  return Object.hash(runtimeType,_this.stepMillis,_this.player,_this.pickupRadius,_this.food,_this.enemyAlertSeconds,_this.companion,_this.clones,_this.party);
}

@override
String toString() {
  final _this = this as RaidRulesData;
  return 'RaidRulesData(stepMillis: ${_this.stepMillis}, player: ${_this.player}, pickupRadius: ${_this.pickupRadius}, food: ${_this.food}, enemyAlertSeconds: ${_this.enemyAlertSeconds}, companion: ${_this.companion}, clones: ${_this.clones}, party: ${_this.party})';
}


}

/// @nodoc
abstract mixin class $RaidRulesDataCopyWith<$Res>  {
  factory $RaidRulesDataCopyWith(RaidRulesData value, $Res Function(RaidRulesData) _then) = _$RaidRulesDataCopyWithImpl;
@useResult
$Res call({
 int stepMillis, PlayerRulesData player, double pickupRadius, FoodRulesData food, double enemyAlertSeconds, CompanionRulesData companion, CloneRulesData clones, PartyRulesData party
});


$PlayerRulesDataCopyWith<$Res> get player;$FoodRulesDataCopyWith<$Res> get food;$CompanionRulesDataCopyWith<$Res> get companion;$CloneRulesDataCopyWith<$Res> get clones;$PartyRulesDataCopyWith<$Res> get party;

}
/// @nodoc
class _$RaidRulesDataCopyWithImpl<$Res>
    implements $RaidRulesDataCopyWith<$Res> {
  _$RaidRulesDataCopyWithImpl(this._self, this._then);

  final RaidRulesData _self;
  final $Res Function(RaidRulesData) _then;

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stepMillis = null,Object? player = null,Object? pickupRadius = null,Object? food = null,Object? enemyAlertSeconds = null,Object? companion = null,Object? clones = null,Object? party = null,}) {
  return _then(RaidRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRulesData,pickupRadius: null == pickupRadius ? _self.pickupRadius : pickupRadius // ignore: cast_nullable_to_non_nullable
as double,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodRulesData,enemyAlertSeconds: null == enemyAlertSeconds ? _self.enemyAlertSeconds : enemyAlertSeconds // ignore: cast_nullable_to_non_nullable
as double,companion: null == companion ? _self.companion : companion // ignore: cast_nullable_to_non_nullable
as CompanionRulesData,clones: null == clones ? _self.clones : clones // ignore: cast_nullable_to_non_nullable
as CloneRulesData,party: null == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyRulesData,
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
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloneRulesDataCopyWith<$Res> get clones {
  
  return $CloneRulesDataCopyWith<$Res>(_self.clones, (value) {
    return _then(_self.copyWith(clones: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyRulesDataCopyWith<$Res> get party {
  
  return $PartyRulesDataCopyWith<$Res>(_self.party, (value) {
    return _then(_self.copyWith(party: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stepMillis,  PlayerRulesData player,  double pickupRadius,  FoodRulesData food,  double enemyAlertSeconds,  CompanionRulesData companion,  CloneRulesData clones,  PartyRulesData party)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
return $default(_that.stepMillis,_that.player,_that.pickupRadius,_that.food,_that.enemyAlertSeconds,_that.companion,_that.clones,_that.party);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stepMillis,  PlayerRulesData player,  double pickupRadius,  FoodRulesData food,  double enemyAlertSeconds,  CompanionRulesData companion,  CloneRulesData clones,  PartyRulesData party)  $default,) {final _that = this;
switch (_that) {
case _RaidRulesData():
return $default(_that.stepMillis,_that.player,_that.pickupRadius,_that.food,_that.enemyAlertSeconds,_that.companion,_that.clones,_that.party);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stepMillis,  PlayerRulesData player,  double pickupRadius,  FoodRulesData food,  double enemyAlertSeconds,  CompanionRulesData companion,  CloneRulesData clones,  PartyRulesData party)?  $default,) {final _that = this;
switch (_that) {
case _RaidRulesData() when $default != null:
return $default(_that.stepMillis,_that.player,_that.pickupRadius,_that.food,_that.enemyAlertSeconds,_that.companion,_that.clones,_that.party);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RaidRulesData implements RaidRulesData {
  const _RaidRulesData({required this.stepMillis, required this.player, required this.pickupRadius, required this.food, required this.enemyAlertSeconds, required this.companion, required this.clones, this.party = const PartyRulesData()});
  factory _RaidRulesData.fromJson(Map<String, dynamic> json) => _$RaidRulesDataFromJson(json);

/// Game time one run `step` covers.
@override final  int stepMillis;
@override final  PlayerRulesData player;
/// How close the player must stand to open a pile or a gathering spot.
@override final  double pickupRadius;
@override final  FoodRulesData food;
/// How long an enemy keeps chasing whoever hit it, even out of sight.
@override final  double enemyAlertSeconds;
@override final  CompanionRulesData companion;
@override final  CloneRulesData clones;
@override@JsonKey() final  PartyRulesData party;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RaidRulesData&&(identical(other.stepMillis, stepMillis) || other.stepMillis == stepMillis)&&(identical(other.player, player) || other.player == player)&&(identical(other.pickupRadius, pickupRadius) || other.pickupRadius == pickupRadius)&&(identical(other.food, food) || other.food == food)&&(identical(other.enemyAlertSeconds, enemyAlertSeconds) || other.enemyAlertSeconds == enemyAlertSeconds)&&(identical(other.companion, companion) || other.companion == companion)&&(identical(other.clones, clones) || other.clones == clones)&&(identical(other.party, party) || other.party == party));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,stepMillis,player,pickupRadius,food,enemyAlertSeconds,companion,clones,party);
}

@override
String toString() {
    return 'RaidRulesData(stepMillis: $stepMillis, player: $player, pickupRadius: $pickupRadius, food: $food, enemyAlertSeconds: $enemyAlertSeconds, companion: $companion, clones: $clones, party: $party)';
}


}

/// @nodoc
abstract mixin class _$RaidRulesDataCopyWith<$Res> implements $RaidRulesDataCopyWith<$Res> {
  factory _$RaidRulesDataCopyWith(_RaidRulesData value, $Res Function(_RaidRulesData) _then) = __$RaidRulesDataCopyWithImpl;
@override @useResult
$Res call({
 int stepMillis, PlayerRulesData player, double pickupRadius, FoodRulesData food, double enemyAlertSeconds, CompanionRulesData companion, CloneRulesData clones, PartyRulesData party
});


@override $PlayerRulesDataCopyWith<$Res> get player;@override $FoodRulesDataCopyWith<$Res> get food;@override $CompanionRulesDataCopyWith<$Res> get companion;@override $CloneRulesDataCopyWith<$Res> get clones;@override $PartyRulesDataCopyWith<$Res> get party;

}
/// @nodoc
class __$RaidRulesDataCopyWithImpl<$Res>
    implements _$RaidRulesDataCopyWith<$Res> {
  __$RaidRulesDataCopyWithImpl(this._self, this._then);

  final _RaidRulesData _self;
  final $Res Function(_RaidRulesData) _then;

/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stepMillis = null,Object? player = null,Object? pickupRadius = null,Object? food = null,Object? enemyAlertSeconds = null,Object? companion = null,Object? clones = null,Object? party = null,}) {
  return _then(_RaidRulesData(
stepMillis: null == stepMillis ? _self.stepMillis : stepMillis // ignore: cast_nullable_to_non_nullable
as int,player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerRulesData,pickupRadius: null == pickupRadius ? _self.pickupRadius : pickupRadius // ignore: cast_nullable_to_non_nullable
as double,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as FoodRulesData,enemyAlertSeconds: null == enemyAlertSeconds ? _self.enemyAlertSeconds : enemyAlertSeconds // ignore: cast_nullable_to_non_nullable
as double,companion: null == companion ? _self.companion : companion // ignore: cast_nullable_to_non_nullable
as CompanionRulesData,clones: null == clones ? _self.clones : clones // ignore: cast_nullable_to_non_nullable
as CloneRulesData,party: null == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as PartyRulesData,
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
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloneRulesDataCopyWith<$Res> get clones {
  
  return $CloneRulesDataCopyWith<$Res>(_self.clones, (value) {
    return _then(_self.copyWith(clones: value));
  });
}/// Create a copy of RaidRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartyRulesDataCopyWith<$Res> get party {
  
  return $PartyRulesDataCopyWith<$Res>(_self.party, (value) {
    return _then(_self.copyWith(party: value));
  });
}
}


/// @nodoc
mixin _$PartyRulesData {

/// How long a fallen member can wait to be revived before they fail.
 double get downSeconds;/// How long a teammate must stay close to revive them.
 double get reviveSeconds;/// How close (tiles) a teammate must stand to revive.
 double get reviveRadius;/// Revive progress lost per second while nobody is close, as a share of
/// the rate it builds up (it drains slowly rather than resetting).
 double get reviveDecay;/// Share of full health a revived member gets back.
 double get revivedHp;
/// Create a copy of PartyRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartyRulesDataCopyWith<PartyRulesData> get copyWith => _$PartyRulesDataCopyWithImpl<PartyRulesData>(this as PartyRulesData, _$identity);

  /// Serializes this PartyRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PartyRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartyRulesData&&(identical(other.downSeconds, _this.downSeconds) || other.downSeconds == _this.downSeconds)&&(identical(other.reviveSeconds, _this.reviveSeconds) || other.reviveSeconds == _this.reviveSeconds)&&(identical(other.reviveRadius, _this.reviveRadius) || other.reviveRadius == _this.reviveRadius)&&(identical(other.reviveDecay, _this.reviveDecay) || other.reviveDecay == _this.reviveDecay)&&(identical(other.revivedHp, _this.revivedHp) || other.revivedHp == _this.revivedHp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PartyRulesData;
  return Object.hash(runtimeType,_this.downSeconds,_this.reviveSeconds,_this.reviveRadius,_this.reviveDecay,_this.revivedHp);
}

@override
String toString() {
  final _this = this as PartyRulesData;
  return 'PartyRulesData(downSeconds: ${_this.downSeconds}, reviveSeconds: ${_this.reviveSeconds}, reviveRadius: ${_this.reviveRadius}, reviveDecay: ${_this.reviveDecay}, revivedHp: ${_this.revivedHp})';
}


}

/// @nodoc
abstract mixin class $PartyRulesDataCopyWith<$Res>  {
  factory $PartyRulesDataCopyWith(PartyRulesData value, $Res Function(PartyRulesData) _then) = _$PartyRulesDataCopyWithImpl;
@useResult
$Res call({
 double downSeconds, double reviveSeconds, double reviveRadius, double reviveDecay, double revivedHp
});




}
/// @nodoc
class _$PartyRulesDataCopyWithImpl<$Res>
    implements $PartyRulesDataCopyWith<$Res> {
  _$PartyRulesDataCopyWithImpl(this._self, this._then);

  final PartyRulesData _self;
  final $Res Function(PartyRulesData) _then;

/// Create a copy of PartyRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? downSeconds = null,Object? reviveSeconds = null,Object? reviveRadius = null,Object? reviveDecay = null,Object? revivedHp = null,}) {
  return _then(PartyRulesData(
downSeconds: null == downSeconds ? _self.downSeconds : downSeconds // ignore: cast_nullable_to_non_nullable
as double,reviveSeconds: null == reviveSeconds ? _self.reviveSeconds : reviveSeconds // ignore: cast_nullable_to_non_nullable
as double,reviveRadius: null == reviveRadius ? _self.reviveRadius : reviveRadius // ignore: cast_nullable_to_non_nullable
as double,reviveDecay: null == reviveDecay ? _self.reviveDecay : reviveDecay // ignore: cast_nullable_to_non_nullable
as double,revivedHp: null == revivedHp ? _self.revivedHp : revivedHp // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PartyRulesData].
extension PartyRulesDataPatterns on PartyRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartyRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartyRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartyRulesData value)  $default,){
final _that = this;
switch (_that) {
case _PartyRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartyRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _PartyRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double downSeconds,  double reviveSeconds,  double reviveRadius,  double reviveDecay,  double revivedHp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartyRulesData() when $default != null:
return $default(_that.downSeconds,_that.reviveSeconds,_that.reviveRadius,_that.reviveDecay,_that.revivedHp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double downSeconds,  double reviveSeconds,  double reviveRadius,  double reviveDecay,  double revivedHp)  $default,) {final _that = this;
switch (_that) {
case _PartyRulesData():
return $default(_that.downSeconds,_that.reviveSeconds,_that.reviveRadius,_that.reviveDecay,_that.revivedHp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double downSeconds,  double reviveSeconds,  double reviveRadius,  double reviveDecay,  double revivedHp)?  $default,) {final _that = this;
switch (_that) {
case _PartyRulesData() when $default != null:
return $default(_that.downSeconds,_that.reviveSeconds,_that.reviveRadius,_that.reviveDecay,_that.revivedHp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartyRulesData implements PartyRulesData {
  const _PartyRulesData({this.downSeconds = 30, this.reviveSeconds = 4, this.reviveRadius = 1.2, this.reviveDecay = 0.5, this.revivedHp = 0.3});
  factory _PartyRulesData.fromJson(Map<String, dynamic> json) => _$PartyRulesDataFromJson(json);

/// How long a fallen member can wait to be revived before they fail.
@override@JsonKey() final  double downSeconds;
/// How long a teammate must stay close to revive them.
@override@JsonKey() final  double reviveSeconds;
/// How close (tiles) a teammate must stand to revive.
@override@JsonKey() final  double reviveRadius;
/// Revive progress lost per second while nobody is close, as a share of
/// the rate it builds up (it drains slowly rather than resetting).
@override@JsonKey() final  double reviveDecay;
/// Share of full health a revived member gets back.
@override@JsonKey() final  double revivedHp;

/// Create a copy of PartyRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartyRulesDataCopyWith<_PartyRulesData> get copyWith => __$PartyRulesDataCopyWithImpl<_PartyRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartyRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartyRulesData&&(identical(other.downSeconds, downSeconds) || other.downSeconds == downSeconds)&&(identical(other.reviveSeconds, reviveSeconds) || other.reviveSeconds == reviveSeconds)&&(identical(other.reviveRadius, reviveRadius) || other.reviveRadius == reviveRadius)&&(identical(other.reviveDecay, reviveDecay) || other.reviveDecay == reviveDecay)&&(identical(other.revivedHp, revivedHp) || other.revivedHp == revivedHp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,downSeconds,reviveSeconds,reviveRadius,reviveDecay,revivedHp);
}

@override
String toString() {
    return 'PartyRulesData(downSeconds: $downSeconds, reviveSeconds: $reviveSeconds, reviveRadius: $reviveRadius, reviveDecay: $reviveDecay, revivedHp: $revivedHp)';
}


}

/// @nodoc
abstract mixin class _$PartyRulesDataCopyWith<$Res> implements $PartyRulesDataCopyWith<$Res> {
  factory _$PartyRulesDataCopyWith(_PartyRulesData value, $Res Function(_PartyRulesData) _then) = __$PartyRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double downSeconds, double reviveSeconds, double reviveRadius, double reviveDecay, double revivedHp
});




}
/// @nodoc
class __$PartyRulesDataCopyWithImpl<$Res>
    implements _$PartyRulesDataCopyWith<$Res> {
  __$PartyRulesDataCopyWithImpl(this._self, this._then);

  final _PartyRulesData _self;
  final $Res Function(_PartyRulesData) _then;

/// Create a copy of PartyRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? downSeconds = null,Object? reviveSeconds = null,Object? reviveRadius = null,Object? reviveDecay = null,Object? revivedHp = null,}) {
  return _then(_PartyRulesData(
downSeconds: null == downSeconds ? _self.downSeconds : downSeconds // ignore: cast_nullable_to_non_nullable
as double,reviveSeconds: null == reviveSeconds ? _self.reviveSeconds : reviveSeconds // ignore: cast_nullable_to_non_nullable
as double,reviveRadius: null == reviveRadius ? _self.reviveRadius : reviveRadius // ignore: cast_nullable_to_non_nullable
as double,reviveDecay: null == reviveDecay ? _self.reviveDecay : reviveDecay // ignore: cast_nullable_to_non_nullable
as double,revivedHp: null == revivedHp ? _self.revivedHp : revivedHp // ignore: cast_nullable_to_non_nullable
as double,
  ));
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
 double get catchUpDistance;/// Farther than this from the player, a companion appears beside them
/// (2026-10-28, user: potatoes stuck behind rocks).
 double get teleportDistance; double get regenDelaySeconds;/// Share of max health refilled per second.
 double get regenPercentPerSecond;/// Food eaten per second by each companion while it heals.
 double get regenFoodPerSecond;/// Food a food potato makes per second.
 double get producePerSecond;/// How far from the player combat potatoes take on enemies: in attack
/// mode any enemy, in defense mode only those going for the party.
 double get attackRange; double get defenseRange;/// How each combat style fights. Other potatoes use [maxHp] and
/// [speedMultiplier] and do not fight.
 Map<CombatStyle, CompanionStyleData> get styles;/// How much each level multiplies a companion's health and attack by,
/// in thousandths over 1: 30 means ×1.03 per level, compounding (see
/// `levelGrowth`).
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanionRulesData&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.speedMultiplier, _this.speedMultiplier) || other.speedMultiplier == _this.speedMultiplier)&&(identical(other.followDistance, _this.followDistance) || other.followDistance == _this.followDistance)&&(identical(other.catchUpDistance, _this.catchUpDistance) || other.catchUpDistance == _this.catchUpDistance)&&(identical(other.teleportDistance, _this.teleportDistance) || other.teleportDistance == _this.teleportDistance)&&(identical(other.regenDelaySeconds, _this.regenDelaySeconds) || other.regenDelaySeconds == _this.regenDelaySeconds)&&(identical(other.regenPercentPerSecond, _this.regenPercentPerSecond) || other.regenPercentPerSecond == _this.regenPercentPerSecond)&&(identical(other.regenFoodPerSecond, _this.regenFoodPerSecond) || other.regenFoodPerSecond == _this.regenFoodPerSecond)&&(identical(other.producePerSecond, _this.producePerSecond) || other.producePerSecond == _this.producePerSecond)&&(identical(other.attackRange, _this.attackRange) || other.attackRange == _this.attackRange)&&(identical(other.defenseRange, _this.defenseRange) || other.defenseRange == _this.defenseRange)&&const DeepCollectionEquality().equals(other.styles, _this.styles)&&(identical(other.levelHpPermille, _this.levelHpPermille) || other.levelHpPermille == _this.levelHpPermille)&&(identical(other.levelAttackPermille, _this.levelAttackPermille) || other.levelAttackPermille == _this.levelAttackPermille)&&(identical(other.aggroPulseRange, _this.aggroPulseRange) || other.aggroPulseRange == _this.aggroPulseRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CompanionRulesData;
  return Object.hash(runtimeType,_this.maxHp,_this.radius,_this.speedMultiplier,_this.followDistance,_this.catchUpDistance,_this.teleportDistance,_this.regenDelaySeconds,_this.regenPercentPerSecond,_this.regenFoodPerSecond,_this.producePerSecond,_this.attackRange,_this.defenseRange,const DeepCollectionEquality().hash(_this.styles),_this.levelHpPermille,_this.levelAttackPermille,_this.aggroPulseRange);
}

@override
String toString() {
  final _this = this as CompanionRulesData;
  return 'CompanionRulesData(maxHp: ${_this.maxHp}, radius: ${_this.radius}, speedMultiplier: ${_this.speedMultiplier}, followDistance: ${_this.followDistance}, catchUpDistance: ${_this.catchUpDistance}, teleportDistance: ${_this.teleportDistance}, regenDelaySeconds: ${_this.regenDelaySeconds}, regenPercentPerSecond: ${_this.regenPercentPerSecond}, regenFoodPerSecond: ${_this.regenFoodPerSecond}, producePerSecond: ${_this.producePerSecond}, attackRange: ${_this.attackRange}, defenseRange: ${_this.defenseRange}, styles: ${_this.styles}, levelHpPermille: ${_this.levelHpPermille}, levelAttackPermille: ${_this.levelAttackPermille}, aggroPulseRange: ${_this.aggroPulseRange})';
}


}

/// @nodoc
abstract mixin class $CompanionRulesDataCopyWith<$Res>  {
  factory $CompanionRulesDataCopyWith(CompanionRulesData value, $Res Function(CompanionRulesData) _then) = _$CompanionRulesDataCopyWithImpl;
@useResult
$Res call({
 double maxHp, double radius, double speedMultiplier, double followDistance, double catchUpDistance, double teleportDistance, double regenDelaySeconds, double regenPercentPerSecond, double regenFoodPerSecond, double producePerSecond, double attackRange, double defenseRange, Map<CombatStyle, CompanionStyleData> styles, int levelHpPermille, int levelAttackPermille, double aggroPulseRange
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
@pragma('vm:prefer-inline') @override $Res call({Object? maxHp = null,Object? radius = null,Object? speedMultiplier = null,Object? followDistance = null,Object? catchUpDistance = null,Object? teleportDistance = null,Object? regenDelaySeconds = null,Object? regenPercentPerSecond = null,Object? regenFoodPerSecond = null,Object? producePerSecond = null,Object? attackRange = null,Object? defenseRange = null,Object? styles = null,Object? levelHpPermille = null,Object? levelAttackPermille = null,Object? aggroPulseRange = null,}) {
  return _then(CompanionRulesData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,followDistance: null == followDistance ? _self.followDistance : followDistance // ignore: cast_nullable_to_non_nullable
as double,catchUpDistance: null == catchUpDistance ? _self.catchUpDistance : catchUpDistance // ignore: cast_nullable_to_non_nullable
as double,teleportDistance: null == teleportDistance ? _self.teleportDistance : teleportDistance // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double teleportDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.teleportDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double teleportDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)  $default,) {final _that = this;
switch (_that) {
case _CompanionRulesData():
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.teleportDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double maxHp,  double radius,  double speedMultiplier,  double followDistance,  double catchUpDistance,  double teleportDistance,  double regenDelaySeconds,  double regenPercentPerSecond,  double regenFoodPerSecond,  double producePerSecond,  double attackRange,  double defenseRange,  Map<CombatStyle, CompanionStyleData> styles,  int levelHpPermille,  int levelAttackPermille,  double aggroPulseRange)?  $default,) {final _that = this;
switch (_that) {
case _CompanionRulesData() when $default != null:
return $default(_that.maxHp,_that.radius,_that.speedMultiplier,_that.followDistance,_that.catchUpDistance,_that.teleportDistance,_that.regenDelaySeconds,_that.regenPercentPerSecond,_that.regenFoodPerSecond,_that.producePerSecond,_that.attackRange,_that.defenseRange,_that.styles,_that.levelHpPermille,_that.levelAttackPermille,_that.aggroPulseRange);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanionRulesData implements CompanionRulesData {
  const _CompanionRulesData({required this.maxHp, required this.radius, required this.speedMultiplier, required this.followDistance, required this.catchUpDistance, required this.teleportDistance, required this.regenDelaySeconds, required this.regenPercentPerSecond, required this.regenFoodPerSecond, required this.producePerSecond, required this.attackRange, required this.defenseRange, required  Map<CombatStyle, CompanionStyleData> styles, required this.levelHpPermille, required this.levelAttackPermille, required this.aggroPulseRange}): _styles = styles;
  factory _CompanionRulesData.fromJson(Map<String, dynamic> json) => _$CompanionRulesDataFromJson(json);

@override final  double maxHp;
@override final  double radius;
/// Speed share of the player's.
@override final  double speedMultiplier;
@override final  double followDistance;
/// Farther than this from the player, a companion runs to catch up.
@override final  double catchUpDistance;
/// Farther than this from the player, a companion appears beside them
/// (2026-10-28, user: potatoes stuck behind rocks).
@override final  double teleportDistance;
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

/// How much each level multiplies a companion's health and attack by,
/// in thousandths over 1: 30 means ×1.03 per level, compounding (see
/// `levelGrowth`).
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanionRulesData&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.speedMultiplier, speedMultiplier) || other.speedMultiplier == speedMultiplier)&&(identical(other.followDistance, followDistance) || other.followDistance == followDistance)&&(identical(other.catchUpDistance, catchUpDistance) || other.catchUpDistance == catchUpDistance)&&(identical(other.teleportDistance, teleportDistance) || other.teleportDistance == teleportDistance)&&(identical(other.regenDelaySeconds, regenDelaySeconds) || other.regenDelaySeconds == regenDelaySeconds)&&(identical(other.regenPercentPerSecond, regenPercentPerSecond) || other.regenPercentPerSecond == regenPercentPerSecond)&&(identical(other.regenFoodPerSecond, regenFoodPerSecond) || other.regenFoodPerSecond == regenFoodPerSecond)&&(identical(other.producePerSecond, producePerSecond) || other.producePerSecond == producePerSecond)&&(identical(other.attackRange, attackRange) || other.attackRange == attackRange)&&(identical(other.defenseRange, defenseRange) || other.defenseRange == defenseRange)&&const DeepCollectionEquality().equals(other.styles, _styles)&&(identical(other.levelHpPermille, levelHpPermille) || other.levelHpPermille == levelHpPermille)&&(identical(other.levelAttackPermille, levelAttackPermille) || other.levelAttackPermille == levelAttackPermille)&&(identical(other.aggroPulseRange, aggroPulseRange) || other.aggroPulseRange == aggroPulseRange));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,maxHp,radius,speedMultiplier,followDistance,catchUpDistance,teleportDistance,regenDelaySeconds,regenPercentPerSecond,regenFoodPerSecond,producePerSecond,attackRange,defenseRange,const DeepCollectionEquality().hash(_styles),levelHpPermille,levelAttackPermille,aggroPulseRange);
}

@override
String toString() {
    return 'CompanionRulesData(maxHp: $maxHp, radius: $radius, speedMultiplier: $speedMultiplier, followDistance: $followDistance, catchUpDistance: $catchUpDistance, teleportDistance: $teleportDistance, regenDelaySeconds: $regenDelaySeconds, regenPercentPerSecond: $regenPercentPerSecond, regenFoodPerSecond: $regenFoodPerSecond, producePerSecond: $producePerSecond, attackRange: $attackRange, defenseRange: $defenseRange, styles: $styles, levelHpPermille: $levelHpPermille, levelAttackPermille: $levelAttackPermille, aggroPulseRange: $aggroPulseRange)';
}


}

/// @nodoc
abstract mixin class _$CompanionRulesDataCopyWith<$Res> implements $CompanionRulesDataCopyWith<$Res> {
  factory _$CompanionRulesDataCopyWith(_CompanionRulesData value, $Res Function(_CompanionRulesData) _then) = __$CompanionRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double maxHp, double radius, double speedMultiplier, double followDistance, double catchUpDistance, double teleportDistance, double regenDelaySeconds, double regenPercentPerSecond, double regenFoodPerSecond, double producePerSecond, double attackRange, double defenseRange, Map<CombatStyle, CompanionStyleData> styles, int levelHpPermille, int levelAttackPermille, double aggroPulseRange
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
@override @pragma('vm:prefer-inline') $Res call({Object? maxHp = null,Object? radius = null,Object? speedMultiplier = null,Object? followDistance = null,Object? catchUpDistance = null,Object? teleportDistance = null,Object? regenDelaySeconds = null,Object? regenPercentPerSecond = null,Object? regenFoodPerSecond = null,Object? producePerSecond = null,Object? attackRange = null,Object? defenseRange = null,Object? styles = null,Object? levelHpPermille = null,Object? levelAttackPermille = null,Object? aggroPulseRange = null,}) {
  return _then(_CompanionRulesData(
maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,followDistance: null == followDistance ? _self.followDistance : followDistance // ignore: cast_nullable_to_non_nullable
as double,catchUpDistance: null == catchUpDistance ? _self.catchUpDistance : catchUpDistance // ignore: cast_nullable_to_non_nullable
as double,teleportDistance: null == teleportDistance ? _self.teleportDistance : teleportDistance // ignore: cast_nullable_to_non_nullable
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
mixin _$CloneRulesData {

/// Shares of the player's sight and speed.
 double get sightMultiplier; double get speedMultiplier; double get maxHp; double get radius;/// Below this share of health (after a fight) it heads out.
 double get lowHpRatio;/// How long one stays before heading out, picked between these.
 double get staySecondsMin; double get staySecondsMax;/// While the player's signal counts down, clone sight grows up to this
/// share at zero.
 double get waitSightMultiplier;
/// Create a copy of CloneRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloneRulesDataCopyWith<CloneRulesData> get copyWith => _$CloneRulesDataCopyWithImpl<CloneRulesData>(this as CloneRulesData, _$identity);

  /// Serializes this CloneRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CloneRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloneRulesData&&(identical(other.sightMultiplier, _this.sightMultiplier) || other.sightMultiplier == _this.sightMultiplier)&&(identical(other.speedMultiplier, _this.speedMultiplier) || other.speedMultiplier == _this.speedMultiplier)&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.lowHpRatio, _this.lowHpRatio) || other.lowHpRatio == _this.lowHpRatio)&&(identical(other.staySecondsMin, _this.staySecondsMin) || other.staySecondsMin == _this.staySecondsMin)&&(identical(other.staySecondsMax, _this.staySecondsMax) || other.staySecondsMax == _this.staySecondsMax)&&(identical(other.waitSightMultiplier, _this.waitSightMultiplier) || other.waitSightMultiplier == _this.waitSightMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CloneRulesData;
  return Object.hash(runtimeType,_this.sightMultiplier,_this.speedMultiplier,_this.maxHp,_this.radius,_this.lowHpRatio,_this.staySecondsMin,_this.staySecondsMax,_this.waitSightMultiplier);
}

@override
String toString() {
  final _this = this as CloneRulesData;
  return 'CloneRulesData(sightMultiplier: ${_this.sightMultiplier}, speedMultiplier: ${_this.speedMultiplier}, maxHp: ${_this.maxHp}, radius: ${_this.radius}, lowHpRatio: ${_this.lowHpRatio}, staySecondsMin: ${_this.staySecondsMin}, staySecondsMax: ${_this.staySecondsMax}, waitSightMultiplier: ${_this.waitSightMultiplier})';
}


}

/// @nodoc
abstract mixin class $CloneRulesDataCopyWith<$Res>  {
  factory $CloneRulesDataCopyWith(CloneRulesData value, $Res Function(CloneRulesData) _then) = _$CloneRulesDataCopyWithImpl;
@useResult
$Res call({
 double sightMultiplier, double speedMultiplier, double maxHp, double radius, double lowHpRatio, double staySecondsMin, double staySecondsMax, double waitSightMultiplier
});




}
/// @nodoc
class _$CloneRulesDataCopyWithImpl<$Res>
    implements $CloneRulesDataCopyWith<$Res> {
  _$CloneRulesDataCopyWithImpl(this._self, this._then);

  final CloneRulesData _self;
  final $Res Function(CloneRulesData) _then;

/// Create a copy of CloneRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sightMultiplier = null,Object? speedMultiplier = null,Object? maxHp = null,Object? radius = null,Object? lowHpRatio = null,Object? staySecondsMin = null,Object? staySecondsMax = null,Object? waitSightMultiplier = null,}) {
  return _then(CloneRulesData(
sightMultiplier: null == sightMultiplier ? _self.sightMultiplier : sightMultiplier // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,lowHpRatio: null == lowHpRatio ? _self.lowHpRatio : lowHpRatio // ignore: cast_nullable_to_non_nullable
as double,staySecondsMin: null == staySecondsMin ? _self.staySecondsMin : staySecondsMin // ignore: cast_nullable_to_non_nullable
as double,staySecondsMax: null == staySecondsMax ? _self.staySecondsMax : staySecondsMax // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CloneRulesData].
extension CloneRulesDataPatterns on CloneRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloneRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloneRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloneRulesData value)  $default,){
final _that = this;
switch (_that) {
case _CloneRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloneRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _CloneRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double sightMultiplier,  double speedMultiplier,  double maxHp,  double radius,  double lowHpRatio,  double staySecondsMin,  double staySecondsMax,  double waitSightMultiplier)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloneRulesData() when $default != null:
return $default(_that.sightMultiplier,_that.speedMultiplier,_that.maxHp,_that.radius,_that.lowHpRatio,_that.staySecondsMin,_that.staySecondsMax,_that.waitSightMultiplier);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double sightMultiplier,  double speedMultiplier,  double maxHp,  double radius,  double lowHpRatio,  double staySecondsMin,  double staySecondsMax,  double waitSightMultiplier)  $default,) {final _that = this;
switch (_that) {
case _CloneRulesData():
return $default(_that.sightMultiplier,_that.speedMultiplier,_that.maxHp,_that.radius,_that.lowHpRatio,_that.staySecondsMin,_that.staySecondsMax,_that.waitSightMultiplier);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double sightMultiplier,  double speedMultiplier,  double maxHp,  double radius,  double lowHpRatio,  double staySecondsMin,  double staySecondsMax,  double waitSightMultiplier)?  $default,) {final _that = this;
switch (_that) {
case _CloneRulesData() when $default != null:
return $default(_that.sightMultiplier,_that.speedMultiplier,_that.maxHp,_that.radius,_that.lowHpRatio,_that.staySecondsMin,_that.staySecondsMax,_that.waitSightMultiplier);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloneRulesData implements CloneRulesData {
  const _CloneRulesData({required this.sightMultiplier, required this.speedMultiplier, required this.maxHp, required this.radius, required this.lowHpRatio, required this.staySecondsMin, required this.staySecondsMax, required this.waitSightMultiplier});
  factory _CloneRulesData.fromJson(Map<String, dynamic> json) => _$CloneRulesDataFromJson(json);

/// Shares of the player's sight and speed.
@override final  double sightMultiplier;
@override final  double speedMultiplier;
@override final  double maxHp;
@override final  double radius;
/// Below this share of health (after a fight) it heads out.
@override final  double lowHpRatio;
/// How long one stays before heading out, picked between these.
@override final  double staySecondsMin;
@override final  double staySecondsMax;
/// While the player's signal counts down, clone sight grows up to this
/// share at zero.
@override final  double waitSightMultiplier;

/// Create a copy of CloneRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloneRulesDataCopyWith<_CloneRulesData> get copyWith => __$CloneRulesDataCopyWithImpl<_CloneRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloneRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloneRulesData&&(identical(other.sightMultiplier, sightMultiplier) || other.sightMultiplier == sightMultiplier)&&(identical(other.speedMultiplier, speedMultiplier) || other.speedMultiplier == speedMultiplier)&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.lowHpRatio, lowHpRatio) || other.lowHpRatio == lowHpRatio)&&(identical(other.staySecondsMin, staySecondsMin) || other.staySecondsMin == staySecondsMin)&&(identical(other.staySecondsMax, staySecondsMax) || other.staySecondsMax == staySecondsMax)&&(identical(other.waitSightMultiplier, waitSightMultiplier) || other.waitSightMultiplier == waitSightMultiplier));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sightMultiplier,speedMultiplier,maxHp,radius,lowHpRatio,staySecondsMin,staySecondsMax,waitSightMultiplier);
}

@override
String toString() {
    return 'CloneRulesData(sightMultiplier: $sightMultiplier, speedMultiplier: $speedMultiplier, maxHp: $maxHp, radius: $radius, lowHpRatio: $lowHpRatio, staySecondsMin: $staySecondsMin, staySecondsMax: $staySecondsMax, waitSightMultiplier: $waitSightMultiplier)';
}


}

/// @nodoc
abstract mixin class _$CloneRulesDataCopyWith<$Res> implements $CloneRulesDataCopyWith<$Res> {
  factory _$CloneRulesDataCopyWith(_CloneRulesData value, $Res Function(_CloneRulesData) _then) = __$CloneRulesDataCopyWithImpl;
@override @useResult
$Res call({
 double sightMultiplier, double speedMultiplier, double maxHp, double radius, double lowHpRatio, double staySecondsMin, double staySecondsMax, double waitSightMultiplier
});




}
/// @nodoc
class __$CloneRulesDataCopyWithImpl<$Res>
    implements _$CloneRulesDataCopyWith<$Res> {
  __$CloneRulesDataCopyWithImpl(this._self, this._then);

  final _CloneRulesData _self;
  final $Res Function(_CloneRulesData) _then;

/// Create a copy of CloneRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sightMultiplier = null,Object? speedMultiplier = null,Object? maxHp = null,Object? radius = null,Object? lowHpRatio = null,Object? staySecondsMin = null,Object? staySecondsMax = null,Object? waitSightMultiplier = null,}) {
  return _then(_CloneRulesData(
sightMultiplier: null == sightMultiplier ? _self.sightMultiplier : sightMultiplier // ignore: cast_nullable_to_non_nullable
as double,speedMultiplier: null == speedMultiplier ? _self.speedMultiplier : speedMultiplier // ignore: cast_nullable_to_non_nullable
as double,maxHp: null == maxHp ? _self.maxHp : maxHp // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,lowHpRatio: null == lowHpRatio ? _self.lowHpRatio : lowHpRatio // ignore: cast_nullable_to_non_nullable
as double,staySecondsMin: null == staySecondsMin ? _self.staySecondsMin : staySecondsMin // ignore: cast_nullable_to_non_nullable
as double,staySecondsMax: null == staySecondsMax ? _self.staySecondsMax : staySecondsMax // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$DefaultCloneData {

 String get id;/// Shown over its head, in the player's language (2026-10-24).
@LocalizedTextConverter() LocalizedText get name; String get weapon; int get weaponLevel; int get bagSlots;/// Zone scores it fits, both ends included.
 int get scoreMin; int get scoreMax; List<CloneCompanionData> get companions;
/// Create a copy of DefaultCloneData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefaultCloneDataCopyWith<DefaultCloneData> get copyWith => _$DefaultCloneDataCopyWithImpl<DefaultCloneData>(this as DefaultCloneData, _$identity);

  /// Serializes this DefaultCloneData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DefaultCloneData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefaultCloneData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.weapon, _this.weapon) || other.weapon == _this.weapon)&&(identical(other.weaponLevel, _this.weaponLevel) || other.weaponLevel == _this.weaponLevel)&&(identical(other.bagSlots, _this.bagSlots) || other.bagSlots == _this.bagSlots)&&(identical(other.scoreMin, _this.scoreMin) || other.scoreMin == _this.scoreMin)&&(identical(other.scoreMax, _this.scoreMax) || other.scoreMax == _this.scoreMax)&&const DeepCollectionEquality().equals(other.companions, _this.companions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DefaultCloneData;
  return Object.hash(runtimeType,_this.id,_this.name,_this.weapon,_this.weaponLevel,_this.bagSlots,_this.scoreMin,_this.scoreMax,const DeepCollectionEquality().hash(_this.companions));
}

@override
String toString() {
  final _this = this as DefaultCloneData;
  return 'DefaultCloneData(id: ${_this.id}, name: ${_this.name}, weapon: ${_this.weapon}, weaponLevel: ${_this.weaponLevel}, bagSlots: ${_this.bagSlots}, scoreMin: ${_this.scoreMin}, scoreMax: ${_this.scoreMax}, companions: ${_this.companions})';
}


}

/// @nodoc
abstract mixin class $DefaultCloneDataCopyWith<$Res>  {
  factory $DefaultCloneDataCopyWith(DefaultCloneData value, $Res Function(DefaultCloneData) _then) = _$DefaultCloneDataCopyWithImpl;
@useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText name, String weapon, int weaponLevel, int bagSlots, int scoreMin, int scoreMax, List<CloneCompanionData> companions
});




}
/// @nodoc
class _$DefaultCloneDataCopyWithImpl<$Res>
    implements $DefaultCloneDataCopyWith<$Res> {
  _$DefaultCloneDataCopyWithImpl(this._self, this._then);

  final DefaultCloneData _self;
  final $Res Function(DefaultCloneData) _then;

/// Create a copy of DefaultCloneData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? weapon = null,Object? weaponLevel = null,Object? bagSlots = null,Object? scoreMin = null,Object? scoreMax = null,Object? companions = null,}) {
  return _then(DefaultCloneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText,weapon: null == weapon ? _self.weapon : weapon // ignore: cast_nullable_to_non_nullable
as String,weaponLevel: null == weaponLevel ? _self.weaponLevel : weaponLevel // ignore: cast_nullable_to_non_nullable
as int,bagSlots: null == bagSlots ? _self.bagSlots : bagSlots // ignore: cast_nullable_to_non_nullable
as int,scoreMin: null == scoreMin ? _self.scoreMin : scoreMin // ignore: cast_nullable_to_non_nullable
as int,scoreMax: null == scoreMax ? _self.scoreMax : scoreMax // ignore: cast_nullable_to_non_nullable
as int,companions: null == companions ? _self.companions : companions // ignore: cast_nullable_to_non_nullable
as List<CloneCompanionData>,
  ));
}

}


/// Adds pattern-matching-related methods to [DefaultCloneData].
extension DefaultCloneDataPatterns on DefaultCloneData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefaultCloneData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefaultCloneData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefaultCloneData value)  $default,){
final _that = this;
switch (_that) {
case _DefaultCloneData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefaultCloneData value)?  $default,){
final _that = this;
switch (_that) {
case _DefaultCloneData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText name,  String weapon,  int weaponLevel,  int bagSlots,  int scoreMin,  int scoreMax,  List<CloneCompanionData> companions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefaultCloneData() when $default != null:
return $default(_that.id,_that.name,_that.weapon,_that.weaponLevel,_that.bagSlots,_that.scoreMin,_that.scoreMax,_that.companions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @LocalizedTextConverter()  LocalizedText name,  String weapon,  int weaponLevel,  int bagSlots,  int scoreMin,  int scoreMax,  List<CloneCompanionData> companions)  $default,) {final _that = this;
switch (_that) {
case _DefaultCloneData():
return $default(_that.id,_that.name,_that.weapon,_that.weaponLevel,_that.bagSlots,_that.scoreMin,_that.scoreMax,_that.companions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @LocalizedTextConverter()  LocalizedText name,  String weapon,  int weaponLevel,  int bagSlots,  int scoreMin,  int scoreMax,  List<CloneCompanionData> companions)?  $default,) {final _that = this;
switch (_that) {
case _DefaultCloneData() when $default != null:
return $default(_that.id,_that.name,_that.weapon,_that.weaponLevel,_that.bagSlots,_that.scoreMin,_that.scoreMax,_that.companions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DefaultCloneData implements DefaultCloneData {
  const _DefaultCloneData({required this.id, @LocalizedTextConverter() required this.name, required this.weapon, this.weaponLevel = 0, required this.bagSlots, required this.scoreMin, required this.scoreMax,  List<CloneCompanionData> companions = const <CloneCompanionData>[]}): _companions = companions;
  factory _DefaultCloneData.fromJson(Map<String, dynamic> json) => _$DefaultCloneDataFromJson(json);

@override final  String id;
/// Shown over its head, in the player's language (2026-10-24).
@override@LocalizedTextConverter() final  LocalizedText name;
@override final  String weapon;
@override@JsonKey() final  int weaponLevel;
@override final  int bagSlots;
/// Zone scores it fits, both ends included.
@override final  int scoreMin;
@override final  int scoreMax;
 final  List<CloneCompanionData> _companions;
@override@JsonKey() List<CloneCompanionData> get companions {
  if (_companions is EqualUnmodifiableListView) return _companions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companions);
}


/// Create a copy of DefaultCloneData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultCloneDataCopyWith<_DefaultCloneData> get copyWith => __$DefaultCloneDataCopyWithImpl<_DefaultCloneData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefaultCloneDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultCloneData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.weapon, weapon) || other.weapon == weapon)&&(identical(other.weaponLevel, weaponLevel) || other.weaponLevel == weaponLevel)&&(identical(other.bagSlots, bagSlots) || other.bagSlots == bagSlots)&&(identical(other.scoreMin, scoreMin) || other.scoreMin == scoreMin)&&(identical(other.scoreMax, scoreMax) || other.scoreMax == scoreMax)&&const DeepCollectionEquality().equals(other.companions, _companions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,weapon,weaponLevel,bagSlots,scoreMin,scoreMax,const DeepCollectionEquality().hash(_companions));
}

@override
String toString() {
    return 'DefaultCloneData(id: $id, name: $name, weapon: $weapon, weaponLevel: $weaponLevel, bagSlots: $bagSlots, scoreMin: $scoreMin, scoreMax: $scoreMax, companions: $companions)';
}


}

/// @nodoc
abstract mixin class _$DefaultCloneDataCopyWith<$Res> implements $DefaultCloneDataCopyWith<$Res> {
  factory _$DefaultCloneDataCopyWith(_DefaultCloneData value, $Res Function(_DefaultCloneData) _then) = __$DefaultCloneDataCopyWithImpl;
@override @useResult
$Res call({
 String id,@LocalizedTextConverter() LocalizedText name, String weapon, int weaponLevel, int bagSlots, int scoreMin, int scoreMax, List<CloneCompanionData> companions
});




}
/// @nodoc
class __$DefaultCloneDataCopyWithImpl<$Res>
    implements _$DefaultCloneDataCopyWith<$Res> {
  __$DefaultCloneDataCopyWithImpl(this._self, this._then);

  final _DefaultCloneData _self;
  final $Res Function(_DefaultCloneData) _then;

/// Create a copy of DefaultCloneData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? weapon = null,Object? weaponLevel = null,Object? bagSlots = null,Object? scoreMin = null,Object? scoreMax = null,Object? companions = null,}) {
  return _then(_DefaultCloneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText,weapon: null == weapon ? _self.weapon : weapon // ignore: cast_nullable_to_non_nullable
as String,weaponLevel: null == weaponLevel ? _self.weaponLevel : weaponLevel // ignore: cast_nullable_to_non_nullable
as int,bagSlots: null == bagSlots ? _self.bagSlots : bagSlots // ignore: cast_nullable_to_non_nullable
as int,scoreMin: null == scoreMin ? _self.scoreMin : scoreMin // ignore: cast_nullable_to_non_nullable
as int,scoreMax: null == scoreMax ? _self.scoreMax : scoreMax // ignore: cast_nullable_to_non_nullable
as int,companions: null == companions ? _self._companions : companions // ignore: cast_nullable_to_non_nullable
as List<CloneCompanionData>,
  ));
}


}


/// @nodoc
mixin _$CloneCompanionData {

 PotatoType get type; Grade get grade; int get level; List<String> get abilities; CombatStyle? get style;
/// Create a copy of CloneCompanionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloneCompanionDataCopyWith<CloneCompanionData> get copyWith => _$CloneCompanionDataCopyWithImpl<CloneCompanionData>(this as CloneCompanionData, _$identity);

  /// Serializes this CloneCompanionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CloneCompanionData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloneCompanionData&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.level, _this.level) || other.level == _this.level)&&const DeepCollectionEquality().equals(other.abilities, _this.abilities)&&(identical(other.style, _this.style) || other.style == _this.style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CloneCompanionData;
  return Object.hash(runtimeType,_this.type,_this.grade,_this.level,const DeepCollectionEquality().hash(_this.abilities),_this.style);
}

@override
String toString() {
  final _this = this as CloneCompanionData;
  return 'CloneCompanionData(type: ${_this.type}, grade: ${_this.grade}, level: ${_this.level}, abilities: ${_this.abilities}, style: ${_this.style})';
}


}

/// @nodoc
abstract mixin class $CloneCompanionDataCopyWith<$Res>  {
  factory $CloneCompanionDataCopyWith(CloneCompanionData value, $Res Function(CloneCompanionData) _then) = _$CloneCompanionDataCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade, int level, List<String> abilities, CombatStyle? style
});




}
/// @nodoc
class _$CloneCompanionDataCopyWithImpl<$Res>
    implements $CloneCompanionDataCopyWith<$Res> {
  _$CloneCompanionDataCopyWithImpl(this._self, this._then);

  final CloneCompanionData _self;
  final $Res Function(CloneCompanionData) _then;

/// Create a copy of CloneCompanionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,Object? level = null,Object? abilities = null,Object? style = freezed,}) {
  return _then(CloneCompanionData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloneCompanionData].
extension CloneCompanionDataPatterns on CloneCompanionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloneCompanionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloneCompanionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloneCompanionData value)  $default,){
final _that = this;
switch (_that) {
case _CloneCompanionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloneCompanionData value)?  $default,){
final _that = this;
switch (_that) {
case _CloneCompanionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloneCompanionData() when $default != null:
return $default(_that.type,_that.grade,_that.level,_that.abilities,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style)  $default,) {final _that = this;
switch (_that) {
case _CloneCompanionData():
return $default(_that.type,_that.grade,_that.level,_that.abilities,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _CloneCompanionData() when $default != null:
return $default(_that.type,_that.grade,_that.level,_that.abilities,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CloneCompanionData implements CloneCompanionData {
  const _CloneCompanionData({required this.type, required this.grade, this.level = 0, required  List<String> abilities, this.style}): _abilities = abilities;
  factory _CloneCompanionData.fromJson(Map<String, dynamic> json) => _$CloneCompanionDataFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;
@override@JsonKey() final  int level;
 final  List<String> _abilities;
@override List<String> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}

@override final  CombatStyle? style;

/// Create a copy of CloneCompanionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloneCompanionDataCopyWith<_CloneCompanionData> get copyWith => __$CloneCompanionDataCopyWithImpl<_CloneCompanionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CloneCompanionDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloneCompanionData&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.abilities, _abilities)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade,level,const DeepCollectionEquality().hash(_abilities),style);
}

@override
String toString() {
    return 'CloneCompanionData(type: $type, grade: $grade, level: $level, abilities: $abilities, style: $style)';
}


}

/// @nodoc
abstract mixin class _$CloneCompanionDataCopyWith<$Res> implements $CloneCompanionDataCopyWith<$Res> {
  factory _$CloneCompanionDataCopyWith(_CloneCompanionData value, $Res Function(_CloneCompanionData) _then) = __$CloneCompanionDataCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade, int level, List<String> abilities, CombatStyle? style
});




}
/// @nodoc
class __$CloneCompanionDataCopyWithImpl<$Res>
    implements _$CloneCompanionDataCopyWith<$Res> {
  __$CloneCompanionDataCopyWithImpl(this._self, this._then);

  final _CloneCompanionData _self;
  final $Res Function(_CloneCompanionData) _then;

/// Create a copy of CloneCompanionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,Object? level = null,Object? abilities = null,Object? style = freezed,}) {
  return _then(_CloneCompanionData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
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
 double get aimSeconds;/// The gap a clone with this weapon keeps from what it fights.
 double get preferredDistance;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeaponData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.interval, _this.interval) || other.interval == _this.interval)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.bulletSpeed, _this.bulletSpeed) || other.bulletSpeed == _this.bulletSpeed)&&(identical(other.pellets, _this.pellets) || other.pellets == _this.pellets)&&(identical(other.spreadDegrees, _this.spreadDegrees) || other.spreadDegrees == _this.spreadDegrees)&&(identical(other.aimSeconds, _this.aimSeconds) || other.aimSeconds == _this.aimSeconds)&&(identical(other.preferredDistance, _this.preferredDistance) || other.preferredDistance == _this.preferredDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeaponData;
  return Object.hash(runtimeType,_this.id,_this.range,_this.interval,_this.damage,_this.bulletSpeed,_this.pellets,_this.spreadDegrees,_this.aimSeconds,_this.preferredDistance);
}

@override
String toString() {
  final _this = this as WeaponData;
  return 'WeaponData(id: ${_this.id}, range: ${_this.range}, interval: ${_this.interval}, damage: ${_this.damage}, bulletSpeed: ${_this.bulletSpeed}, pellets: ${_this.pellets}, spreadDegrees: ${_this.spreadDegrees}, aimSeconds: ${_this.aimSeconds}, preferredDistance: ${_this.preferredDistance})';
}


}

/// @nodoc
abstract mixin class $WeaponDataCopyWith<$Res>  {
  factory $WeaponDataCopyWith(WeaponData value, $Res Function(WeaponData) _then) = _$WeaponDataCopyWithImpl;
@useResult
$Res call({
 String id, double range, double interval, double damage, double bulletSpeed, int pellets, double spreadDegrees, double aimSeconds, double preferredDistance
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? range = null,Object? interval = null,Object? damage = null,Object? bulletSpeed = null,Object? pellets = null,Object? spreadDegrees = null,Object? aimSeconds = null,Object? preferredDistance = null,}) {
  return _then(WeaponData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,pellets: null == pellets ? _self.pellets : pellets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,aimSeconds: null == aimSeconds ? _self.aimSeconds : aimSeconds // ignore: cast_nullable_to_non_nullable
as double,preferredDistance: null == preferredDistance ? _self.preferredDistance : preferredDistance // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds,  double preferredDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds,_that.preferredDistance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds,  double preferredDistance)  $default,) {final _that = this;
switch (_that) {
case _WeaponData():
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds,_that.preferredDistance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double range,  double interval,  double damage,  double bulletSpeed,  int pellets,  double spreadDegrees,  double aimSeconds,  double preferredDistance)?  $default,) {final _that = this;
switch (_that) {
case _WeaponData() when $default != null:
return $default(_that.id,_that.range,_that.interval,_that.damage,_that.bulletSpeed,_that.pellets,_that.spreadDegrees,_that.aimSeconds,_that.preferredDistance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeaponData implements WeaponData {
  const _WeaponData({required this.id, required this.range, required this.interval, required this.damage, required this.bulletSpeed, this.pellets = 1, this.spreadDegrees = 0.0, this.aimSeconds = 0.0, this.preferredDistance = 1.5});
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
/// The gap a clone with this weapon keeps from what it fights.
@override@JsonKey() final  double preferredDistance;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeaponData&&(identical(other.id, id) || other.id == id)&&(identical(other.range, range) || other.range == range)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.bulletSpeed, bulletSpeed) || other.bulletSpeed == bulletSpeed)&&(identical(other.pellets, pellets) || other.pellets == pellets)&&(identical(other.spreadDegrees, spreadDegrees) || other.spreadDegrees == spreadDegrees)&&(identical(other.aimSeconds, aimSeconds) || other.aimSeconds == aimSeconds)&&(identical(other.preferredDistance, preferredDistance) || other.preferredDistance == preferredDistance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,range,interval,damage,bulletSpeed,pellets,spreadDegrees,aimSeconds,preferredDistance);
}

@override
String toString() {
    return 'WeaponData(id: $id, range: $range, interval: $interval, damage: $damage, bulletSpeed: $bulletSpeed, pellets: $pellets, spreadDegrees: $spreadDegrees, aimSeconds: $aimSeconds, preferredDistance: $preferredDistance)';
}


}

/// @nodoc
abstract mixin class _$WeaponDataCopyWith<$Res> implements $WeaponDataCopyWith<$Res> {
  factory _$WeaponDataCopyWith(_WeaponData value, $Res Function(_WeaponData) _then) = __$WeaponDataCopyWithImpl;
@override @useResult
$Res call({
 String id, double range, double interval, double damage, double bulletSpeed, int pellets, double spreadDegrees, double aimSeconds, double preferredDistance
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? range = null,Object? interval = null,Object? damage = null,Object? bulletSpeed = null,Object? pellets = null,Object? spreadDegrees = null,Object? aimSeconds = null,Object? preferredDistance = null,}) {
  return _then(_WeaponData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,bulletSpeed: null == bulletSpeed ? _self.bulletSpeed : bulletSpeed // ignore: cast_nullable_to_non_nullable
as double,pellets: null == pellets ? _self.pellets : pellets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,aimSeconds: null == aimSeconds ? _self.aimSeconds : aimSeconds // ignore: cast_nullable_to_non_nullable
as double,preferredDistance: null == preferredDistance ? _self.preferredDistance : preferredDistance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$EnemyData {

 String get id; EnemyTemper get temper; EnemyAttack get attack; double get maxHp; double get radius; double get damage; double get attackInterval;/// Melee: gap between bodies within which it hits.
 double get reach;/// Ranged: shooting distance.
 double get range; double get bulletSpeed;/// Set for a boss: it guards the boss area and has extra attacks.
 BossData? get boss;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnemyData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.temper, _this.temper) || other.temper == _this.temper)&&(identical(other.attack, _this.attack) || other.attack == _this.attack)&&(identical(other.maxHp, _this.maxHp) || other.maxHp == _this.maxHp)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.attackInterval, _this.attackInterval) || other.attackInterval == _this.attackInterval)&&(identical(other.reach, _this.reach) || other.reach == _this.reach)&&(identical(other.range, _this.range) || other.range == _this.range)&&(identical(other.bulletSpeed, _this.bulletSpeed) || other.bulletSpeed == _this.bulletSpeed)&&(identical(other.boss, _this.boss) || other.boss == _this.boss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EnemyData;
  return Object.hash(runtimeType,_this.id,_this.temper,_this.attack,_this.maxHp,_this.radius,_this.damage,_this.attackInterval,_this.reach,_this.range,_this.bulletSpeed,_this.boss);
}

@override
String toString() {
  final _this = this as EnemyData;
  return 'EnemyData(id: ${_this.id}, temper: ${_this.temper}, attack: ${_this.attack}, maxHp: ${_this.maxHp}, radius: ${_this.radius}, damage: ${_this.damage}, attackInterval: ${_this.attackInterval}, reach: ${_this.reach}, range: ${_this.range}, bulletSpeed: ${_this.bulletSpeed}, boss: ${_this.boss})';
}


}

/// @nodoc
abstract mixin class $EnemyDataCopyWith<$Res>  {
  factory $EnemyDataCopyWith(EnemyData value, $Res Function(EnemyData) _then) = _$EnemyDataCopyWithImpl;
@useResult
$Res call({
 String id, EnemyTemper temper, EnemyAttack attack, double maxHp, double radius, double damage, double attackInterval, double reach, double range, double bulletSpeed, BossData? boss
});


$BossDataCopyWith<$Res>? get boss;

}
/// @nodoc
class _$EnemyDataCopyWithImpl<$Res>
    implements $EnemyDataCopyWith<$Res> {
  _$EnemyDataCopyWithImpl(this._self, this._then);

  final EnemyData _self;
  final $Res Function(EnemyData) _then;

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? temper = null,Object? attack = null,Object? maxHp = null,Object? radius = null,Object? damage = null,Object? attackInterval = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,Object? boss = freezed,}) {
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
as double,boss: freezed == boss ? _self.boss : boss // ignore: cast_nullable_to_non_nullable
as BossData?,
  ));
}
/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossDataCopyWith<$Res>? get boss {
    if (_self.boss == null) {
    return null;
  }

  return $BossDataCopyWith<$Res>(_self.boss!, (value) {
    return _then(_self.copyWith(boss: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed,  BossData? boss)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed,_that.boss);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed,  BossData? boss)  $default,) {final _that = this;
switch (_that) {
case _EnemyData():
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed,_that.boss);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  EnemyTemper temper,  EnemyAttack attack,  double maxHp,  double radius,  double damage,  double attackInterval,  double reach,  double range,  double bulletSpeed,  BossData? boss)?  $default,) {final _that = this;
switch (_that) {
case _EnemyData() when $default != null:
return $default(_that.id,_that.temper,_that.attack,_that.maxHp,_that.radius,_that.damage,_that.attackInterval,_that.reach,_that.range,_that.bulletSpeed,_that.boss);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EnemyData implements EnemyData {
  const _EnemyData({required this.id, required this.temper, required this.attack, required this.maxHp, required this.radius, required this.damage, required this.attackInterval, this.reach = 0.0, this.range = 0.0, this.bulletSpeed = 0.0, this.boss});
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
/// Set for a boss: it guards the boss area and has extra attacks.
@override final  BossData? boss;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnemyData&&(identical(other.id, id) || other.id == id)&&(identical(other.temper, temper) || other.temper == temper)&&(identical(other.attack, attack) || other.attack == attack)&&(identical(other.maxHp, maxHp) || other.maxHp == maxHp)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.attackInterval, attackInterval) || other.attackInterval == attackInterval)&&(identical(other.reach, reach) || other.reach == reach)&&(identical(other.range, range) || other.range == range)&&(identical(other.bulletSpeed, bulletSpeed) || other.bulletSpeed == bulletSpeed)&&(identical(other.boss, boss) || other.boss == boss));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,temper,attack,maxHp,radius,damage,attackInterval,reach,range,bulletSpeed,boss);
}

@override
String toString() {
    return 'EnemyData(id: $id, temper: $temper, attack: $attack, maxHp: $maxHp, radius: $radius, damage: $damage, attackInterval: $attackInterval, reach: $reach, range: $range, bulletSpeed: $bulletSpeed, boss: $boss)';
}


}

/// @nodoc
abstract mixin class _$EnemyDataCopyWith<$Res> implements $EnemyDataCopyWith<$Res> {
  factory _$EnemyDataCopyWith(_EnemyData value, $Res Function(_EnemyData) _then) = __$EnemyDataCopyWithImpl;
@override @useResult
$Res call({
 String id, EnemyTemper temper, EnemyAttack attack, double maxHp, double radius, double damage, double attackInterval, double reach, double range, double bulletSpeed, BossData? boss
});


@override $BossDataCopyWith<$Res>? get boss;

}
/// @nodoc
class __$EnemyDataCopyWithImpl<$Res>
    implements _$EnemyDataCopyWith<$Res> {
  __$EnemyDataCopyWithImpl(this._self, this._then);

  final _EnemyData _self;
  final $Res Function(_EnemyData) _then;

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? temper = null,Object? attack = null,Object? maxHp = null,Object? radius = null,Object? damage = null,Object? attackInterval = null,Object? reach = null,Object? range = null,Object? bulletSpeed = null,Object? boss = freezed,}) {
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
as double,boss: freezed == boss ? _self.boss : boss // ignore: cast_nullable_to_non_nullable
as BossData?,
  ));
}

/// Create a copy of EnemyData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossDataCopyWith<$Res>? get boss {
    if (_self.boss == null) {
    return null;
  }

  return $BossDataCopyWith<$Res>(_self.boss!, (value) {
    return _then(_self.copyWith(boss: value));
  });
}
}


/// @nodoc
mixin _$BossData {

 double get chargeEverySeconds; double get chargeTelegraphSeconds; double get chargeSpeed; double get chargeDistance; double get chargeDamage; double get sprayEverySeconds; int get sprayBullets; double get sprayDamage; double get spraySpeed; double get sprayRange; BossJumpData? get jump; BossBurrowData? get burrow; List<BossCloudData> get clouds; List<BossShotData> get shots;
/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossDataCopyWith<BossData> get copyWith => _$BossDataCopyWithImpl<BossData>(this as BossData, _$identity);

  /// Serializes this BossData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BossData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossData&&(identical(other.chargeEverySeconds, _this.chargeEverySeconds) || other.chargeEverySeconds == _this.chargeEverySeconds)&&(identical(other.chargeTelegraphSeconds, _this.chargeTelegraphSeconds) || other.chargeTelegraphSeconds == _this.chargeTelegraphSeconds)&&(identical(other.chargeSpeed, _this.chargeSpeed) || other.chargeSpeed == _this.chargeSpeed)&&(identical(other.chargeDistance, _this.chargeDistance) || other.chargeDistance == _this.chargeDistance)&&(identical(other.chargeDamage, _this.chargeDamage) || other.chargeDamage == _this.chargeDamage)&&(identical(other.sprayEverySeconds, _this.sprayEverySeconds) || other.sprayEverySeconds == _this.sprayEverySeconds)&&(identical(other.sprayBullets, _this.sprayBullets) || other.sprayBullets == _this.sprayBullets)&&(identical(other.sprayDamage, _this.sprayDamage) || other.sprayDamage == _this.sprayDamage)&&(identical(other.spraySpeed, _this.spraySpeed) || other.spraySpeed == _this.spraySpeed)&&(identical(other.sprayRange, _this.sprayRange) || other.sprayRange == _this.sprayRange)&&(identical(other.jump, _this.jump) || other.jump == _this.jump)&&(identical(other.burrow, _this.burrow) || other.burrow == _this.burrow)&&const DeepCollectionEquality().equals(other.clouds, _this.clouds)&&const DeepCollectionEquality().equals(other.shots, _this.shots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BossData;
  return Object.hash(runtimeType,_this.chargeEverySeconds,_this.chargeTelegraphSeconds,_this.chargeSpeed,_this.chargeDistance,_this.chargeDamage,_this.sprayEverySeconds,_this.sprayBullets,_this.sprayDamage,_this.spraySpeed,_this.sprayRange,_this.jump,_this.burrow,const DeepCollectionEquality().hash(_this.clouds),const DeepCollectionEquality().hash(_this.shots));
}

@override
String toString() {
  final _this = this as BossData;
  return 'BossData(chargeEverySeconds: ${_this.chargeEverySeconds}, chargeTelegraphSeconds: ${_this.chargeTelegraphSeconds}, chargeSpeed: ${_this.chargeSpeed}, chargeDistance: ${_this.chargeDistance}, chargeDamage: ${_this.chargeDamage}, sprayEverySeconds: ${_this.sprayEverySeconds}, sprayBullets: ${_this.sprayBullets}, sprayDamage: ${_this.sprayDamage}, spraySpeed: ${_this.spraySpeed}, sprayRange: ${_this.sprayRange}, jump: ${_this.jump}, burrow: ${_this.burrow}, clouds: ${_this.clouds}, shots: ${_this.shots})';
}


}

/// @nodoc
abstract mixin class $BossDataCopyWith<$Res>  {
  factory $BossDataCopyWith(BossData value, $Res Function(BossData) _then) = _$BossDataCopyWithImpl;
@useResult
$Res call({
 double chargeEverySeconds, double chargeTelegraphSeconds, double chargeSpeed, double chargeDistance, double chargeDamage, double sprayEverySeconds, int sprayBullets, double sprayDamage, double spraySpeed, double sprayRange, BossJumpData? jump, BossBurrowData? burrow, List<BossCloudData> clouds, List<BossShotData> shots
});


$BossJumpDataCopyWith<$Res>? get jump;$BossBurrowDataCopyWith<$Res>? get burrow;

}
/// @nodoc
class _$BossDataCopyWithImpl<$Res>
    implements $BossDataCopyWith<$Res> {
  _$BossDataCopyWithImpl(this._self, this._then);

  final BossData _self;
  final $Res Function(BossData) _then;

/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chargeEverySeconds = null,Object? chargeTelegraphSeconds = null,Object? chargeSpeed = null,Object? chargeDistance = null,Object? chargeDamage = null,Object? sprayEverySeconds = null,Object? sprayBullets = null,Object? sprayDamage = null,Object? spraySpeed = null,Object? sprayRange = null,Object? jump = freezed,Object? burrow = freezed,Object? clouds = null,Object? shots = null,}) {
  return _then(BossData(
chargeEverySeconds: null == chargeEverySeconds ? _self.chargeEverySeconds : chargeEverySeconds // ignore: cast_nullable_to_non_nullable
as double,chargeTelegraphSeconds: null == chargeTelegraphSeconds ? _self.chargeTelegraphSeconds : chargeTelegraphSeconds // ignore: cast_nullable_to_non_nullable
as double,chargeSpeed: null == chargeSpeed ? _self.chargeSpeed : chargeSpeed // ignore: cast_nullable_to_non_nullable
as double,chargeDistance: null == chargeDistance ? _self.chargeDistance : chargeDistance // ignore: cast_nullable_to_non_nullable
as double,chargeDamage: null == chargeDamage ? _self.chargeDamage : chargeDamage // ignore: cast_nullable_to_non_nullable
as double,sprayEverySeconds: null == sprayEverySeconds ? _self.sprayEverySeconds : sprayEverySeconds // ignore: cast_nullable_to_non_nullable
as double,sprayBullets: null == sprayBullets ? _self.sprayBullets : sprayBullets // ignore: cast_nullable_to_non_nullable
as int,sprayDamage: null == sprayDamage ? _self.sprayDamage : sprayDamage // ignore: cast_nullable_to_non_nullable
as double,spraySpeed: null == spraySpeed ? _self.spraySpeed : spraySpeed // ignore: cast_nullable_to_non_nullable
as double,sprayRange: null == sprayRange ? _self.sprayRange : sprayRange // ignore: cast_nullable_to_non_nullable
as double,jump: freezed == jump ? _self.jump : jump // ignore: cast_nullable_to_non_nullable
as BossJumpData?,burrow: freezed == burrow ? _self.burrow : burrow // ignore: cast_nullable_to_non_nullable
as BossBurrowData?,clouds: null == clouds ? _self.clouds : clouds // ignore: cast_nullable_to_non_nullable
as List<BossCloudData>,shots: null == shots ? _self.shots : shots // ignore: cast_nullable_to_non_nullable
as List<BossShotData>,
  ));
}
/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossJumpDataCopyWith<$Res>? get jump {
    if (_self.jump == null) {
    return null;
  }

  return $BossJumpDataCopyWith<$Res>(_self.jump!, (value) {
    return _then(_self.copyWith(jump: value));
  });
}/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossBurrowDataCopyWith<$Res>? get burrow {
    if (_self.burrow == null) {
    return null;
  }

  return $BossBurrowDataCopyWith<$Res>(_self.burrow!, (value) {
    return _then(_self.copyWith(burrow: value));
  });
}
}


/// Adds pattern-matching-related methods to [BossData].
extension BossDataPatterns on BossData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossData value)  $default,){
final _that = this;
switch (_that) {
case _BossData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossData value)?  $default,){
final _that = this;
switch (_that) {
case _BossData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double chargeEverySeconds,  double chargeTelegraphSeconds,  double chargeSpeed,  double chargeDistance,  double chargeDamage,  double sprayEverySeconds,  int sprayBullets,  double sprayDamage,  double spraySpeed,  double sprayRange,  BossJumpData? jump,  BossBurrowData? burrow,  List<BossCloudData> clouds,  List<BossShotData> shots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossData() when $default != null:
return $default(_that.chargeEverySeconds,_that.chargeTelegraphSeconds,_that.chargeSpeed,_that.chargeDistance,_that.chargeDamage,_that.sprayEverySeconds,_that.sprayBullets,_that.sprayDamage,_that.spraySpeed,_that.sprayRange,_that.jump,_that.burrow,_that.clouds,_that.shots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double chargeEverySeconds,  double chargeTelegraphSeconds,  double chargeSpeed,  double chargeDistance,  double chargeDamage,  double sprayEverySeconds,  int sprayBullets,  double sprayDamage,  double spraySpeed,  double sprayRange,  BossJumpData? jump,  BossBurrowData? burrow,  List<BossCloudData> clouds,  List<BossShotData> shots)  $default,) {final _that = this;
switch (_that) {
case _BossData():
return $default(_that.chargeEverySeconds,_that.chargeTelegraphSeconds,_that.chargeSpeed,_that.chargeDistance,_that.chargeDamage,_that.sprayEverySeconds,_that.sprayBullets,_that.sprayDamage,_that.spraySpeed,_that.sprayRange,_that.jump,_that.burrow,_that.clouds,_that.shots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double chargeEverySeconds,  double chargeTelegraphSeconds,  double chargeSpeed,  double chargeDistance,  double chargeDamage,  double sprayEverySeconds,  int sprayBullets,  double sprayDamage,  double spraySpeed,  double sprayRange,  BossJumpData? jump,  BossBurrowData? burrow,  List<BossCloudData> clouds,  List<BossShotData> shots)?  $default,) {final _that = this;
switch (_that) {
case _BossData() when $default != null:
return $default(_that.chargeEverySeconds,_that.chargeTelegraphSeconds,_that.chargeSpeed,_that.chargeDistance,_that.chargeDamage,_that.sprayEverySeconds,_that.sprayBullets,_that.sprayDamage,_that.spraySpeed,_that.sprayRange,_that.jump,_that.burrow,_that.clouds,_that.shots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossData implements BossData {
  const _BossData({this.chargeEverySeconds = 0.0, this.chargeTelegraphSeconds = 0.0, this.chargeSpeed = 0.0, this.chargeDistance = 0.0, this.chargeDamage = 0.0, this.sprayEverySeconds = 0.0, this.sprayBullets = 0, this.sprayDamage = 0.0, this.spraySpeed = 0.0, this.sprayRange = 0.0, this.jump, this.burrow,  List<BossCloudData> clouds = const <BossCloudData>[],  List<BossShotData> shots = const <BossShotData>[]}): _clouds = clouds,_shots = shots;
  factory _BossData.fromJson(Map<String, dynamic> json) => _$BossDataFromJson(json);

@override@JsonKey() final  double chargeEverySeconds;
@override@JsonKey() final  double chargeTelegraphSeconds;
@override@JsonKey() final  double chargeSpeed;
@override@JsonKey() final  double chargeDistance;
@override@JsonKey() final  double chargeDamage;
@override@JsonKey() final  double sprayEverySeconds;
@override@JsonKey() final  int sprayBullets;
@override@JsonKey() final  double sprayDamage;
@override@JsonKey() final  double spraySpeed;
@override@JsonKey() final  double sprayRange;
@override final  BossJumpData? jump;
@override final  BossBurrowData? burrow;
 final  List<BossCloudData> _clouds;
@override@JsonKey() List<BossCloudData> get clouds {
  if (_clouds is EqualUnmodifiableListView) return _clouds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clouds);
}

 final  List<BossShotData> _shots;
@override@JsonKey() List<BossShotData> get shots {
  if (_shots is EqualUnmodifiableListView) return _shots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shots);
}


/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossDataCopyWith<_BossData> get copyWith => __$BossDataCopyWithImpl<_BossData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossData&&(identical(other.chargeEverySeconds, chargeEverySeconds) || other.chargeEverySeconds == chargeEverySeconds)&&(identical(other.chargeTelegraphSeconds, chargeTelegraphSeconds) || other.chargeTelegraphSeconds == chargeTelegraphSeconds)&&(identical(other.chargeSpeed, chargeSpeed) || other.chargeSpeed == chargeSpeed)&&(identical(other.chargeDistance, chargeDistance) || other.chargeDistance == chargeDistance)&&(identical(other.chargeDamage, chargeDamage) || other.chargeDamage == chargeDamage)&&(identical(other.sprayEverySeconds, sprayEverySeconds) || other.sprayEverySeconds == sprayEverySeconds)&&(identical(other.sprayBullets, sprayBullets) || other.sprayBullets == sprayBullets)&&(identical(other.sprayDamage, sprayDamage) || other.sprayDamage == sprayDamage)&&(identical(other.spraySpeed, spraySpeed) || other.spraySpeed == spraySpeed)&&(identical(other.sprayRange, sprayRange) || other.sprayRange == sprayRange)&&(identical(other.jump, jump) || other.jump == jump)&&(identical(other.burrow, burrow) || other.burrow == burrow)&&const DeepCollectionEquality().equals(other.clouds, _clouds)&&const DeepCollectionEquality().equals(other.shots, _shots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chargeEverySeconds,chargeTelegraphSeconds,chargeSpeed,chargeDistance,chargeDamage,sprayEverySeconds,sprayBullets,sprayDamage,spraySpeed,sprayRange,jump,burrow,const DeepCollectionEquality().hash(_clouds),const DeepCollectionEquality().hash(_shots));
}

@override
String toString() {
    return 'BossData(chargeEverySeconds: $chargeEverySeconds, chargeTelegraphSeconds: $chargeTelegraphSeconds, chargeSpeed: $chargeSpeed, chargeDistance: $chargeDistance, chargeDamage: $chargeDamage, sprayEverySeconds: $sprayEverySeconds, sprayBullets: $sprayBullets, sprayDamage: $sprayDamage, spraySpeed: $spraySpeed, sprayRange: $sprayRange, jump: $jump, burrow: $burrow, clouds: $clouds, shots: $shots)';
}


}

/// @nodoc
abstract mixin class _$BossDataCopyWith<$Res> implements $BossDataCopyWith<$Res> {
  factory _$BossDataCopyWith(_BossData value, $Res Function(_BossData) _then) = __$BossDataCopyWithImpl;
@override @useResult
$Res call({
 double chargeEverySeconds, double chargeTelegraphSeconds, double chargeSpeed, double chargeDistance, double chargeDamage, double sprayEverySeconds, int sprayBullets, double sprayDamage, double spraySpeed, double sprayRange, BossJumpData? jump, BossBurrowData? burrow, List<BossCloudData> clouds, List<BossShotData> shots
});


@override $BossJumpDataCopyWith<$Res>? get jump;@override $BossBurrowDataCopyWith<$Res>? get burrow;

}
/// @nodoc
class __$BossDataCopyWithImpl<$Res>
    implements _$BossDataCopyWith<$Res> {
  __$BossDataCopyWithImpl(this._self, this._then);

  final _BossData _self;
  final $Res Function(_BossData) _then;

/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chargeEverySeconds = null,Object? chargeTelegraphSeconds = null,Object? chargeSpeed = null,Object? chargeDistance = null,Object? chargeDamage = null,Object? sprayEverySeconds = null,Object? sprayBullets = null,Object? sprayDamage = null,Object? spraySpeed = null,Object? sprayRange = null,Object? jump = freezed,Object? burrow = freezed,Object? clouds = null,Object? shots = null,}) {
  return _then(_BossData(
chargeEverySeconds: null == chargeEverySeconds ? _self.chargeEverySeconds : chargeEverySeconds // ignore: cast_nullable_to_non_nullable
as double,chargeTelegraphSeconds: null == chargeTelegraphSeconds ? _self.chargeTelegraphSeconds : chargeTelegraphSeconds // ignore: cast_nullable_to_non_nullable
as double,chargeSpeed: null == chargeSpeed ? _self.chargeSpeed : chargeSpeed // ignore: cast_nullable_to_non_nullable
as double,chargeDistance: null == chargeDistance ? _self.chargeDistance : chargeDistance // ignore: cast_nullable_to_non_nullable
as double,chargeDamage: null == chargeDamage ? _self.chargeDamage : chargeDamage // ignore: cast_nullable_to_non_nullable
as double,sprayEverySeconds: null == sprayEverySeconds ? _self.sprayEverySeconds : sprayEverySeconds // ignore: cast_nullable_to_non_nullable
as double,sprayBullets: null == sprayBullets ? _self.sprayBullets : sprayBullets // ignore: cast_nullable_to_non_nullable
as int,sprayDamage: null == sprayDamage ? _self.sprayDamage : sprayDamage // ignore: cast_nullable_to_non_nullable
as double,spraySpeed: null == spraySpeed ? _self.spraySpeed : spraySpeed // ignore: cast_nullable_to_non_nullable
as double,sprayRange: null == sprayRange ? _self.sprayRange : sprayRange // ignore: cast_nullable_to_non_nullable
as double,jump: freezed == jump ? _self.jump : jump // ignore: cast_nullable_to_non_nullable
as BossJumpData?,burrow: freezed == burrow ? _self.burrow : burrow // ignore: cast_nullable_to_non_nullable
as BossBurrowData?,clouds: null == clouds ? _self._clouds : clouds // ignore: cast_nullable_to_non_nullable
as List<BossCloudData>,shots: null == shots ? _self._shots : shots // ignore: cast_nullable_to_non_nullable
as List<BossShotData>,
  ));
}

/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossJumpDataCopyWith<$Res>? get jump {
    if (_self.jump == null) {
    return null;
  }

  return $BossJumpDataCopyWith<$Res>(_self.jump!, (value) {
    return _then(_self.copyWith(jump: value));
  });
}/// Create a copy of BossData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BossBurrowDataCopyWith<$Res>? get burrow {
    if (_self.burrow == null) {
    return null;
  }

  return $BossBurrowDataCopyWith<$Res>(_self.burrow!, (value) {
    return _then(_self.copyWith(burrow: value));
  });
}
}


/// @nodoc
mixin _$BossJumpData {

 double get everySeconds; double get airSeconds; double get lockSeconds; double get radius; double get damage;
/// Create a copy of BossJumpData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossJumpDataCopyWith<BossJumpData> get copyWith => _$BossJumpDataCopyWithImpl<BossJumpData>(this as BossJumpData, _$identity);

  /// Serializes this BossJumpData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BossJumpData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossJumpData&&(identical(other.everySeconds, _this.everySeconds) || other.everySeconds == _this.everySeconds)&&(identical(other.airSeconds, _this.airSeconds) || other.airSeconds == _this.airSeconds)&&(identical(other.lockSeconds, _this.lockSeconds) || other.lockSeconds == _this.lockSeconds)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.damage, _this.damage) || other.damage == _this.damage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BossJumpData;
  return Object.hash(runtimeType,_this.everySeconds,_this.airSeconds,_this.lockSeconds,_this.radius,_this.damage);
}

@override
String toString() {
  final _this = this as BossJumpData;
  return 'BossJumpData(everySeconds: ${_this.everySeconds}, airSeconds: ${_this.airSeconds}, lockSeconds: ${_this.lockSeconds}, radius: ${_this.radius}, damage: ${_this.damage})';
}


}

/// @nodoc
abstract mixin class $BossJumpDataCopyWith<$Res>  {
  factory $BossJumpDataCopyWith(BossJumpData value, $Res Function(BossJumpData) _then) = _$BossJumpDataCopyWithImpl;
@useResult
$Res call({
 double everySeconds, double airSeconds, double lockSeconds, double radius, double damage
});




}
/// @nodoc
class _$BossJumpDataCopyWithImpl<$Res>
    implements $BossJumpDataCopyWith<$Res> {
  _$BossJumpDataCopyWithImpl(this._self, this._then);

  final BossJumpData _self;
  final $Res Function(BossJumpData) _then;

/// Create a copy of BossJumpData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? everySeconds = null,Object? airSeconds = null,Object? lockSeconds = null,Object? radius = null,Object? damage = null,}) {
  return _then(BossJumpData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,airSeconds: null == airSeconds ? _self.airSeconds : airSeconds // ignore: cast_nullable_to_non_nullable
as double,lockSeconds: null == lockSeconds ? _self.lockSeconds : lockSeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BossJumpData].
extension BossJumpDataPatterns on BossJumpData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossJumpData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossJumpData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossJumpData value)  $default,){
final _that = this;
switch (_that) {
case _BossJumpData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossJumpData value)?  $default,){
final _that = this;
switch (_that) {
case _BossJumpData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double everySeconds,  double airSeconds,  double lockSeconds,  double radius,  double damage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossJumpData() when $default != null:
return $default(_that.everySeconds,_that.airSeconds,_that.lockSeconds,_that.radius,_that.damage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double everySeconds,  double airSeconds,  double lockSeconds,  double radius,  double damage)  $default,) {final _that = this;
switch (_that) {
case _BossJumpData():
return $default(_that.everySeconds,_that.airSeconds,_that.lockSeconds,_that.radius,_that.damage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double everySeconds,  double airSeconds,  double lockSeconds,  double radius,  double damage)?  $default,) {final _that = this;
switch (_that) {
case _BossJumpData() when $default != null:
return $default(_that.everySeconds,_that.airSeconds,_that.lockSeconds,_that.radius,_that.damage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossJumpData implements BossJumpData {
  const _BossJumpData({required this.everySeconds, required this.airSeconds, this.lockSeconds = 0.7, required this.radius, required this.damage});
  factory _BossJumpData.fromJson(Map<String, dynamic> json) => _$BossJumpDataFromJson(json);

@override final  double everySeconds;
@override final  double airSeconds;
@override@JsonKey() final  double lockSeconds;
@override final  double radius;
@override final  double damage;

/// Create a copy of BossJumpData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossJumpDataCopyWith<_BossJumpData> get copyWith => __$BossJumpDataCopyWithImpl<_BossJumpData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossJumpDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossJumpData&&(identical(other.everySeconds, everySeconds) || other.everySeconds == everySeconds)&&(identical(other.airSeconds, airSeconds) || other.airSeconds == airSeconds)&&(identical(other.lockSeconds, lockSeconds) || other.lockSeconds == lockSeconds)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.damage, damage) || other.damage == damage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,everySeconds,airSeconds,lockSeconds,radius,damage);
}

@override
String toString() {
    return 'BossJumpData(everySeconds: $everySeconds, airSeconds: $airSeconds, lockSeconds: $lockSeconds, radius: $radius, damage: $damage)';
}


}

/// @nodoc
abstract mixin class _$BossJumpDataCopyWith<$Res> implements $BossJumpDataCopyWith<$Res> {
  factory _$BossJumpDataCopyWith(_BossJumpData value, $Res Function(_BossJumpData) _then) = __$BossJumpDataCopyWithImpl;
@override @useResult
$Res call({
 double everySeconds, double airSeconds, double lockSeconds, double radius, double damage
});




}
/// @nodoc
class __$BossJumpDataCopyWithImpl<$Res>
    implements _$BossJumpDataCopyWith<$Res> {
  __$BossJumpDataCopyWithImpl(this._self, this._then);

  final _BossJumpData _self;
  final $Res Function(_BossJumpData) _then;

/// Create a copy of BossJumpData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? everySeconds = null,Object? airSeconds = null,Object? lockSeconds = null,Object? radius = null,Object? damage = null,}) {
  return _then(_BossJumpData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,airSeconds: null == airSeconds ? _self.airSeconds : airSeconds // ignore: cast_nullable_to_non_nullable
as double,lockSeconds: null == lockSeconds ? _self.lockSeconds : lockSeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BossBurrowData {

 double get everySeconds; double get followSeconds; double get lockSeconds; int get followUps; double get followUpLockSeconds; double get radius; double get damage;
/// Create a copy of BossBurrowData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossBurrowDataCopyWith<BossBurrowData> get copyWith => _$BossBurrowDataCopyWithImpl<BossBurrowData>(this as BossBurrowData, _$identity);

  /// Serializes this BossBurrowData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BossBurrowData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossBurrowData&&(identical(other.everySeconds, _this.everySeconds) || other.everySeconds == _this.everySeconds)&&(identical(other.followSeconds, _this.followSeconds) || other.followSeconds == _this.followSeconds)&&(identical(other.lockSeconds, _this.lockSeconds) || other.lockSeconds == _this.lockSeconds)&&(identical(other.followUps, _this.followUps) || other.followUps == _this.followUps)&&(identical(other.followUpLockSeconds, _this.followUpLockSeconds) || other.followUpLockSeconds == _this.followUpLockSeconds)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.damage, _this.damage) || other.damage == _this.damage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BossBurrowData;
  return Object.hash(runtimeType,_this.everySeconds,_this.followSeconds,_this.lockSeconds,_this.followUps,_this.followUpLockSeconds,_this.radius,_this.damage);
}

@override
String toString() {
  final _this = this as BossBurrowData;
  return 'BossBurrowData(everySeconds: ${_this.everySeconds}, followSeconds: ${_this.followSeconds}, lockSeconds: ${_this.lockSeconds}, followUps: ${_this.followUps}, followUpLockSeconds: ${_this.followUpLockSeconds}, radius: ${_this.radius}, damage: ${_this.damage})';
}


}

/// @nodoc
abstract mixin class $BossBurrowDataCopyWith<$Res>  {
  factory $BossBurrowDataCopyWith(BossBurrowData value, $Res Function(BossBurrowData) _then) = _$BossBurrowDataCopyWithImpl;
@useResult
$Res call({
 double everySeconds, double followSeconds, double lockSeconds, int followUps, double followUpLockSeconds, double radius, double damage
});




}
/// @nodoc
class _$BossBurrowDataCopyWithImpl<$Res>
    implements $BossBurrowDataCopyWith<$Res> {
  _$BossBurrowDataCopyWithImpl(this._self, this._then);

  final BossBurrowData _self;
  final $Res Function(BossBurrowData) _then;

/// Create a copy of BossBurrowData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? everySeconds = null,Object? followSeconds = null,Object? lockSeconds = null,Object? followUps = null,Object? followUpLockSeconds = null,Object? radius = null,Object? damage = null,}) {
  return _then(BossBurrowData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,followSeconds: null == followSeconds ? _self.followSeconds : followSeconds // ignore: cast_nullable_to_non_nullable
as double,lockSeconds: null == lockSeconds ? _self.lockSeconds : lockSeconds // ignore: cast_nullable_to_non_nullable
as double,followUps: null == followUps ? _self.followUps : followUps // ignore: cast_nullable_to_non_nullable
as int,followUpLockSeconds: null == followUpLockSeconds ? _self.followUpLockSeconds : followUpLockSeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BossBurrowData].
extension BossBurrowDataPatterns on BossBurrowData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossBurrowData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossBurrowData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossBurrowData value)  $default,){
final _that = this;
switch (_that) {
case _BossBurrowData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossBurrowData value)?  $default,){
final _that = this;
switch (_that) {
case _BossBurrowData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double everySeconds,  double followSeconds,  double lockSeconds,  int followUps,  double followUpLockSeconds,  double radius,  double damage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossBurrowData() when $default != null:
return $default(_that.everySeconds,_that.followSeconds,_that.lockSeconds,_that.followUps,_that.followUpLockSeconds,_that.radius,_that.damage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double everySeconds,  double followSeconds,  double lockSeconds,  int followUps,  double followUpLockSeconds,  double radius,  double damage)  $default,) {final _that = this;
switch (_that) {
case _BossBurrowData():
return $default(_that.everySeconds,_that.followSeconds,_that.lockSeconds,_that.followUps,_that.followUpLockSeconds,_that.radius,_that.damage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double everySeconds,  double followSeconds,  double lockSeconds,  int followUps,  double followUpLockSeconds,  double radius,  double damage)?  $default,) {final _that = this;
switch (_that) {
case _BossBurrowData() when $default != null:
return $default(_that.everySeconds,_that.followSeconds,_that.lockSeconds,_that.followUps,_that.followUpLockSeconds,_that.radius,_that.damage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossBurrowData implements BossBurrowData {
  const _BossBurrowData({required this.everySeconds, required this.followSeconds, this.lockSeconds = 0.7, this.followUps = 2, required this.followUpLockSeconds, required this.radius, required this.damage});
  factory _BossBurrowData.fromJson(Map<String, dynamic> json) => _$BossBurrowDataFromJson(json);

@override final  double everySeconds;
@override final  double followSeconds;
@override@JsonKey() final  double lockSeconds;
@override@JsonKey() final  int followUps;
@override final  double followUpLockSeconds;
@override final  double radius;
@override final  double damage;

/// Create a copy of BossBurrowData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossBurrowDataCopyWith<_BossBurrowData> get copyWith => __$BossBurrowDataCopyWithImpl<_BossBurrowData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossBurrowDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossBurrowData&&(identical(other.everySeconds, everySeconds) || other.everySeconds == everySeconds)&&(identical(other.followSeconds, followSeconds) || other.followSeconds == followSeconds)&&(identical(other.lockSeconds, lockSeconds) || other.lockSeconds == lockSeconds)&&(identical(other.followUps, followUps) || other.followUps == followUps)&&(identical(other.followUpLockSeconds, followUpLockSeconds) || other.followUpLockSeconds == followUpLockSeconds)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.damage, damage) || other.damage == damage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,everySeconds,followSeconds,lockSeconds,followUps,followUpLockSeconds,radius,damage);
}

@override
String toString() {
    return 'BossBurrowData(everySeconds: $everySeconds, followSeconds: $followSeconds, lockSeconds: $lockSeconds, followUps: $followUps, followUpLockSeconds: $followUpLockSeconds, radius: $radius, damage: $damage)';
}


}

/// @nodoc
abstract mixin class _$BossBurrowDataCopyWith<$Res> implements $BossBurrowDataCopyWith<$Res> {
  factory _$BossBurrowDataCopyWith(_BossBurrowData value, $Res Function(_BossBurrowData) _then) = __$BossBurrowDataCopyWithImpl;
@override @useResult
$Res call({
 double everySeconds, double followSeconds, double lockSeconds, int followUps, double followUpLockSeconds, double radius, double damage
});




}
/// @nodoc
class __$BossBurrowDataCopyWithImpl<$Res>
    implements _$BossBurrowDataCopyWith<$Res> {
  __$BossBurrowDataCopyWithImpl(this._self, this._then);

  final _BossBurrowData _self;
  final $Res Function(_BossBurrowData) _then;

/// Create a copy of BossBurrowData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? everySeconds = null,Object? followSeconds = null,Object? lockSeconds = null,Object? followUps = null,Object? followUpLockSeconds = null,Object? radius = null,Object? damage = null,}) {
  return _then(_BossBurrowData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,followSeconds: null == followSeconds ? _self.followSeconds : followSeconds // ignore: cast_nullable_to_non_nullable
as double,lockSeconds: null == lockSeconds ? _self.lockSeconds : lockSeconds // ignore: cast_nullable_to_non_nullable
as double,followUps: null == followUps ? _self.followUps : followUps // ignore: cast_nullable_to_non_nullable
as int,followUpLockSeconds: null == followUpLockSeconds ? _self.followUpLockSeconds : followUpLockSeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BossCloudData {

 double get everySeconds; double get radius; double get seconds; double get spreadSeconds; double get damagePerSecond; double get fanDegrees;
/// Create a copy of BossCloudData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossCloudDataCopyWith<BossCloudData> get copyWith => _$BossCloudDataCopyWithImpl<BossCloudData>(this as BossCloudData, _$identity);

  /// Serializes this BossCloudData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BossCloudData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossCloudData&&(identical(other.everySeconds, _this.everySeconds) || other.everySeconds == _this.everySeconds)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.seconds, _this.seconds) || other.seconds == _this.seconds)&&(identical(other.spreadSeconds, _this.spreadSeconds) || other.spreadSeconds == _this.spreadSeconds)&&(identical(other.damagePerSecond, _this.damagePerSecond) || other.damagePerSecond == _this.damagePerSecond)&&(identical(other.fanDegrees, _this.fanDegrees) || other.fanDegrees == _this.fanDegrees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BossCloudData;
  return Object.hash(runtimeType,_this.everySeconds,_this.radius,_this.seconds,_this.spreadSeconds,_this.damagePerSecond,_this.fanDegrees);
}

@override
String toString() {
  final _this = this as BossCloudData;
  return 'BossCloudData(everySeconds: ${_this.everySeconds}, radius: ${_this.radius}, seconds: ${_this.seconds}, spreadSeconds: ${_this.spreadSeconds}, damagePerSecond: ${_this.damagePerSecond}, fanDegrees: ${_this.fanDegrees})';
}


}

/// @nodoc
abstract mixin class $BossCloudDataCopyWith<$Res>  {
  factory $BossCloudDataCopyWith(BossCloudData value, $Res Function(BossCloudData) _then) = _$BossCloudDataCopyWithImpl;
@useResult
$Res call({
 double everySeconds, double radius, double seconds, double spreadSeconds, double damagePerSecond, double fanDegrees
});




}
/// @nodoc
class _$BossCloudDataCopyWithImpl<$Res>
    implements $BossCloudDataCopyWith<$Res> {
  _$BossCloudDataCopyWithImpl(this._self, this._then);

  final BossCloudData _self;
  final $Res Function(BossCloudData) _then;

/// Create a copy of BossCloudData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? everySeconds = null,Object? radius = null,Object? seconds = null,Object? spreadSeconds = null,Object? damagePerSecond = null,Object? fanDegrees = null,}) {
  return _then(BossCloudData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as double,spreadSeconds: null == spreadSeconds ? _self.spreadSeconds : spreadSeconds // ignore: cast_nullable_to_non_nullable
as double,damagePerSecond: null == damagePerSecond ? _self.damagePerSecond : damagePerSecond // ignore: cast_nullable_to_non_nullable
as double,fanDegrees: null == fanDegrees ? _self.fanDegrees : fanDegrees // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BossCloudData].
extension BossCloudDataPatterns on BossCloudData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossCloudData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossCloudData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossCloudData value)  $default,){
final _that = this;
switch (_that) {
case _BossCloudData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossCloudData value)?  $default,){
final _that = this;
switch (_that) {
case _BossCloudData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double everySeconds,  double radius,  double seconds,  double spreadSeconds,  double damagePerSecond,  double fanDegrees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossCloudData() when $default != null:
return $default(_that.everySeconds,_that.radius,_that.seconds,_that.spreadSeconds,_that.damagePerSecond,_that.fanDegrees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double everySeconds,  double radius,  double seconds,  double spreadSeconds,  double damagePerSecond,  double fanDegrees)  $default,) {final _that = this;
switch (_that) {
case _BossCloudData():
return $default(_that.everySeconds,_that.radius,_that.seconds,_that.spreadSeconds,_that.damagePerSecond,_that.fanDegrees);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double everySeconds,  double radius,  double seconds,  double spreadSeconds,  double damagePerSecond,  double fanDegrees)?  $default,) {final _that = this;
switch (_that) {
case _BossCloudData() when $default != null:
return $default(_that.everySeconds,_that.radius,_that.seconds,_that.spreadSeconds,_that.damagePerSecond,_that.fanDegrees);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossCloudData implements BossCloudData {
  const _BossCloudData({required this.everySeconds, required this.radius, this.seconds = 3.0, required this.spreadSeconds, required this.damagePerSecond, this.fanDegrees = 0.0});
  factory _BossCloudData.fromJson(Map<String, dynamic> json) => _$BossCloudDataFromJson(json);

@override final  double everySeconds;
@override final  double radius;
@override@JsonKey() final  double seconds;
@override final  double spreadSeconds;
@override final  double damagePerSecond;
@override@JsonKey() final  double fanDegrees;

/// Create a copy of BossCloudData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossCloudDataCopyWith<_BossCloudData> get copyWith => __$BossCloudDataCopyWithImpl<_BossCloudData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossCloudDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossCloudData&&(identical(other.everySeconds, everySeconds) || other.everySeconds == everySeconds)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.seconds, seconds) || other.seconds == seconds)&&(identical(other.spreadSeconds, spreadSeconds) || other.spreadSeconds == spreadSeconds)&&(identical(other.damagePerSecond, damagePerSecond) || other.damagePerSecond == damagePerSecond)&&(identical(other.fanDegrees, fanDegrees) || other.fanDegrees == fanDegrees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,everySeconds,radius,seconds,spreadSeconds,damagePerSecond,fanDegrees);
}

@override
String toString() {
    return 'BossCloudData(everySeconds: $everySeconds, radius: $radius, seconds: $seconds, spreadSeconds: $spreadSeconds, damagePerSecond: $damagePerSecond, fanDegrees: $fanDegrees)';
}


}

/// @nodoc
abstract mixin class _$BossCloudDataCopyWith<$Res> implements $BossCloudDataCopyWith<$Res> {
  factory _$BossCloudDataCopyWith(_BossCloudData value, $Res Function(_BossCloudData) _then) = __$BossCloudDataCopyWithImpl;
@override @useResult
$Res call({
 double everySeconds, double radius, double seconds, double spreadSeconds, double damagePerSecond, double fanDegrees
});




}
/// @nodoc
class __$BossCloudDataCopyWithImpl<$Res>
    implements _$BossCloudDataCopyWith<$Res> {
  __$BossCloudDataCopyWithImpl(this._self, this._then);

  final _BossCloudData _self;
  final $Res Function(_BossCloudData) _then;

/// Create a copy of BossCloudData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? everySeconds = null,Object? radius = null,Object? seconds = null,Object? spreadSeconds = null,Object? damagePerSecond = null,Object? fanDegrees = null,}) {
  return _then(_BossCloudData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double,seconds: null == seconds ? _self.seconds : seconds // ignore: cast_nullable_to_non_nullable
as double,spreadSeconds: null == spreadSeconds ? _self.spreadSeconds : spreadSeconds // ignore: cast_nullable_to_non_nullable
as double,damagePerSecond: null == damagePerSecond ? _self.damagePerSecond : damagePerSecond // ignore: cast_nullable_to_non_nullable
as double,fanDegrees: null == fanDegrees ? _self.fanDegrees : fanDegrees // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$BossShotData {

 double get everySeconds; int get bullets; double get spreadDegrees; double get damage; double get speed; double get range;
/// Create a copy of BossShotData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossShotDataCopyWith<BossShotData> get copyWith => _$BossShotDataCopyWithImpl<BossShotData>(this as BossShotData, _$identity);

  /// Serializes this BossShotData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BossShotData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossShotData&&(identical(other.everySeconds, _this.everySeconds) || other.everySeconds == _this.everySeconds)&&(identical(other.bullets, _this.bullets) || other.bullets == _this.bullets)&&(identical(other.spreadDegrees, _this.spreadDegrees) || other.spreadDegrees == _this.spreadDegrees)&&(identical(other.damage, _this.damage) || other.damage == _this.damage)&&(identical(other.speed, _this.speed) || other.speed == _this.speed)&&(identical(other.range, _this.range) || other.range == _this.range));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BossShotData;
  return Object.hash(runtimeType,_this.everySeconds,_this.bullets,_this.spreadDegrees,_this.damage,_this.speed,_this.range);
}

@override
String toString() {
  final _this = this as BossShotData;
  return 'BossShotData(everySeconds: ${_this.everySeconds}, bullets: ${_this.bullets}, spreadDegrees: ${_this.spreadDegrees}, damage: ${_this.damage}, speed: ${_this.speed}, range: ${_this.range})';
}


}

/// @nodoc
abstract mixin class $BossShotDataCopyWith<$Res>  {
  factory $BossShotDataCopyWith(BossShotData value, $Res Function(BossShotData) _then) = _$BossShotDataCopyWithImpl;
@useResult
$Res call({
 double everySeconds, int bullets, double spreadDegrees, double damage, double speed, double range
});




}
/// @nodoc
class _$BossShotDataCopyWithImpl<$Res>
    implements $BossShotDataCopyWith<$Res> {
  _$BossShotDataCopyWithImpl(this._self, this._then);

  final BossShotData _self;
  final $Res Function(BossShotData) _then;

/// Create a copy of BossShotData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? everySeconds = null,Object? bullets = null,Object? spreadDegrees = null,Object? damage = null,Object? speed = null,Object? range = null,}) {
  return _then(BossShotData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,bullets: null == bullets ? _self.bullets : bullets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BossShotData].
extension BossShotDataPatterns on BossShotData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossShotData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossShotData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossShotData value)  $default,){
final _that = this;
switch (_that) {
case _BossShotData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossShotData value)?  $default,){
final _that = this;
switch (_that) {
case _BossShotData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double everySeconds,  int bullets,  double spreadDegrees,  double damage,  double speed,  double range)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossShotData() when $default != null:
return $default(_that.everySeconds,_that.bullets,_that.spreadDegrees,_that.damage,_that.speed,_that.range);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double everySeconds,  int bullets,  double spreadDegrees,  double damage,  double speed,  double range)  $default,) {final _that = this;
switch (_that) {
case _BossShotData():
return $default(_that.everySeconds,_that.bullets,_that.spreadDegrees,_that.damage,_that.speed,_that.range);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double everySeconds,  int bullets,  double spreadDegrees,  double damage,  double speed,  double range)?  $default,) {final _that = this;
switch (_that) {
case _BossShotData() when $default != null:
return $default(_that.everySeconds,_that.bullets,_that.spreadDegrees,_that.damage,_that.speed,_that.range);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossShotData implements BossShotData {
  const _BossShotData({required this.everySeconds, required this.bullets, this.spreadDegrees = 0.0, required this.damage, required this.speed, required this.range});
  factory _BossShotData.fromJson(Map<String, dynamic> json) => _$BossShotDataFromJson(json);

@override final  double everySeconds;
@override final  int bullets;
@override@JsonKey() final  double spreadDegrees;
@override final  double damage;
@override final  double speed;
@override final  double range;

/// Create a copy of BossShotData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossShotDataCopyWith<_BossShotData> get copyWith => __$BossShotDataCopyWithImpl<_BossShotData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossShotDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossShotData&&(identical(other.everySeconds, everySeconds) || other.everySeconds == everySeconds)&&(identical(other.bullets, bullets) || other.bullets == bullets)&&(identical(other.spreadDegrees, spreadDegrees) || other.spreadDegrees == spreadDegrees)&&(identical(other.damage, damage) || other.damage == damage)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.range, range) || other.range == range));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,everySeconds,bullets,spreadDegrees,damage,speed,range);
}

@override
String toString() {
    return 'BossShotData(everySeconds: $everySeconds, bullets: $bullets, spreadDegrees: $spreadDegrees, damage: $damage, speed: $speed, range: $range)';
}


}

/// @nodoc
abstract mixin class _$BossShotDataCopyWith<$Res> implements $BossShotDataCopyWith<$Res> {
  factory _$BossShotDataCopyWith(_BossShotData value, $Res Function(_BossShotData) _then) = __$BossShotDataCopyWithImpl;
@override @useResult
$Res call({
 double everySeconds, int bullets, double spreadDegrees, double damage, double speed, double range
});




}
/// @nodoc
class __$BossShotDataCopyWithImpl<$Res>
    implements _$BossShotDataCopyWith<$Res> {
  __$BossShotDataCopyWithImpl(this._self, this._then);

  final _BossShotData _self;
  final $Res Function(_BossShotData) _then;

/// Create a copy of BossShotData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? everySeconds = null,Object? bullets = null,Object? spreadDegrees = null,Object? damage = null,Object? speed = null,Object? range = null,}) {
  return _then(_BossShotData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as double,bullets: null == bullets ? _self.bullets : bullets // ignore: cast_nullable_to_non_nullable
as int,spreadDegrees: null == spreadDegrees ? _self.spreadDegrees : spreadDegrees // ignore: cast_nullable_to_non_nullable
as double,damage: null == damage ? _self.damage : damage // ignore: cast_nullable_to_non_nullable
as double,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,range: null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ZoneBossData {

/// An enemy with [EnemyData.boss] set.
 String get enemy;/// Loot table of the bundle it leaves.
 String get loot;
/// Create a copy of ZoneBossData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoneBossDataCopyWith<ZoneBossData> get copyWith => _$ZoneBossDataCopyWithImpl<ZoneBossData>(this as ZoneBossData, _$identity);

  /// Serializes this ZoneBossData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ZoneBossData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneBossData&&(identical(other.enemy, _this.enemy) || other.enemy == _this.enemy)&&(identical(other.loot, _this.loot) || other.loot == _this.loot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneBossData;
  return Object.hash(runtimeType,_this.enemy,_this.loot);
}

@override
String toString() {
  final _this = this as ZoneBossData;
  return 'ZoneBossData(enemy: ${_this.enemy}, loot: ${_this.loot})';
}


}

/// @nodoc
abstract mixin class $ZoneBossDataCopyWith<$Res>  {
  factory $ZoneBossDataCopyWith(ZoneBossData value, $Res Function(ZoneBossData) _then) = _$ZoneBossDataCopyWithImpl;
@useResult
$Res call({
 String enemy, String loot
});




}
/// @nodoc
class _$ZoneBossDataCopyWithImpl<$Res>
    implements $ZoneBossDataCopyWith<$Res> {
  _$ZoneBossDataCopyWithImpl(this._self, this._then);

  final ZoneBossData _self;
  final $Res Function(ZoneBossData) _then;

/// Create a copy of ZoneBossData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enemy = null,Object? loot = null,}) {
  return _then(ZoneBossData(
enemy: null == enemy ? _self.enemy : enemy // ignore: cast_nullable_to_non_nullable
as String,loot: null == loot ? _self.loot : loot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ZoneBossData].
extension ZoneBossDataPatterns on ZoneBossData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ZoneBossData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ZoneBossData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ZoneBossData value)  $default,){
final _that = this;
switch (_that) {
case _ZoneBossData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ZoneBossData value)?  $default,){
final _that = this;
switch (_that) {
case _ZoneBossData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String enemy,  String loot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneBossData() when $default != null:
return $default(_that.enemy,_that.loot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String enemy,  String loot)  $default,) {final _that = this;
switch (_that) {
case _ZoneBossData():
return $default(_that.enemy,_that.loot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String enemy,  String loot)?  $default,) {final _that = this;
switch (_that) {
case _ZoneBossData() when $default != null:
return $default(_that.enemy,_that.loot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneBossData implements ZoneBossData {
  const _ZoneBossData({required this.enemy, required this.loot});
  factory _ZoneBossData.fromJson(Map<String, dynamic> json) => _$ZoneBossDataFromJson(json);

/// An enemy with [EnemyData.boss] set.
@override final  String enemy;
/// Loot table of the bundle it leaves.
@override final  String loot;

/// Create a copy of ZoneBossData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoneBossDataCopyWith<_ZoneBossData> get copyWith => __$ZoneBossDataCopyWithImpl<_ZoneBossData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoneBossDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneBossData&&(identical(other.enemy, enemy) || other.enemy == enemy)&&(identical(other.loot, loot) || other.loot == loot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,enemy,loot);
}

@override
String toString() {
    return 'ZoneBossData(enemy: $enemy, loot: $loot)';
}


}

/// @nodoc
abstract mixin class _$ZoneBossDataCopyWith<$Res> implements $ZoneBossDataCopyWith<$Res> {
  factory _$ZoneBossDataCopyWith(_ZoneBossData value, $Res Function(_ZoneBossData) _then) = __$ZoneBossDataCopyWithImpl;
@override @useResult
$Res call({
 String enemy, String loot
});




}
/// @nodoc
class __$ZoneBossDataCopyWithImpl<$Res>
    implements _$ZoneBossDataCopyWith<$Res> {
  __$ZoneBossDataCopyWithImpl(this._self, this._then);

  final _ZoneBossData _self;
  final $Res Function(_ZoneBossData) _then;

/// Create a copy of ZoneBossData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enemy = null,Object? loot = null,}) {
  return _then(_ZoneBossData(
enemy: null == enemy ? _self.enemy : enemy // ignore: cast_nullable_to_non_nullable
as String,loot: null == loot ? _self.loot : loot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ZoneData {

 String get id;/// The region score: the level of the seeds and gear found here, and
/// how strong enemies and loot are (`rules.zone_scaling`).
 int get score;/// The region's name, shown with safe or danger zone. Null for test
/// zones, which the app names itself.
@LocalizedTextConverter() LocalizedText? get name; MapRecipe get map; ZoneEnemiesData get enemies; ZoneGatheringData get gathering; ZoneDropsData get drops;/// Set for a danger zone: leaving takes an open exit and a signal, and
/// failing loses what was brought. Null for a safe zone.
 ZoneDangerData? get danger;/// Who guards the map's clearing, if anyone.
 ZoneBossData? get boss;/// Which region's pictures the map is drawn with (`grassland`,
/// `desert`, ...): ground, high ground, trees and the like. Only the
/// look; the rules are the same (2026-10-25, phase 8 drafts).
 String get look;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.map, _this.map) || other.map == _this.map)&&(identical(other.enemies, _this.enemies) || other.enemies == _this.enemies)&&(identical(other.gathering, _this.gathering) || other.gathering == _this.gathering)&&(identical(other.drops, _this.drops) || other.drops == _this.drops)&&(identical(other.danger, _this.danger) || other.danger == _this.danger)&&(identical(other.boss, _this.boss) || other.boss == _this.boss)&&(identical(other.look, _this.look) || other.look == _this.look));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneData;
  return Object.hash(runtimeType,_this.id,_this.score,_this.name,_this.map,_this.enemies,_this.gathering,_this.drops,_this.danger,_this.boss,_this.look);
}

@override
String toString() {
  final _this = this as ZoneData;
  return 'ZoneData(id: ${_this.id}, score: ${_this.score}, name: ${_this.name}, map: ${_this.map}, enemies: ${_this.enemies}, gathering: ${_this.gathering}, drops: ${_this.drops}, danger: ${_this.danger}, boss: ${_this.boss}, look: ${_this.look})';
}


}

/// @nodoc
abstract mixin class $ZoneDataCopyWith<$Res>  {
  factory $ZoneDataCopyWith(ZoneData value, $Res Function(ZoneData) _then) = _$ZoneDataCopyWithImpl;
@useResult
$Res call({
 String id, int score,@LocalizedTextConverter() LocalizedText? name, MapRecipe map, ZoneEnemiesData enemies, ZoneGatheringData gathering, ZoneDropsData drops, ZoneDangerData? danger, ZoneBossData? boss, String look
});


$MapRecipeCopyWith<$Res> get map;$ZoneEnemiesDataCopyWith<$Res> get enemies;$ZoneGatheringDataCopyWith<$Res> get gathering;$ZoneDropsDataCopyWith<$Res> get drops;$ZoneDangerDataCopyWith<$Res>? get danger;$ZoneBossDataCopyWith<$Res>? get boss;

}
/// @nodoc
class _$ZoneDataCopyWithImpl<$Res>
    implements $ZoneDataCopyWith<$Res> {
  _$ZoneDataCopyWithImpl(this._self, this._then);

  final ZoneData _self;
  final $Res Function(ZoneData) _then;

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? score = null,Object? name = freezed,Object? map = null,Object? enemies = null,Object? gathering = null,Object? drops = null,Object? danger = freezed,Object? boss = freezed,Object? look = null,}) {
  return _then(ZoneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText?,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as MapRecipe,enemies: null == enemies ? _self.enemies : enemies // ignore: cast_nullable_to_non_nullable
as ZoneEnemiesData,gathering: null == gathering ? _self.gathering : gathering // ignore: cast_nullable_to_non_nullable
as ZoneGatheringData,drops: null == drops ? _self.drops : drops // ignore: cast_nullable_to_non_nullable
as ZoneDropsData,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as ZoneDangerData?,boss: freezed == boss ? _self.boss : boss // ignore: cast_nullable_to_non_nullable
as ZoneBossData?,look: null == look ? _self.look : look // ignore: cast_nullable_to_non_nullable
as String,
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
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneBossDataCopyWith<$Res>? get boss {
    if (_self.boss == null) {
    return null;
  }

  return $ZoneBossDataCopyWith<$Res>(_self.boss!, (value) {
    return _then(_self.copyWith(boss: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int score, @LocalizedTextConverter()  LocalizedText? name,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger,  ZoneBossData? boss,  String look)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
return $default(_that.id,_that.score,_that.name,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger,_that.boss,_that.look);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int score, @LocalizedTextConverter()  LocalizedText? name,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger,  ZoneBossData? boss,  String look)  $default,) {final _that = this;
switch (_that) {
case _ZoneData():
return $default(_that.id,_that.score,_that.name,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger,_that.boss,_that.look);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int score, @LocalizedTextConverter()  LocalizedText? name,  MapRecipe map,  ZoneEnemiesData enemies,  ZoneGatheringData gathering,  ZoneDropsData drops,  ZoneDangerData? danger,  ZoneBossData? boss,  String look)?  $default,) {final _that = this;
switch (_that) {
case _ZoneData() when $default != null:
return $default(_that.id,_that.score,_that.name,_that.map,_that.enemies,_that.gathering,_that.drops,_that.danger,_that.boss,_that.look);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneData implements ZoneData {
  const _ZoneData({required this.id, required this.score, @LocalizedTextConverter() this.name, required this.map, required this.enemies, required this.gathering, required this.drops, this.danger, this.boss, this.look = 'grassland'});
  factory _ZoneData.fromJson(Map<String, dynamic> json) => _$ZoneDataFromJson(json);

@override final  String id;
/// The region score: the level of the seeds and gear found here, and
/// how strong enemies and loot are (`rules.zone_scaling`).
@override final  int score;
/// The region's name, shown with safe or danger zone. Null for test
/// zones, which the app names itself.
@override@LocalizedTextConverter() final  LocalizedText? name;
@override final  MapRecipe map;
@override final  ZoneEnemiesData enemies;
@override final  ZoneGatheringData gathering;
@override final  ZoneDropsData drops;
/// Set for a danger zone: leaving takes an open exit and a signal, and
/// failing loses what was brought. Null for a safe zone.
@override final  ZoneDangerData? danger;
/// Who guards the map's clearing, if anyone.
@override final  ZoneBossData? boss;
/// Which region's pictures the map is drawn with (`grassland`,
/// `desert`, ...): ground, high ground, trees and the like. Only the
/// look; the rules are the same (2026-10-25, phase 8 drafts).
@override@JsonKey() final  String look;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneData&&(identical(other.id, id) || other.id == id)&&(identical(other.score, score) || other.score == score)&&(identical(other.name, name) || other.name == name)&&(identical(other.map, map) || other.map == map)&&(identical(other.enemies, enemies) || other.enemies == enemies)&&(identical(other.gathering, gathering) || other.gathering == gathering)&&(identical(other.drops, drops) || other.drops == drops)&&(identical(other.danger, danger) || other.danger == danger)&&(identical(other.boss, boss) || other.boss == boss)&&(identical(other.look, look) || other.look == look));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,score,name,map,enemies,gathering,drops,danger,boss,look);
}

@override
String toString() {
    return 'ZoneData(id: $id, score: $score, name: $name, map: $map, enemies: $enemies, gathering: $gathering, drops: $drops, danger: $danger, boss: $boss, look: $look)';
}


}

/// @nodoc
abstract mixin class _$ZoneDataCopyWith<$Res> implements $ZoneDataCopyWith<$Res> {
  factory _$ZoneDataCopyWith(_ZoneData value, $Res Function(_ZoneData) _then) = __$ZoneDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int score,@LocalizedTextConverter() LocalizedText? name, MapRecipe map, ZoneEnemiesData enemies, ZoneGatheringData gathering, ZoneDropsData drops, ZoneDangerData? danger, ZoneBossData? boss, String look
});


@override $MapRecipeCopyWith<$Res> get map;@override $ZoneEnemiesDataCopyWith<$Res> get enemies;@override $ZoneGatheringDataCopyWith<$Res> get gathering;@override $ZoneDropsDataCopyWith<$Res> get drops;@override $ZoneDangerDataCopyWith<$Res>? get danger;@override $ZoneBossDataCopyWith<$Res>? get boss;

}
/// @nodoc
class __$ZoneDataCopyWithImpl<$Res>
    implements _$ZoneDataCopyWith<$Res> {
  __$ZoneDataCopyWithImpl(this._self, this._then);

  final _ZoneData _self;
  final $Res Function(_ZoneData) _then;

/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? score = null,Object? name = freezed,Object? map = null,Object? enemies = null,Object? gathering = null,Object? drops = null,Object? danger = freezed,Object? boss = freezed,Object? look = null,}) {
  return _then(_ZoneData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText?,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as MapRecipe,enemies: null == enemies ? _self.enemies : enemies // ignore: cast_nullable_to_non_nullable
as ZoneEnemiesData,gathering: null == gathering ? _self.gathering : gathering // ignore: cast_nullable_to_non_nullable
as ZoneGatheringData,drops: null == drops ? _self.drops : drops // ignore: cast_nullable_to_non_nullable
as ZoneDropsData,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as ZoneDangerData?,boss: freezed == boss ? _self.boss : boss // ignore: cast_nullable_to_non_nullable
as ZoneBossData?,look: null == look ? _self.look : look // ignore: cast_nullable_to_non_nullable
as String,
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
}/// Create a copy of ZoneData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoneBossDataCopyWith<$Res>? get boss {
    if (_self.boss == null) {
    return null;
  }

  return $ZoneBossDataCopyWith<$Res>(_self.boss!, (value) {
    return _then(_self.copyWith(boss: value));
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
 double get hungryDamagePerSecond;/// Clones walking in with the player, then one more every
/// [cloneEverySeconds] until [clonesMax] have come in all.
 int get clonesAtStart; double get cloneEverySeconds; int get clonesMax;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ZoneDangerData&&(identical(other.openExits, _this.openExits) || other.openExits == _this.openExits)&&(identical(other.revealSeconds, _this.revealSeconds) || other.revealSeconds == _this.revealSeconds)&&(identical(other.exitRadius, _this.exitRadius) || other.exitRadius == _this.exitRadius)&&(identical(other.countdownSeconds, _this.countdownSeconds) || other.countdownSeconds == _this.countdownSeconds)&&(identical(other.waitSightMultiplier, _this.waitSightMultiplier) || other.waitSightMultiplier == _this.waitSightMultiplier)&&(identical(other.hungryDamagePerSecond, _this.hungryDamagePerSecond) || other.hungryDamagePerSecond == _this.hungryDamagePerSecond)&&(identical(other.clonesAtStart, _this.clonesAtStart) || other.clonesAtStart == _this.clonesAtStart)&&(identical(other.cloneEverySeconds, _this.cloneEverySeconds) || other.cloneEverySeconds == _this.cloneEverySeconds)&&(identical(other.clonesMax, _this.clonesMax) || other.clonesMax == _this.clonesMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ZoneDangerData;
  return Object.hash(runtimeType,_this.openExits,_this.revealSeconds,_this.exitRadius,_this.countdownSeconds,_this.waitSightMultiplier,_this.hungryDamagePerSecond,_this.clonesAtStart,_this.cloneEverySeconds,_this.clonesMax);
}

@override
String toString() {
  final _this = this as ZoneDangerData;
  return 'ZoneDangerData(openExits: ${_this.openExits}, revealSeconds: ${_this.revealSeconds}, exitRadius: ${_this.exitRadius}, countdownSeconds: ${_this.countdownSeconds}, waitSightMultiplier: ${_this.waitSightMultiplier}, hungryDamagePerSecond: ${_this.hungryDamagePerSecond}, clonesAtStart: ${_this.clonesAtStart}, cloneEverySeconds: ${_this.cloneEverySeconds}, clonesMax: ${_this.clonesMax})';
}


}

/// @nodoc
abstract mixin class $ZoneDangerDataCopyWith<$Res>  {
  factory $ZoneDangerDataCopyWith(ZoneDangerData value, $Res Function(ZoneDangerData) _then) = _$ZoneDangerDataCopyWithImpl;
@useResult
$Res call({
 int openExits, double revealSeconds, double exitRadius, double countdownSeconds, double waitSightMultiplier, double hungryDamagePerSecond, int clonesAtStart, double cloneEverySeconds, int clonesMax
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
@pragma('vm:prefer-inline') @override $Res call({Object? openExits = null,Object? revealSeconds = null,Object? exitRadius = null,Object? countdownSeconds = null,Object? waitSightMultiplier = null,Object? hungryDamagePerSecond = null,Object? clonesAtStart = null,Object? cloneEverySeconds = null,Object? clonesMax = null,}) {
  return _then(ZoneDangerData(
openExits: null == openExits ? _self.openExits : openExits // ignore: cast_nullable_to_non_nullable
as int,revealSeconds: null == revealSeconds ? _self.revealSeconds : revealSeconds // ignore: cast_nullable_to_non_nullable
as double,exitRadius: null == exitRadius ? _self.exitRadius : exitRadius // ignore: cast_nullable_to_non_nullable
as double,countdownSeconds: null == countdownSeconds ? _self.countdownSeconds : countdownSeconds // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryDamagePerSecond: null == hungryDamagePerSecond ? _self.hungryDamagePerSecond : hungryDamagePerSecond // ignore: cast_nullable_to_non_nullable
as double,clonesAtStart: null == clonesAtStart ? _self.clonesAtStart : clonesAtStart // ignore: cast_nullable_to_non_nullable
as int,cloneEverySeconds: null == cloneEverySeconds ? _self.cloneEverySeconds : cloneEverySeconds // ignore: cast_nullable_to_non_nullable
as double,clonesMax: null == clonesMax ? _self.clonesMax : clonesMax // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond,  int clonesAtStart,  double cloneEverySeconds,  int clonesMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond,_that.clonesAtStart,_that.cloneEverySeconds,_that.clonesMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond,  int clonesAtStart,  double cloneEverySeconds,  int clonesMax)  $default,) {final _that = this;
switch (_that) {
case _ZoneDangerData():
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond,_that.clonesAtStart,_that.cloneEverySeconds,_that.clonesMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int openExits,  double revealSeconds,  double exitRadius,  double countdownSeconds,  double waitSightMultiplier,  double hungryDamagePerSecond,  int clonesAtStart,  double cloneEverySeconds,  int clonesMax)?  $default,) {final _that = this;
switch (_that) {
case _ZoneDangerData() when $default != null:
return $default(_that.openExits,_that.revealSeconds,_that.exitRadius,_that.countdownSeconds,_that.waitSightMultiplier,_that.hungryDamagePerSecond,_that.clonesAtStart,_that.cloneEverySeconds,_that.clonesMax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ZoneDangerData implements ZoneDangerData {
  const _ZoneDangerData({required this.openExits, required this.revealSeconds, required this.exitRadius, required this.countdownSeconds, required this.waitSightMultiplier, required this.hungryDamagePerSecond, this.clonesAtStart = 0, this.cloneEverySeconds = 0.0, this.clonesMax = 0});
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
/// Clones walking in with the player, then one more every
/// [cloneEverySeconds] until [clonesMax] have come in all.
@override@JsonKey() final  int clonesAtStart;
@override@JsonKey() final  double cloneEverySeconds;
@override@JsonKey() final  int clonesMax;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ZoneDangerData&&(identical(other.openExits, openExits) || other.openExits == openExits)&&(identical(other.revealSeconds, revealSeconds) || other.revealSeconds == revealSeconds)&&(identical(other.exitRadius, exitRadius) || other.exitRadius == exitRadius)&&(identical(other.countdownSeconds, countdownSeconds) || other.countdownSeconds == countdownSeconds)&&(identical(other.waitSightMultiplier, waitSightMultiplier) || other.waitSightMultiplier == waitSightMultiplier)&&(identical(other.hungryDamagePerSecond, hungryDamagePerSecond) || other.hungryDamagePerSecond == hungryDamagePerSecond)&&(identical(other.clonesAtStart, clonesAtStart) || other.clonesAtStart == clonesAtStart)&&(identical(other.cloneEverySeconds, cloneEverySeconds) || other.cloneEverySeconds == cloneEverySeconds)&&(identical(other.clonesMax, clonesMax) || other.clonesMax == clonesMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,openExits,revealSeconds,exitRadius,countdownSeconds,waitSightMultiplier,hungryDamagePerSecond,clonesAtStart,cloneEverySeconds,clonesMax);
}

@override
String toString() {
    return 'ZoneDangerData(openExits: $openExits, revealSeconds: $revealSeconds, exitRadius: $exitRadius, countdownSeconds: $countdownSeconds, waitSightMultiplier: $waitSightMultiplier, hungryDamagePerSecond: $hungryDamagePerSecond, clonesAtStart: $clonesAtStart, cloneEverySeconds: $cloneEverySeconds, clonesMax: $clonesMax)';
}


}

/// @nodoc
abstract mixin class _$ZoneDangerDataCopyWith<$Res> implements $ZoneDangerDataCopyWith<$Res> {
  factory _$ZoneDangerDataCopyWith(_ZoneDangerData value, $Res Function(_ZoneDangerData) _then) = __$ZoneDangerDataCopyWithImpl;
@override @useResult
$Res call({
 int openExits, double revealSeconds, double exitRadius, double countdownSeconds, double waitSightMultiplier, double hungryDamagePerSecond, int clonesAtStart, double cloneEverySeconds, int clonesMax
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
@override @pragma('vm:prefer-inline') $Res call({Object? openExits = null,Object? revealSeconds = null,Object? exitRadius = null,Object? countdownSeconds = null,Object? waitSightMultiplier = null,Object? hungryDamagePerSecond = null,Object? clonesAtStart = null,Object? cloneEverySeconds = null,Object? clonesMax = null,}) {
  return _then(_ZoneDangerData(
openExits: null == openExits ? _self.openExits : openExits // ignore: cast_nullable_to_non_nullable
as int,revealSeconds: null == revealSeconds ? _self.revealSeconds : revealSeconds // ignore: cast_nullable_to_non_nullable
as double,exitRadius: null == exitRadius ? _self.exitRadius : exitRadius // ignore: cast_nullable_to_non_nullable
as double,countdownSeconds: null == countdownSeconds ? _self.countdownSeconds : countdownSeconds // ignore: cast_nullable_to_non_nullable
as double,waitSightMultiplier: null == waitSightMultiplier ? _self.waitSightMultiplier : waitSightMultiplier // ignore: cast_nullable_to_non_nullable
as double,hungryDamagePerSecond: null == hungryDamagePerSecond ? _self.hungryDamagePerSecond : hungryDamagePerSecond // ignore: cast_nullable_to_non_nullable
as double,clonesAtStart: null == clonesAtStart ? _self.clonesAtStart : clonesAtStart // ignore: cast_nullable_to_non_nullable
as int,cloneEverySeconds: null == cloneEverySeconds ? _self.cloneEverySeconds : cloneEverySeconds // ignore: cast_nullable_to_non_nullable
as double,clonesMax: null == clonesMax ? _self.clonesMax : clonesMax // ignore: cast_nullable_to_non_nullable
as int,
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
