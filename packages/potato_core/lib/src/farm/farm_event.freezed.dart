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
                case 'graveLost':
          return GraveLost.fromJson(
            json
          );
                case 'revived':
          return PotatoRevived.fromJson(
            json
          );
                case 'seedOverflowed':
          return SeedOverflowed.fromJson(
            json
          );
                case 'overflowExpired':
          return OverflowExpired.fromJson(
            json
          );
                case 'mailArrived':
          return MailArrived.fromJson(
            json
          );
                case 'storyDone':
          return StoryDone.fromJson(
            json
          );
                case 'gearEnhanced':
          return GearEnhanced.fromJson(
            json
          );
                case 'gearDisassembled':
          return GearDisassembled.fromJson(
            json
          );
                case 'totemLit':
          return TotemLit.fromJson(
            json
          );
                case 'seedMade':
          return SeedMade.fromJson(
            json
          );
                case 'totemOut':
          return TotemOut.fromJson(
            json
          );
                case 'blockOpened':
          return BlockOpened.fromJson(
            json
          );
                case 'fieldMade':
          return FieldMade.fromJson(
            json
          );
                case 'fieldChanged':
          return FieldChanged.fromJson(
            json
          );
                case 'buildingMoved':
          return BuildingMoved.fromJson(
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
                case 'released':
          return PotatoReleased.fromJson(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PotatoPlanted value)?  planted,TResult Function( PotatoGrown value)?  grown,TResult Function( PotatoDied value)?  died,TResult Function( GraveLost value)?  graveLost,TResult Function( PotatoRevived value)?  revived,TResult Function( SeedOverflowed value)?  seedOverflowed,TResult Function( OverflowExpired value)?  overflowExpired,TResult Function( MailArrived value)?  mailArrived,TResult Function( StoryDone value)?  storyDone,TResult Function( GearEnhanced value)?  gearEnhanced,TResult Function( GearDisassembled value)?  gearDisassembled,TResult Function( TotemLit value)?  totemLit,TResult Function( SeedMade value)?  seedMade,TResult Function( TotemOut value)?  totemOut,TResult Function( BlockOpened value)?  blockOpened,TResult Function( FieldMade value)?  fieldMade,TResult Function( FieldChanged value)?  fieldChanged,TResult Function( BuildingMoved value)?  buildingMoved,TResult Function( BuildingBuilt value)?  built,TResult Function( BuildingUpgraded value)?  upgraded,TResult Function( BuildingDemolished value)?  demolished,TResult Function( SeedTrained value)?  trained,TResult Function( PestAppeared value)?  pestAppeared,TResult Function( PestCleared value)?  pestCleared,TResult Function( PotatoesWeakened value)?  weakened,TResult Function( PotatoesRecovered value)?  recovered,TResult Function( PotatoUprooted value)?  uprooted,TResult Function( PotatoReleased value)?  released,TResult Function( PotatoTakenOut value)?  takenOut,TResult Function( FoodHarvested value)?  harvested,TResult Function( Departed value)?  departed,TResult Function( Returned value)?  returned,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case GraveLost() when graveLost != null:
return graveLost(_that);case PotatoRevived() when revived != null:
return revived(_that);case SeedOverflowed() when seedOverflowed != null:
return seedOverflowed(_that);case OverflowExpired() when overflowExpired != null:
return overflowExpired(_that);case MailArrived() when mailArrived != null:
return mailArrived(_that);case StoryDone() when storyDone != null:
return storyDone(_that);case GearEnhanced() when gearEnhanced != null:
return gearEnhanced(_that);case GearDisassembled() when gearDisassembled != null:
return gearDisassembled(_that);case TotemLit() when totemLit != null:
return totemLit(_that);case SeedMade() when seedMade != null:
return seedMade(_that);case TotemOut() when totemOut != null:
return totemOut(_that);case BlockOpened() when blockOpened != null:
return blockOpened(_that);case FieldMade() when fieldMade != null:
return fieldMade(_that);case FieldChanged() when fieldChanged != null:
return fieldChanged(_that);case BuildingMoved() when buildingMoved != null:
return buildingMoved(_that);case BuildingBuilt() when built != null:
return built(_that);case BuildingUpgraded() when upgraded != null:
return upgraded(_that);case BuildingDemolished() when demolished != null:
return demolished(_that);case SeedTrained() when trained != null:
return trained(_that);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that);case PestCleared() when pestCleared != null:
return pestCleared(_that);case PotatoesWeakened() when weakened != null:
return weakened(_that);case PotatoesRecovered() when recovered != null:
return recovered(_that);case PotatoUprooted() when uprooted != null:
return uprooted(_that);case PotatoReleased() when released != null:
return released(_that);case PotatoTakenOut() when takenOut != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PotatoPlanted value)  planted,required TResult Function( PotatoGrown value)  grown,required TResult Function( PotatoDied value)  died,required TResult Function( GraveLost value)  graveLost,required TResult Function( PotatoRevived value)  revived,required TResult Function( SeedOverflowed value)  seedOverflowed,required TResult Function( OverflowExpired value)  overflowExpired,required TResult Function( MailArrived value)  mailArrived,required TResult Function( StoryDone value)  storyDone,required TResult Function( GearEnhanced value)  gearEnhanced,required TResult Function( GearDisassembled value)  gearDisassembled,required TResult Function( TotemLit value)  totemLit,required TResult Function( SeedMade value)  seedMade,required TResult Function( TotemOut value)  totemOut,required TResult Function( BlockOpened value)  blockOpened,required TResult Function( FieldMade value)  fieldMade,required TResult Function( FieldChanged value)  fieldChanged,required TResult Function( BuildingMoved value)  buildingMoved,required TResult Function( BuildingBuilt value)  built,required TResult Function( BuildingUpgraded value)  upgraded,required TResult Function( BuildingDemolished value)  demolished,required TResult Function( SeedTrained value)  trained,required TResult Function( PestAppeared value)  pestAppeared,required TResult Function( PestCleared value)  pestCleared,required TResult Function( PotatoesWeakened value)  weakened,required TResult Function( PotatoesRecovered value)  recovered,required TResult Function( PotatoUprooted value)  uprooted,required TResult Function( PotatoReleased value)  released,required TResult Function( PotatoTakenOut value)  takenOut,required TResult Function( FoodHarvested value)  harvested,required TResult Function( Departed value)  departed,required TResult Function( Returned value)  returned,}){
final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that);case PotatoGrown():
return grown(_that);case PotatoDied():
return died(_that);case GraveLost():
return graveLost(_that);case PotatoRevived():
return revived(_that);case SeedOverflowed():
return seedOverflowed(_that);case OverflowExpired():
return overflowExpired(_that);case MailArrived():
return mailArrived(_that);case StoryDone():
return storyDone(_that);case GearEnhanced():
return gearEnhanced(_that);case GearDisassembled():
return gearDisassembled(_that);case TotemLit():
return totemLit(_that);case SeedMade():
return seedMade(_that);case TotemOut():
return totemOut(_that);case BlockOpened():
return blockOpened(_that);case FieldMade():
return fieldMade(_that);case FieldChanged():
return fieldChanged(_that);case BuildingMoved():
return buildingMoved(_that);case BuildingBuilt():
return built(_that);case BuildingUpgraded():
return upgraded(_that);case BuildingDemolished():
return demolished(_that);case SeedTrained():
return trained(_that);case PestAppeared():
return pestAppeared(_that);case PestCleared():
return pestCleared(_that);case PotatoesWeakened():
return weakened(_that);case PotatoesRecovered():
return recovered(_that);case PotatoUprooted():
return uprooted(_that);case PotatoReleased():
return released(_that);case PotatoTakenOut():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PotatoPlanted value)?  planted,TResult? Function( PotatoGrown value)?  grown,TResult? Function( PotatoDied value)?  died,TResult? Function( GraveLost value)?  graveLost,TResult? Function( PotatoRevived value)?  revived,TResult? Function( SeedOverflowed value)?  seedOverflowed,TResult? Function( OverflowExpired value)?  overflowExpired,TResult? Function( MailArrived value)?  mailArrived,TResult? Function( StoryDone value)?  storyDone,TResult? Function( GearEnhanced value)?  gearEnhanced,TResult? Function( GearDisassembled value)?  gearDisassembled,TResult? Function( TotemLit value)?  totemLit,TResult? Function( SeedMade value)?  seedMade,TResult? Function( TotemOut value)?  totemOut,TResult? Function( BlockOpened value)?  blockOpened,TResult? Function( FieldMade value)?  fieldMade,TResult? Function( FieldChanged value)?  fieldChanged,TResult? Function( BuildingMoved value)?  buildingMoved,TResult? Function( BuildingBuilt value)?  built,TResult? Function( BuildingUpgraded value)?  upgraded,TResult? Function( BuildingDemolished value)?  demolished,TResult? Function( SeedTrained value)?  trained,TResult? Function( PestAppeared value)?  pestAppeared,TResult? Function( PestCleared value)?  pestCleared,TResult? Function( PotatoesWeakened value)?  weakened,TResult? Function( PotatoesRecovered value)?  recovered,TResult? Function( PotatoUprooted value)?  uprooted,TResult? Function( PotatoReleased value)?  released,TResult? Function( PotatoTakenOut value)?  takenOut,TResult? Function( FoodHarvested value)?  harvested,TResult? Function( Departed value)?  departed,TResult? Function( Returned value)?  returned,}){
final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that);case PotatoGrown() when grown != null:
return grown(_that);case PotatoDied() when died != null:
return died(_that);case GraveLost() when graveLost != null:
return graveLost(_that);case PotatoRevived() when revived != null:
return revived(_that);case SeedOverflowed() when seedOverflowed != null:
return seedOverflowed(_that);case OverflowExpired() when overflowExpired != null:
return overflowExpired(_that);case MailArrived() when mailArrived != null:
return mailArrived(_that);case StoryDone() when storyDone != null:
return storyDone(_that);case GearEnhanced() when gearEnhanced != null:
return gearEnhanced(_that);case GearDisassembled() when gearDisassembled != null:
return gearDisassembled(_that);case TotemLit() when totemLit != null:
return totemLit(_that);case SeedMade() when seedMade != null:
return seedMade(_that);case TotemOut() when totemOut != null:
return totemOut(_that);case BlockOpened() when blockOpened != null:
return blockOpened(_that);case FieldMade() when fieldMade != null:
return fieldMade(_that);case FieldChanged() when fieldChanged != null:
return fieldChanged(_that);case BuildingMoved() when buildingMoved != null:
return buildingMoved(_that);case BuildingBuilt() when built != null:
return built(_that);case BuildingUpgraded() when upgraded != null:
return upgraded(_that);case BuildingDemolished() when demolished != null:
return demolished(_that);case SeedTrained() when trained != null:
return trained(_that);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that);case PestCleared() when pestCleared != null:
return pestCleared(_that);case PotatoesWeakened() when weakened != null:
return weakened(_that);case PotatoesRecovered() when recovered != null:
return recovered(_that);case PotatoUprooted() when uprooted != null:
return uprooted(_that);case PotatoReleased() when released != null:
return released(_that);case PotatoTakenOut() when takenOut != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)?  planted,TResult Function( int? fieldId,  TilePos? tile,  int potatoId)?  grown,TResult Function( int? fieldId,  TilePos? tile,  TilePos? at,  int potatoId,  PotatoType type,  bool buried)?  died,TResult Function( int potatoId)?  graveLost,TResult Function( int potatoId,  Grade from,  Seed seed)?  revived,TResult Function( Seed seed)?  seedOverflowed,TResult Function( Seed seed,  int food)?  overflowExpired,TResult Function( int mailId)?  mailArrived,TResult Function( String event,  List<String> unlocks)?  storyDone,TResult Function( GearKind kind,  int level,  bool worked)?  gearEnhanced,TResult Function( int materials)?  gearDisassembled,TResult Function( int buildingId)?  totemLit,TResult Function( int fieldId,  int potatoId,  Seed seed)?  seedMade,TResult Function( int buildingId)?  totemOut,TResult Function( TilePos block,  int food)?  blockOpened,TResult Function( int fieldId,  TileRect rect)?  fieldMade,TResult Function( int fieldId,  TileRect? rect)?  fieldChanged,TResult Function( int buildingId,  TilePos origin)?  buildingMoved,TResult Function( int buildingId,  String kind,  TilePos origin)?  built,TResult Function( int buildingId,  int level)?  upgraded,TResult Function( int buildingId,  List<int> toFridge)?  demolished,TResult Function( int buildingId,  int potatoId,  Seed seed)?  trained,TResult Function( int fieldId,  PestKind kind)?  pestAppeared,TResult Function( int fieldId,  PestKind kind,  bool byTap)?  pestCleared,TResult Function( List<int> potatoIds)?  weakened,TResult Function( List<int> potatoIds)?  recovered,TResult Function( int potatoId)?  uprooted,TResult Function( int potatoId)?  released,TResult Function( int potatoId)?  takenOut,TResult Function( int fieldId,  int food,  Seed? seed,  List<Seed> seeds)?  harvested,TResult Function( int food,  List<int> potatoIds)?  departed,TResult Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge,  List<int> lost)?  returned,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.at,_that.potatoId,_that.type,_that.buried);case GraveLost() when graveLost != null:
return graveLost(_that.potatoId);case PotatoRevived() when revived != null:
return revived(_that.potatoId,_that.from,_that.seed);case SeedOverflowed() when seedOverflowed != null:
return seedOverflowed(_that.seed);case OverflowExpired() when overflowExpired != null:
return overflowExpired(_that.seed,_that.food);case MailArrived() when mailArrived != null:
return mailArrived(_that.mailId);case StoryDone() when storyDone != null:
return storyDone(_that.event,_that.unlocks);case GearEnhanced() when gearEnhanced != null:
return gearEnhanced(_that.kind,_that.level,_that.worked);case GearDisassembled() when gearDisassembled != null:
return gearDisassembled(_that.materials);case TotemLit() when totemLit != null:
return totemLit(_that.buildingId);case SeedMade() when seedMade != null:
return seedMade(_that.fieldId,_that.potatoId,_that.seed);case TotemOut() when totemOut != null:
return totemOut(_that.buildingId);case BlockOpened() when blockOpened != null:
return blockOpened(_that.block,_that.food);case FieldMade() when fieldMade != null:
return fieldMade(_that.fieldId,_that.rect);case FieldChanged() when fieldChanged != null:
return fieldChanged(_that.fieldId,_that.rect);case BuildingMoved() when buildingMoved != null:
return buildingMoved(_that.buildingId,_that.origin);case BuildingBuilt() when built != null:
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded() when upgraded != null:
return upgraded(_that.buildingId,_that.level);case BuildingDemolished() when demolished != null:
return demolished(_that.buildingId,_that.toFridge);case SeedTrained() when trained != null:
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that.fieldId,_that.kind);case PestCleared() when pestCleared != null:
return pestCleared(_that.fieldId,_that.kind,_that.byTap);case PotatoesWeakened() when weakened != null:
return weakened(_that.potatoIds);case PotatoesRecovered() when recovered != null:
return recovered(_that.potatoIds);case PotatoUprooted() when uprooted != null:
return uprooted(_that.potatoId);case PotatoReleased() when released != null:
return released(_that.potatoId);case PotatoTakenOut() when takenOut != null:
return takenOut(_that.potatoId);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food,_that.seed,_that.seeds);case Departed() when departed != null:
return departed(_that.food,_that.potatoIds);case Returned() when returned != null:
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge,_that.lost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)  planted,required TResult Function( int? fieldId,  TilePos? tile,  int potatoId)  grown,required TResult Function( int? fieldId,  TilePos? tile,  TilePos? at,  int potatoId,  PotatoType type,  bool buried)  died,required TResult Function( int potatoId)  graveLost,required TResult Function( int potatoId,  Grade from,  Seed seed)  revived,required TResult Function( Seed seed)  seedOverflowed,required TResult Function( Seed seed,  int food)  overflowExpired,required TResult Function( int mailId)  mailArrived,required TResult Function( String event,  List<String> unlocks)  storyDone,required TResult Function( GearKind kind,  int level,  bool worked)  gearEnhanced,required TResult Function( int materials)  gearDisassembled,required TResult Function( int buildingId)  totemLit,required TResult Function( int fieldId,  int potatoId,  Seed seed)  seedMade,required TResult Function( int buildingId)  totemOut,required TResult Function( TilePos block,  int food)  blockOpened,required TResult Function( int fieldId,  TileRect rect)  fieldMade,required TResult Function( int fieldId,  TileRect? rect)  fieldChanged,required TResult Function( int buildingId,  TilePos origin)  buildingMoved,required TResult Function( int buildingId,  String kind,  TilePos origin)  built,required TResult Function( int buildingId,  int level)  upgraded,required TResult Function( int buildingId,  List<int> toFridge)  demolished,required TResult Function( int buildingId,  int potatoId,  Seed seed)  trained,required TResult Function( int fieldId,  PestKind kind)  pestAppeared,required TResult Function( int fieldId,  PestKind kind,  bool byTap)  pestCleared,required TResult Function( List<int> potatoIds)  weakened,required TResult Function( List<int> potatoIds)  recovered,required TResult Function( int potatoId)  uprooted,required TResult Function( int potatoId)  released,required TResult Function( int potatoId)  takenOut,required TResult Function( int fieldId,  int food,  Seed? seed,  List<Seed> seeds)  harvested,required TResult Function( int food,  List<int> potatoIds)  departed,required TResult Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge,  List<int> lost)  returned,}) {final _that = this;
switch (_that) {
case PotatoPlanted():
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown():
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied():
return died(_that.fieldId,_that.tile,_that.at,_that.potatoId,_that.type,_that.buried);case GraveLost():
return graveLost(_that.potatoId);case PotatoRevived():
return revived(_that.potatoId,_that.from,_that.seed);case SeedOverflowed():
return seedOverflowed(_that.seed);case OverflowExpired():
return overflowExpired(_that.seed,_that.food);case MailArrived():
return mailArrived(_that.mailId);case StoryDone():
return storyDone(_that.event,_that.unlocks);case GearEnhanced():
return gearEnhanced(_that.kind,_that.level,_that.worked);case GearDisassembled():
return gearDisassembled(_that.materials);case TotemLit():
return totemLit(_that.buildingId);case SeedMade():
return seedMade(_that.fieldId,_that.potatoId,_that.seed);case TotemOut():
return totemOut(_that.buildingId);case BlockOpened():
return blockOpened(_that.block,_that.food);case FieldMade():
return fieldMade(_that.fieldId,_that.rect);case FieldChanged():
return fieldChanged(_that.fieldId,_that.rect);case BuildingMoved():
return buildingMoved(_that.buildingId,_that.origin);case BuildingBuilt():
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded():
return upgraded(_that.buildingId,_that.level);case BuildingDemolished():
return demolished(_that.buildingId,_that.toFridge);case SeedTrained():
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared():
return pestAppeared(_that.fieldId,_that.kind);case PestCleared():
return pestCleared(_that.fieldId,_that.kind,_that.byTap);case PotatoesWeakened():
return weakened(_that.potatoIds);case PotatoesRecovered():
return recovered(_that.potatoIds);case PotatoUprooted():
return uprooted(_that.potatoId);case PotatoReleased():
return released(_that.potatoId);case PotatoTakenOut():
return takenOut(_that.potatoId);case FoodHarvested():
return harvested(_that.fieldId,_that.food,_that.seed,_that.seeds);case Departed():
return departed(_that.food,_that.potatoIds);case Returned():
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge,_that.lost);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  int potatoId,  Seed seed)?  planted,TResult? Function( int? fieldId,  TilePos? tile,  int potatoId)?  grown,TResult? Function( int? fieldId,  TilePos? tile,  TilePos? at,  int potatoId,  PotatoType type,  bool buried)?  died,TResult? Function( int potatoId)?  graveLost,TResult? Function( int potatoId,  Grade from,  Seed seed)?  revived,TResult? Function( Seed seed)?  seedOverflowed,TResult? Function( Seed seed,  int food)?  overflowExpired,TResult? Function( int mailId)?  mailArrived,TResult? Function( String event,  List<String> unlocks)?  storyDone,TResult? Function( GearKind kind,  int level,  bool worked)?  gearEnhanced,TResult? Function( int materials)?  gearDisassembled,TResult? Function( int buildingId)?  totemLit,TResult? Function( int fieldId,  int potatoId,  Seed seed)?  seedMade,TResult? Function( int buildingId)?  totemOut,TResult? Function( TilePos block,  int food)?  blockOpened,TResult? Function( int fieldId,  TileRect rect)?  fieldMade,TResult? Function( int fieldId,  TileRect? rect)?  fieldChanged,TResult? Function( int buildingId,  TilePos origin)?  buildingMoved,TResult? Function( int buildingId,  String kind,  TilePos origin)?  built,TResult? Function( int buildingId,  int level)?  upgraded,TResult? Function( int buildingId,  List<int> toFridge)?  demolished,TResult? Function( int buildingId,  int potatoId,  Seed seed)?  trained,TResult? Function( int fieldId,  PestKind kind)?  pestAppeared,TResult? Function( int fieldId,  PestKind kind,  bool byTap)?  pestCleared,TResult? Function( List<int> potatoIds)?  weakened,TResult? Function( List<int> potatoIds)?  recovered,TResult? Function( int potatoId)?  uprooted,TResult? Function( int potatoId)?  released,TResult? Function( int potatoId)?  takenOut,TResult? Function( int fieldId,  int food,  Seed? seed,  List<Seed> seeds)?  harvested,TResult? Function( int food,  List<int> potatoIds)?  departed,TResult? Function( int food,  int seeds,  List<int> potatoIds,  List<int> toFridge,  List<int> lost)?  returned,}) {final _that = this;
switch (_that) {
case PotatoPlanted() when planted != null:
return planted(_that.fieldId,_that.tile,_that.potatoId,_that.seed);case PotatoGrown() when grown != null:
return grown(_that.fieldId,_that.tile,_that.potatoId);case PotatoDied() when died != null:
return died(_that.fieldId,_that.tile,_that.at,_that.potatoId,_that.type,_that.buried);case GraveLost() when graveLost != null:
return graveLost(_that.potatoId);case PotatoRevived() when revived != null:
return revived(_that.potatoId,_that.from,_that.seed);case SeedOverflowed() when seedOverflowed != null:
return seedOverflowed(_that.seed);case OverflowExpired() when overflowExpired != null:
return overflowExpired(_that.seed,_that.food);case MailArrived() when mailArrived != null:
return mailArrived(_that.mailId);case StoryDone() when storyDone != null:
return storyDone(_that.event,_that.unlocks);case GearEnhanced() when gearEnhanced != null:
return gearEnhanced(_that.kind,_that.level,_that.worked);case GearDisassembled() when gearDisassembled != null:
return gearDisassembled(_that.materials);case TotemLit() when totemLit != null:
return totemLit(_that.buildingId);case SeedMade() when seedMade != null:
return seedMade(_that.fieldId,_that.potatoId,_that.seed);case TotemOut() when totemOut != null:
return totemOut(_that.buildingId);case BlockOpened() when blockOpened != null:
return blockOpened(_that.block,_that.food);case FieldMade() when fieldMade != null:
return fieldMade(_that.fieldId,_that.rect);case FieldChanged() when fieldChanged != null:
return fieldChanged(_that.fieldId,_that.rect);case BuildingMoved() when buildingMoved != null:
return buildingMoved(_that.buildingId,_that.origin);case BuildingBuilt() when built != null:
return built(_that.buildingId,_that.kind,_that.origin);case BuildingUpgraded() when upgraded != null:
return upgraded(_that.buildingId,_that.level);case BuildingDemolished() when demolished != null:
return demolished(_that.buildingId,_that.toFridge);case SeedTrained() when trained != null:
return trained(_that.buildingId,_that.potatoId,_that.seed);case PestAppeared() when pestAppeared != null:
return pestAppeared(_that.fieldId,_that.kind);case PestCleared() when pestCleared != null:
return pestCleared(_that.fieldId,_that.kind,_that.byTap);case PotatoesWeakened() when weakened != null:
return weakened(_that.potatoIds);case PotatoesRecovered() when recovered != null:
return recovered(_that.potatoIds);case PotatoUprooted() when uprooted != null:
return uprooted(_that.potatoId);case PotatoReleased() when released != null:
return released(_that.potatoId);case PotatoTakenOut() when takenOut != null:
return takenOut(_that.potatoId);case FoodHarvested() when harvested != null:
return harvested(_that.fieldId,_that.food,_that.seed,_that.seeds);case Departed() when departed != null:
return departed(_that.food,_that.potatoIds);case Returned() when returned != null:
return returned(_that.food,_that.seeds,_that.potatoIds,_that.toFridge,_that.lost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PotatoPlanted implements FarmEvent {
  const PotatoPlanted({required this.fieldId, required this.tile, required this.potatoId, required this.seed,  String? $type}): $type = $type ?? 'planted';
  factory PotatoPlanted.fromJson(Map<String, dynamic> json) => _$PotatoPlantedFromJson(json);

 final  int fieldId;
 final  TilePos tile;
 final  int potatoId;
 final  Seed seed;

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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? potatoId = null,Object? seed = null,}) {
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
  const PotatoDied({this.fieldId, this.tile, this.at, required this.potatoId, required this.type, required this.buried,  String? $type}): $type = $type ?? 'died';
  factory PotatoDied.fromJson(Map<String, dynamic> json) => _$PotatoDiedFromJson(json);

 final  int? fieldId;
 final  TilePos? tile;
 final  TilePos? at;
 final  int potatoId;
 final  PotatoType type;
 final  bool buried;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoDied&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.at, at) || other.at == at)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.type, type) || other.type == type)&&(identical(other.buried, buried) || other.buried == buried));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,at,potatoId,type,buried);
}

