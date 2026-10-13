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
                case 'built':
          return BuildingBuilt.fromJson(
            json
          );
                case 'upgraded':
          return BuildingUpgraded.fromJson(
            json
          );
                case 'demolished':
          return BuildingDemolished.fromJson(
            json
          );
                case 'trained':
          return SeedTrained.fromJson(
            json
          );
                case 'pestAppeared':
          return PestAppeared.fromJson(
            json
          );
                case 'pestCleared':
          return PestCleared.fromJson(
            json
          );
                case 'weakened':
          return PotatoesWeakened.fromJson(
            json
          );
                case 'recovered':
          return PotatoesRecovered.fromJson(
            json
          );
                case 'uprooted':
          return PotatoUprooted.fromJson(
            json
          );
                case 'takenOut':
          return PotatoTakenOut.fromJson(
            json
          );
                case 'harvested':
          return FoodHarvested.fromJson(
            json
          );
                case 'departed':
          return Departed.fromJson(
            json
          );
                case 'returned':
          return Returned.fromJson(
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



  /// Serializes this FarmEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmEvent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FarmEvent()';
}


}

/// @nodoc
class $FarmEventCopyWith<$Res>  {
$FarmEventCopyWith(FarmEvent _, $Res Function(FarmEvent) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PotatoPlanted value)?  planted,TResult Function( PotatoGrown value)?  grown,TResult Function( PotatoDied value)?  died,TResult Function( BuildingBuilt value)?  built,TResult Function( BuildingUpgraded value)?  upgraded,TResult Function( BuildingDemolished value)?  demolished,TResult Function( SeedTrained value)?  trained,TResult Function( PestAppeared value)?  pestAppeared,TResult Function( PestCleared value)?  pestCleared,TResult Function( PotatoesWeakened value)?  weakened,TResult Function( PotatoesRecovered value)?  recovered,TResult Function( PotatoUprooted value)?  uprooted,TResult Function( PotatoTakenOut value)?  takenOut,TResult Function( FoodHarvested value)?  harvested,TResult Function( Departed value)?  departed,TResult Function( Returned value)?  returned,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case BuildingBuilt() when built != null:
return built(_that);case BuildingUpgraded() when upgraded != null:
return upgraded(_that);case BuildingDemolished() when demolished != null:
return demolished(_that);case SeedTrained() when trained != null:
return trained(_that);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that);case PestCleared() when pestCleared != null:
return pestCleared(_that);case PotatoesWeakened() when weakened != null:
return weakened(_that);case PotatoesRecovered() when recovered != null:
return recovered(_that);case PotatoUprooted() when uprooted != null:
return uprooted(_that);case PotatoTakenOut() when takenOut != null:
return takenOut(_that);case FoodHarvested() when harvested != null:
return harvested(_that);case Departed() when departed != null:
return departed(_that);case Returned() when returned != null:
return returned(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PotatoPlanted value)  planted,required TResult Function( PotatoGrown value)  grown,required TResult Function( PotatoDied value)  died,required TResult Function( BuildingBuilt value)  built,required TResult Function( BuildingUpgraded value)  upgraded,required TResult Function( BuildingDemolished value)  demolished,required TResult Function( SeedTrained value)  trained,required TResult Function( PestAppeared value)  pestAppeared,required TResult Function( PestCleared value)  pestCleared,required TResult Function( PotatoesWeakened value)  weakened,required TResult Function( PotatoesRecovered value)  recovered,required TResult Function( PotatoUprooted value)  uprooted,required TResult Function( PotatoTakenOut value)  takenOut,required TResult Function( FoodHarvested value)  harvested,required TResult Function( Departed value)  departed,required TResult Function( Returned value)  returned,}){
final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that);case PotatoGrown():
return grown(_that);case PotatoDied():
return died(_that);case BuildingBuilt():
return built(_that);case BuildingUpgraded():
return upgraded(_that);case BuildingDemolished():
return demolished(_that);case SeedTrained():
return trained(_that);case PestAppeared():
return pestAppeared(_that);case PestCleared():
return pestCleared(_that);case PotatoesWeakened():
return weakened(_that);case PotatoesRecovered():
return recovered(_that);case PotatoUprooted():
return uprooted(_that);case PotatoTakenOut():
return takenOut(_that);case FoodHarvested():
return harvested(_that);case Departed():
return departed(_that);case Returned():
return returned(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PotatoPlanted value)?  planted,TResult? Function( PotatoGrown value)?  grown,TResult? Function( PotatoDied value)?  died,TResult? Function( BuildingBuilt value)?  built,TResult? Function( BuildingUpgraded value)?  upgraded,TResult? Function( BuildingDemolished value)?  demolished,TResult? Function( SeedTrained value)?  trained,TResult? Function( PestAppeared value)?  pestAppeared,TResult? Function( PestCleared value)?  pestCleared,TResult? Function( PotatoesWeakened value)?  weakened,TResult? Function( PotatoesRecovered value)?  recovered,TResult? Function( PotatoUprooted value)?  uprooted,TResult? Function( PotatoTakenOut value)?  takenOut,TResult? Function( FoodHarvested value)?  harvested,TResult? Function( Departed value)?  departed,TResult? Function( Returned value)?  returned,}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case BuildingBuilt() when built != null:
return built(_that);case BuildingUpgraded() when upgraded != null:
return upgraded(_that);case BuildingDemolished() when demolished != null:
return demolished(_that);case SeedTrained() when trained != null:
return trained(_that);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that);case PestCleared() when pestCleared != null:
return pestCleared(_that);case PotatoesWeakened() when weakened != null:
return weakened(_that);case PotatoesRecovered() when recovered != null:
return recovered(_that);case PotatoUprooted() when uprooted != null:
return uprooted(_that);case PotatoTakenOut() when takenOut != null:
return takenOut(_that);case FoodHarvested() when harvested != null:
return harvested(_that);case Departed() when departed != null:
return departed(_that);case Returned() when returned != null:
return returned(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed,  bool gradeUp)?  planted,TResult Function( int? fieldId,  TilePos? tile,  int potatoId)?  grown,TResult Function( int? fieldId,  TilePos? tile,  int potatoId,  Seed seedLeft)?  died,TResult Function( int buildingId,  String kind,  TilePos origin)?  built,TResult Function( int buildingId,  int level)?  upgraded,TResult Function( int buildingId,  List<int> toFridge)?  demolished,TResult Function( int buildingId,  int potatoId,  Seed seed)?  trained,TResult Function( int fieldId,  PestKind kind)?  pestAppeared,TResult Function( int fieldId,  PestKind kind,  bool byTap,  int food,  Seed? seed)?  pestCleared,TResult Function( List<int> potatoIds)?  weakened,TResult Function( List<int> potatoIds)?  recovered,TResult Function( int potatoId)?  uprooted,TResult Function( int potatoId)?  takenOut,TResult Function( int fieldId,  int food)?  harvested,TResult Function( int food,  List<int> potatoIds)?  departed,TResult Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge)?  returned,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed,_that.gradeUp);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case BuildingBuilt() when built != null:
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded() when upgraded != null:
return upgraded(_that.buildingId,_that.level);case BuildingDemolished() when demolished != null:
return demolished(_that.buildingId,_that.toFridge);case SeedTrained() when trained != null:
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that.fieldId,_that.kind);case PestCleared() when pestCleared != null:
return pestCleared(_that.fieldId,_that.kind,_that.byTap,_that.food,_that.seed);case PotatoesWeakened() when weakened != null:
return weakened(_that.potatoIds);case PotatoesRecovered() when recovered != null:
return recovered(_that.potatoIds);case PotatoUprooted() when uprooted != null:
return uprooted(_that.potatoId);case PotatoTakenOut() when takenOut != null:
return takenOut(_that.potatoId);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food);case Departed() when departed != null:
return departed(_that.food,_that.potatoIds);case Returned() when returned != null:
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed,  bool gradeUp)  planted,required TResult Function( int? fieldId,  TilePos? tile,  int potatoId)  grown,required TResult Function( int? fieldId,  TilePos? tile,  int potatoId,  Seed seedLeft)  died,required TResult Function( int buildingId,  String kind,  TilePos origin)  built,required TResult Function( int buildingId,  int level)  upgraded,required TResult Function( int buildingId,  List<int> toFridge)  demolished,required TResult Function( int buildingId,  int potatoId,  Seed seed)  trained,required TResult Function( int fieldId,  PestKind kind)  pestAppeared,required TResult Function( int fieldId,  PestKind kind,  bool byTap,  int food,  Seed? seed)  pestCleared,required TResult Function( List<int> potatoIds)  weakened,required TResult Function( List<int> potatoIds)  recovered,required TResult Function( int potatoId)  uprooted,required TResult Function( int potatoId)  takenOut,required TResult Function( int fieldId,  int food)  harvested,required TResult Function( int food,  List<int> potatoIds)  departed,required TResult Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge)  returned,}) {final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed,_that.gradeUp);case PotatoGrown():
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied():
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case BuildingBuilt():
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded():
return upgraded(_that.buildingId,_that.level);case BuildingDemolished():
return demolished(_that.buildingId,_that.toFridge);case SeedTrained():
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared():
return pestAppeared(_that.fieldId,_that.kind);case PestCleared():
return pestCleared(_that.fieldId,_that.kind,_that.byTap,_that.food,_that.seed);case PotatoesWeakened():
return weakened(_that.potatoIds);case PotatoesRecovered():
return recovered(_that.potatoIds);case PotatoUprooted():
return uprooted(_that.potatoId);case PotatoTakenOut():
return takenOut(_that.potatoId);case FoodHarvested():
return harvested(_that.fieldId,_that.food);case Departed():
return departed(_that.food,_that.potatoIds);case Returned():
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed,  bool gradeUp)?  planted,TResult? Function( int? fieldId,  TilePos? tile,  int potatoId)?  grown,TResult? Function( int? fieldId,  TilePos? tile,  int potatoId,  Seed seedLeft)?  died,TResult? Function( int buildingId,  String kind,  TilePos origin)?  built,TResult? Function( int buildingId,  int level)?  upgraded,TResult? Function( int buildingId,  List<int> toFridge)?  demolished,TResult? Function( int buildingId,  int potatoId,  Seed seed)?  trained,TResult? Function( int fieldId,  PestKind kind)?  pestAppeared,TResult? Function( int fieldId,  PestKind kind,  bool byTap,  int food,  Seed? seed)?  pestCleared,TResult? Function( List<int> potatoIds)?  weakened,TResult? Function( List<int> potatoIds)?  recovered,TResult? Function( int potatoId)?  uprooted,TResult? Function( int potatoId)?  takenOut,TResult? Function( int fieldId,  int food)?  harvested,TResult? Function( int food,  List<int> potatoIds)?  departed,TResult? Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge)?  returned,}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed,_that.gradeUp);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.potatoId,_that.seedLeft);case BuildingBuilt() when built != null:
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded() when upgraded != null:
return upgraded(_that.buildingId,_that.level);case BuildingDemolished() when demolished != null:
return demolished(_that.buildingId,_that.toFridge);case SeedTrained() when trained != null:
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that.fieldId,_that.kind);case PestCleared() when pestCleared != null:
return pestCleared(_that.fieldId,_that.kind,_that.byTap,_that.food,_that.seed);case PotatoesWeakened() when weakened != null:
return weakened(_that.potatoIds);case PotatoesRecovered() when recovered != null:
return recovered(_that.potatoIds);case PotatoUprooted() when uprooted != null:
return uprooted(_that.potatoId);case PotatoTakenOut() when takenOut != null:
return takenOut(_that.potatoId);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food);case Departed() when departed != null:
return departed(_that.food,_that.potatoIds);case Returned() when returned != null:
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PotatoPlanted implements FarmEvent {
  const PotatoPlanted({required this.fieldId, required this.tile, required this.potatoId, required this.seed, this.gradeUp = false,  String? $type}): $type = $type ?? 'planted';
  factory PotatoPlanted.fromJson(Map<String, dynamic> json) => _$PotatoPlantedFromJson(json);

 final  int fieldId;
 final  TilePos tile;
 final  int potatoId;
 final  Seed seed;
@JsonKey() final  bool gradeUp;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoPlantedCopyWith<PotatoPlanted> get copyWith => _$PotatoPlantedCopyWithImpl<PotatoPlanted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoPlantedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoPlanted&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.gradeUp, gradeUp) || other.gradeUp == gradeUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,potatoId,seed,gradeUp);
}

