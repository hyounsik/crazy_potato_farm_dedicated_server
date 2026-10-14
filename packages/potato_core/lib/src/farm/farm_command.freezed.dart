// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
FarmCommand _$FarmCommandFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'plant':
          return PlantSeed.fromJson(
            json
          );
                case 'harvest':
          return HarvestPotato.fromJson(
            json
          );
                case 'harvestField':
          return HarvestField.fromJson(
            json
          );
                case 'widenPouch':
          return WidenPouch.fromJson(
            json
          );
                case 'widenGearBox':
          return WidenGearBox.fromJson(
            json
          );
                case 'sellSeed':
          return SellSeed.fromJson(
            json
          );
                case 'takeOverflow':
          return TakeOverflow.fromJson(
            json
          );
                case 'readMail':
          return ReadMail.fromJson(
            json
          );
                case 'claimMail':
          return ClaimMail.fromJson(
            json
          );
                case 'openBlock':
          return OpenBlock.fromJson(
            json
          );
                case 'makeField':
          return MakeField.fromJson(
            json
          );
                case 'resizeField':
          return ResizeField.fromJson(
            json
          );
                case 'moveField':
          return MoveField.fromJson(
            json
          );
                case 'removeField':
          return RemoveField.fromJson(
            json
          );
                case 'moveBuilding':
          return MoveBuilding.fromJson(
            json
          );
                case 'build':
          return BuildBuilding.fromJson(
            json
          );
                case 'upgrade':
          return UpgradeBuilding.fromJson(
            json
          );
                case 'demolish':
          return DemolishBuilding.fromJson(
            json
          );
                case 'train':
          return TrainSeed.fromJson(
            json
          );
                case 'clearPest':
          return ClearPest.fromJson(
            json
          );
                case 'uproot':
          return Uproot.fromJson(
            json
          );
                case 'replant':
          return Replant.fromJson(
            json
          );
                case 'retrain':
          return Retrain.fromJson(
            json
          );
                case 'revive':
          return Revive.fromJson(
            json
          );
                case 'depart':
          return Depart.fromJson(
            json
          );
                case 'returnHome':
          return ReturnHome.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'FarmCommand',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$FarmCommand {



  /// Serializes this FarmCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmCommand);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FarmCommand()';
}


}

/// @nodoc
class $FarmCommandCopyWith<$Res>  {
$FarmCommandCopyWith(FarmCommand _, $Res Function(FarmCommand) __);
}