@override
String toString() {
    return 'FarmEvent.died(fieldId: $fieldId, tile: $tile, at: $at, potatoId: $potatoId, type: $type, buried: $buried)';
}


}

/// @nodoc
abstract mixin class $PotatoDiedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoDiedCopyWith(PotatoDied value, $Res Function(PotatoDied) _then) = _$PotatoDiedCopyWithImpl;
@useResult
$Res call({
 int? fieldId, TilePos? tile, TilePos? at, int potatoId, PotatoType type, bool buried
});


$TilePosCopyWith<$Res>? get tile;$TilePosCopyWith<$Res>? get at;

}
/// @nodoc
class _$PotatoDiedCopyWithImpl<$Res>
    implements $PotatoDiedCopyWith<$Res> {
  _$PotatoDiedCopyWithImpl(this._self, this._then);

  final PotatoDied _self;
  final $Res Function(PotatoDied) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = freezed,Object? tile = freezed,Object? at = freezed,Object? potatoId = null,Object? type = null,Object? buried = null,}) {
  return _then(PotatoDied(
fieldId: freezed == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int?,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as TilePos?,potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,buried: null == buried ? _self.buried : buried // ignore: cast_nullable_to_non_nullable
as bool,
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
$TilePosCopyWith<$Res>? get at {
    if (_self.at == null) {
    return null;
  }

  return $TilePosCopyWith<$Res>(_self.at!, (value) {
    return _then(_self.copyWith(at: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class GraveLost implements FarmEvent {
  const GraveLost({required this.potatoId,  String? $type}): $type = $type ?? 'graveLost';
  factory GraveLost.fromJson(Map<String, dynamic> json) => _$GraveLostFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraveLostCopyWith<GraveLost> get copyWith => _$GraveLostCopyWithImpl<GraveLost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GraveLostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GraveLost&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmEvent.graveLost(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $GraveLostCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $GraveLostCopyWith(GraveLost value, $Res Function(GraveLost) _then) = _$GraveLostCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$GraveLostCopyWithImpl<$Res>
    implements $GraveLostCopyWith<$Res> {
  _$GraveLostCopyWithImpl(this._self, this._then);

  final GraveLost _self;
  final $Res Function(GraveLost) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(GraveLost(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PotatoRevived implements FarmEvent {
  const PotatoRevived({required this.potatoId, required this.from, required this.seed,  String? $type}): $type = $type ?? 'revived';
  factory PotatoRevived.fromJson(Map<String, dynamic> json) => _$PotatoRevivedFromJson(json);

 final  int potatoId;
 final  Grade from;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoRevivedCopyWith<PotatoRevived> get copyWith => _$PotatoRevivedCopyWithImpl<PotatoRevived>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoRevivedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoRevived&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.from, from) || other.from == from)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId,from,seed);
}

@override
String toString() {
    return 'FarmEvent.revived(potatoId: $potatoId, from: $from, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $PotatoRevivedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoRevivedCopyWith(PotatoRevived value, $Res Function(PotatoRevived) _then) = _$PotatoRevivedCopyWithImpl;
@useResult
$Res call({
 int potatoId, Grade from, Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$PotatoRevivedCopyWithImpl<$Res>
    implements $PotatoRevivedCopyWith<$Res> {
  _$PotatoRevivedCopyWithImpl(this._self, this._then);

  final PotatoRevived _self;
  final $Res Function(PotatoRevived) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,Object? from = null,Object? seed = null,}) {
  return _then(PotatoRevived(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Grade,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
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

class SeedOverflowed implements FarmEvent {
  const SeedOverflowed({required this.seed,  String? $type}): $type = $type ?? 'seedOverflowed';
  factory SeedOverflowed.fromJson(Map<String, dynamic> json) => _$SeedOverflowedFromJson(json);

 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedOverflowedCopyWith<SeedOverflowed> get copyWith => _$SeedOverflowedCopyWithImpl<SeedOverflowed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedOverflowedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedOverflowed&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed);
}

@override
String toString() {
    return 'FarmEvent.seedOverflowed(seed: $seed)';
}


}

/// @nodoc
abstract mixin class $SeedOverflowedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $SeedOverflowedCopyWith(SeedOverflowed value, $Res Function(SeedOverflowed) _then) = _$SeedOverflowedCopyWithImpl;
@useResult
$Res call({
 Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$SeedOverflowedCopyWithImpl<$Res>
    implements $SeedOverflowedCopyWith<$Res> {
  _$SeedOverflowedCopyWithImpl(this._self, this._then);

  final SeedOverflowed _self;
  final $Res Function(SeedOverflowed) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seed = null,}) {
  return _then(SeedOverflowed(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
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

class OverflowExpired implements FarmEvent {
  const OverflowExpired({required this.seed, required this.food,  String? $type}): $type = $type ?? 'overflowExpired';
  factory OverflowExpired.fromJson(Map<String, dynamic> json) => _$OverflowExpiredFromJson(json);

 final  Seed seed;
 final  int food;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverflowExpiredCopyWith<OverflowExpired> get copyWith => _$OverflowExpiredCopyWithImpl<OverflowExpired>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverflowExpiredToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OverflowExpired&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.food, food) || other.food == food));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed,food);
}

@override
String toString() {
    return 'FarmEvent.overflowExpired(seed: $seed, food: $food)';
}


}

/// @nodoc
abstract mixin class $OverflowExpiredCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $OverflowExpiredCopyWith(OverflowExpired value, $Res Function(OverflowExpired) _then) = _$OverflowExpiredCopyWithImpl;
@useResult
$Res call({
 Seed seed, int food
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$OverflowExpiredCopyWithImpl<$Res>
    implements $OverflowExpiredCopyWith<$Res> {
  _$OverflowExpiredCopyWithImpl(this._self, this._then);

  final OverflowExpired _self;
  final $Res Function(OverflowExpired) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seed = null,Object? food = null,}) {
  return _then(OverflowExpired(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
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

class MailArrived implements FarmEvent {
  const MailArrived({required this.mailId,  String? $type}): $type = $type ?? 'mailArrived';
  factory MailArrived.fromJson(Map<String, dynamic> json) => _$MailArrivedFromJson(json);

 final  int mailId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MailArrivedCopyWith<MailArrived> get copyWith => _$MailArrivedCopyWithImpl<MailArrived>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MailArrivedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MailArrived&&(identical(other.mailId, mailId) || other.mailId == mailId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mailId);
}

@override
String toString() {
    return 'FarmEvent.mailArrived(mailId: $mailId)';
}


}

/// @nodoc
abstract mixin class $MailArrivedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $MailArrivedCopyWith(MailArrived value, $Res Function(MailArrived) _then) = _$MailArrivedCopyWithImpl;
@useResult
$Res call({
 int mailId
});




}
/// @nodoc
class _$MailArrivedCopyWithImpl<$Res>
    implements $MailArrivedCopyWith<$Res> {
  _$MailArrivedCopyWithImpl(this._self, this._then);

  final MailArrived _self;
  final $Res Function(MailArrived) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mailId = null,}) {
  return _then(MailArrived(
mailId: null == mailId ? _self.mailId : mailId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StoryDone implements FarmEvent {
  const StoryDone({required this.event,  List<String> unlocks = const <String>[],  String? $type}): _unlocks = unlocks,$type = $type ?? 'storyDone';
  factory StoryDone.fromJson(Map<String, dynamic> json) => _$StoryDoneFromJson(json);

 final  String event;
 final  List<String> _unlocks;
@JsonKey() List<String> get unlocks {
  if (_unlocks is EqualUnmodifiableListView) return _unlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlocks);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDoneCopyWith<StoryDone> get copyWith => _$StoryDoneCopyWithImpl<StoryDone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryDoneToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryDone&&(identical(other.event, event) || other.event == event)&&const DeepCollectionEquality().equals(other.unlocks, _unlocks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,event,const DeepCollectionEquality().hash(_unlocks));
}

@override
String toString() {
    return 'FarmEvent.storyDone(event: $event, unlocks: $unlocks)';
}


}

/// @nodoc
abstract mixin class $StoryDoneCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $StoryDoneCopyWith(StoryDone value, $Res Function(StoryDone) _then) = _$StoryDoneCopyWithImpl;
@useResult
$Res call({
 String event, List<String> unlocks
});




}
/// @nodoc
class _$StoryDoneCopyWithImpl<$Res>
    implements $StoryDoneCopyWith<$Res> {
  _$StoryDoneCopyWithImpl(this._self, this._then);

  final StoryDone _self;
  final $Res Function(StoryDone) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,Object? unlocks = null,}) {
  return _then(StoryDone(
event: null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String,unlocks: null == unlocks ? _self._unlocks : unlocks // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GearEnhanced implements FarmEvent {
  const GearEnhanced({required this.kind, required this.level, required this.worked,  String? $type}): $type = $type ?? 'gearEnhanced';
  factory GearEnhanced.fromJson(Map<String, dynamic> json) => _$GearEnhancedFromJson(json);

 final  GearKind kind;
 final  int level;
 final  bool worked;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GearEnhancedCopyWith<GearEnhanced> get copyWith => _$GearEnhancedCopyWithImpl<GearEnhanced>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GearEnhancedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GearEnhanced&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.level, level) || other.level == level)&&(identical(other.worked, worked) || other.worked == worked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,level,worked);
}

@override
String toString() {
    return 'FarmEvent.gearEnhanced(kind: $kind, level: $level, worked: $worked)';
}


}

/// @nodoc
abstract mixin class $GearEnhancedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $GearEnhancedCopyWith(GearEnhanced value, $Res Function(GearEnhanced) _then) = _$GearEnhancedCopyWithImpl;
@useResult
$Res call({
 GearKind kind, int level, bool worked
});




}
/// @nodoc
class _$GearEnhancedCopyWithImpl<$Res>
    implements $GearEnhancedCopyWith<$Res> {
  _$GearEnhancedCopyWithImpl(this._self, this._then);

  final GearEnhanced _self;
  final $Res Function(GearEnhanced) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? level = null,Object? worked = null,}) {
  return _then(GearEnhanced(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GearKind,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,worked: null == worked ? _self.worked : worked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class GearDisassembled implements FarmEvent {
  const GearDisassembled({required this.materials,  String? $type}): $type = $type ?? 'gearDisassembled';
  factory GearDisassembled.fromJson(Map<String, dynamic> json) => _$GearDisassembledFromJson(json);

 final  int materials;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GearDisassembledCopyWith<GearDisassembled> get copyWith => _$GearDisassembledCopyWithImpl<GearDisassembled>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GearDisassembledToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GearDisassembled&&(identical(other.materials, materials) || other.materials == materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,materials);
}

@override
String toString() {
    return 'FarmEvent.gearDisassembled(materials: $materials)';
}


}

/// @nodoc
abstract mixin class $GearDisassembledCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $GearDisassembledCopyWith(GearDisassembled value, $Res Function(GearDisassembled) _then) = _$GearDisassembledCopyWithImpl;
@useResult
$Res call({
 int materials
});




}
/// @nodoc
class _$GearDisassembledCopyWithImpl<$Res>
    implements $GearDisassembledCopyWith<$Res> {
  _$GearDisassembledCopyWithImpl(this._self, this._then);

  final GearDisassembled _self;
  final $Res Function(GearDisassembled) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materials = null,}) {
  return _then(GearDisassembled(
materials: null == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TotemLit implements FarmEvent {
  const TotemLit({required this.buildingId,  String? $type}): $type = $type ?? 'totemLit';
  factory TotemLit.fromJson(Map<String, dynamic> json) => _$TotemLitFromJson(json);

 final  int buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemLitCopyWith<TotemLit> get copyWith => _$TotemLitCopyWithImpl<TotemLit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemLitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemLit&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'FarmEvent.totemLit(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class $TotemLitCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $TotemLitCopyWith(TotemLit value, $Res Function(TotemLit) _then) = _$TotemLitCopyWithImpl;
@useResult
$Res call({
 int buildingId
});




}
/// @nodoc
class _$TotemLitCopyWithImpl<$Res>
    implements $TotemLitCopyWith<$Res> {
  _$TotemLitCopyWithImpl(this._self, this._then);

  final TotemLit _self;
  final $Res Function(TotemLit) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(TotemLit(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SeedMade implements FarmEvent {
  const SeedMade({required this.fieldId, required this.potatoId, required this.seed,  String? $type}): $type = $type ?? 'seedMade';
  factory SeedMade.fromJson(Map<String, dynamic> json) => _$SeedMadeFromJson(json);

 final  int fieldId;
 final  int potatoId;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedMadeCopyWith<SeedMade> get copyWith => _$SeedMadeCopyWithImpl<SeedMade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedMadeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedMade&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,potatoId,seed);
}

@override
String toString() {
    return 'FarmEvent.seedMade(fieldId: $fieldId, potatoId: $potatoId, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $SeedMadeCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $SeedMadeCopyWith(SeedMade value, $Res Function(SeedMade) _then) = _$SeedMadeCopyWithImpl;
@useResult
$Res call({
 int fieldId, int potatoId, Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$SeedMadeCopyWithImpl<$Res>
    implements $SeedMadeCopyWith<$Res> {
  _$SeedMadeCopyWithImpl(this._self, this._then);

  final SeedMade _self;
  final $Res Function(SeedMade) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? potatoId = null,Object? seed = null,}) {
  return _then(SeedMade(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
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

class TotemOut implements FarmEvent {
  const TotemOut({required this.buildingId,  String? $type}): $type = $type ?? 'totemOut';
  factory TotemOut.fromJson(Map<String, dynamic> json) => _$TotemOutFromJson(json);

 final  int buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotemOutCopyWith<TotemOut> get copyWith => _$TotemOutCopyWithImpl<TotemOut>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotemOutToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TotemOut&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'FarmEvent.totemOut(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class $TotemOutCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $TotemOutCopyWith(TotemOut value, $Res Function(TotemOut) _then) = _$TotemOutCopyWithImpl;
@useResult
$Res call({
 int buildingId
});




}
/// @nodoc
class _$TotemOutCopyWithImpl<$Res>
    implements $TotemOutCopyWith<$Res> {
  _$TotemOutCopyWithImpl(this._self, this._then);

  final TotemOut _self;
  final $Res Function(TotemOut) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(TotemOut(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BlockOpened implements FarmEvent {
  const BlockOpened({required this.block, required this.food,  String? $type}): $type = $type ?? 'blockOpened';
  factory BlockOpened.fromJson(Map<String, dynamic> json) => _$BlockOpenedFromJson(json);

 final  TilePos block;
 final  int food;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockOpenedCopyWith<BlockOpened> get copyWith => _$BlockOpenedCopyWithImpl<BlockOpened>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockOpenedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockOpened&&(identical(other.block, block) || other.block == block)&&(identical(other.food, food) || other.food == food));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,block,food);
}

@override
String toString() {
    return 'FarmEvent.blockOpened(block: $block, food: $food)';
}


}

/// @nodoc
abstract mixin class $BlockOpenedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $BlockOpenedCopyWith(BlockOpened value, $Res Function(BlockOpened) _then) = _$BlockOpenedCopyWithImpl;
@useResult
$Res call({
 TilePos block, int food
});


$TilePosCopyWith<$Res> get block;

}
/// @nodoc
class _$BlockOpenedCopyWithImpl<$Res>
    implements $BlockOpenedCopyWith<$Res> {
  _$BlockOpenedCopyWithImpl(this._self, this._then);

  final BlockOpened _self;
  final $Res Function(BlockOpened) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? block = null,Object? food = null,}) {
  return _then(BlockOpened(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as TilePos,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get block {
  
  return $TilePosCopyWith<$Res>(_self.block, (value) {
    return _then(_self.copyWith(block: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class FieldMade implements FarmEvent {
  const FieldMade({required this.fieldId, required this.rect,  String? $type}): $type = $type ?? 'fieldMade';
  factory FieldMade.fromJson(Map<String, dynamic> json) => _$FieldMadeFromJson(json);

 final  int fieldId;
 final  TileRect rect;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldMadeCopyWith<FieldMade> get copyWith => _$FieldMadeCopyWithImpl<FieldMade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldMadeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldMade&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.rect, rect) || other.rect == rect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,rect);
}

@override
String toString() {
    return 'FarmEvent.fieldMade(fieldId: $fieldId, rect: $rect)';
}


}

/// @nodoc
abstract mixin class $FieldMadeCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $FieldMadeCopyWith(FieldMade value, $Res Function(FieldMade) _then) = _$FieldMadeCopyWithImpl;
@useResult
$Res call({
 int fieldId, TileRect rect
});


$TileRectCopyWith<$Res> get rect;

}
/// @nodoc
class _$FieldMadeCopyWithImpl<$Res>
    implements $FieldMadeCopyWith<$Res> {
  _$FieldMadeCopyWithImpl(this._self, this._then);

  final FieldMade _self;
  final $Res Function(FieldMade) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? rect = null,}) {
  return _then(FieldMade(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res> get rect {
  
  return $TileRectCopyWith<$Res>(_self.rect, (value) {
    return _then(_self.copyWith(rect: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class FieldChanged implements FarmEvent {
  const FieldChanged({required this.fieldId, this.rect,  String? $type}): $type = $type ?? 'fieldChanged';
  factory FieldChanged.fromJson(Map<String, dynamic> json) => _$FieldChangedFromJson(json);

 final  int fieldId;
 final  TileRect? rect;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldChangedCopyWith<FieldChanged> get copyWith => _$FieldChangedCopyWithImpl<FieldChanged>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldChangedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldChanged&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.rect, rect) || other.rect == rect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,rect);
}

@override
String toString() {
    return 'FarmEvent.fieldChanged(fieldId: $fieldId, rect: $rect)';
}


}

/// @nodoc
abstract mixin class $FieldChangedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $FieldChangedCopyWith(FieldChanged value, $Res Function(FieldChanged) _then) = _$FieldChangedCopyWithImpl;
@useResult
$Res call({
 int fieldId, TileRect? rect
});


$TileRectCopyWith<$Res>? get rect;

}
/// @nodoc
class _$FieldChangedCopyWithImpl<$Res>
    implements $FieldChangedCopyWith<$Res> {
  _$FieldChangedCopyWithImpl(this._self, this._then);

  final FieldChanged _self;
  final $Res Function(FieldChanged) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? rect = freezed,}) {
  return _then(FieldChanged(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,rect: freezed == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect?,
  ));
}

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res>? get rect {
    if (_self.rect == null) {
    return null;
  }

  return $TileRectCopyWith<$Res>(_self.rect!, (value) {
    return _then(_self.copyWith(rect: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class BuildingMoved implements FarmEvent {
  const BuildingMoved({required this.buildingId, required this.origin,  String? $type}): $type = $type ?? 'buildingMoved';
  factory BuildingMoved.fromJson(Map<String, dynamic> json) => _$BuildingMovedFromJson(json);

 final  int buildingId;
 final  TilePos origin;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingMovedCopyWith<BuildingMoved> get copyWith => _$BuildingMovedCopyWithImpl<BuildingMoved>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingMovedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingMoved&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,origin);
}

@override
String toString() {
    return 'FarmEvent.buildingMoved(buildingId: $buildingId, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $BuildingMovedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $BuildingMovedCopyWith(BuildingMoved value, $Res Function(BuildingMoved) _then) = _$BuildingMovedCopyWithImpl;
@useResult
$Res call({
 int buildingId, TilePos origin
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$BuildingMovedCopyWithImpl<$Res>
    implements $BuildingMovedCopyWith<$Res> {
  _$BuildingMovedCopyWithImpl(this._self, this._then);

  final BuildingMoved _self;
  final $Res Function(BuildingMoved) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? origin = null,}) {
  return _then(BuildingMoved(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
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
  const PestCleared({required this.fieldId, required this.kind, required this.byTap,  String? $type}): $type = $type ?? 'pestCleared';
  factory PestCleared.fromJson(Map<String, dynamic> json) => _$PestClearedFromJson(json);

 final  int fieldId;
 final  PestKind kind;
 final  bool byTap;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PestCleared&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.byTap, byTap) || other.byTap == byTap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,kind,byTap);
}

@override
String toString() {
    return 'FarmEvent.pestCleared(fieldId: $fieldId, kind: $kind, byTap: $byTap)';
}


}

/// @nodoc
abstract mixin class $PestClearedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PestClearedCopyWith(PestCleared value, $Res Function(PestCleared) _then) = _$PestClearedCopyWithImpl;
@useResult
$Res call({
 int fieldId, PestKind kind, bool byTap
});




}
/// @nodoc
class _$PestClearedCopyWithImpl<$Res>
    implements $PestClearedCopyWith<$Res> {
  _$PestClearedCopyWithImpl(this._self, this._then);

  final PestCleared _self;
  final $Res Function(PestCleared) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? kind = null,Object? byTap = null,}) {
  return _then(PestCleared(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PestKind,byTap: null == byTap ? _self.byTap : byTap // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

class PotatoReleased implements FarmEvent {
  const PotatoReleased({required this.potatoId,  String? $type}): $type = $type ?? 'released';
  factory PotatoReleased.fromJson(Map<String, dynamic> json) => _$PotatoReleasedFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoReleasedCopyWith<PotatoReleased> get copyWith => _$PotatoReleasedCopyWithImpl<PotatoReleased>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoReleasedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoReleased&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmEvent.released(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $PotatoReleasedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $PotatoReleasedCopyWith(PotatoReleased value, $Res Function(PotatoReleased) _then) = _$PotatoReleasedCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$PotatoReleasedCopyWithImpl<$Res>
    implements $PotatoReleasedCopyWith<$Res> {
  _$PotatoReleasedCopyWithImpl(this._self, this._then);

  final PotatoReleased _self;
  final $Res Function(PotatoReleased) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(PotatoReleased(
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
  const FoodHarvested({required this.fieldId, required this.food, this.seed,  List<Seed> seeds = const <Seed>[],  String? $type}): _seeds = seeds,$type = $type ?? 'harvested';
  factory FoodHarvested.fromJson(Map<String, dynamic> json) => _$FoodHarvestedFromJson(json);

 final  int fieldId;
 final  int food;
 final  Seed? seed;
 final  List<Seed> _seeds;
@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodHarvested&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.food, food) || other.food == food)&&(identical(other.seed, seed) || other.seed == seed)&&const DeepCollectionEquality().equals(other.seeds, _seeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,food,seed,const DeepCollectionEquality().hash(_seeds));
}

@override
String toString() {
    return 'FarmEvent.harvested(fieldId: $fieldId, food: $food, seed: $seed, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class $FoodHarvestedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $FoodHarvestedCopyWith(FoodHarvested value, $Res Function(FoodHarvested) _then) = _$FoodHarvestedCopyWithImpl;
@useResult
$Res call({
 int fieldId, int food, Seed? seed, List<Seed> seeds
});


$SeedCopyWith<$Res>? get seed;

}
/// @nodoc
class _$FoodHarvestedCopyWithImpl<$Res>
    implements $FoodHarvestedCopyWith<$Res> {
  _$FoodHarvestedCopyWithImpl(this._self, this._then);

  final FoodHarvested _self;
  final $Res Function(FoodHarvested) _then;

/// Create a copy of FarmEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? food = null,Object? seed = freezed,Object? seeds = null,}) {
  return _then(FoodHarvested(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed?,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,
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
  const Returned({required this.food, required this.seeds, required  List<int> potatoIds,  List<int> toFridge = const <int>[],  List<int> lost = const <int>[],  String? $type}): _potatoIds = potatoIds,_toFridge = toFridge,_lost = lost,$type = $type ?? 'returned';
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

/// Companions lost in a failed danger run: gone, no grave, no seed.
 final  List<int> _lost;
/// Companions lost in a failed danger run: gone, no grave, no seed.
@JsonKey() List<int> get lost {
  if (_lost is EqualUnmodifiableListView) return _lost;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lost);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Returned&&(identical(other.food, food) || other.food == food)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds)&&const DeepCollectionEquality().equals(other.toFridge, _toFridge)&&const DeepCollectionEquality().equals(other.lost, _lost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,seeds,const DeepCollectionEquality().hash(_potatoIds),const DeepCollectionEquality().hash(_toFridge),const DeepCollectionEquality().hash(_lost));
}

@override
String toString() {
    return 'FarmEvent.returned(food: $food, seeds: $seeds, potatoIds: $potatoIds, toFridge: $toFridge, lost: $lost)';
}


}

/// @nodoc
abstract mixin class $ReturnedCopyWith<$Res> implements $FarmEventCopyWith<$Res> {
  factory $ReturnedCopyWith(Returned value, $Res Function(Returned) _then) = _$ReturnedCopyWithImpl;
@useResult
$Res call({
 int food, int seeds, List<int> potatoIds, List<int> toFridge, List<int> lost
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
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? seeds = null,Object? potatoIds = null,Object? toFridge = null,Object? lost = null,}) {
  return _then(Returned(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,toFridge: null == toFridge ? _self._toFridge : toFridge // ignore: cast_nullable_to_non_nullable
as List<int>,lost: null == lost ? _self._lost : lost // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
