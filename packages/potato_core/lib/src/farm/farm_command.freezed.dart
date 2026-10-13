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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlantSeed value)?  plant,TResult Function( HarvestPotato value)?  harvest,TResult Function( HarvestField value)?  harvestField,TResult Function( BuildBuilding value)?  build,TResult Function( UpgradeBuilding value)?  upgrade,TResult Function( DemolishBuilding value)?  demolish,TResult Function( TrainSeed value)?  train,TResult Function( ClearPest value)?  clearPest,TResult Function( Uproot value)?  uproot,TResult Function( Replant value)?  replant,TResult Function( Retrain value)?  retrain,TResult Function( Depart value)?  depart,TResult Function( ReturnHome value)?  returnHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case BuildBuilding() when build != null:
return build(_that);case UpgradeBuilding() when upgrade != null:
return upgrade(_that);case DemolishBuilding() when demolish != null:
return demolish(_that);case TrainSeed() when train != null:
return train(_that);case ClearPest() when clearPest != null:
return clearPest(_that);case Uproot() when uproot != null:
return uproot(_that);case Replant() when replant != null:
return replant(_that);case Retrain() when retrain != null:
return retrain(_that);case Depart() when depart != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlantSeed value)  plant,required TResult Function( HarvestPotato value)  harvest,required TResult Function( HarvestField value)  harvestField,required TResult Function( BuildBuilding value)  build,required TResult Function( UpgradeBuilding value)  upgrade,required TResult Function( DemolishBuilding value)  demolish,required TResult Function( TrainSeed value)  train,required TResult Function( ClearPest value)  clearPest,required TResult Function( Uproot value)  uproot,required TResult Function( Replant value)  replant,required TResult Function( Retrain value)  retrain,required TResult Function( Depart value)  depart,required TResult Function( ReturnHome value)  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that);case HarvestPotato():
return harvest(_that);case HarvestField():
return harvestField(_that);case BuildBuilding():
return build(_that);case UpgradeBuilding():
return upgrade(_that);case DemolishBuilding():
return demolish(_that);case TrainSeed():
return train(_that);case ClearPest():
return clearPest(_that);case Uproot():
return uproot(_that);case Replant():
return replant(_that);case Retrain():
return retrain(_that);case Depart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlantSeed value)?  plant,TResult? Function( HarvestPotato value)?  harvest,TResult? Function( HarvestField value)?  harvestField,TResult? Function( BuildBuilding value)?  build,TResult? Function( UpgradeBuilding value)?  upgrade,TResult? Function( DemolishBuilding value)?  demolish,TResult? Function( TrainSeed value)?  train,TResult? Function( ClearPest value)?  clearPest,TResult? Function( Uproot value)?  uproot,TResult? Function( Replant value)?  replant,TResult? Function( Retrain value)?  retrain,TResult? Function( Depart value)?  depart,TResult? Function( ReturnHome value)?  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case BuildBuilding() when build != null:
return build(_that);case UpgradeBuilding() when upgrade != null:
return upgrade(_that);case DemolishBuilding() when demolish != null:
return demolish(_that);case TrainSeed() when train != null:
return train(_that);case ClearPest() when clearPest != null:
return clearPest(_that);case Uproot() when uproot != null:
return uproot(_that);case Replant() when replant != null:
return replant(_that);case Retrain() when retrain != null:
return retrain(_that);case Depart() when depart != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult Function( int fieldId,  TilePos tile)?  harvest,TResult Function( int fieldId)?  harvestField,TResult Function( String kind,  TilePos origin)?  build,TResult Function( int buildingId)?  upgrade,TResult Function( int buildingId)?  demolish,TResult Function( int buildingId,  Seed seed)?  train,TResult Function( int fieldId)?  clearPest,TResult Function( int potatoId)?  uproot,TResult Function( int potatoId,  int fieldId,  TilePos tile)?  replant,TResult Function( int potatoId,  int buildingId)?  retrain,TResult Function( int food,  List<int> potatoIds)?  depart,TResult Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)?  returnHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case BuildBuilding() when build != null:
return build(_that.kind,_that.origin);case UpgradeBuilding() when upgrade != null:
return upgrade(_that.buildingId);case DemolishBuilding() when demolish != null:
return demolish(_that.buildingId);case TrainSeed() when train != null:
return train(_that.buildingId,_that.seed);case ClearPest() when clearPest != null:
return clearPest(_that.fieldId);case Uproot() when uproot != null:
return uproot(_that.potatoId);case Replant() when replant != null:
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain() when retrain != null:
return retrain(_that.potatoId,_that.buildingId);case Depart() when depart != null:
return depart(_that.food,_that.potatoIds);case ReturnHome() when returnHome != null:
return returnHome(_that.food,_that.seeds,_that.potatoIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  Seed seed)  plant,required TResult Function( int fieldId,  TilePos tile)  harvest,required TResult Function( int fieldId)  harvestField,required TResult Function( String kind,  TilePos origin)  build,required TResult Function( int buildingId)  upgrade,required TResult Function( int buildingId)  demolish,required TResult Function( int buildingId,  Seed seed)  train,required TResult Function( int fieldId)  clearPest,required TResult Function( int potatoId)  uproot,required TResult Function( int potatoId,  int fieldId,  TilePos tile)  replant,required TResult Function( int potatoId,  int buildingId)  retrain,required TResult Function( int food,  List<int> potatoIds)  depart,required TResult Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato():
return harvest(_that.fieldId,_that.tile);case HarvestField():
return harvestField(_that.fieldId);case BuildBuilding():
return build(_that.kind,_that.origin);case UpgradeBuilding():
return upgrade(_that.buildingId);case DemolishBuilding():
return demolish(_that.buildingId);case TrainSeed():
return train(_that.buildingId,_that.seed);case ClearPest():
return clearPest(_that.fieldId);case Uproot():
return uproot(_that.potatoId);case Replant():
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain():
return retrain(_that.potatoId,_that.buildingId);case Depart():
return depart(_that.food,_that.potatoIds);case ReturnHome():
return returnHome(_that.food,_that.seeds,_that.potatoIds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult? Function( int fieldId,  TilePos tile)?  harvest,TResult? Function( int fieldId)?  harvestField,TResult? Function( String kind,  TilePos origin)?  build,TResult? Function( int buildingId)?  upgrade,TResult? Function( int buildingId)?  demolish,TResult? Function( int buildingId,  Seed seed)?  train,TResult? Function( int fieldId)?  clearPest,TResult? Function( int potatoId)?  uproot,TResult? Function( int potatoId,  int fieldId,  TilePos tile)?  replant,TResult? Function( int potatoId,  int buildingId)?  retrain,TResult? Function( int food,  List<int> potatoIds)?  depart,TResult? Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)?  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case BuildBuilding() when build != null:
return build(_that.kind,_that.origin);case UpgradeBuilding() when upgrade != null:
return upgrade(_that.buildingId);case DemolishBuilding() when demolish != null:
return demolish(_that.buildingId);case TrainSeed() when train != null:
return train(_that.buildingId,_that.seed);case ClearPest() when clearPest != null:
return clearPest(_that.fieldId);case Uproot() when uproot != null:
return uproot(_that.potatoId);case Replant() when replant != null:
return replant(_that.potatoId,_that.fieldId,_that.tile);case Retrain() when retrain != null:
return retrain(_that.potatoId,_that.buildingId);case Depart() when depart != null:
return depart(_that.food,_that.potatoIds);case ReturnHome() when returnHome != null:
return returnHome(_that.food,_that.seeds,_that.potatoIds);case _:
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
  const ReturnHome({required this.food,  List<SeedStackData> seeds = const <SeedStackData>[],  List<int> potatoIds = const <int>[],  String? $type}): _seeds = seeds,_potatoIds = potatoIds,$type = $type ?? 'returnHome';
  factory ReturnHome.fromJson(Map<String, dynamic> json) => _$ReturnHomeFromJson(json);

 final  int food;
 final  List<SeedStackData> _seeds;
@JsonKey() List<SeedStackData> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnHome&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&const DeepCollectionEquality().equals(other.potatoIds, _potatoIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_seeds),const DeepCollectionEquality().hash(_potatoIds));
}

@override
String toString() {
    return 'FarmCommand.returnHome(food: $food, seeds: $seeds, potatoIds: $potatoIds)';
}


}

/// @nodoc
abstract mixin class $ReturnHomeCopyWith<$Res> implements $FarmCommandCopyWith<$Res> {
  factory $ReturnHomeCopyWith(ReturnHome value, $Res Function(ReturnHome) _then) = _$ReturnHomeCopyWithImpl;
@useResult
$Res call({
 int food, List<SeedStackData> seeds, List<int> potatoIds
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
@pragma('vm:prefer-inline') $Res call({Object? food = null,Object? seeds = null,Object? potatoIds = null,}) {
  return _then(ReturnHome(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,potatoIds: null == potatoIds ? _self._potatoIds : potatoIds // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