/// Adds pattern-matching-related methods to [FarmCommand].
extension FarmCommandPatterns on FarmCommand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlantSeed value)?  plant,TResult Function( HarvestPotato value)?  harvest,TResult Function( HarvestField value)?  harvestField,TResult Function( WidenPouch value)?  widenPouch,TResult Function( WidenGearBox value)?  widenGearBox,TResult Function( SellSeed value)?  sellSeed,TResult Function( TakeOverflow value)?  takeOverflow,TResult Function( ReadMail value)?  readMail,TResult Function( ClaimMail value)?  claimMail,TResult Function( OpenBlock value)?  openBlock,TResult Function( MakeField value)?  makeField,TResult Function( ResizeField value)?  resizeField,TResult Function( MoveField value)?  moveField,TResult Function( RemoveField value)?  removeField,TResult Function( MoveBuilding value)?  moveBuilding,TResult Function( BuildBuilding value)?  build,TResult Function( UpgradeBuilding value)?  upgrade,TResult Function( DemolishBuilding value)?  demolish,TResult Function( TrainSeed value)?  train,TResult Function( ClearPest value)?  clearPest,TResult Function( Uproot value)?  uproot,TResult Function( Replant value)?  replant,TResult Function( Retrain value)?  retrain,TResult Function( Revive value)?  revive,TResult Function( Depart value)?  depart,TResult Function( ReturnHome value)?  returnHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case WidenPouch() when widenPouch != null:
return widenPouch(_that);case WidenGearBox() when widenGearBox != null:
return widenGearBox(_that);case SellSeed() when sellSeed != null:
return sellSeed(_that);case TakeOverflow() when takeOverflow != null:
return takeOverflow(_that);case ReadMail() when readMail != null:
return readMail(_that);case ClaimMail() when claimMail != null:
return claimMail(_that);case OpenBlock() when openBlock != null:
return openBlock(_that);case MakeField() when makeField != null:
return makeField(_that);case ResizeField() when resizeField != null:
return resizeField(_that);case MoveField() when moveField != null:
return moveField(_that);case RemoveField() when removeField != null:
return removeField(_that);case MoveBuilding() when moveBuilding != null:
return moveBuilding(_that);case BuildBuilding() when build != null:
return build(_that);case UpgradeBuilding() when upgrade != null:
return upgrade(_that);case DemolishBuilding() when demolish != null:
return demolish(_that);case TrainSeed() when train != null:
return train(_that);case ClearPest() when clearPest != null:
return clearPest(_that);case Uproot() when uproot != null:
return uproot(_that);case Replant() when replant != null:
return replant(_that);case Retrain() when retrain != null:
return retrain(_that);case Revive() when revive != null:
return revive(_that);case Depart() when depart != null:
return depart(_that);case ReturnHome() when returnHome != null:
return returnHome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlantSeed value)  plant,required TResult Function( HarvestPotato value)  harvest,required TResult Function( HarvestField value)  harvestField,required TResult Function( WidenPouch value)  widenPouch,required TResult Function( WidenGearBox value)  widenGearBox,required TResult Function( SellSeed value)  sellSeed,required TResult Function( TakeOverflow value)  takeOverflow,required TResult Function( ReadMail value)  readMail,required TResult Function( ClaimMail value)  claimMail,required TResult Function( OpenBlock value)  openBlock,required TResult Function( MakeField value)  makeField,required TResult Function( ResizeField value)  resizeField,required TResult Function( MoveField value)  moveField,required TResult Function( RemoveField value)  removeField,required TResult Function( MoveBuilding value)  moveBuilding,required TResult Function( BuildBuilding value)  build,required TResult Function( UpgradeBuilding value)  upgrade,required TResult Function( DemolishBuilding value)  demolish,required TResult Function( TrainSeed value)  train,required TResult Function( ClearPest value)  clearPest,required TResult Function( Uproot value)  uproot,required TResult Function( Replant value)  replant,required TResult Function( Retrain value)  retrain,required TResult Function( Revive value)  revive,required TResult Function( Depart value)  depart,required TResult Function( ReturnHome value)  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that);case HarvestPotato():
return harvest(_that);case HarvestField():
return harvestField(_that);case WidenPouch():
return widenPouch(_that);case WidenGearBox():
return widenGearBox(_that);case SellSeed():
return sellSeed(_that);case TakeOverflow():
return takeOverflow(_that);case ReadMail():
return readMail(_that);case ClaimMail():
return claimMail(_that);case OpenBlock():
return openBlock(_that);case MakeField():
return makeField(_that);case ResizeField():
return resizeField(_that);case MoveField():
return moveField(_that);case RemoveField():
return removeField(_that);case MoveBuilding():
return moveBuilding(_that);case BuildBuilding():
return build(_that);case UpgradeBuilding():
return upgrade(_that);case DemolishBuilding():
return demolish(_that);case TrainSeed():
return train(_that);case ClearPest():
return clearPest(_that);case Uproot():
return uproot(_that);case Replant():
return replant(_that);case Retrain():
return retrain(_that);case Revive():
return revive(_that);case Depart():
return depart(_that);case ReturnHome():
return returnHome(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlantSeed value)?  plant,TResult? Function( HarvestPotato value)?  harvest,TResult? Function( HarvestField value)?  harvestField,TResult? Function( WidenPouch value)?  widenPouch,TResult? Function( WidenGearBox value)?  widenGearBox,TResult? Function( SellSeed value)?  sellSeed,TResult? Function( TakeOverflow value)?  takeOverflow,TResult? Function( ReadMail value)?  readMail,TResult? Function( ClaimMail value)?  claimMail,TResult? Function( OpenBlock value)?  openBlock,TResult? Function( MakeField value)?  makeField,TResult? Function( ResizeField value)?  resizeField,TResult? Function( MoveField value)?  moveField,TResult? Function( RemoveField value)?  removeField,TResult? Function( MoveBuilding value)?  moveBuilding,TResult? Function( BuildBuilding value)?  build,TResult? Function( UpgradeBuilding value)?  upgrade,TResult? Function( DemolishBuilding value)?  demolish,TResult? Function( TrainSeed value)?  train,TResult? Function( ClearPest value)?  clearPest,TResult? Function( Uproot value)?  uproot,TResult? Function( Replant value)?  replant,TResult? Function( Retrain value)?  retrain,TResult? Function( Revive value)?  revive,TResult? Function( Depart value)?  depart,TResult? Function( ReturnHome value)?  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case WidenPouch() when widenPouch != null:
return widenPouch(_that);case WidenGearBox() when widenGearBox != null:
return widenGearBox(_that);case SellSeed() when sellSeed != null:
return sellSeed(_that);case TakeOverflow() when takeOverflow != null:
return takeOverflow(_that);case ReadMail() when readMail != null:
return readMail(_that);case ClaimMail() when claimMail != null:
return claimMail(_that);case OpenBlock() when openBlock != null:
return openBlock(_that);case MakeField() when makeField != null:
return makeField(_that);case ResizeField() when resizeField != null:
return resizeField(_that);case MoveField() when moveField != null:
return moveField(_that);case RemoveField() when removeField != null:
return removeField(_that);case MoveBuilding() when moveBuilding != null:
return moveBuilding(_that);case BuildBuilding() when build != null:
return build(_that);case UpgradeBuilding() when upgrade != null:
return upgrade(_that);case DemolishBuilding() when demolish != null:
return demolish(_that);case TrainSeed() when train != null:
return train(_that);case ClearPest() when clearPest != null:
return clearPest(_that);case Uproot() when uproot != null:
return uproot(_that);case Replant() when replant != null:
return replant(_that);case Retrain() when retrain != null:
return retrain(_that);case Revive() when revive != null:
return revive(_that);case Depart() when depart != null:
return depart(_that);case ReturnHome() when returnHome != null:
return returnHome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult Function( int fieldId,  TilePos tile)?  harvest,TResult Function( int fieldId)?  harvestField,TResult Function()?  widenPouch,TResult Function()?  widenGearBox,TResult Function( Seed seed)?  sellSeed,TResult Function( Seed seed)?  takeOverflow,TResult Function( int mailId)?  readMail,TResult Function( int mailId)?  claimMail,TResult Function( TilePos block)?  openBlock,TResult Function( TileRect rect)?  makeField,TResult Function( int fieldId,  TileRect rect)?  resizeField,TResult Function( int fieldId,  TilePos origin)?  moveField,TResult Function( int fieldId)?  removeField,TResult Function( int buildingId,  TilePos origin)?  moveBuilding,TResult Function( String kind,  TilePos origin)?  build,TResult Function( int buildingId)?  upgrade,TResult Function( int buildingId)?  demolish,TResult Function( int buildingId,  Seed seed)?  train,TResult Function( int fieldId)?  clearPest,TResult Function( int potatoId)?  uproot,TResult Function( int potatoId,  int fieldId,  TilePos tile)?  replant,TResult Function( int potatoId,  int buildingId)?  retrain,TResult Function( int potatoId)?  revive,TResult Function( int food,  List<int> potatoIds)?  depart,TResult Function( int food,  List<SeedCount> seeds,  Map<String, int> materials,  List<int> potatoIds)?  returnHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case WidenPouch() when widenPouch != null:
return widenPouch();case WidenGearBox() when widenGearBox != null:
return widenGearBox();case SellSeed() when sellSeed != null:
return sellSeed(_that.seed);case TakeOverflow() when takeOverflow != null:
return takeOverflow(_that.seed);case ReadMail() when readMail != null:
return readMail(_that.mailId);case ClaimMail() when claimMail != null:
return claimMail(_that.mailId);case OpenBlock() when openBlock != null:
return openBlock(_that.block);case MakeField() when makeField != null:
return makeField(_that.rect);case ResizeField() when resizeField != null:
return resizeField(_that.fieldId,_that.rect);case MoveField() when moveField != null:
return moveField(_that.fieldId,_that.origin);case RemoveField() when removeField != null:
return removeField(_that.fieldId);case MoveBuilding() when moveBuilding != null:
return moveBuilding(_that.buildingId,_that.origin);case BuildBuilding() when build != null:
return build(_that.kind,_that.origin);case UpgradeBuilding() when upgrade != null:
return upgrade(_that.buildingId);case DemolishBuilding() when demolish != null:
return demolish(_that.buildingId);case TrainSeed() when train != null:
return train(_that.buildingId,_that.seed);case ClearPest() when clearPest != null:
return clearPest(_that.fieldId);case Uproot() when uproot != null:
return uproot(_that.potatoId);case Replant() when replant != null:
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain() when retrain != null:
return retrain(_that.potatoId,_that.buildingId);case Revive() when revive != null:
return revive(_that.potatoId);case Depart() when depart != null:
return depart(_that.food,_that.potatoIds);case ReturnHome() when returnHome != null:
return returnHome(_that.food,_that.seeds,_that.materials,_that.potatoIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  Seed seed)  plant,required TResult Function( int fieldId,  TilePos tile)  harvest,required TResult Function( int fieldId)  harvestField,required TResult Function()  widenPouch,required TResult Function()  widenGearBox,required TResult Function( Seed seed)  sellSeed,required TResult Function( Seed seed)  takeOverflow,required TResult Function( int mailId)  readMail,required TResult Function( int mailId)  claimMail,required TResult Function( TilePos block)  openBlock,required TResult Function( TileRect rect)  makeField,required TResult Function( int fieldId,  TileRect rect)  resizeField,required TResult Function( int fieldId,  TilePos origin)  moveField,required TResult Function( int fieldId)  removeField,required TResult Function( int buildingId,  TilePos origin)  moveBuilding,required TResult Function( String kind,  TilePos origin)  build,required TResult Function( int buildingId)  upgrade,required TResult Function( int buildingId)  demolish,required TResult Function( int buildingId,  Seed seed)  train,required TResult Function( int fieldId)  clearPest,required TResult Function( int potatoId)  uproot,required TResult Function( int potatoId,  int fieldId,  TilePos tile)  replant,required TResult Function( int potatoId,  int buildingId)  retrain,required TResult Function( int potatoId)  revive,required TResult Function( int food,  List<int> potatoIds)  depart,required TResult Function( int food,  List<SeedCount> seeds,  Map<String, int> materials,  List<int> potatoIds)  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato():
return harvest(_that.fieldId,_that.tile);case HarvestField():
return harvestField(_that.fieldId);case WidenPouch():
return widenPouch();case WidenGearBox():
return widenGearBox();case SellSeed():
return sellSeed(_that.seed);case TakeOverflow():
return takeOverflow(_that.seed);case ReadMail():
return readMail(_that.mailId);case ClaimMail():
return claimMail(_that.mailId);case OpenBlock():
return openBlock(_that.block);case MakeField():
return makeField(_that.rect);case ResizeField():
return resizeField(_that.fieldId,_that.rect);case MoveField():
return moveField(_that.fieldId,_that.origin);case RemoveField():
return removeField(_that.fieldId);case MoveBuilding():
return moveBuilding(_that.buildingId,_that.origin);case BuildBuilding():
return build(_that.kind,_that.origin);case UpgradeBuilding():
return upgrade(_that.buildingId);case DemolishBuilding():
return demolish(_that.buildingId);case TrainSeed():
return train(_that.buildingId,_that.seed);case ClearPest():
return clearPest(_that.fieldId);case Uproot():
return uproot(_that.potatoId);case Replant():
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain():
return retrain(_that.potatoId,_that.buildingId);case Revive():
return revive(_that.potatoId);case Depart():
return depart(_that.food,_that.potatoIds);case ReturnHome():
return returnHome(_that.food,_that.seeds,_that.materials,_that.potatoIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult? Function( int fieldId,  TilePos tile)?  harvest,TResult? Function( int fieldId)?  harvestField,TResult? Function()?  widenPouch,TResult? Function()?  widenGearBox,TResult? Function( Seed seed)?  sellSeed,TResult? Function( Seed seed)?  takeOverflow,TResult? Function( int mailId)?  readMail,TResult? Function( int mailId)?  claimMail,TResult? Function( TilePos block)?  openBlock,TResult? Function( TileRect rect)?  makeField,TResult? Function( int fieldId,  TileRect rect)?  resizeField,TResult? Function( int fieldId,  TilePos origin)?  moveField,TResult? Function( int fieldId)?  removeField,TResult? Function( int buildingId,  TilePos origin)?  moveBuilding,TResult? Function( String kind,  TilePos origin)?  build,TResult? Function( int buildingId)?  upgrade,TResult? Function( int buildingId)?  demolish,TResult? Function( int buildingId,  Seed seed)?  train,TResult? Function( int fieldId)?  clearPest,TResult? Function( int potatoId)?  uproot,TResult? Function( int potatoId,  int fieldId,  TilePos tile)?  replant,TResult? Function( int potatoId,  int buildingId)?  retrain,TResult? Function( int potatoId)?  revive,TResult? Function( int food,  List<int> potatoIds)?  depart,TResult? Function( int food,  List<SeedCount> seeds,  Map<String, int> materials,  List<int> potatoIds)?  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case WidenPouch() when widenPouch != null:
return widenPouch();case WidenGearBox() when widenGearBox != null:
return widenGearBox();case SellSeed() when sellSeed != null:
return sellSeed(_that.seed);case TakeOverflow() when takeOverflow != null:
return takeOverflow(_that.seed);case ReadMail() when readMail != null:
return readMail(_that.mailId);case ClaimMail() when claimMail != null:
return claimMail(_that.mailId);case OpenBlock() when openBlock != null:
return openBlock(_that.block);case MakeField() when makeField != null:
return makeField(_that.rect);case ResizeField() when resizeField != null:
return resizeField(_that.fieldId,_that.rect);case MoveField() when moveField != null:
return moveField(_that.fieldId,_that.origin);case RemoveField() when removeField != null:
return removeField(_that.fieldId);case MoveBuilding() when moveBuilding != null:
return moveBuilding(_that.buildingId,_that.origin);case BuildBuilding() when build != null:
return build(_that.kind,_that.origin);case UpgradeBuilding() when upgrade != null:
return upgrade(_that.buildingId);case DemolishBuilding() when demolish != null:
return demolish(_that.buildingId);case TrainSeed() when train != null:
return train(_that.buildingId,_that.seed);case ClearPest() when clearPest != null:
return clearPest(_that.fieldId);case Uproot() when uproot != null:
return uproot(_that.potatoId);case Replant() when replant != null:
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain() when retrain != null:
return retrain(_that.potatoId,_that.buildingId);case Revive() when revive != null:
return revive(_that.potatoId);case Depart() when depart != null:
return depart(_that.food,_that.potatoIds);case ReturnHome() when returnHome != null:
return returnHome(_that.food,_that.seeds,_that.materials,_that.potatoIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PlantSeed implements FarmCommand {
  const PlantSeed({required this.fieldId, required this.tile, required this.seed,  String? $type}): $type = $type ?? 'plant';
  factory PlantSeed.fromJson(Map<String, dynamic> json) => _$PlantSeedFromJson(json);

 final  int fieldId;
 final  TilePos tile;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantSeedCopyWith<PlantSeed> get copyWith => _$PlantSeedCopyWithImpl<PlantSeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantSeedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantSeed&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile,seed);
}

@override
String toString() {
    return 'FarmCommand.plant(fieldId: $fieldId, tile: $tile, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $PlantSeedCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $PlantSeedCopyWith(PlantSeed value, $Res Function(PlantSeed) _then) = _$PlantSeedCopyWithImpl;
@useResult
$Res call({
 int fieldId, TilePos tile, Seed seed
});


$TilePosCopyWith<$Res> get tile;$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$PlantSeedCopyWithImpl<$Res>
    implements $PlantSeedCopyWith<$Res> {
  _$PlantSeedCopyWithImpl(this._self, this._then);

  final PlantSeed _self;
  final $Res Function(PlantSeed) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? seed = null,}) {
  return _then(PlantSeed(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}/// Create a copy of FarmCommand
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

class HarvestPotato implements FarmCommand {
  const HarvestPotato({required this.fieldId, required this.tile,  String? $type}): $type = $type ?? 'harvest';
  factory HarvestPotato.fromJson(Map<String, dynamic> json) => _$HarvestPotatoFromJson(json);

 final  int fieldId;
 final  TilePos tile;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HarvestPotatoCopyWith<HarvestPotato> get copyWith => _$HarvestPotatoCopyWithImpl<HarvestPotato>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HarvestPotatoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HarvestPotato&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,tile);
}

@override
String toString() {
    return 'FarmCommand.harvest(fieldId: $fieldId, tile: $tile)';
}


}

/// @nodoc
abstract mixin class $HarvestPotatoCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $HarvestPotatoCopyWith(HarvestPotato value, $Res Function(HarvestPotato) _then) = _$HarvestPotatoCopyWithImpl;
@useResult
$Res call({
 int fieldId, TilePos tile
});


$TilePosCopyWith<$Res> get tile;

}
/// @nodoc
class _$HarvestPotatoCopyWithImpl<$Res>
    implements $HarvestPotatoCopyWith<$Res> {
  _$HarvestPotatoCopyWithImpl(this._self, this._then);

  final HarvestPotato _self;
  final $Res Function(HarvestPotato) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,}) {
  return _then(HarvestPotato(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class HarvestField implements FarmCommand {
  const HarvestField({required this.fieldId,  String? $type}): $type = $type ?? 'harvestField';
  factory HarvestField.fromJson(Map<String, dynamic> json) => _$HarvestFieldFromJson(json);

 final  int fieldId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HarvestFieldCopyWith<HarvestField> get copyWith => _$HarvestFieldCopyWithImpl<HarvestField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HarvestFieldToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HarvestField&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId);
}

@override
String toString() {
    return 'FarmCommand.harvestField(fieldId: $fieldId)';
}


}

/// @nodoc
abstract mixin class $HarvestFieldCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $HarvestFieldCopyWith(HarvestField value, $Res Function(HarvestField) _then) = _$HarvestFieldCopyWithImpl;
@useResult
$Res call({
 int fieldId
});




}
/// @nodoc
class _$HarvestFieldCopyWithImpl<$Res>
    implements $HarvestFieldCopyWith<$Res> {
  _$HarvestFieldCopyWithImpl(this._self, this._then);

  final HarvestField _self;
  final $Res Function(HarvestField) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,}) {
  return _then(HarvestField(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class WidenPouch implements FarmCommand {
  const WidenPouch({ String? $type}): $type = $type ?? 'widenPouch';
  factory WidenPouch.fromJson(Map<String, dynamic> json) => _$WidenPouchFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$WidenPouchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WidenPouch);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FarmCommand.widenPouch()';
}


}




/// @nodoc
@JsonSerializable()

class WidenGearBox implements FarmCommand {
  const WidenGearBox({ String? $type}): $type = $type ?? 'widenGearBox';
  factory WidenGearBox.fromJson(Map<String, dynamic> json) => _$WidenGearBoxFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$WidenGearBoxToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WidenGearBox);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'FarmCommand.widenGearBox()';
}


}




