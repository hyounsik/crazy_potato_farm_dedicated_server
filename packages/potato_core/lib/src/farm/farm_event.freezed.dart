// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
FarmEvent _$FarmEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'planted':
          return PotatoPlanted.fromJson(
            json
          );
                case 'grown':
          return PotatoGrown.fromJson(
            json
          );
                case 'died':
          return PotatoDied.fromJson(
            json
          );
                case 'harvested':
          return FoodHarvested.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'FarmEvent',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$FarmEvent {

 int get fieldId;
/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FarmEventCopyWith<FarmEvent> get copyWith => _$FarmEventCopyWithImpl<FarmEvent>(this as FarmEvent, _$identity);

  /// Serializes this FarmEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FarmEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmEvent&&(identical(other.fieldId, _this.fieldId) || other.fieldId == _this.fieldId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmEvent;
  return Object.hash(runtimeType,_this.fieldId);
}

@override
String toString() {
  final _this = this as FarmEvent;
  return 'FarmEvent(fieldId: ${_this.fieldId})';
}


}

/// @nodoc
abstract mixin class $FarmEventCopyWith<$Res>  {
  factory $FarmEventCopyWith(FarmEvent value, $Res Function(FarmEvent) _then) = _$FarmEventCopyWithImpl;
@useResult
$Res call({
 int fieldId
});




}
/// @nodoc
class _$FarmEventCopyWithImpl<$Res>
    implements $FarmEventCopyWith<$Res> {
  _$FarmEventCopyWithImpl(this._self, this._then);

  final FarmEvent _self;
  final $Res Function(FarmEvent) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldId = null,}) {
  return _then(_self.copyWith(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FarmEvent].
extension FarmEventPatterns on FarmEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PotatoPlanted value)?  planted,TResult Function( PotatoGrown value)?  grown,TResult Function( PotatoDied value)?  died,TResult Function( FoodHarvested value)?  harvested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case FoodHarvested() when harvested != null:
return harvested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PotatoPlanted value)  planted,required TResult Function( PotatoGrown value)  grown,required TResult Function( PotatoDied value)  died,required TResult Function( FoodHarvested value)  harvested,}){
final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that);case PotatoGrown():
return grown(_that);case PotatoDied():
return died(_that);case FoodHarvested():
return harvested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PotatoPlanted value)?  planted,TResult? Function( PotatoGrown value)?  grown,TResult? Function( PotatoDied value)?  died,TResult? Function( FoodHarvested value)?  harvested,}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case FoodHarvested() when harvested != null:
return harvested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)?  planted,TResult Function( int fieldId,  TilePos tile,  int potatoId)?  grown,TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seedLeft)?  died,TResult Function( int fieldId,  int food)?  harvested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)  planted,required TResult Function( int fieldId,  TilePos tile,  int potatoId)  grown,required TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seedLeft)  died,required TResult Function( int fieldId,  int food)  harvested,}) {final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown():
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied():
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case FoodHarvested():
return harvested(_that.fieldId,_that.food);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)?  planted,TResult? Function( int fieldId,  TilePos tile,  int potatoId)?  grown,TResult? Function( int fieldId,  TilePos tile,  int potatoId,  Seed seedLeft)?  died,TResult? Function( int fieldId,  int food)?  harvested,}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PotatoPlanted implements FarmEvent {
  const PotatoPlanted({required this.fieldId, required this.tile, required this.potatoId, required this.seed,  String? $type}): $type = $type ?? 'planted';
  factory PotatoPlanted.fromJson(Map<String, dynamic> json) => _$PotatoPlantedFromJson(json);

@override final  int fieldId;
 final  TilePos tile;
 final  int potatoId;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoPlantedCopyWith<PotatoPlanted> get copyWith => _$PotatoPlantedCopyWithImpl<PotatoPlanted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoPlantedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoPlanted&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,potatoId,seed);
}