@override
String toString() {
    return 'FarmEvent.planted(fieldId: $fieldId, tile: $tile, potatoId: $potatoId, seed: $seed, gradeUp: $gradeUp)';
}


}

/// @nodoc
abstract mixin class $PotatoPlantedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoPlantedCopyWith(PotatoPlanted value, $Res Function(PotatoPlanted) _then) = _$PotatoPlantedCopyWithImpl;
@useResult
$Res call({
 int fieldId, TilePos tile, int potatoId, Seed seed, bool gradeUp
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
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? potatoId = null,Object? seed = null,Object? gradeUp = null,}) {
  return _then(PotatoPlanted(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,gradeUp: null == gradeUp ? _self.gradeUp : gradeUp // ignore: cast_nullable_to_non_nullable
as bool,
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
  const PotatoGrown({this.fieldId, this.tile, required this.potatoId,  String? $type}): $type = $type ?? 'grown';
  factory PotatoGrown.fromJson(Map<String, dynamic> json) => _$PotatoGrownFromJson(json);

 final  int? fieldId;
 final  TilePos? tile;
 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
$Res call({
 int? fieldId, TilePos? tile, int potatoId
});


$TilePosCopyWith<$Res>? get tile;

}
/// @nodoc
class _$PotatoGrownCopyWithImpl<$Res>
    implements $PotatoGrownCopyWith<$Res> {
  _$PotatoGrownCopyWithImpl(this._self, this._then);

  final PotatoGrown _self;
  final $Res Function(PotatoGrown) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = freezed,Object? tile = freezed,Object? potatoId = null,}) {
  return _then(PotatoGrown(
fieldId: freezed == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int?,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res>? get tile {
    if (_self.tile == null) {
    return null;
  }

  return $TilePosCopyWith<$Res>(_self.tile!, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PotatoDied implements FarmEvent {
  const PotatoDied({this.fieldId, this.tile, required this.potatoId, required this.seedLeft,  String? $type}): $type = $type ?? 'died';
  factory PotatoDied.fromJson(Map<String, dynamic> json) => _$PotatoDiedFromJson(json);

 final  int? fieldId;
 final  TilePos? tile;
 final  int potatoId;
 final  Seed seedLeft;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
$Res call({
 int? fieldId, TilePos? tile, int potatoId, Seed seedLeft
});


$TilePosCopyWith<$Res>? get tile;$SeedCopyWith<$Res> get seedLeft;

}
/// @nodoc
class _$PotatoDiedCopyWithImpl<$Res>
    implements $PotatoDiedCopyWith<$Res> {
  _$PotatoDiedCopyWithImpl(this._self, this._then);

  final PotatoDied _self;
  final $Res Function(PotatoDied) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = freezed,Object? tile = freezed,Object? potatoId = null,Object? seedLeft = null,}) {
  return _then(PotatoDied(
fieldId: freezed == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int?,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,seedLeft: null == seedLeft ? _self.seedLeft : seedLeft // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res>? get tile {
    if (_self.tile == null) {
    return null;
  }

  return $TilePosCopyWith<$Res>(_self.tile!, (value) {
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

class BuildingBuilt implements FarmEvent {
  const BuildingBuilt({required this.buildingId, required this.kind, required this.origin,  String? $type}): $type = $type ?? 'built';
  factory BuildingBuilt.fromJson(Map<String, dynamic> json) => _$BuildingBuiltFromJson(json);

 final  int buildingId;
 final  String kind;
 final  TilePos origin;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingBuiltCopyWith<BuildingBuilt> get copyWith => _$BuildingBuiltCopyWithImpl<BuildingBuilt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingBuiltToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingBuilt&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,kind,origin);
}

@override
String toString() {
    return 'FarmEvent.built(buildingId: $buildingId, kind: $kind, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $BuildingBuiltCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $BuildingBuiltCopyWith(BuildingBuilt value, $Res Function(BuildingBuilt) _then) = _$BuildingBuiltCopyWithImpl;
@useResult
$Res call({
 int buildingId, String kind, TilePos origin
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$BuildingBuiltCopyWithImpl<$Res>
    implements $BuildingBuiltCopyWith<$Res> {
  _$BuildingBuiltCopyWithImpl(this._self, this._then);

  final BuildingBuilt _self;
  final $Res Function(BuildingBuilt) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? kind = null,Object? origin = null,}) {
  return _then(BuildingBuilt(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get origin {
  
  return $TilePosCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class BuildingUpgraded implements FarmEvent {
  const BuildingUpgraded({required this.buildingId, required this.level,  String? $type}): $type = $type ?? 'upgraded';
  factory BuildingUpgraded.fromJson(Map<String, dynamic> json) => _$BuildingUpgradedFromJson(json);

 final  int buildingId;
 final  int level;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingUpgradedCopyWith<BuildingUpgraded> get copyWith => _$BuildingUpgradedCopyWithImpl<BuildingUpgraded>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingUpgradedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingUpgraded&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,level);
}

@override
String toString() {
    return 'FarmEvent.upgraded(buildingId: $buildingId, level: $level)';
}


}

/// @nodoc
abstract mixin class $BuildingUpgradedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $BuildingUpgradedCopyWith(BuildingUpgraded value, $Res Function(BuildingUpgraded) _then) = _$BuildingUpgradedCopyWithImpl;
@useResult
$Res call({
 int buildingId, int level
});




}
/// @nodoc
class _$BuildingUpgradedCopyWithImpl<$Res>
    implements $BuildingUpgradedCopyWith<$Res> {
  _$BuildingUpgradedCopyWithImpl(this._self, this._then);

  final BuildingUpgraded _self;
  final $Res Function(BuildingUpgraded) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? level = null,}) {
  return _then(BuildingUpgraded(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BuildingDemolished implements FarmEvent {
  const BuildingDemolished({required this.buildingId,  List<int> toFridge = const <int>[],  String? $type}): _toFridge = toFridge,$type = $type ?? 'demolished';
  factory BuildingDemolished.fromJson(Map<String, dynamic> json) => _$BuildingDemolishedFromJson(json);

 final  int buildingId;
 final  List<int> _toFridge;
@JsonKey() List<int> get toFridge {
  if (_toFridge is EqualUnmodifiableListView) return _toFridge;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toFridge);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingDemolishedCopyWith<BuildingDemolished> get copyWith => _$BuildingDemolishedCopyWithImpl<BuildingDemolished>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingDemolishedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingDemolished&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&const DeepCollectionEquality().equals(other.toFridge, _toFridge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,const DeepCollectionEquality().hash(_toFridge));
}

@override
String toString() {
    return 'FarmEvent.demolished(buildingId: $buildingId, toFridge: $toFridge)';
}


}

/// @nodoc
abstract mixin class $BuildingDemolishedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $BuildingDemolishedCopyWith(BuildingDemolished value, $Res Function(BuildingDemolished) _then) = _$BuildingDemolishedCopyWithImpl;
@useResult
$Res call({
 int buildingId, List<int> toFridge
});




}
/// @nodoc
class _$BuildingDemolishedCopyWithImpl<$Res>
    implements $BuildingDemolishedCopyWith<$Res> {
  _$BuildingDemolishedCopyWithImpl(this._self, this._then);

  final BuildingDemolished _self;
  final $Res Function(BuildingDemolished) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? toFridge = null,}) {
  return _then(BuildingDemolished(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,toFridge: null == toFridge ? _self._toFridge : toFridge // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SeedTrained implements FarmEvent {
  const SeedTrained({required this.buildingId, required this.potatoId, required this.seed,  String? $type}): $type = $type ?? 'trained';
  factory SeedTrained.fromJson(Map<String, dynamic> json) => _$SeedTrainedFromJson(json);

 final  int buildingId;
 final  int potatoId;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedTrainedCopyWith<SeedTrained> get copyWith => _$SeedTrainedCopyWithImpl<SeedTrained>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedTrainedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedTrained&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,potatoId,seed);
}

@override
String toString() {
    return 'FarmEvent.trained(buildingId: $buildingId, potatoId: $potatoId, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $SeedTrainedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $SeedTrainedCopyWith(SeedTrained value, $Res Function(SeedTrained) _then) = _$SeedTrainedCopyWithImpl;
@useResult
$Res call({
 int buildingId, int potatoId, Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$SeedTrainedCopyWithImpl<$Res>
    implements $SeedTrainedCopyWith<$Res> {
  _$SeedTrainedCopyWithImpl(this._self, this._then);

  final SeedTrained _self;
  final $Res Function(SeedTrained) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? potatoId = null,Object? seed = null,}) {
  return _then(SeedTrained(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmEvent
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

class PestAppeared implements FarmEvent {
  const PestAppeared({required this.fieldId, required this.kind,  String? $type}): $type = $type ?? 'pestAppeared';
  factory PestAppeared.fromJson(Map<String, dynamic> json) => _$PestAppearedFromJson(json);

 final  int fieldId;
 final  PestKind kind;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PestAppearedCopyWith<PestAppeared> get copyWith => _$PestAppearedCopyWithImpl<PestAppeared>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PestAppearedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PestAppeared&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,kind);
}

@override
String toString() {
    return 'FarmEvent.pestAppeared(fieldId: $fieldId, kind: $kind)';
}


}

/// @nodoc
abstract mixin class $PestAppearedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PestAppearedCopyWith(PestAppeared value, $Res Function(PestAppeared) _then) = _$PestAppearedCopyWithImpl;
@useResult
$Res call({
 int fieldId, PestKind kind
});




}
/// @nodoc
class _$PestAppearedCopyWithImpl<$Res>
    implements $PestAppearedCopyWith<$Res> {
  _$PestAppearedCopyWithImpl(this._self, this._then);

  final PestAppeared _self;
  final $Res Function(PestAppeared) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? kind = null,}) {
  return _then(PestAppeared(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PestKind,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PestCleared implements FarmEvent {
  const PestCleared({required this.fieldId, required this.kind, required this.byTap, required this.food, this.seed,  String? $type}): $type = $type ?? 'pestCleared';
  factory PestCleared.fromJson(Map<String, dynamic> json) => _$PestClearedFromJson(json);

 final  int fieldId;
 final  PestKind kind;
 final  bool byTap;
 final  int food;
 final  Seed? seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PestClearedCopyWith<PestCleared> get copyWith => _$PestClearedCopyWithImpl<PestCleared>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PestClearedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PestCleared&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.byTap, byTap) || other.byTap == byTap)&&(identical(other.food, food) || other.food == food)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,kind,byTap,food,seed);
}

@override
String toString() {
    return 'FarmEvent.pestCleared(fieldId: $fieldId, kind: $kind, byTap: $byTap, food: $food, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $PestClearedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PestClearedCopyWith(PestCleared value, $Res Function(PestCleared) _then) = _$PestClearedCopyWithImpl;
@useResult
$Res call({
 int fieldId, PestKind kind, bool byTap, int food, Seed? seed
});


$SeedCopyWith<$Res>? get seed;

}
/// @nodoc
class _$PestClearedCopyWithImpl<$Res>
    implements $PestClearedCopyWith<$Res> {
  _$PestClearedCopyWithImpl(this._self, this._then);

  final PestCleared _self;
  final $Res Function(PestCleared) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? kind = null,Object? byTap = null,Object? food = null,Object? seed = freezed,}) {
  return _then(PestCleared(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PestKind,byTap: null == byTap ? _self.byTap : byTap // ignore: cast_nullable_to_non_nullable
as bool,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed?,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res>? get seed {
    if (_self.seed == null) {
    return null;
  }

  return $SeedCopyWith<$Res>(_self.seed!, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PotatoesWeakened implements FarmEvent {
  const PotatoesWeakened({required  List<int> potatoIds,  String? $type}): _potatoIds = potatoIds,$type = $type ?? 'weakened';
  factory PotatoesWeakened.fromJson(Map<String, dynamic> json) => _$PotatoesWeakenedFromJson(json);

 final  List<int> _potatoIds;
 List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoesWeakenedCopyWith<PotatoesWeakened> get copyWith => _$PotatoesWeakenedCopyWithImpl<PotatoesWeakened>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoesWeakenedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoesWeakened&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmEvent.weakened(potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $PotatoesWeakenedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoesWeakenedCopyWith(PotatoesWeakened value, $Res Function(PotatoesWeakened) _then) = _$PotatoesWeakenedCopyWithImpl;
@useResult
$Res call({
 List<int> potatoIds
});




}
/// @nodoc
class _$PotatoesWeakenedCopyWithImpl<$Res>
    implements $PotatoesWeakenedCopyWith<$Res> {
  _$PotatoesWeakenedCopyWithImpl(this._self, this._then);

  final PotatoesWeakened _self;
  final $Res Function(PotatoesWeakened) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoIds = null,}) {
  return _then(PotatoesWeakened(
potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PotatoesRecovered implements FarmEvent {
  const PotatoesRecovered({required  List<int> potatoIds,  String? $type}): _potatoIds = potatoIds,$type = $type ?? 'recovered';
  factory PotatoesRecovered.fromJson(Map<String, dynamic> json) => _$PotatoesRecoveredFromJson(json);

 final  List<int> _potatoIds;
 List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoesRecoveredCopyWith<PotatoesRecovered> get copyWith => _$PotatoesRecoveredCopyWithImpl<PotatoesRecovered>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoesRecoveredToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoesRecovered&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmEvent.recovered(potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $PotatoesRecoveredCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoesRecoveredCopyWith(PotatoesRecovered value, $Res Function(PotatoesRecovered) _then) = _$PotatoesRecoveredCopyWithImpl;
@useResult
$Res call({
 List<int> potatoIds
});




}
/// @nodoc
class _$PotatoesRecoveredCopyWithImpl<$Res>
    implements $PotatoesRecoveredCopyWith<$Res> {
  _$PotatoesRecoveredCopyWithImpl(this._self, this._then);

  final PotatoesRecovered _self;
  final $Res Function(PotatoesRecovered) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoIds = null,}) {
  return _then(PotatoesRecovered(
potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PotatoUprooted implements FarmEvent {
  const PotatoUprooted({required this.potatoId,  String? $type}): $type = $type ?? 'uprooted';
  factory PotatoUprooted.fromJson(Map<String, dynamic> json) => _$PotatoUprootedFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoUprootedCopyWith<PotatoUprooted> get copyWith => _$PotatoUprootedCopyWithImpl<PotatoUprooted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoUprootedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoUprooted&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmEvent.uprooted(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $PotatoUprootedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoUprootedCopyWith(PotatoUprooted value, $Res Function(PotatoUprooted) _then) = _$PotatoUprootedCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$PotatoUprootedCopyWithImpl<$Res>
    implements $PotatoUprootedCopyWith<$Res> {
  _$PotatoUprootedCopyWithImpl(this._self, this._then);

  final PotatoUprooted _self;
  final $Res Function(PotatoUprooted) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(PotatoUprooted(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PotatoTakenOut implements FarmEvent {
  const PotatoTakenOut({required this.potatoId,  String? $type}): $type = $type ?? 'takenOut';
  factory PotatoTakenOut.fromJson(Map<String, dynamic> json) => _$PotatoTakenOutFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoTakenOutCopyWith<PotatoTakenOut> get copyWith => _$PotatoTakenOutCopyWithImpl<PotatoTakenOut>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoTakenOutToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoTakenOut&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmEvent.takenOut(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $PotatoTakenOutCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoTakenOutCopyWith(PotatoTakenOut value, $Res Function(PotatoTakenOut) _then) = _$PotatoTakenOutCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$PotatoTakenOutCopyWithImpl<$Res>
    implements $PotatoTakenOutCopyWith<$Res> {
  _$PotatoTakenOutCopyWithImpl(this._self, this._then);

  final PotatoTakenOut _self;
  final $Res Function(PotatoTakenOut) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(PotatoTakenOut(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class FoodHarvested implements FarmEvent {
  const FoodHarvested({required this.fieldId, required this.food,  String? $type}): $type = $type ?? 'harvested';
  factory FoodHarvested.fromJson(Map<String, dynamic> json) => _$FoodHarvestedFromJson(json);

 final  int fieldId;
 final  int food;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? food = null,}) {
  return _then(FoodHarvested(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Departed implements FarmEvent {
  const Departed({required this.food, required  List<int> potatoIds,  String? $type}): _potatoIds = potatoIds,$type = $type ?? 'departed';
  factory Departed.fromJson(Map<String, dynamic> json) => _$DepartedFromJson(json);

 final  int food;
 final  List<int> _potatoIds;
 List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartedCopyWith<Departed> get copyWith => _$DepartedCopyWithImpl<Departed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Departed&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmEvent.departed(food: $food, potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $DepartedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $DepartedCopyWith(Departed value, $Res Function(Departed) _then) = _$DepartedCopyWithImpl;
@useResult
$Res call({
 int food, List<int> potatoIds
});




}
/// @nodoc
class _$DepartedCopyWithImpl<$Res>
    implements $DepartedCopyWith<$Res> {
  _$DepartedCopyWithImpl(this._self, this._then);

  final Departed _self;
  final $Res Function(Departed) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? potatoIds = null,}) {
  return _then(Departed(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Returned implements FarmEvent {
  const Returned({required this.food, required this.seeds, required  List<int> potatoIds,  List<int> toFridge = const <int>[],  String? $type}): _potatoIds = potatoIds,_toFridge = toFridge,$type = $type ?? 'returned';
  factory Returned.fromJson(Map<String, dynamic> json) => _$ReturnedFromJson(json);

 final  int food;
 final  int seeds;
 final  List<int> _potatoIds;
 List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}

 final  List<int> _toFridge;
@JsonKey() List<int> get toFridge {
  if (_toFridge is EqualUnmodifiableListView) return _toFridge;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_toFridge);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnedCopyWith<Returned> get copyWith => _$ReturnedCopyWithImpl<Returned>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Returned&&(identical(other.food, food) || other.food == food)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds)&&const DeepCollectionEquality().equals(other.toFridge, _toFridge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,seeds,const DeepCollectionEquality().hash(_potatoIds),const DeepCollectionEquality().hash(_toFridge));
}

@override
String toString() {
    return 'FarmEvent.returned(food: $food, seeds: $seeds, potatoIds: $potatoIds, toFridge: $toFridge)';
}


}

/// @nodoc
abstract mixin class $ReturnedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $ReturnedCopyWith(Returned value, $Res Function(Returned) _then) = _$ReturnedCopyWithImpl;
@useResult
$Res call({
 int food, int seeds, List<int> potatoIds, List<int> toFridge
});




}
/// @nodoc
class _$ReturnedCopyWithImpl<$Res>
    implements $ReturnedCopyWith<$Res> {
  _$ReturnedCopyWithImpl(this._self, this._then);

  final Returned _self;
  final $Res Function(Returned) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? seeds = null,Object? potatoIds = null,Object? toFridge = null,}) {
  return _then(Returned(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,toFridge: null == toFridge ? _self._toFridge : toFridge // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