/// @nodoc
@JsonSerializable()

class SellSeed implements FarmCommand {
  const SellSeed({required this.seed,  String? $type}): $type = $type ?? 'sellSeed';
  factory SellSeed.fromJson(Map<String, dynamic> json) => _$SellSeedFromJson(json);

 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellSeedCopyWith<SellSeed> get copyWith => _$SellSeedCopyWithImpl<SellSeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellSeedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SellSeed&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed);
}

@override
String toString() {
    return 'FarmCommand.sellSeed(seed: $seed)';
}


}

/// @nodoc
abstract mixin class $SellSeedCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $SellSeedCopyWith(SellSeed value, $Res Function(SellSeed) _then) = _$SellSeedCopyWithImpl;
@useResult
$Res call({
 Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$SellSeedCopyWithImpl<$Res>
    implements $SellSeedCopyWith<$Res> {
  _$SellSeedCopyWithImpl(this._self, this._then);

  final SellSeed _self;
  final $Res Function(SellSeed) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seed = null,}) {
  return _then(SellSeed(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmCommand
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

class TakeOverflow implements FarmCommand {
  const TakeOverflow({required this.seed,  String? $type}): $type = $type ?? 'takeOverflow';
  factory TakeOverflow.fromJson(Map<String, dynamic> json) => _$TakeOverflowFromJson(json);

 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TakeOverflowCopyWith<TakeOverflow> get copyWith => _$TakeOverflowCopyWithImpl<TakeOverflow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TakeOverflowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TakeOverflow&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed);
}

@override
String toString() {
    return 'FarmCommand.takeOverflow(seed: $seed)';
}


}

/// @nodoc
abstract mixin class $TakeOverflowCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $TakeOverflowCopyWith(TakeOverflow value, $Res Function(TakeOverflow) _then) = _$TakeOverflowCopyWithImpl;
@useResult
$Res call({
 Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$TakeOverflowCopyWithImpl<$Res>
    implements $TakeOverflowCopyWith<$Res> {
  _$TakeOverflowCopyWithImpl(this._self, this._then);

  final TakeOverflow _self;
  final $Res Function(TakeOverflow) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seed = null,}) {
  return _then(TakeOverflow(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmCommand
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

class ReadMail implements FarmCommand {
  const ReadMail({required this.mailId,  String? $type}): $type = $type ?? 'readMail';
  factory ReadMail.fromJson(Map<String, dynamic> json) => _$ReadMailFromJson(json);

 final  int mailId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadMailCopyWith<ReadMail> get copyWith => _$ReadMailCopyWithImpl<ReadMail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadMailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadMail&&(identical(other.mailId, mailId) || other.mailId == mailId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mailId);
}

@override
String toString() {
    return 'FarmCommand.readMail(mailId: $mailId)';
}


}

/// @nodoc
abstract mixin class $ReadMailCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ReadMailCopyWith(ReadMail value, $Res Function(ReadMail) _then) = _$ReadMailCopyWithImpl;
@useResult
$Res call({
 int mailId
});




}
/// @nodoc
class _$ReadMailCopyWithImpl<$Res>
    implements $ReadMailCopyWith<$Res> {
  _$ReadMailCopyWithImpl(this._self, this._then);

  final ReadMail _self;
  final $Res Function(ReadMail) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mailId = null,}) {
  return _then(ReadMail(
mailId: null == mailId ? _self.mailId : mailId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ClaimMail implements FarmCommand {
  const ClaimMail({required this.mailId,  String? $type}): $type = $type ?? 'claimMail';
  factory ClaimMail.fromJson(Map<String, dynamic> json) => _$ClaimMailFromJson(json);

 final  int mailId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimMailCopyWith<ClaimMail> get copyWith => _$ClaimMailCopyWithImpl<ClaimMail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimMailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimMail&&(identical(other.mailId, mailId) || other.mailId == mailId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mailId);
}

@override
String toString() {
    return 'FarmCommand.claimMail(mailId: $mailId)';
}


}

/// @nodoc
abstract mixin class $ClaimMailCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ClaimMailCopyWith(ClaimMail value, $Res Function(ClaimMail) _then) = _$ClaimMailCopyWithImpl;
@useResult
$Res call({
 int mailId
});




}
/// @nodoc
class _$ClaimMailCopyWithImpl<$Res>
    implements $ClaimMailCopyWith<$Res> {
  _$ClaimMailCopyWithImpl(this._self, this._then);

  final ClaimMail _self;
  final $Res Function(ClaimMail) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mailId = null,}) {
  return _then(ClaimMail(
mailId: null == mailId ? _self.mailId : mailId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class OpenBlock implements FarmCommand {
  const OpenBlock({required this.block,  String? $type}): $type = $type ?? 'openBlock';
  factory OpenBlock.fromJson(Map<String, dynamic> json) => _$OpenBlockFromJson(json);

 final  TilePos block;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenBlockCopyWith<OpenBlock> get copyWith => _$OpenBlockCopyWithImpl<OpenBlock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenBlockToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenBlock&&(identical(other.block, block) || other.block == block));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,block);
}

@override
String toString() {
    return 'FarmCommand.openBlock(block: $block)';
}


}

/// @nodoc
abstract mixin class $OpenBlockCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $OpenBlockCopyWith(OpenBlock value, $Res Function(OpenBlock) _then) = _$OpenBlockCopyWithImpl;
@useResult
$Res call({
 TilePos block
});


$TilePosCopyWith<$Res> get block;

}
/// @nodoc
class _$OpenBlockCopyWithImpl<$Res>
    implements $OpenBlockCopyWith<$Res> {
  _$OpenBlockCopyWithImpl(this._self, this._then);

  final OpenBlock _self;
  final $Res Function(OpenBlock) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? block = null,}) {
  return _then(OpenBlock(
block: null == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class MakeField implements FarmCommand {
  const MakeField({required this.rect,  String? $type}): $type = $type ?? 'makeField';
  factory MakeField.fromJson(Map<String, dynamic> json) => _$MakeFieldFromJson(json);

 final  TileRect rect;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MakeFieldCopyWith<MakeField> get copyWith => _$MakeFieldCopyWithImpl<MakeField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MakeFieldToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MakeField&&(identical(other.rect, rect) || other.rect == rect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rect);
}

@override
String toString() {
    return 'FarmCommand.makeField(rect: $rect)';
}


}

/// @nodoc
abstract mixin class $MakeFieldCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $MakeFieldCopyWith(MakeField value, $Res Function(MakeField) _then) = _$MakeFieldCopyWithImpl;
@useResult
$Res call({
 TileRect rect
});


$TileRectCopyWith<$Res> get rect;

}
/// @nodoc
class _$MakeFieldCopyWithImpl<$Res>
    implements $MakeFieldCopyWith<$Res> {
  _$MakeFieldCopyWithImpl(this._self, this._then);

  final MakeField _self;
  final $Res Function(MakeField) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rect = null,}) {
  return _then(MakeField(
rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,
  ));
}

/// Create a copy of FarmCommand
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

class ResizeField implements FarmCommand {
  const ResizeField({required this.fieldId, required this.rect,  String? $type}): $type = $type ?? 'resizeField';
  factory ResizeField.fromJson(Map<String, dynamic> json) => _$ResizeFieldFromJson(json);

 final  int fieldId;
 final  TileRect rect;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResizeFieldCopyWith<ResizeField> get copyWith => _$ResizeFieldCopyWithImpl<ResizeField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResizeFieldToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ResizeField&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.rect, rect) || other.rect == rect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,rect);
}