@override
String toString() {
    return 'FarmEvent.planted(fieldId: $fieldId, tile: $tile, potatoId: $potatoId, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $PotatoPlantedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoPlantedCopyWith(PotatoPlanted value, $Res Function(PotatoPlanted) _then) = _$PotatoPlantedCopyWithImpl;
@override @useResult
$Res call({
 int fieldId, TilePos tile, int potatoId, Seed seed
});


$TilePosCopyWith<$Res> get tile;$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$PotatoPlantedCopyWithImpl<$Res>
    implements $PotatoPlantedCopyWith<$Res> {
  _$PotatoPlantedCopyWithImpl(this._self, this._then);

  final PotatoPlanted _self;
  final $Res Function(PotatoPlanted) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? potatoId = null,Object? seed = null,}) {
  return _then(PotatoPlanted(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res> get seed {
  
  return $SeedCopyWith<$Res>(_self.seed, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PotatoGrown implements FarmEvent {
  const PotatoGrown({required this.fieldId, required this.tile, required this.potatoId,  String? $type}): $type = $type ?? 'grown';
  factory PotatoGrown.fromJson(Map<String, dynamic> json) => _$PotatoGrownFromJson(json);

@override final  int fieldId;
 final  TilePos tile;
 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoGrownCopyWith<PotatoGrown> get copyWith => _$PotatoGrownCopyWithImpl<PotatoGrown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoGrownToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoGrown&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,potatoId);
}

@override
String toString() {
    return 'FarmEvent.grown(fieldId: $fieldId, tile: $tile, potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $PotatoGrownCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoGrownCopyWith(PotatoGrown value, $Res Function(PotatoGrown) _then) = _$PotatoGrownCopyWithImpl;
@override @useResult
$Res call({
 int fieldId, TilePos tile, int potatoId
});


$TilePosCopyWith<$Res> get tile;

}
/// @nodoc
class _$PotatoGrownCopyWithImpl<$Res>
    implements $PotatoGrownCopyWith<$Res> {
  _$PotatoGrownCopyWithImpl(this._self, this._then);

  final PotatoGrown _self;
  final $Res Function(PotatoGrown) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? potatoId = null,}) {
  return _then(PotatoGrown(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PotatoDied implements FarmEvent {
  const PotatoDied({required this.fieldId, required this.tile, required this.potatoId, required this.seedLeft,  String? $type}): $type = $type ?? 'died';
  factory PotatoDied.fromJson(Map<String, dynamic> json) => _$PotatoDiedFromJson(json);

@override final  int fieldId;
 final  TilePos tile;
 final  int potatoId;
 final  Seed seedLeft;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoDiedCopyWith<PotatoDied> get copyWith => _$PotatoDiedCopyWithImpl<PotatoDied>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoDiedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoDied&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.seedLeft, seedLeft) || other.seedLeft == seedLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,potatoId,seedLeft);
}

@override
String toString() {
    return 'FarmEvent.died(fieldId: $fieldId, tile: $tile, potatoId: $potatoId, seedLeft: $seedLeft)';
}


}

/// @nodoc
abstract mixin class $PotatoDiedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoDiedCopyWith(PotatoDied value, $Res Function(PotatoDied) _then) = _$PotatoDiedCopyWithImpl;
@override @useResult
$Res call({
 int fieldId, TilePos tile, int potatoId, Seed seedLeft
});


$TilePosCopyWith<$Res> get tile;$SeedCopyWith<$Res> get seedLeft;

}
/// @nodoc
class _$PotatoDiedCopyWithImpl<$Res>
    implements $PotatoDiedCopyWith<$Res> {
  _$PotatoDiedCopyWithImpl(this._self, this._then);

  final PotatoDied _self;
  final $Res Function(PotatoDied) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? potatoId = null,Object? seedLeft = null,}) {
  return _then(PotatoDied(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,seedLeft: null == seedLeft ? _self.seedLeft : seedLeft // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res> get seedLeft {
  
  return $SeedCopyWith<$Res>(_self.seedLeft, (value) {
    return _then(_self.copyWith(seedLeft: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class FoodHarvested implements FarmEvent {
  const FoodHarvested({required this.fieldId, required this.food,  String? $type}): $type = $type ?? 'harvested';
  factory FoodHarvested.fromJson(Map<String, dynamic> json) => _$FoodHarvestedFromJson(json);

@override final  int fieldId;
 final  int food;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodHarvestedCopyWith<FoodHarvested> get copyWith => _$FoodHarvestedCopyWithImpl<FoodHarvested>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodHarvestedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodHarvested&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.food, food) || other.food == food));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,food);
}

@override
String toString() {
    return 'FarmEvent.harvested(fieldId: $fieldId, food: $food)';
}


}

/// @nodoc
abstract mixin class $FoodHarvestedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $FoodHarvestedCopyWith(FoodHarvested value, $Res Function(FoodHarvested) _then) = _$FoodHarvestedCopyWithImpl;
@override @useResult
$Res call({
 int fieldId, int food
});




}
/// @nodoc
class _$FoodHarvestedCopyWithImpl<$Res>
    implements $FoodHarvestedCopyWith<$Res> {
  _$FoodHarvestedCopyWithImpl(this._self, this._then);

  final FoodHarvested _self;
  final $Res Function(FoodHarvested) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? food = null,}) {
  return _then(FoodHarvested(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
