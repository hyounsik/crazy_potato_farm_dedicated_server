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

 int get fieldId;
/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FarmCommandCopyWith<FarmCommand> get copyWith => _$FarmCommandCopyWithImpl<FarmCommand>(this as FarmCommand, _$identity);

  /// Serializes this FarmCommand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FarmCommand;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmCommand&&(identical(other.fieldId, _this.fieldId) || other.fieldId == _this.fieldId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmCommand;
  return Object.hash(runtimeType,_this.fieldId);
}

@override
String toString() {
  final _this = this as FarmCommand;
  return 'FarmCommand(fieldId: ${_this.fieldId})';
}


}

/// @nodoc
abstract mixin class $FarmCommandCopyWith<$Res>  {
  factory $FarmCommandCopyWith(FarmCommand value, $Res Function(FarmCommand) _then) = _$FarmCommandCopyWithImpl;
@useResult
$Res call({
 int fieldId
});




}
/// @nodoc
class _$FarmCommandCopyWithImpl<$Res>
    implements $FarmCommandCopyWith<$Res> {
  _$FarmCommandCopyWithImpl(this._self, this._then);

  final FarmCommand _self;
  final $Res Function(FarmCommand) _then;

/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldId = null,}) {
  return _then(_self.copyWith(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlantSeed value)?  plant,TResult Function( HarvestPotato value)?  harvest,TResult Function( HarvestField value)?  harvestField,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlantSeed value)  plant,required TResult Function( HarvestPotato value)  harvest,required TResult Function( HarvestField value)  harvestField,}){
final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that);case HarvestPotato():
return harvest(_that);case HarvestField():
return harvestField(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlantSeed value)?  plant,TResult? Function( HarvestPotato value)?  harvest,TResult? Function( HarvestField value)?  harvestField,}){
final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that);case HarvestPotato() when harvest != null:
return harvest(_that);case HarvestField() when harvestField != null:
return harvestField(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult Function( int fieldId,  TilePos tile)?  harvest,TResult Function( int fieldId)?  harvestField,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int fieldId,  TilePos tile,  Seed seed)  plant,required TResult Function( int fieldId,  TilePos tile)  harvest,required TResult Function( int fieldId)  harvestField,}) {final _that = this;
switch (_that) {
case PlantSeed():
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato():
return harvest(_that.fieldId,_that.tile);case HarvestField():
return harvestField(_that.fieldId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int fieldId,  TilePos tile,  Seed seed)?  plant,TResult? Function( int fieldId,  TilePos tile)?  harvest,TResult? Function( int fieldId)?  harvestField,}) {final _that = this;
switch (_that) {
case PlantSeed() when plant != null:
return plant(_that.fieldId,_that.tile,_that.seed);case HarvestPotato() when harvest != null:
return harvest(_that.fieldId,_that.tile);case HarvestField() when harvestField != null:
return harvestField(_that.fieldId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class PlantSeed implements FarmCommand {
  const PlantSeed({required this.fieldId, required this.tile, required this.seed,  String? $type}): $type = $type ?? 'plant';
  factory PlantSeed.fromJson(Map<String, dynamic> json) => _$PlantSeedFromJson(json);

@override final  int fieldId;
 final  TilePos tile;
 final  Seed seed;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,Object? seed = null,}) {
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

@override final  int fieldId;
 final  TilePos tile;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,Object? tile = null,}) {
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

@override final  int fieldId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FarmCommand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
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
@override @useResult
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
@override @pragma('vm:prefer-inline') $Res call({Object? fieldId = null,}) {
  return _then(HarvestField(
fieldId: null == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