@override
String toString() {
    return 'FarmCommand.resizeField(fieldId: $fieldId, rect: $rect)';
}


}

/// @nodoc
abstract mixin class $ResizeFieldCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ResizeFieldCopyWith(ResizeField value, $Res Function(ResizeField) _then) = _$ResizeFieldCopyWithImpl;
@useResult
$Res call({
 int fieldId, TileRect rect
});


$TileRectCopyWith<$Res> get rect;

}
/// @nodoc
class _$ResizeFieldCopyWithImpl<$Res>
    implements $ResizeFieldCopyWith<$Res> {
  _$ResizeFieldCopyWithImpl(this._self, this._then);

  final ResizeField _self;
  final $Res Function(ResizeField) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? rect = null,}) {
  return _then(ResizeField(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,
  ));
}

/// Create a copy of FarmCommand
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

class MoveField implements FarmCommand {
  const MoveField({required this.fieldId, required this.origin,  String? $type}): $type = $type ?? 'moveField';
  factory MoveField.fromJson(Map<String, dynamic> json) => _$MoveFieldFromJson(json);

 final  int fieldId;
 final  TilePos origin;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveFieldCopyWith<MoveField> get copyWith => _$MoveFieldCopyWithImpl<MoveField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveFieldToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveField&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId,origin);
}

