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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlantSeed value)?  plant,TResult Function( HarvestPotato value)?  harvest,TResult Function( HarvestField value)?  harvestField,TResult Function( Depart value)?  depart,TResult Function( ReturnHome value)?  returnHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case Depart() when depart != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlantSeed value)  plant,required TResult Function( HarvestPotato value)  harvest,required TResult Function( HarvestField value)  harvestField,required TResult Function( Depart value)  depart,required TResult Function( ReturnHome value)  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that);case HarvestPotato():
return harvest(_that);case HarvestField():
return harvestField(_that);case Depart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlantSeed value)?  plant,TResult? Function( HarvestPotato value)?  harvest,TResult? Function( HarvestField value)?  harvestField,TResult? Function( Depart value)?  depart,TResult? Function( ReturnHome value)?  returnHome,}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case Depart() when depart != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult Function( int fieldId,  TilePos tile)?  harvest,TResult Function( int fieldId)?  harvestField,TResult Function( int food,  List<int> potatoIds)?  depart,TResult Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)?  returnHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case Depart() when depart != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  Seed seed)  plant,required TResult Function( int fieldId,  TilePos tile)  harvest,required TResult Function( int fieldId)  harvestField,required TResult Function( int food,  List<int> potatoIds)  depart,required TResult Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato():
return harvest(_that.fieldId,_that.tile);case HarvestField():
return harvestField(_that.fieldId);case Depart():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult? Function( int fieldId,  TilePos tile)?  harvest,TResult? Function( int fieldId)?  harvestField,TResult? Function( int food,  List<int> potatoIds)?  depart,TResult? Function( int food,  List<SeedStackData> seeds,  List<int> potatoIds)?  returnHome,}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case Depart() when depart != null:
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