@override
String toString() {
    return 'FarmCommand.moveField(fieldId: $fieldId, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $MoveFieldCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $MoveFieldCopyWith(MoveField value, $Res Function(MoveField) _then) = _$MoveFieldCopyWithImpl;
@useResult
$Res call({
 int fieldId, TilePos origin
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$MoveFieldCopyWithImpl<$Res>
    implements $MoveFieldCopyWith<$Res> {
  _$MoveFieldCopyWithImpl(this._self, this._then);

  final MoveField _self;
  final $Res Function(MoveField) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? origin = null,}) {
  return _then(MoveField(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class RemoveField implements FarmCommand {
  const RemoveField({required this.fieldId,  String? $type}): $type = $type ?? 'removeField';
  factory RemoveField.fromJson(Map<String, dynamic> json) => _$RemoveFieldFromJson(json);

 final  int fieldId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFieldCopyWith<RemoveField> get copyWith => _$RemoveFieldCopyWithImpl<RemoveField>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoveFieldToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveField&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId);
}

@override
String toString() {
    return 'FarmCommand.removeField(fieldId: $fieldId)';
}


}

/// @nodoc
abstract mixin class $RemoveFieldCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $RemoveFieldCopyWith(RemoveField value, $Res Function(RemoveField) _then) = _$RemoveFieldCopyWithImpl;
@useResult
$Res call({
 int fieldId
});




}
/// @nodoc
class _$RemoveFieldCopyWithImpl<$Res>
    implements $RemoveFieldCopyWith<$Res> {
  _$RemoveFieldCopyWithImpl(this._self, this._then);

  final RemoveField _self;
  final $Res Function(RemoveField) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,}) {
  return _then(RemoveField(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MoveBuilding implements FarmCommand {
  const MoveBuilding({required this.buildingId, required this.origin,  String? $type}): $type = $type ?? 'moveBuilding';
  factory MoveBuilding.fromJson(Map<String, dynamic> json) => _$MoveBuildingFromJson(json);

 final  int buildingId;
 final  TilePos origin;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoveBuildingCopyWith<MoveBuilding> get copyWith => _$MoveBuildingCopyWithImpl<MoveBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoveBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveBuilding&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,origin);
}

@override
String toString() {
    return 'FarmCommand.moveBuilding(buildingId: $buildingId, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $MoveBuildingCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $MoveBuildingCopyWith(MoveBuilding value, $Res Function(MoveBuilding) _then) = _$MoveBuildingCopyWithImpl;
@useResult
$Res call({
 int buildingId, TilePos origin
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$MoveBuildingCopyWithImpl<$Res>
    implements $MoveBuildingCopyWith<$Res> {
  _$MoveBuildingCopyWithImpl(this._self, this._then);

  final MoveBuilding _self;
  final $Res Function(MoveBuilding) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? origin = null,}) {
  return _then(MoveBuilding(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class BuildBuilding implements FarmCommand {
  const BuildBuilding({required this.kind, required this.origin,  String? $type}): $type = $type ?? 'build';
  factory BuildBuilding.fromJson(Map<String, dynamic> json) => _$BuildBuildingFromJson(json);

 final  String kind;
 final  TilePos origin;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildBuildingCopyWith<BuildBuilding> get copyWith => _$BuildBuildingCopyWithImpl<BuildBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildBuilding&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.origin, origin) || other.origin == origin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,origin);
}

@override
String toString() {
    return 'FarmCommand.build(kind: $kind, origin: $origin)';
}


}

/// @nodoc
abstract mixin class $BuildBuildingCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $BuildBuildingCopyWith(BuildBuilding value, $Res Function(BuildBuilding) _then) = _$BuildBuildingCopyWithImpl;
@useResult
$Res call({
 String kind, TilePos origin
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$BuildBuildingCopyWithImpl<$Res>
    implements $BuildBuildingCopyWith<$Res> {
  _$BuildBuildingCopyWithImpl(this._self, this._then);

  final BuildBuilding _self;
  final $Res Function(BuildBuilding) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? origin = null,}) {
  return _then(BuildBuilding(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class UpgradeBuilding implements FarmCommand {
  const UpgradeBuilding({required this.buildingId,  String? $type}): $type = $type ?? 'upgrade';
  factory UpgradeBuilding.fromJson(Map<String, dynamic> json) => _$UpgradeBuildingFromJson(json);

 final  int buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpgradeBuildingCopyWith<UpgradeBuilding> get copyWith => _$UpgradeBuildingCopyWithImpl<UpgradeBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpgradeBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is UpgradeBuilding&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'FarmCommand.upgrade(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class $UpgradeBuildingCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $UpgradeBuildingCopyWith(UpgradeBuilding value, $Res Function(UpgradeBuilding) _then) = _$UpgradeBuildingCopyWithImpl;
@useResult
$Res call({
 int buildingId
});




}
/// @nodoc
class _$UpgradeBuildingCopyWithImpl<$Res>
    implements $UpgradeBuildingCopyWith<$Res> {
  _$UpgradeBuildingCopyWithImpl(this._self, this._then);

  final UpgradeBuilding _self;
  final $Res Function(UpgradeBuilding) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(UpgradeBuilding(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DemolishBuilding implements FarmCommand {
  const DemolishBuilding({required this.buildingId,  String? $type}): $type = $type ?? 'demolish';
  factory DemolishBuilding.fromJson(Map<String, dynamic> json) => _$DemolishBuildingFromJson(json);

 final  int buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DemolishBuildingCopyWith<DemolishBuilding> get copyWith => _$DemolishBuildingCopyWithImpl<DemolishBuilding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DemolishBuildingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DemolishBuilding&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId);
}

@override
String toString() {
    return 'FarmCommand.demolish(buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class $DemolishBuildingCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $DemolishBuildingCopyWith(DemolishBuilding value, $Res Function(DemolishBuilding) _then) = _$DemolishBuildingCopyWithImpl;
@useResult
$Res call({
 int buildingId
});




}
/// @nodoc
class _$DemolishBuildingCopyWithImpl<$Res>
    implements $DemolishBuildingCopyWith<$Res> {
  _$DemolishBuildingCopyWithImpl(this._self, this._then);

  final DemolishBuilding _self;
  final $Res Function(DemolishBuilding) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,}) {
  return _then(DemolishBuilding(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TrainSeed implements FarmCommand {
  const TrainSeed({required this.buildingId, required this.seed,  String? $type}): $type = $type ?? 'train';
  factory TrainSeed.fromJson(Map<String, dynamic> json) => _$TrainSeedFromJson(json);

 final  int buildingId;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainSeedCopyWith<TrainSeed> get copyWith => _$TrainSeedCopyWithImpl<TrainSeed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainSeedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainSeed&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,buildingId,seed);
}

@override
String toString() {
    return 'FarmCommand.train(buildingId: $buildingId, seed: $seed)';
}


}

/// @nodoc
abstract mixin class $TrainSeedCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $TrainSeedCopyWith(TrainSeed value, $Res Function(TrainSeed) _then) = _$TrainSeedCopyWithImpl;
@useResult
$Res call({
 int buildingId, Seed seed
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$TrainSeedCopyWithImpl<$Res>
    implements $TrainSeedCopyWith<$Res> {
  _$TrainSeedCopyWithImpl(this._self, this._then);

  final TrainSeed _self;
  final $Res Function(TrainSeed) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buildingId = null,Object? seed = null,}) {
  return _then(TrainSeed(
buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,
  ));
}

/// Create a copy of FarmCommand
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

class ClearPest implements FarmCommand {
  const ClearPest({required this.fieldId,  String? $type}): $type = $type ?? 'clearPest';
  factory ClearPest.fromJson(Map<String, dynamic> json) => _$ClearPestFromJson(json);

 final  int fieldId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClearPestCopyWith<ClearPest> get copyWith => _$ClearPestCopyWithImpl<ClearPest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClearPestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearPest&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fieldId);
}

@override
String toString() {
    return 'FarmCommand.clearPest(fieldId: $fieldId)';
}


}

/// @nodoc
abstract mixin class $ClearPestCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ClearPestCopyWith(ClearPest value, $Res Function(ClearPest) _then) = _$ClearPestCopyWithImpl;
@useResult
$Res call({
 int fieldId
});




}
/// @nodoc
class _$ClearPestCopyWithImpl<$Res>
    implements $ClearPestCopyWith<$Res> {
  _$ClearPestCopyWithImpl(this._self, this._then);

  final ClearPest _self;
  final $Res Function(ClearPest) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fieldId = null,}) {
  return _then(ClearPest(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Uproot implements FarmCommand {
  const Uproot({required this.potatoId,  String? $type}): $type = $type ?? 'uproot';
  factory Uproot.fromJson(Map<String, dynamic> json) => _$UprootFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UprootCopyWith<Uproot> get copyWith => _$UprootCopyWithImpl<Uproot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UprootToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Uproot&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmCommand.uproot(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $UprootCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $UprootCopyWith(Uproot value, $Res Function(Uproot) _then) = _$UprootCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$UprootCopyWithImpl<$Res>
    implements $UprootCopyWith<$Res> {
  _$UprootCopyWithImpl(this._self, this._then);

  final Uproot _self;
  final $Res Function(Uproot) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(Uproot(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Replant implements FarmCommand {
  const Replant({required this.potatoId, required this.fieldId, required this.tile,  String? $type}): $type = $type ?? 'replant';
  factory Replant.fromJson(Map<String, dynamic> json) => _$ReplantFromJson(json);

 final  int potatoId;
 final  int fieldId;
 final  TilePos tile;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplantCopyWith<Replant> get copyWith => _$ReplantCopyWithImpl<Replant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReplantToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Replant&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.tile, tile) || other.tile == tile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId,fieldId,tile);
}

@override
String toString() {
    return 'FarmCommand.replant(potatoId: $potatoId, fieldId: $fieldId, tile: $tile)';
}


}

/// @nodoc
abstract mixin class $ReplantCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ReplantCopyWith(Replant value, $Res Function(Replant) _then) = _$ReplantCopyWithImpl;
@useResult
$Res call({
 int potatoId, int fieldId, TilePos tile
});


$TilePosCopyWith<$Res> get tile;

}
/// @nodoc
class _$ReplantCopyWithImpl<$Res>
    implements $ReplantCopyWith<$Res> {
  _$ReplantCopyWithImpl(this._self, this._then);

  final Replant _self;
  final $Res Function(Replant) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,Object? fieldId = null,Object? tile = null,}) {
  return _then(Replant(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,
  ));
}

/// Create a copy of FarmCommand
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

class Retrain implements FarmCommand {
  const Retrain({required this.potatoId, required this.buildingId,  String? $type}): $type = $type ?? 'retrain';
  factory Retrain.fromJson(Map<String, dynamic> json) => _$RetrainFromJson(json);

 final  int potatoId;
 final  int buildingId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RetrainCopyWith<Retrain> get copyWith => _$RetrainCopyWithImpl<Retrain>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RetrainToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Retrain&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId,buildingId);
}

@override
String toString() {
    return 'FarmCommand.retrain(potatoId: $potatoId, buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class $RetrainCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $RetrainCopyWith(Retrain value, $Res Function(Retrain) _then) = _$RetrainCopyWithImpl;
@useResult
$Res call({
 int potatoId, int buildingId
});




}
/// @nodoc
class _$RetrainCopyWithImpl<$Res>
    implements $RetrainCopyWith<$Res> {
  _$RetrainCopyWithImpl(this._self, this._then);

  final Retrain _self;
  final $Res Function(Retrain) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,Object? buildingId = null,}) {
  return _then(Retrain(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Revive implements FarmCommand {
  const Revive({required this.potatoId,  String? $type}): $type = $type ?? 'revive';
  factory Revive.fromJson(Map<String, dynamic> json) => _$ReviveFromJson(json);

 final  int potatoId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviveCopyWith<Revive> get copyWith => _$ReviveCopyWithImpl<Revive>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviveToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Revive&&(identical(other.potatoId, potatoId) || other.potatoId == potatoId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potatoId);
}

@override
String toString() {
    return 'FarmCommand.revive(potatoId: $potatoId)';
}


}

/// @nodoc
abstract mixin class $ReviveCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ReviveCopyWith(Revive value, $Res Function(Revive) _then) = _$ReviveCopyWithImpl;
@useResult
$Res call({
 int potatoId
});




}
/// @nodoc
class _$ReviveCopyWithImpl<$Res>
    implements $ReviveCopyWith<$Res> {
  _$ReviveCopyWithImpl(this._self, this._then);

  final Revive _self;
  final $Res Function(Revive) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? potatoId = null,}) {
  return _then(Revive(
potatoId: null == potatoId ? _self.potatoId : potatoId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Depart implements FarmCommand {
  const Depart({required this.food,  List<int> potatoIds = const <int>[],  String? $type}): _potatoIds = potatoIds,$type = $type ?? 'depart';
  factory Depart.fromJson(Map<String, dynamic> json) => _$DepartFromJson(json);

 final  int food;
 final  List<int> _potatoIds;
@JsonKey() List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartCopyWith<Depart> get copyWith => _$DepartCopyWithImpl<Depart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Depart&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmCommand.depart(food: $food, potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $DepartCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $DepartCopyWith(Depart value, $Res Function(Depart) _then) = _$DepartCopyWithImpl;
@useResult
$Res call({
 int food, List<int> potatoIds
});




}
/// @nodoc
class _$DepartCopyWithImpl<$Res>
    implements $DepartCopyWith<$Res> {
  _$DepartCopyWithImpl(this._self, this._then);

  final Depart _self;
  final $Res Function(Depart) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? potatoIds = null,}) {
  return _then(Depart(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ReturnHome implements FarmCommand {
  const ReturnHome({required this.food,  List<SeedCount> seeds = const <SeedCount>[],  Map<String, int> materials = const <String, int>{},  List<int> potatoIds = const <int>[],  String? $type}): _seeds = seeds,_materials = materials,_potatoIds = potatoIds,$type = $type ?? 'returnHome';
  factory ReturnHome.fromJson(Map<String, dynamic> json) => _$ReturnHomeFromJson(json);

 final  int food;
 final  List<SeedCount> _seeds;
@JsonKey() List<SeedCount> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}

/// Materials brought back, by item id.
 final  Map<String, int> _materials;
/// Materials brought back, by item id.
@JsonKey() Map<String, int> get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}

 final  List<int> _potatoIds;
@JsonKey() List<int> get potatoIds {
  if (_potatoIds is EqualUnmodifiableListView) return _potatoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoIds);
}


@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnHomeCopyWith<ReturnHome> get copyWith => _$ReturnHomeCopyWithImpl<ReturnHome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnHomeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnHome&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&const DeepCollectionEquality().equals(other.materials, _materials)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_seeds),const DeepCollectionEquality().hash(_materials),const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmCommand.returnHome(food: $food, seeds: $seeds, materials: $materials, potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $ReturnHomeCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ReturnHomeCopyWith(ReturnHome value, $Res Function(ReturnHome) _then) = _$ReturnHomeCopyWithImpl;
@useResult
$Res call({
 int food, List<SeedCount> seeds, Map<String, int> materials, List<int> potatoIds
});




}
/// @nodoc
class _$ReturnHomeCopyWithImpl<$Res>
    implements $ReturnHomeCopyWith<$Res> {
  _$ReturnHomeCopyWithImpl(this._self, this._then);

  final ReturnHome _self;
  final $Res Function(ReturnHome) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? seeds = null,Object? materials = null,Object? potatoIds = null,}) {
  return _then(ReturnHome(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedCount>,materials: null == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as Map<String, int>,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
