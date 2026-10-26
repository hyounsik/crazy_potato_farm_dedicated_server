// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'farm_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FarmDocument {

/// Bumped whenever the format changes; see [farmFormatVersion].
 int get formatVersion; int get tick; int get nextId; List<int> get randomState; int get food; List<SeedCount> get seeds; List<FieldDocument> get fields; List<BuildingDocument> get buildings; List<GuardDocument> get guards;/// Seeds left over by an upgrade with nowhere to wait (format 7: those
/// compost yards held); the farm takes them in when it loads.
 List<Seed> get returnedSeeds;/// Potatoes in the fridge; their `tile` is null.
 List<PotatoDocument> get fridge; List<AwayDocument> get away;/// Dead potatoes in the graveyards, oldest first; `tile` is null.
 List<PotatoDocument> get graves;/// Open blocks, in block units. Null in documents from before blocks
/// opened: those farms still have only the starting land.
 List<TilePos>? get openBlocks;/// Pouch and box sizes; null in documents from before they were kept,
/// which start at the catalog's sizes.
 int? get pouchSlots; int? get gearSlots; List<OverflowDocument> get overflow; Map<String, int> get materials; List<MailDocument> get mail;/// The workbench level of the one weapon, in documents from before
/// gear (then [equipped] is null and the farm gets the starting gear,
/// this level on its weapon).
 int get weaponLevel; List<Gear> get gear; Equipped? get equipped; int get progress; int? get totemLimit; Map<String, dynamic> get totals;/// Story events done, by id, with the step each was done on.
 Map<String, int> get storyDone;/// Every feature open, no story events (see
/// [FarmSimulation.storySkipped]).
 bool get storySkipped;/// Starting building kinds a farm saved before they existed should get
/// when it is read (set by migrations, never written).
 List<String> get missingBuildings;
/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FarmDocumentCopyWith<FarmDocument> get copyWith => _$FarmDocumentCopyWithImpl<FarmDocument>(this as FarmDocument, _$identity);

  /// Serializes this FarmDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FarmDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmDocument&&(identical(other.formatVersion, _this.formatVersion) || other.formatVersion == _this.formatVersion)&&(identical(other.tick, _this.tick) || other.tick == _this.tick)&&(identical(other.nextId, _this.nextId) || other.nextId == _this.nextId)&&const DeepCollectionEquality().equals(other.randomState, _this.randomState)&&(identical(other.food, _this.food) || other.food == _this.food)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds)&&const DeepCollectionEquality().equals(other.fields, _this.fields)&&const DeepCollectionEquality().equals(other.buildings, _this.buildings)&&const DeepCollectionEquality().equals(other.guards, _this.guards)&&const DeepCollectionEquality().equals(other.returnedSeeds, _this.returnedSeeds)&&const DeepCollectionEquality().equals(other.fridge, _this.fridge)&&const DeepCollectionEquality().equals(other.away, _this.away)&&const DeepCollectionEquality().equals(other.graves, _this.graves)&&const DeepCollectionEquality().equals(other.openBlocks, _this.openBlocks)&&(identical(other.pouchSlots, _this.pouchSlots) || other.pouchSlots == _this.pouchSlots)&&(identical(other.gearSlots, _this.gearSlots) || other.gearSlots == _this.gearSlots)&&const DeepCollectionEquality().equals(other.overflow, _this.overflow)&&const DeepCollectionEquality().equals(other.materials, _this.materials)&&const DeepCollectionEquality().equals(other.mail, _this.mail)&&(identical(other.weaponLevel, _this.weaponLevel) || other.weaponLevel == _this.weaponLevel)&&const DeepCollectionEquality().equals(other.gear, _this.gear)&&(identical(other.equipped, _this.equipped) || other.equipped == _this.equipped)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&(identical(other.totemLimit, _this.totemLimit) || other.totemLimit == _this.totemLimit)&&const DeepCollectionEquality().equals(other.totals, _this.totals)&&const DeepCollectionEquality().equals(other.storyDone, _this.storyDone)&&(identical(other.storySkipped, _this.storySkipped) || other.storySkipped == _this.storySkipped)&&const DeepCollectionEquality().equals(other.missingBuildings, _this.missingBuildings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmDocument;
  return Object.hashAll([runtimeType,_this.formatVersion,_this.tick,_this.nextId,const DeepCollectionEquality().hash(_this.randomState),_this.food,const DeepCollectionEquality().hash(_this.seeds),const DeepCollectionEquality().hash(_this.fields),const DeepCollectionEquality().hash(_this.buildings),const DeepCollectionEquality().hash(_this.guards),const DeepCollectionEquality().hash(_this.returnedSeeds),const DeepCollectionEquality().hash(_this.fridge),const DeepCollectionEquality().hash(_this.away),const DeepCollectionEquality().hash(_this.graves),const DeepCollectionEquality().hash(_this.openBlocks),_this.pouchSlots,_this.gearSlots,const DeepCollectionEquality().hash(_this.overflow),const DeepCollectionEquality().hash(_this.materials),const DeepCollectionEquality().hash(_this.mail),_this.weaponLevel,const DeepCollectionEquality().hash(_this.gear),_this.equipped,_this.progress,_this.totemLimit,const DeepCollectionEquality().hash(_this.totals),const DeepCollectionEquality().hash(_this.storyDone),_this.storySkipped,const DeepCollectionEquality().hash(_this.missingBuildings)]);
}

@override
String toString() {
  final _this = this as FarmDocument;
  return 'FarmDocument(formatVersion: ${_this.formatVersion}, tick: ${_this.tick}, nextId: ${_this.nextId}, randomState: ${_this.randomState}, food: ${_this.food}, seeds: ${_this.seeds}, fields: ${_this.fields}, buildings: ${_this.buildings}, guards: ${_this.guards}, returnedSeeds: ${_this.returnedSeeds}, fridge: ${_this.fridge}, away: ${_this.away}, graves: ${_this.graves}, openBlocks: ${_this.openBlocks}, pouchSlots: ${_this.pouchSlots}, gearSlots: ${_this.gearSlots}, overflow: ${_this.overflow}, materials: ${_this.materials}, mail: ${_this.mail}, weaponLevel: ${_this.weaponLevel}, gear: ${_this.gear}, equipped: ${_this.equipped}, progress: ${_this.progress}, totemLimit: ${_this.totemLimit}, totals: ${_this.totals}, storyDone: ${_this.storyDone}, storySkipped: ${_this.storySkipped}, missingBuildings: ${_this.missingBuildings})';
}


}

/// @nodoc
abstract mixin class $FarmDocumentCopyWith<$Res>  {
  factory $FarmDocumentCopyWith(FarmDocument value, $Res Function(FarmDocument) _then) = _$FarmDocumentCopyWithImpl;
@useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedCount> seeds, List<FieldDocument> fields, List<BuildingDocument> buildings, List<GuardDocument> guards, List<Seed> returnedSeeds, List<PotatoDocument> fridge, List<AwayDocument> away, List<PotatoDocument> graves, List<TilePos>? openBlocks, int? pouchSlots, int? gearSlots, List<OverflowDocument> overflow, Map<String, int> materials, List<MailDocument> mail, int weaponLevel, List<Gear> gear, Equipped? equipped, int progress, int? totemLimit, Map<String, dynamic> totals, Map<String, int> storyDone, bool storySkipped, List<String> missingBuildings
});


$EquippedCopyWith<$Res>? get equipped;

}
/// @nodoc
class _$FarmDocumentCopyWithImpl<$Res>
    implements $FarmDocumentCopyWith<$Res> {
  _$FarmDocumentCopyWithImpl(this._self, this._then);

  final FarmDocument _self;
  final $Res Function(FarmDocument) _then;

/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,Object? buildings = null,Object? guards = null,Object? returnedSeeds = null,Object? fridge = null,Object? away = null,Object? graves = null,Object? openBlocks = freezed,Object? pouchSlots = freezed,Object? gearSlots = freezed,Object? overflow = null,Object? materials = null,Object? mail = null,Object? weaponLevel = null,Object? gear = null,Object? equipped = freezed,Object? progress = null,Object? totemLimit = freezed,Object? totals = null,Object? storyDone = null,Object? storySkipped = null,Object? missingBuildings = null,}) {
  return _then(FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self.randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedCount>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,buildings: null == buildings ? _self.buildings : buildings // ignore: cast_nullable_to_non_nullable
as List<BuildingDocument>,guards: null == guards ? _self.guards : guards // ignore: cast_nullable_to_non_nullable
as List<GuardDocument>,returnedSeeds: null == returnedSeeds ? _self.returnedSeeds : returnedSeeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,fridge: null == fridge ? _self.fridge : fridge // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as List<AwayDocument>,graves: null == graves ? _self.graves : graves // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,openBlocks: freezed == openBlocks ? _self.openBlocks : openBlocks // ignore: cast_nullable_to_non_nullable
as List<TilePos>?,pouchSlots: freezed == pouchSlots ? _self.pouchSlots : pouchSlots // ignore: cast_nullable_to_non_nullable
as int?,gearSlots: freezed == gearSlots ? _self.gearSlots : gearSlots // ignore: cast_nullable_to_non_nullable
as int?,overflow: null == overflow ? _self.overflow : overflow // ignore: cast_nullable_to_non_nullable
as List<OverflowDocument>,materials: null == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as Map<String, int>,mail: null == mail ? _self.mail : mail // ignore: cast_nullable_to_non_nullable
as List<MailDocument>,weaponLevel: null == weaponLevel ? _self.weaponLevel : weaponLevel // ignore: cast_nullable_to_non_nullable
as int,gear: null == gear ? _self.gear : gear // ignore: cast_nullable_to_non_nullable
as List<Gear>,equipped: freezed == equipped ? _self.equipped : equipped // ignore: cast_nullable_to_non_nullable
as Equipped?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,totemLimit: freezed == totemLimit ? _self.totemLimit : totemLimit // ignore: cast_nullable_to_non_nullable
as int?,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,storyDone: null == storyDone ? _self.storyDone : storyDone // ignore: cast_nullable_to_non_nullable
as Map<String, int>,storySkipped: null == storySkipped ? _self.storySkipped : storySkipped // ignore: cast_nullable_to_non_nullable
as bool,missingBuildings: null == missingBuildings ? _self.missingBuildings : missingBuildings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EquippedCopyWith<$Res>? get equipped {
    if (_self.equipped == null) {
    return null;
  }

  return $EquippedCopyWith<$Res>(_self.equipped!, (value) {
    return _then(_self.copyWith(equipped: value));
  });
}
}


/// Adds pattern-matching-related methods to [FarmDocument].
extension FarmDocumentPatterns on FarmDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FarmDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FarmDocument value)  $default,){
final _that = this;
switch (_that) {
case _FarmDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FarmDocument value)?  $default,){
final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedCount> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<Seed> returnedSeeds,  List<PotatoDocument> fridge,  List<AwayDocument> away,  List<PotatoDocument> graves,  List<TilePos>? openBlocks,  int? pouchSlots,  int? gearSlots,  List<OverflowDocument> overflow,  Map<String, int> materials,  List<MailDocument> mail,  int weaponLevel,  List<Gear> gear,  Equipped? equipped,  int progress,  int? totemLimit,  Map<String, dynamic> totals,  Map<String, int> storyDone,  bool storySkipped,  List<String> missingBuildings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.returnedSeeds,_that.fridge,_that.away,_that.graves,_that.openBlocks,_that.pouchSlots,_that.gearSlots,_that.overflow,_that.materials,_that.mail,_that.weaponLevel,_that.gear,_that.equipped,_that.progress,_that.totemLimit,_that.totals,_that.storyDone,_that.storySkipped,_that.missingBuildings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedCount> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<Seed> returnedSeeds,  List<PotatoDocument> fridge,  List<AwayDocument> away,  List<PotatoDocument> graves,  List<TilePos>? openBlocks,  int? pouchSlots,  int? gearSlots,  List<OverflowDocument> overflow,  Map<String, int> materials,  List<MailDocument> mail,  int weaponLevel,  List<Gear> gear,  Equipped? equipped,  int progress,  int? totemLimit,  Map<String, dynamic> totals,  Map<String, int> storyDone,  bool storySkipped,  List<String> missingBuildings)  $default,) {final _that = this;
switch (_that) {
case _FarmDocument():
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.returnedSeeds,_that.fridge,_that.away,_that.graves,_that.openBlocks,_that.pouchSlots,_that.gearSlots,_that.overflow,_that.materials,_that.mail,_that.weaponLevel,_that.gear,_that.equipped,_that.progress,_that.totemLimit,_that.totals,_that.storyDone,_that.storySkipped,_that.missingBuildings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedCount> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<Seed> returnedSeeds,  List<PotatoDocument> fridge,  List<AwayDocument> away,  List<PotatoDocument> graves,  List<TilePos>? openBlocks,  int? pouchSlots,  int? gearSlots,  List<OverflowDocument> overflow,  Map<String, int> materials,  List<MailDocument> mail,  int weaponLevel,  List<Gear> gear,  Equipped? equipped,  int progress,  int? totemLimit,  Map<String, dynamic> totals,  Map<String, int> storyDone,  bool storySkipped,  List<String> missingBuildings)?  $default,) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.returnedSeeds,_that.fridge,_that.away,_that.graves,_that.openBlocks,_that.pouchSlots,_that.gearSlots,_that.overflow,_that.materials,_that.mail,_that.weaponLevel,_that.gear,_that.equipped,_that.progress,_that.totemLimit,_that.totals,_that.storyDone,_that.storySkipped,_that.missingBuildings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FarmDocument extends FarmDocument {
  const _FarmDocument({required this.formatVersion, required this.tick, required this.nextId, required  List<int> randomState, required this.food, required  List<SeedCount> seeds, required  List<FieldDocument> fields,  List<BuildingDocument> buildings = const <BuildingDocument>[],  List<GuardDocument> guards = const <GuardDocument>[],  List<Seed> returnedSeeds = const <Seed>[],  List<PotatoDocument> fridge = const <PotatoDocument>[],  List<AwayDocument> away = const <AwayDocument>[],  List<PotatoDocument> graves = const <PotatoDocument>[],  List<TilePos>? openBlocks, this.pouchSlots, this.gearSlots,  List<OverflowDocument> overflow = const <OverflowDocument>[],  Map<String, int> materials = const <String, int>{},  List<MailDocument> mail = const <MailDocument>[], this.weaponLevel = 0,  List<Gear> gear = const <Gear>[], this.equipped, this.progress = 0, this.totemLimit,  Map<String, dynamic> totals = const <String, dynamic>{},  Map<String, int> storyDone = const <String, int>{}, this.storySkipped = false,  List<String> missingBuildings = const <String>[]}): _randomState = randomState,_seeds = seeds,_fields = fields,_buildings = buildings,_guards = guards,_returnedSeeds = returnedSeeds,_fridge = fridge,_away = away,_graves = graves,_openBlocks = openBlocks,_overflow = overflow,_materials = materials,_mail = mail,_gear = gear,_totals = totals,_storyDone = storyDone,_missingBuildings = missingBuildings,super._();
  factory _FarmDocument.fromJson(Map<String, dynamic> json) => _$FarmDocumentFromJson(json);

/// Bumped whenever the format changes; see [farmFormatVersion].
@override final  int formatVersion;
@override final  int tick;
@override final  int nextId;
 final  List<int> _randomState;
@override List<int> get randomState {
  if (_randomState is EqualUnmodifiableListView) return _randomState;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_randomState);
}

@override final  int food;
 final  List<SeedCount> _seeds;
@override List<SeedCount> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}

 final  List<FieldDocument> _fields;
@override List<FieldDocument> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

 final  List<BuildingDocument> _buildings;
@override@JsonKey() List<BuildingDocument> get buildings {
  if (_buildings is EqualUnmodifiableListView) return _buildings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buildings);
}

 final  List<GuardDocument> _guards;
@override@JsonKey() List<GuardDocument> get guards {
  if (_guards is EqualUnmodifiableListView) return _guards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guards);
}

/// Seeds left over by an upgrade with nowhere to wait (format 7: those
/// compost yards held); the farm takes them in when it loads.
 final  List<Seed> _returnedSeeds;
/// Seeds left over by an upgrade with nowhere to wait (format 7: those
/// compost yards held); the farm takes them in when it loads.
@override@JsonKey() List<Seed> get returnedSeeds {
  if (_returnedSeeds is EqualUnmodifiableListView) return _returnedSeeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_returnedSeeds);
}

/// Potatoes in the fridge; their `tile` is null.
 final  List<PotatoDocument> _fridge;
/// Potatoes in the fridge; their `tile` is null.
@override@JsonKey() List<PotatoDocument> get fridge {
  if (_fridge is EqualUnmodifiableListView) return _fridge;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fridge);
}

 final  List<AwayDocument> _away;
@override@JsonKey() List<AwayDocument> get away {
  if (_away is EqualUnmodifiableListView) return _away;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_away);
}

/// Dead potatoes in the graveyards, oldest first; `tile` is null.
 final  List<PotatoDocument> _graves;
/// Dead potatoes in the graveyards, oldest first; `tile` is null.
@override@JsonKey() List<PotatoDocument> get graves {
  if (_graves is EqualUnmodifiableListView) return _graves;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_graves);
}

/// Open blocks, in block units. Null in documents from before blocks
/// opened: those farms still have only the starting land.
 final  List<TilePos>? _openBlocks;
/// Open blocks, in block units. Null in documents from before blocks
/// opened: those farms still have only the starting land.
@override List<TilePos>? get openBlocks {
  final value = _openBlocks;
  if (value == null) return null;
  if (_openBlocks is EqualUnmodifiableListView) return _openBlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Pouch and box sizes; null in documents from before they were kept,
/// which start at the catalog's sizes.
@override final  int? pouchSlots;
@override final  int? gearSlots;
 final  List<OverflowDocument> _overflow;
@override@JsonKey() List<OverflowDocument> get overflow {
  if (_overflow is EqualUnmodifiableListView) return _overflow;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_overflow);
}

 final  Map<String, int> _materials;
@override@JsonKey() Map<String, int> get materials {
  if (_materials is EqualUnmodifiableMapView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_materials);
}

 final  List<MailDocument> _mail;
@override@JsonKey() List<MailDocument> get mail {
  if (_mail is EqualUnmodifiableListView) return _mail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mail);
}

/// The workbench level of the one weapon, in documents from before
/// gear (then [equipped] is null and the farm gets the starting gear,
/// this level on its weapon).
@override@JsonKey() final  int weaponLevel;
 final  List<Gear> _gear;
@override@JsonKey() List<Gear> get gear {
  if (_gear is EqualUnmodifiableListView) return _gear;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gear);
}

@override final  Equipped? equipped;
@override@JsonKey() final  int progress;
@override final  int? totemLimit;
 final  Map<String, dynamic> _totals;
@override@JsonKey() Map<String, dynamic> get totals {
  if (_totals is EqualUnmodifiableMapView) return _totals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totals);
}

/// Story events done, by id, with the step each was done on.
 final  Map<String, int> _storyDone;
/// Story events done, by id, with the step each was done on.
@override@JsonKey() Map<String, int> get storyDone {
  if (_storyDone is EqualUnmodifiableMapView) return _storyDone;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_storyDone);
}

/// Every feature open, no story events (see
/// [FarmSimulation.storySkipped]).
@override@JsonKey() final  bool storySkipped;
/// Starting building kinds a farm saved before they existed should get
/// when it is read (set by migrations, never written).
 final  List<String> _missingBuildings;
/// Starting building kinds a farm saved before they existed should get
/// when it is read (set by migrations, never written).
@override@JsonKey() List<String> get missingBuildings {
  if (_missingBuildings is EqualUnmodifiableListView) return _missingBuildings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingBuildings);
}


/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FarmDocumentCopyWith<_FarmDocument> get copyWith => __$FarmDocumentCopyWithImpl<_FarmDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FarmDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmDocument&&(identical(other.formatVersion, formatVersion) || other.formatVersion == formatVersion)&&(identical(other.tick, tick) || other.tick == tick)&&(identical(other.nextId, nextId) || other.nextId == nextId)&&const DeepCollectionEquality().equals(other.randomState, _randomState)&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&const DeepCollectionEquality().equals(other.fields, _fields)&&const DeepCollectionEquality().equals(other.buildings, _buildings)&&const DeepCollectionEquality().equals(other.guards, _guards)&&const DeepCollectionEquality().equals(other.returnedSeeds, _returnedSeeds)&&const DeepCollectionEquality().equals(other.fridge, _fridge)&&const DeepCollectionEquality().equals(other.away, _away)&&const DeepCollectionEquality().equals(other.graves, _graves)&&const DeepCollectionEquality().equals(other.openBlocks, _openBlocks)&&(identical(other.pouchSlots, pouchSlots) || other.pouchSlots == pouchSlots)&&(identical(other.gearSlots, gearSlots) || other.gearSlots == gearSlots)&&const DeepCollectionEquality().equals(other.overflow, _overflow)&&const DeepCollectionEquality().equals(other.materials, _materials)&&const DeepCollectionEquality().equals(other.mail, _mail)&&(identical(other.weaponLevel, weaponLevel) || other.weaponLevel == weaponLevel)&&const DeepCollectionEquality().equals(other.gear, _gear)&&(identical(other.equipped, equipped) || other.equipped == equipped)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.totemLimit, totemLimit) || other.totemLimit == totemLimit)&&const DeepCollectionEquality().equals(other.totals, _totals)&&const DeepCollectionEquality().equals(other.storyDone, _storyDone)&&(identical(other.storySkipped, storySkipped) || other.storySkipped == storySkipped)&&const DeepCollectionEquality().equals(other.missingBuildings, _missingBuildings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,formatVersion,tick,nextId,const DeepCollectionEquality().hash(_randomState),food,const DeepCollectionEquality().hash(_seeds),const DeepCollectionEquality().hash(_fields),const DeepCollectionEquality().hash(_buildings),const DeepCollectionEquality().hash(_guards),const DeepCollectionEquality().hash(_returnedSeeds),const DeepCollectionEquality().hash(_fridge),const DeepCollectionEquality().hash(_away),const DeepCollectionEquality().hash(_graves),const DeepCollectionEquality().hash(_openBlocks),pouchSlots,gearSlots,const DeepCollectionEquality().hash(_overflow),const DeepCollectionEquality().hash(_materials),const DeepCollectionEquality().hash(_mail),weaponLevel,const DeepCollectionEquality().hash(_gear),equipped,progress,totemLimit,const DeepCollectionEquality().hash(_totals),const DeepCollectionEquality().hash(_storyDone),storySkipped,const DeepCollectionEquality().hash(_missingBuildings)]);
}

@override
String toString() {
    return 'FarmDocument(formatVersion: $formatVersion, tick: $tick, nextId: $nextId, randomState: $randomState, food: $food, seeds: $seeds, fields: $fields, buildings: $buildings, guards: $guards, returnedSeeds: $returnedSeeds, fridge: $fridge, away: $away, graves: $graves, openBlocks: $openBlocks, pouchSlots: $pouchSlots, gearSlots: $gearSlots, overflow: $overflow, materials: $materials, mail: $mail, weaponLevel: $weaponLevel, gear: $gear, equipped: $equipped, progress: $progress, totemLimit: $totemLimit, totals: $totals, storyDone: $storyDone, storySkipped: $storySkipped, missingBuildings: $missingBuildings)';
}


}

/// @nodoc
abstract mixin class _$FarmDocumentCopyWith<$Res> implements $FarmDocumentCopyWith<$Res> {
  factory _$FarmDocumentCopyWith(_FarmDocument value, $Res Function(_FarmDocument) _then) = __$FarmDocumentCopyWithImpl;
@override @useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedCount> seeds, List<FieldDocument> fields, List<BuildingDocument> buildings, List<GuardDocument> guards, List<Seed> returnedSeeds, List<PotatoDocument> fridge, List<AwayDocument> away, List<PotatoDocument> graves, List<TilePos>? openBlocks, int? pouchSlots, int? gearSlots, List<OverflowDocument> overflow, Map<String, int> materials, List<MailDocument> mail, int weaponLevel, List<Gear> gear, Equipped? equipped, int progress, int? totemLimit, Map<String, dynamic> totals, Map<String, int> storyDone, bool storySkipped, List<String> missingBuildings
});


@override $EquippedCopyWith<$Res>? get equipped;

}
/// @nodoc
class __$FarmDocumentCopyWithImpl<$Res>
    implements _$FarmDocumentCopyWith<$Res> {
  __$FarmDocumentCopyWithImpl(this._self, this._then);

  final _FarmDocument _self;
  final $Res Function(_FarmDocument) _then;

/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,Object? buildings = null,Object? guards = null,Object? returnedSeeds = null,Object? fridge = null,Object? away = null,Object? graves = null,Object? openBlocks = freezed,Object? pouchSlots = freezed,Object? gearSlots = freezed,Object? overflow = null,Object? materials = null,Object? mail = null,Object? weaponLevel = null,Object? gear = null,Object? equipped = freezed,Object? progress = null,Object? totemLimit = freezed,Object? totals = null,Object? storyDone = null,Object? storySkipped = null,Object? missingBuildings = null,}) {
  return _then(_FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self._randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedCount>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,buildings: null == buildings ? _self._buildings : buildings // ignore: cast_nullable_to_non_nullable
as List<BuildingDocument>,guards: null == guards ? _self._guards : guards // ignore: cast_nullable_to_non_nullable
as List<GuardDocument>,returnedSeeds: null == returnedSeeds ? _self._returnedSeeds : returnedSeeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,fridge: null == fridge ? _self._fridge : fridge // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,away: null == away ? _self._away : away // ignore: cast_nullable_to_non_nullable
as List<AwayDocument>,graves: null == graves ? _self._graves : graves // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,openBlocks: freezed == openBlocks ? _self._openBlocks : openBlocks // ignore: cast_nullable_to_non_nullable
as List<TilePos>?,pouchSlots: freezed == pouchSlots ? _self.pouchSlots : pouchSlots // ignore: cast_nullable_to_non_nullable
as int?,gearSlots: freezed == gearSlots ? _self.gearSlots : gearSlots // ignore: cast_nullable_to_non_nullable
as int?,overflow: null == overflow ? _self._overflow : overflow // ignore: cast_nullable_to_non_nullable
as List<OverflowDocument>,materials: null == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as Map<String, int>,mail: null == mail ? _self._mail : mail // ignore: cast_nullable_to_non_nullable
as List<MailDocument>,weaponLevel: null == weaponLevel ? _self.weaponLevel : weaponLevel // ignore: cast_nullable_to_non_nullable
as int,gear: null == gear ? _self._gear : gear // ignore: cast_nullable_to_non_nullable
as List<Gear>,equipped: freezed == equipped ? _self.equipped : equipped // ignore: cast_nullable_to_non_nullable
as Equipped?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,totemLimit: freezed == totemLimit ? _self.totemLimit : totemLimit // ignore: cast_nullable_to_non_nullable
as int?,totals: null == totals ? _self._totals : totals // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,storyDone: null == storyDone ? _self._storyDone : storyDone // ignore: cast_nullable_to_non_nullable
as Map<String, int>,storySkipped: null == storySkipped ? _self.storySkipped : storySkipped // ignore: cast_nullable_to_non_nullable
as bool,missingBuildings: null == missingBuildings ? _self._missingBuildings : missingBuildings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EquippedCopyWith<$Res>? get equipped {
    if (_self.equipped == null) {
    return null;
  }

  return $EquippedCopyWith<$Res>(_self.equipped!, (value) {
    return _then(_self.copyWith(equipped: value));
  });
}
}


/// @nodoc
mixin _$FieldDocument {

 int get id; TileRect get rect; List<PotatoDocument> get potatoes; PestDocument? get pest;
/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FieldDocumentCopyWith<FieldDocument> get copyWith => _$FieldDocumentCopyWithImpl<FieldDocument>(this as FieldDocument, _$identity);

  /// Serializes this FieldDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FieldDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rect, _this.rect) || other.rect == _this.rect)&&const DeepCollectionEquality().equals(other.potatoes, _this.potatoes)&&(identical(other.pest, _this.pest) || other.pest == _this.pest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FieldDocument;
  return Object.hash(runtimeType,_this.id,_this.rect,const DeepCollectionEquality().hash(_this.potatoes),_this.pest);
}

@override
String toString() {
  final _this = this as FieldDocument;
  return 'FieldDocument(id: ${_this.id}, rect: ${_this.rect}, potatoes: ${_this.potatoes}, pest: ${_this.pest})';
}


}

/// @nodoc
abstract mixin class $FieldDocumentCopyWith<$Res>  {
  factory $FieldDocumentCopyWith(FieldDocument value, $Res Function(FieldDocument) _then) = _$FieldDocumentCopyWithImpl;
@useResult
$Res call({
 int id, TileRect rect, List<PotatoDocument> potatoes, PestDocument? pest
});


$TileRectCopyWith<$Res> get rect;$PestDocumentCopyWith<$Res>? get pest;

}
/// @nodoc
class _$FieldDocumentCopyWithImpl<$Res>
    implements $FieldDocumentCopyWith<$Res> {
  _$FieldDocumentCopyWithImpl(this._self, this._then);

  final FieldDocument _self;
  final $Res Function(FieldDocument) _then;

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rect = null,Object? potatoes = null,Object? pest = freezed,}) {
  return _then(FieldDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,pest: freezed == pest ? _self.pest : pest // ignore: cast_nullable_to_non_nullable
as PestDocument?,
  ));
}
/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res> get rect {
  
  return $TileRectCopyWith<$Res>(_self.rect, (value) {
    return _then(_self.copyWith(rect: value));
  });
}/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestDocumentCopyWith<$Res>? get pest {
    if (_self.pest == null) {
    return null;
  }

  return $PestDocumentCopyWith<$Res>(_self.pest!, (value) {
    return _then(_self.copyWith(pest: value));
  });
}
}


/// Adds pattern-matching-related methods to [FieldDocument].
extension FieldDocumentPatterns on FieldDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FieldDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FieldDocument value)  $default,){
final _that = this;
switch (_that) {
case _FieldDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FieldDocument value)?  $default,){
final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TileRect rect,  List<PotatoDocument> potatoes,  PestDocument? pest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
return $default(_that.id,_that.rect,_that.potatoes,_that.pest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TileRect rect,  List<PotatoDocument> potatoes,  PestDocument? pest)  $default,) {final _that = this;
switch (_that) {
case _FieldDocument():
return $default(_that.id,_that.rect,_that.potatoes,_that.pest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TileRect rect,  List<PotatoDocument> potatoes,  PestDocument? pest)?  $default,) {final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
return $default(_that.id,_that.rect,_that.potatoes,_that.pest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldDocument implements FieldDocument {
  const _FieldDocument({required this.id, required this.rect, required  List<PotatoDocument> potatoes, this.pest}): _potatoes = potatoes;
  factory _FieldDocument.fromJson(Map<String, dynamic> json) => _$FieldDocumentFromJson(json);

@override final  int id;
@override final  TileRect rect;
 final  List<PotatoDocument> _potatoes;
@override List<PotatoDocument> get potatoes {
  if (_potatoes is EqualUnmodifiableListView) return _potatoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoes);
}

@override final  PestDocument? pest;

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FieldDocumentCopyWith<_FieldDocument> get copyWith => __$FieldDocumentCopyWithImpl<_FieldDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FieldDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.rect, rect) || other.rect == rect)&&const DeepCollectionEquality().equals(other.potatoes, _potatoes)&&(identical(other.pest, pest) || other.pest == pest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,rect,const DeepCollectionEquality().hash(_potatoes),pest);
}

@override
String toString() {
    return 'FieldDocument(id: $id, rect: $rect, potatoes: $potatoes, pest: $pest)';
}


}

/// @nodoc
abstract mixin class _$FieldDocumentCopyWith<$Res> implements $FieldDocumentCopyWith<$Res> {
  factory _$FieldDocumentCopyWith(_FieldDocument value, $Res Function(_FieldDocument) _then) = __$FieldDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, TileRect rect, List<PotatoDocument> potatoes, PestDocument? pest
});


@override $TileRectCopyWith<$Res> get rect;@override $PestDocumentCopyWith<$Res>? get pest;

}
/// @nodoc
class __$FieldDocumentCopyWithImpl<$Res>
    implements _$FieldDocumentCopyWith<$Res> {
  __$FieldDocumentCopyWithImpl(this._self, this._then);

  final _FieldDocument _self;
  final $Res Function(_FieldDocument) _then;

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rect = null,Object? potatoes = null,Object? pest = freezed,}) {
  return _then(_FieldDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,potatoes: null == potatoes ? _self._potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,pest: freezed == pest ? _self.pest : pest // ignore: cast_nullable_to_non_nullable
as PestDocument?,
  ));
}

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TileRectCopyWith<$Res> get rect {
  
  return $TileRectCopyWith<$Res>(_self.rect, (value) {
    return _then(_self.copyWith(rect: value));
  });
}/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PestDocumentCopyWith<$Res>? get pest {
    if (_self.pest == null) {
    return null;
  }

  return $PestDocumentCopyWith<$Res>(_self.pest!, (value) {
    return _then(_self.copyWith(pest: value));
  });
}
}


/// @nodoc
mixin _$PestDocument {

 PestKind get kind; int get clearedMillis; int get biteMillis;
/// Create a copy of PestDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PestDocumentCopyWith<PestDocument> get copyWith => _$PestDocumentCopyWithImpl<PestDocument>(this as PestDocument, _$identity);

  /// Serializes this PestDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PestDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PestDocument&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.clearedMillis, _this.clearedMillis) || other.clearedMillis == _this.clearedMillis)&&(identical(other.biteMillis, _this.biteMillis) || other.biteMillis == _this.biteMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PestDocument;
  return Object.hash(runtimeType,_this.kind,_this.clearedMillis,_this.biteMillis);
}

@override
String toString() {
  final _this = this as PestDocument;
  return 'PestDocument(kind: ${_this.kind}, clearedMillis: ${_this.clearedMillis}, biteMillis: ${_this.biteMillis})';
}


}

/// @nodoc
abstract mixin class $PestDocumentCopyWith<$Res>  {
  factory $PestDocumentCopyWith(PestDocument value, $Res Function(PestDocument) _then) = _$PestDocumentCopyWithImpl;
@useResult
$Res call({
 PestKind kind, int clearedMillis, int biteMillis
});




}
/// @nodoc
class _$PestDocumentCopyWithImpl<$Res>
    implements $PestDocumentCopyWith<$Res> {
  _$PestDocumentCopyWithImpl(this._self, this._then);

  final PestDocument _self;
  final $Res Function(PestDocument) _then;

/// Create a copy of PestDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? clearedMillis = null,Object? biteMillis = null,}) {
  return _then(PestDocument(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PestKind,clearedMillis: null == clearedMillis ? _self.clearedMillis : clearedMillis // ignore: cast_nullable_to_non_nullable
as int,biteMillis: null == biteMillis ? _self.biteMillis : biteMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PestDocument].
extension PestDocumentPatterns on PestDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PestDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PestDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PestDocument value)  $default,){
final _that = this;
switch (_that) {
case _PestDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PestDocument value)?  $default,){
final _that = this;
switch (_that) {
case _PestDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PestKind kind,  int clearedMillis,  int biteMillis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PestDocument() when $default != null:
return $default(_that.kind,_that.clearedMillis,_that.biteMillis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PestKind kind,  int clearedMillis,  int biteMillis)  $default,) {final _that = this;
switch (_that) {
case _PestDocument():
return $default(_that.kind,_that.clearedMillis,_that.biteMillis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PestKind kind,  int clearedMillis,  int biteMillis)?  $default,) {final _that = this;
switch (_that) {
case _PestDocument() when $default != null:
return $default(_that.kind,_that.clearedMillis,_that.biteMillis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PestDocument implements PestDocument {
  const _PestDocument({required this.kind, required this.clearedMillis, required this.biteMillis});
  factory _PestDocument.fromJson(Map<String, dynamic> json) => _$PestDocumentFromJson(json);

@override final  PestKind kind;
@override final  int clearedMillis;
@override final  int biteMillis;

/// Create a copy of PestDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PestDocumentCopyWith<_PestDocument> get copyWith => __$PestDocumentCopyWithImpl<_PestDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PestDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PestDocument&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.clearedMillis, clearedMillis) || other.clearedMillis == clearedMillis)&&(identical(other.biteMillis, biteMillis) || other.biteMillis == biteMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,clearedMillis,biteMillis);
}

@override
String toString() {
    return 'PestDocument(kind: $kind, clearedMillis: $clearedMillis, biteMillis: $biteMillis)';
}


}

/// @nodoc
abstract mixin class _$PestDocumentCopyWith<$Res> implements $PestDocumentCopyWith<$Res> {
  factory _$PestDocumentCopyWith(_PestDocument value, $Res Function(_PestDocument) _then) = __$PestDocumentCopyWithImpl;
@override @useResult
$Res call({
 PestKind kind, int clearedMillis, int biteMillis
});




}
/// @nodoc
class __$PestDocumentCopyWithImpl<$Res>
    implements _$PestDocumentCopyWith<$Res> {
  __$PestDocumentCopyWithImpl(this._self, this._then);

  final _PestDocument _self;
  final $Res Function(_PestDocument) _then;

/// Create a copy of PestDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? clearedMillis = null,Object? biteMillis = null,}) {
  return _then(_PestDocument(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PestKind,clearedMillis: null == clearedMillis ? _self.clearedMillis : clearedMillis // ignore: cast_nullable_to_non_nullable
as int,biteMillis: null == biteMillis ? _self.biteMillis : biteMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BuildingDocument {

 int get id; String get kind; TilePos get origin; int get level;/// For totems: when its light goes out and when it can be lit again.
 int get litUntilTick; int get readyTick;
/// Create a copy of BuildingDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingDocumentCopyWith<BuildingDocument> get copyWith => _$BuildingDocumentCopyWithImpl<BuildingDocument>(this as BuildingDocument, _$identity);

  /// Serializes this BuildingDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BuildingDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.litUntilTick, _this.litUntilTick) || other.litUntilTick == _this.litUntilTick)&&(identical(other.readyTick, _this.readyTick) || other.readyTick == _this.readyTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuildingDocument;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.origin,_this.level,_this.litUntilTick,_this.readyTick);
}

@override
String toString() {
  final _this = this as BuildingDocument;
  return 'BuildingDocument(id: ${_this.id}, kind: ${_this.kind}, origin: ${_this.origin}, level: ${_this.level}, litUntilTick: ${_this.litUntilTick}, readyTick: ${_this.readyTick})';
}


}

/// @nodoc
abstract mixin class $BuildingDocumentCopyWith<$Res>  {
  factory $BuildingDocumentCopyWith(BuildingDocument value, $Res Function(BuildingDocument) _then) = _$BuildingDocumentCopyWithImpl;
@useResult
$Res call({
 int id, String kind, TilePos origin, int level, int litUntilTick, int readyTick
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$BuildingDocumentCopyWithImpl<$Res>
    implements $BuildingDocumentCopyWith<$Res> {
  _$BuildingDocumentCopyWithImpl(this._self, this._then);

  final BuildingDocument _self;
  final $Res Function(BuildingDocument) _then;

/// Create a copy of BuildingDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? origin = null,Object? level = null,Object? litUntilTick = null,Object? readyTick = null,}) {
  return _then(BuildingDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,litUntilTick: null == litUntilTick ? _self.litUntilTick : litUntilTick // ignore: cast_nullable_to_non_nullable
as int,readyTick: null == readyTick ? _self.readyTick : readyTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of BuildingDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get origin {
  
  return $TilePosCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuildingDocument].
extension BuildingDocumentPatterns on BuildingDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildingDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildingDocument value)  $default,){
final _that = this;
switch (_that) {
case _BuildingDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildingDocument value)?  $default,){
final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String kind,  TilePos origin,  int level,  int litUntilTick,  int readyTick)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
return $default(_that.id,_that.kind,_that.origin,_that.level,_that.litUntilTick,_that.readyTick);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String kind,  TilePos origin,  int level,  int litUntilTick,  int readyTick)  $default,) {final _that = this;
switch (_that) {
case _BuildingDocument():
return $default(_that.id,_that.kind,_that.origin,_that.level,_that.litUntilTick,_that.readyTick);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String kind,  TilePos origin,  int level,  int litUntilTick,  int readyTick)?  $default,) {final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
return $default(_that.id,_that.kind,_that.origin,_that.level,_that.litUntilTick,_that.readyTick);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingDocument implements BuildingDocument {
  const _BuildingDocument({required this.id, required this.kind, required this.origin, required this.level, this.litUntilTick = 0, this.readyTick = 0});
  factory _BuildingDocument.fromJson(Map<String, dynamic> json) => _$BuildingDocumentFromJson(json);

@override final  int id;
@override final  String kind;
@override final  TilePos origin;
@override final  int level;
/// For totems: when its light goes out and when it can be lit again.
@override@JsonKey() final  int litUntilTick;
@override@JsonKey() final  int readyTick;

/// Create a copy of BuildingDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildingDocumentCopyWith<_BuildingDocument> get copyWith => __$BuildingDocumentCopyWithImpl<_BuildingDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.level, level) || other.level == level)&&(identical(other.litUntilTick, litUntilTick) || other.litUntilTick == litUntilTick)&&(identical(other.readyTick, readyTick) || other.readyTick == readyTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,origin,level,litUntilTick,readyTick);
}

@override
String toString() {
    return 'BuildingDocument(id: $id, kind: $kind, origin: $origin, level: $level, litUntilTick: $litUntilTick, readyTick: $readyTick)';
}


}

/// @nodoc
abstract mixin class _$BuildingDocumentCopyWith<$Res> implements $BuildingDocumentCopyWith<$Res> {
  factory _$BuildingDocumentCopyWith(_BuildingDocument value, $Res Function(_BuildingDocument) _then) = __$BuildingDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, String kind, TilePos origin, int level, int litUntilTick, int readyTick
});


@override $TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class __$BuildingDocumentCopyWithImpl<$Res>
    implements _$BuildingDocumentCopyWith<$Res> {
  __$BuildingDocumentCopyWithImpl(this._self, this._then);

  final _BuildingDocument _self;
  final $Res Function(_BuildingDocument) _then;

/// Create a copy of BuildingDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? origin = null,Object? level = null,Object? litUntilTick = null,Object? readyTick = null,}) {
  return _then(_BuildingDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,litUntilTick: null == litUntilTick ? _self.litUntilTick : litUntilTick // ignore: cast_nullable_to_non_nullable
as int,readyTick: null == readyTick ? _self.readyTick : readyTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of BuildingDocument
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
mixin _$GuardDocument {

 PotatoDocument get potato; int get buildingId; TilePos get at; int? get targetFieldId; bool get harvesting; TilePos? get walkTo; int get walkMillis; int get walkTotalMillis;
/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuardDocumentCopyWith<GuardDocument> get copyWith => _$GuardDocumentCopyWithImpl<GuardDocument>(this as GuardDocument, _$identity);

  /// Serializes this GuardDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GuardDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardDocument&&(identical(other.potato, _this.potato) || other.potato == _this.potato)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.targetFieldId, _this.targetFieldId) || other.targetFieldId == _this.targetFieldId)&&(identical(other.harvesting, _this.harvesting) || other.harvesting == _this.harvesting)&&(identical(other.walkTo, _this.walkTo) || other.walkTo == _this.walkTo)&&(identical(other.walkMillis, _this.walkMillis) || other.walkMillis == _this.walkMillis)&&(identical(other.walkTotalMillis, _this.walkTotalMillis) || other.walkTotalMillis == _this.walkTotalMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GuardDocument;
  return Object.hash(runtimeType,_this.potato,_this.buildingId,_this.at,_this.targetFieldId,_this.harvesting,_this.walkTo,_this.walkMillis,_this.walkTotalMillis);
}

@override
String toString() {
  final _this = this as GuardDocument;
  return 'GuardDocument(potato: ${_this.potato}, buildingId: ${_this.buildingId}, at: ${_this.at}, targetFieldId: ${_this.targetFieldId}, harvesting: ${_this.harvesting}, walkTo: ${_this.walkTo}, walkMillis: ${_this.walkMillis}, walkTotalMillis: ${_this.walkTotalMillis})';
}


}

/// @nodoc
abstract mixin class $GuardDocumentCopyWith<$Res>  {
  factory $GuardDocumentCopyWith(GuardDocument value, $Res Function(GuardDocument) _then) = _$GuardDocumentCopyWithImpl;
@useResult
$Res call({
 PotatoDocument potato, int buildingId, TilePos at, int? targetFieldId, bool harvesting, TilePos? walkTo, int walkMillis, int walkTotalMillis
});


$PotatoDocumentCopyWith<$Res> get potato;$TilePosCopyWith<$Res> get at;$TilePosCopyWith<$Res>? get walkTo;

}
/// @nodoc
class _$GuardDocumentCopyWithImpl<$Res>
    implements $GuardDocumentCopyWith<$Res> {
  _$GuardDocumentCopyWithImpl(this._self, this._then);

  final GuardDocument _self;
  final $Res Function(GuardDocument) _then;

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? potato = null,Object? buildingId = null,Object? at = null,Object? targetFieldId = freezed,Object? harvesting = null,Object? walkTo = freezed,Object? walkMillis = null,Object? walkTotalMillis = null,}) {
  return _then(GuardDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as TilePos,targetFieldId: freezed == targetFieldId ? _self.targetFieldId : targetFieldId // ignore: cast_nullable_to_non_nullable
as int?,harvesting: null == harvesting ? _self.harvesting : harvesting // ignore: cast_nullable_to_non_nullable
as bool,walkTo: freezed == walkTo ? _self.walkTo : walkTo // ignore: cast_nullable_to_non_nullable
as TilePos?,walkMillis: null == walkMillis ? _self.walkMillis : walkMillis // ignore: cast_nullable_to_non_nullable
as int,walkTotalMillis: null == walkTotalMillis ? _self.walkTotalMillis : walkTotalMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoDocumentCopyWith<$Res> get potato {
  
  return $PotatoDocumentCopyWith<$Res>(_self.potato, (value) {
    return _then(_self.copyWith(potato: value));
  });
}/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get at {
  
  return $TilePosCopyWith<$Res>(_self.at, (value) {
    return _then(_self.copyWith(at: value));
  });
}/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res>? get walkTo {
    if (_self.walkTo == null) {
    return null;
  }

  return $TilePosCopyWith<$Res>(_self.walkTo!, (value) {
    return _then(_self.copyWith(walkTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [GuardDocument].
extension GuardDocumentPatterns on GuardDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuardDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuardDocument value)  $default,){
final _that = this;
switch (_that) {
case _GuardDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuardDocument value)?  $default,){
final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  bool harvesting,  TilePos? walkTo,  int walkMillis,  int walkTotalMillis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.harvesting,_that.walkTo,_that.walkMillis,_that.walkTotalMillis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  bool harvesting,  TilePos? walkTo,  int walkMillis,  int walkTotalMillis)  $default,) {final _that = this;
switch (_that) {
case _GuardDocument():
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.harvesting,_that.walkTo,_that.walkMillis,_that.walkTotalMillis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  bool harvesting,  TilePos? walkTo,  int walkMillis,  int walkTotalMillis)?  $default,) {final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.harvesting,_that.walkTo,_that.walkMillis,_that.walkTotalMillis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuardDocument implements GuardDocument {
  const _GuardDocument({required this.potato, required this.buildingId, required this.at, this.targetFieldId, this.harvesting = false, this.walkTo, required this.walkMillis, this.walkTotalMillis = 0});
  factory _GuardDocument.fromJson(Map<String, dynamic> json) => _$GuardDocumentFromJson(json);

@override final  PotatoDocument potato;
@override final  int buildingId;
@override final  TilePos at;
@override final  int? targetFieldId;
@override@JsonKey() final  bool harvesting;
@override final  TilePos? walkTo;
@override final  int walkMillis;
@override@JsonKey() final  int walkTotalMillis;

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuardDocumentCopyWith<_GuardDocument> get copyWith => __$GuardDocumentCopyWithImpl<_GuardDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuardDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardDocument&&(identical(other.potato, potato) || other.potato == potato)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.at, at) || other.at == at)&&(identical(other.targetFieldId, targetFieldId) || other.targetFieldId == targetFieldId)&&(identical(other.harvesting, harvesting) || other.harvesting == harvesting)&&(identical(other.walkTo, walkTo) || other.walkTo == walkTo)&&(identical(other.walkMillis, walkMillis) || other.walkMillis == walkMillis)&&(identical(other.walkTotalMillis, walkTotalMillis) || other.walkTotalMillis == walkTotalMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potato,buildingId,at,targetFieldId,harvesting,walkTo,walkMillis,walkTotalMillis);
}

@override
String toString() {
    return 'GuardDocument(potato: $potato, buildingId: $buildingId, at: $at, targetFieldId: $targetFieldId, harvesting: $harvesting, walkTo: $walkTo, walkMillis: $walkMillis, walkTotalMillis: $walkTotalMillis)';
}


}

/// @nodoc
abstract mixin class _$GuardDocumentCopyWith<$Res> implements $GuardDocumentCopyWith<$Res> {
  factory _$GuardDocumentCopyWith(_GuardDocument value, $Res Function(_GuardDocument) _then) = __$GuardDocumentCopyWithImpl;
@override @useResult
$Res call({
 PotatoDocument potato, int buildingId, TilePos at, int? targetFieldId, bool harvesting, TilePos? walkTo, int walkMillis, int walkTotalMillis
});


@override $PotatoDocumentCopyWith<$Res> get potato;@override $TilePosCopyWith<$Res> get at;@override $TilePosCopyWith<$Res>? get walkTo;

}
/// @nodoc
class __$GuardDocumentCopyWithImpl<$Res>
    implements _$GuardDocumentCopyWith<$Res> {
  __$GuardDocumentCopyWithImpl(this._self, this._then);

  final _GuardDocument _self;
  final $Res Function(_GuardDocument) _then;

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? potato = null,Object? buildingId = null,Object? at = null,Object? targetFieldId = freezed,Object? harvesting = null,Object? walkTo = freezed,Object? walkMillis = null,Object? walkTotalMillis = null,}) {
  return _then(_GuardDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as TilePos,targetFieldId: freezed == targetFieldId ? _self.targetFieldId : targetFieldId // ignore: cast_nullable_to_non_nullable
as int?,harvesting: null == harvesting ? _self.harvesting : harvesting // ignore: cast_nullable_to_non_nullable
as bool,walkTo: freezed == walkTo ? _self.walkTo : walkTo // ignore: cast_nullable_to_non_nullable
as TilePos?,walkMillis: null == walkMillis ? _self.walkMillis : walkMillis // ignore: cast_nullable_to_non_nullable
as int,walkTotalMillis: null == walkTotalMillis ? _self.walkTotalMillis : walkTotalMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoDocumentCopyWith<$Res> get potato {
  
  return $PotatoDocumentCopyWith<$Res>(_self.potato, (value) {
    return _then(_self.copyWith(potato: value));
  });
}/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get at {
  
  return $TilePosCopyWith<$Res>(_self.at, (value) {
    return _then(_self.copyWith(at: value));
  });
}/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res>? get walkTo {
    if (_self.walkTo == null) {
    return null;
  }

  return $TilePosCopyWith<$Res>(_self.walkTo!, (value) {
    return _then(_self.copyWith(walkTo: value));
  });
}
}


/// @nodoc
mixin _$AwayDocument {

 PotatoDocument get potato; int? get fieldId; int? get buildingId;
/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AwayDocumentCopyWith<AwayDocument> get copyWith => _$AwayDocumentCopyWithImpl<AwayDocument>(this as AwayDocument, _$identity);

  /// Serializes this AwayDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AwayDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwayDocument&&(identical(other.potato, _this.potato) || other.potato == _this.potato)&&(identical(other.fieldId, _this.fieldId) || other.fieldId == _this.fieldId)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AwayDocument;
  return Object.hash(runtimeType,_this.potato,_this.fieldId,_this.buildingId);
}

@override
String toString() {
  final _this = this as AwayDocument;
  return 'AwayDocument(potato: ${_this.potato}, fieldId: ${_this.fieldId}, buildingId: ${_this.buildingId})';
}


}

/// @nodoc
abstract mixin class $AwayDocumentCopyWith<$Res>  {
  factory $AwayDocumentCopyWith(AwayDocument value, $Res Function(AwayDocument) _then) = _$AwayDocumentCopyWithImpl;
@useResult
$Res call({
 PotatoDocument potato, int? fieldId, int? buildingId
});


$PotatoDocumentCopyWith<$Res> get potato;

}
/// @nodoc
class _$AwayDocumentCopyWithImpl<$Res>
    implements $AwayDocumentCopyWith<$Res> {
  _$AwayDocumentCopyWithImpl(this._self, this._then);

  final AwayDocument _self;
  final $Res Function(AwayDocument) _then;

/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? potato = null,Object? fieldId = freezed,Object? buildingId = freezed,}) {
  return _then(AwayDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,fieldId: freezed == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoDocumentCopyWith<$Res> get potato {
  
  return $PotatoDocumentCopyWith<$Res>(_self.potato, (value) {
    return _then(_self.copyWith(potato: value));
  });
}
}


/// Adds pattern-matching-related methods to [AwayDocument].
extension AwayDocumentPatterns on AwayDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AwayDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AwayDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AwayDocument value)  $default,){
final _that = this;
switch (_that) {
case _AwayDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AwayDocument value)?  $default,){
final _that = this;
switch (_that) {
case _AwayDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoDocument potato,  int? fieldId,  int? buildingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AwayDocument() when $default != null:
return $default(_that.potato,_that.fieldId,_that.buildingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoDocument potato,  int? fieldId,  int? buildingId)  $default,) {final _that = this;
switch (_that) {
case _AwayDocument():
return $default(_that.potato,_that.fieldId,_that.buildingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoDocument potato,  int? fieldId,  int? buildingId)?  $default,) {final _that = this;
switch (_that) {
case _AwayDocument() when $default != null:
return $default(_that.potato,_that.fieldId,_that.buildingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AwayDocument implements AwayDocument {
  const _AwayDocument({required this.potato, this.fieldId, this.buildingId});
  factory _AwayDocument.fromJson(Map<String, dynamic> json) => _$AwayDocumentFromJson(json);

@override final  PotatoDocument potato;
@override final  int? fieldId;
@override final  int? buildingId;

/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AwayDocumentCopyWith<_AwayDocument> get copyWith => __$AwayDocumentCopyWithImpl<_AwayDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AwayDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AwayDocument&&(identical(other.potato, potato) || other.potato == potato)&&(identical(other.fieldId, fieldId) || other.fieldId == fieldId)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potato,fieldId,buildingId);
}

@override
String toString() {
    return 'AwayDocument(potato: $potato, fieldId: $fieldId, buildingId: $buildingId)';
}


}

/// @nodoc
abstract mixin class _$AwayDocumentCopyWith<$Res> implements $AwayDocumentCopyWith<$Res> {
  factory _$AwayDocumentCopyWith(_AwayDocument value, $Res Function(_AwayDocument) _then) = __$AwayDocumentCopyWithImpl;
@override @useResult
$Res call({
 PotatoDocument potato, int? fieldId, int? buildingId
});


@override $PotatoDocumentCopyWith<$Res> get potato;

}
/// @nodoc
class __$AwayDocumentCopyWithImpl<$Res>
    implements _$AwayDocumentCopyWith<$Res> {
  __$AwayDocumentCopyWithImpl(this._self, this._then);

  final _AwayDocument _self;
  final $Res Function(_AwayDocument) _then;

/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? potato = null,Object? fieldId = freezed,Object? buildingId = freezed,}) {
  return _then(_AwayDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,fieldId: freezed == fieldId ? _self.fieldId : fieldId // ignore: cast_nullable_to_non_nullable
as int?,buildingId: freezed == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of AwayDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PotatoDocumentCopyWith<$Res> get potato {
  
  return $PotatoDocumentCopyWith<$Res>(_self.potato, (value) {
    return _then(_self.copyWith(potato: value));
  });
}
}


/// @nodoc
mixin _$PotatoDocument {

 int get id;/// Its field tile; null outside fields.
 TilePos? get tile; PotatoType get type; Grade get grade; int get level; List<String> get abilities; CombatStyle? get style; int get grownMillis; int get livedMillis; int get productionMillis; int get stored;/// Seeds a breeding potato made, waiting to be harvested.
 List<Seed> get seeds; bool get weak;
/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoDocumentCopyWith<PotatoDocument> get copyWith => _$PotatoDocumentCopyWithImpl<PotatoDocument>(this as PotatoDocument, _$identity);

  /// Serializes this PotatoDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PotatoDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tile, _this.tile) || other.tile == _this.tile)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.level, _this.level) || other.level == _this.level)&&const DeepCollectionEquality().equals(other.abilities, _this.abilities)&&(identical(other.style, _this.style) || other.style == _this.style)&&(identical(other.grownMillis, _this.grownMillis) || other.grownMillis == _this.grownMillis)&&(identical(other.livedMillis, _this.livedMillis) || other.livedMillis == _this.livedMillis)&&(identical(other.productionMillis, _this.productionMillis) || other.productionMillis == _this.productionMillis)&&(identical(other.stored, _this.stored) || other.stored == _this.stored)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds)&&(identical(other.weak, _this.weak) || other.weak == _this.weak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoDocument;
  return Object.hash(runtimeType,_this.id,_this.tile,_this.type,_this.grade,_this.level,const DeepCollectionEquality().hash(_this.abilities),_this.style,_this.grownMillis,_this.livedMillis,_this.productionMillis,_this.stored,const DeepCollectionEquality().hash(_this.seeds),_this.weak);
}

@override
String toString() {
  final _this = this as PotatoDocument;
  return 'PotatoDocument(id: ${_this.id}, tile: ${_this.tile}, type: ${_this.type}, grade: ${_this.grade}, level: ${_this.level}, abilities: ${_this.abilities}, style: ${_this.style}, grownMillis: ${_this.grownMillis}, livedMillis: ${_this.livedMillis}, productionMillis: ${_this.productionMillis}, stored: ${_this.stored}, seeds: ${_this.seeds}, weak: ${_this.weak})';
}


}

/// @nodoc
abstract mixin class $PotatoDocumentCopyWith<$Res>  {
  factory $PotatoDocumentCopyWith(PotatoDocument value, $Res Function(PotatoDocument) _then) = _$PotatoDocumentCopyWithImpl;
@useResult
$Res call({
 int id, TilePos? tile, PotatoType type, Grade grade, int level, List<String> abilities, CombatStyle? style, int grownMillis, int livedMillis, int productionMillis, int stored, List<Seed> seeds, bool weak
});


$TilePosCopyWith<$Res>? get tile;

}
/// @nodoc
class _$PotatoDocumentCopyWithImpl<$Res>
    implements $PotatoDocumentCopyWith<$Res> {
  _$PotatoDocumentCopyWithImpl(this._self, this._then);

  final PotatoDocument _self;
  final $Res Function(PotatoDocument) _then;

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tile = freezed,Object? type = null,Object? grade = null,Object? level = null,Object? abilities = null,Object? style = freezed,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? seeds = null,Object? weak = null,}) {
  return _then(PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,abilities: null == abilities ? _self.abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,weak: null == weak ? _self.weak : weak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PotatoDocument
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


/// Adds pattern-matching-related methods to [PotatoDocument].
extension PotatoDocumentPatterns on PotatoDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PotatoDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PotatoDocument value)  $default,){
final _that = this;
switch (_that) {
case _PotatoDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PotatoDocument value)?  $default,){
final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  List<Seed> seeds,  bool weak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.level,_that.abilities,_that.style,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.seeds,_that.weak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  List<Seed> seeds,  bool weak)  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument():
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.level,_that.abilities,_that.style,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.seeds,_that.weak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int level,  List<String> abilities,  CombatStyle? style,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  List<Seed> seeds,  bool weak)?  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.level,_that.abilities,_that.style,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.seeds,_that.weak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoDocument extends PotatoDocument {
  const _PotatoDocument({required this.id, this.tile, required this.type, required this.grade, required this.level, required  List<String> abilities, this.style, required this.grownMillis, required this.livedMillis, required this.productionMillis, required this.stored,  List<Seed> seeds = const <Seed>[], this.weak = false}): _abilities = abilities,_seeds = seeds,super._();
  factory _PotatoDocument.fromJson(Map<String, dynamic> json) => _$PotatoDocumentFromJson(json);

@override final  int id;
/// Its field tile; null outside fields.
@override final  TilePos? tile;
@override final  PotatoType type;
@override final  Grade grade;
@override final  int level;
 final  List<String> _abilities;
@override List<String> get abilities {
  if (_abilities is EqualUnmodifiableListView) return _abilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abilities);
}

@override final  CombatStyle? style;
@override final  int grownMillis;
@override final  int livedMillis;
@override final  int productionMillis;
@override final  int stored;
/// Seeds a breeding potato made, waiting to be harvested.
 final  List<Seed> _seeds;
/// Seeds a breeding potato made, waiting to be harvested.
@override@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}

@override@JsonKey() final  bool weak;

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PotatoDocumentCopyWith<_PotatoDocument> get copyWith => __$PotatoDocumentCopyWithImpl<_PotatoDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.abilities, _abilities)&&(identical(other.style, style) || other.style == style)&&(identical(other.grownMillis, grownMillis) || other.grownMillis == grownMillis)&&(identical(other.livedMillis, livedMillis) || other.livedMillis == livedMillis)&&(identical(other.productionMillis, productionMillis) || other.productionMillis == productionMillis)&&(identical(other.stored, stored) || other.stored == stored)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&(identical(other.weak, weak) || other.weak == weak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tile,type,grade,level,const DeepCollectionEquality().hash(_abilities),style,grownMillis,livedMillis,productionMillis,stored,const DeepCollectionEquality().hash(_seeds),weak);
}

@override
String toString() {
    return 'PotatoDocument(id: $id, tile: $tile, type: $type, grade: $grade, level: $level, abilities: $abilities, style: $style, grownMillis: $grownMillis, livedMillis: $livedMillis, productionMillis: $productionMillis, stored: $stored, seeds: $seeds, weak: $weak)';
}


}

/// @nodoc
abstract mixin class _$PotatoDocumentCopyWith<$Res> implements $PotatoDocumentCopyWith<$Res> {
  factory _$PotatoDocumentCopyWith(_PotatoDocument value, $Res Function(_PotatoDocument) _then) = __$PotatoDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, TilePos? tile, PotatoType type, Grade grade, int level, List<String> abilities, CombatStyle? style, int grownMillis, int livedMillis, int productionMillis, int stored, List<Seed> seeds, bool weak
});


@override $TilePosCopyWith<$Res>? get tile;

}
/// @nodoc
class __$PotatoDocumentCopyWithImpl<$Res>
    implements _$PotatoDocumentCopyWith<$Res> {
  __$PotatoDocumentCopyWithImpl(this._self, this._then);

  final _PotatoDocument _self;
  final $Res Function(_PotatoDocument) _then;

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tile = freezed,Object? type = null,Object? grade = null,Object? level = null,Object? abilities = null,Object? style = freezed,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? seeds = null,Object? weak = null,}) {
  return _then(_PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,abilities: null == abilities ? _self._abilities : abilities // ignore: cast_nullable_to_non_nullable
as List<String>,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,weak: null == weak ? _self.weak : weak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PotatoDocument
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
mixin _$OverflowDocument {

 Seed get seed; int get expiresTick;
/// Create a copy of OverflowDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverflowDocumentCopyWith<OverflowDocument> get copyWith => _$OverflowDocumentCopyWithImpl<OverflowDocument>(this as OverflowDocument, _$identity);

  /// Serializes this OverflowDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OverflowDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverflowDocument&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.expiresTick, _this.expiresTick) || other.expiresTick == _this.expiresTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OverflowDocument;
  return Object.hash(runtimeType,_this.seed,_this.expiresTick);
}

@override
String toString() {
  final _this = this as OverflowDocument;
  return 'OverflowDocument(seed: ${_this.seed}, expiresTick: ${_this.expiresTick})';
}


}

/// @nodoc
abstract mixin class $OverflowDocumentCopyWith<$Res>  {
  factory $OverflowDocumentCopyWith(OverflowDocument value, $Res Function(OverflowDocument) _then) = _$OverflowDocumentCopyWithImpl;
@useResult
$Res call({
 Seed seed, int expiresTick
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$OverflowDocumentCopyWithImpl<$Res>
    implements $OverflowDocumentCopyWith<$Res> {
  _$OverflowDocumentCopyWithImpl(this._self, this._then);

  final OverflowDocument _self;
  final $Res Function(OverflowDocument) _then;

/// Create a copy of OverflowDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = null,Object? expiresTick = null,}) {
  return _then(OverflowDocument(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,expiresTick: null == expiresTick ? _self.expiresTick : expiresTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of OverflowDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res> get seed {
  
  return $SeedCopyWith<$Res>(_self.seed, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}


/// Adds pattern-matching-related methods to [OverflowDocument].
extension OverflowDocumentPatterns on OverflowDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverflowDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverflowDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverflowDocument value)  $default,){
final _that = this;
switch (_that) {
case _OverflowDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverflowDocument value)?  $default,){
final _that = this;
switch (_that) {
case _OverflowDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Seed seed,  int expiresTick)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverflowDocument() when $default != null:
return $default(_that.seed,_that.expiresTick);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Seed seed,  int expiresTick)  $default,) {final _that = this;
switch (_that) {
case _OverflowDocument():
return $default(_that.seed,_that.expiresTick);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Seed seed,  int expiresTick)?  $default,) {final _that = this;
switch (_that) {
case _OverflowDocument() when $default != null:
return $default(_that.seed,_that.expiresTick);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverflowDocument implements OverflowDocument {
  const _OverflowDocument({required this.seed, required this.expiresTick});
  factory _OverflowDocument.fromJson(Map<String, dynamic> json) => _$OverflowDocumentFromJson(json);

@override final  Seed seed;
@override final  int expiresTick;

/// Create a copy of OverflowDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverflowDocumentCopyWith<_OverflowDocument> get copyWith => __$OverflowDocumentCopyWithImpl<_OverflowDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverflowDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverflowDocument&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.expiresTick, expiresTick) || other.expiresTick == expiresTick));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed,expiresTick);
}

@override
String toString() {
    return 'OverflowDocument(seed: $seed, expiresTick: $expiresTick)';
}


}

/// @nodoc
abstract mixin class _$OverflowDocumentCopyWith<$Res> implements $OverflowDocumentCopyWith<$Res> {
  factory _$OverflowDocumentCopyWith(_OverflowDocument value, $Res Function(_OverflowDocument) _then) = __$OverflowDocumentCopyWithImpl;
@override @useResult
$Res call({
 Seed seed, int expiresTick
});


@override $SeedCopyWith<$Res> get seed;

}
/// @nodoc
class __$OverflowDocumentCopyWithImpl<$Res>
    implements _$OverflowDocumentCopyWith<$Res> {
  __$OverflowDocumentCopyWithImpl(this._self, this._then);

  final _OverflowDocument _self;
  final $Res Function(_OverflowDocument) _then;

/// Create a copy of OverflowDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = null,Object? expiresTick = null,}) {
  return _then(_OverflowDocument(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,expiresTick: null == expiresTick ? _self.expiresTick : expiresTick // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of OverflowDocument
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
mixin _$MailDocument {

 int get id; MailKind get kind; int get tick; String? get building; String? get story; List<Seed> get seeds; int get food; bool get read; bool get claimed;
/// Create a copy of MailDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MailDocumentCopyWith<MailDocument> get copyWith => _$MailDocumentCopyWithImpl<MailDocument>(this as MailDocument, _$identity);

  /// Serializes this MailDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MailDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MailDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.tick, _this.tick) || other.tick == _this.tick)&&(identical(other.building, _this.building) || other.building == _this.building)&&(identical(other.story, _this.story) || other.story == _this.story)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds)&&(identical(other.food, _this.food) || other.food == _this.food)&&(identical(other.read, _this.read) || other.read == _this.read)&&(identical(other.claimed, _this.claimed) || other.claimed == _this.claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MailDocument;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.tick,_this.building,_this.story,const DeepCollectionEquality().hash(_this.seeds),_this.food,_this.read,_this.claimed);
}

@override
String toString() {
  final _this = this as MailDocument;
  return 'MailDocument(id: ${_this.id}, kind: ${_this.kind}, tick: ${_this.tick}, building: ${_this.building}, story: ${_this.story}, seeds: ${_this.seeds}, food: ${_this.food}, read: ${_this.read}, claimed: ${_this.claimed})';
}


}

/// @nodoc
abstract mixin class $MailDocumentCopyWith<$Res>  {
  factory $MailDocumentCopyWith(MailDocument value, $Res Function(MailDocument) _then) = _$MailDocumentCopyWithImpl;
@useResult
$Res call({
 int id, MailKind kind, int tick, String? building, String? story, List<Seed> seeds, int food, bool read, bool claimed
});




}
/// @nodoc
class _$MailDocumentCopyWithImpl<$Res>
    implements $MailDocumentCopyWith<$Res> {
  _$MailDocumentCopyWithImpl(this._self, this._then);

  final MailDocument _self;
  final $Res Function(MailDocument) _then;

/// Create a copy of MailDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? tick = null,Object? building = freezed,Object? story = freezed,Object? seeds = null,Object? food = null,Object? read = null,Object? claimed = null,}) {
  return _then(MailDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MailKind,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,story: freezed == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String?,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MailDocument].
extension MailDocumentPatterns on MailDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MailDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MailDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MailDocument value)  $default,){
final _that = this;
switch (_that) {
case _MailDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MailDocument value)?  $default,){
final _that = this;
switch (_that) {
case _MailDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  MailKind kind,  int tick,  String? building,  String? story,  List<Seed> seeds,  int food,  bool read,  bool claimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MailDocument() when $default != null:
return $default(_that.id,_that.kind,_that.tick,_that.building,_that.story,_that.seeds,_that.food,_that.read,_that.claimed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  MailKind kind,  int tick,  String? building,  String? story,  List<Seed> seeds,  int food,  bool read,  bool claimed)  $default,) {final _that = this;
switch (_that) {
case _MailDocument():
return $default(_that.id,_that.kind,_that.tick,_that.building,_that.story,_that.seeds,_that.food,_that.read,_that.claimed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  MailKind kind,  int tick,  String? building,  String? story,  List<Seed> seeds,  int food,  bool read,  bool claimed)?  $default,) {final _that = this;
switch (_that) {
case _MailDocument() when $default != null:
return $default(_that.id,_that.kind,_that.tick,_that.building,_that.story,_that.seeds,_that.food,_that.read,_that.claimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MailDocument extends MailDocument {
  const _MailDocument({required this.id, required this.kind, required this.tick, this.building, this.story,  List<Seed> seeds = const <Seed>[], this.food = 0, this.read = false, this.claimed = false}): _seeds = seeds,super._();
  factory _MailDocument.fromJson(Map<String, dynamic> json) => _$MailDocumentFromJson(json);

@override final  int id;
@override final  MailKind kind;
@override final  int tick;
@override final  String? building;
@override final  String? story;
 final  List<Seed> _seeds;
@override@JsonKey() List<Seed> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}

@override@JsonKey() final  int food;
@override@JsonKey() final  bool read;
@override@JsonKey() final  bool claimed;

/// Create a copy of MailDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MailDocumentCopyWith<_MailDocument> get copyWith => __$MailDocumentCopyWithImpl<_MailDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MailDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MailDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.tick, tick) || other.tick == tick)&&(identical(other.building, building) || other.building == building)&&(identical(other.story, story) || other.story == story)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&(identical(other.food, food) || other.food == food)&&(identical(other.read, read) || other.read == read)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,tick,building,story,const DeepCollectionEquality().hash(_seeds),food,read,claimed);
}

@override
String toString() {
    return 'MailDocument(id: $id, kind: $kind, tick: $tick, building: $building, story: $story, seeds: $seeds, food: $food, read: $read, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class _$MailDocumentCopyWith<$Res> implements $MailDocumentCopyWith<$Res> {
  factory _$MailDocumentCopyWith(_MailDocument value, $Res Function(_MailDocument) _then) = __$MailDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, MailKind kind, int tick, String? building, String? story, List<Seed> seeds, int food, bool read, bool claimed
});




}
/// @nodoc
class __$MailDocumentCopyWithImpl<$Res>
    implements _$MailDocumentCopyWith<$Res> {
  __$MailDocumentCopyWithImpl(this._self, this._then);

  final _MailDocument _self;
  final $Res Function(_MailDocument) _then;

/// Create a copy of MailDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? tick = null,Object? building = freezed,Object? story = freezed,Object? seeds = null,Object? food = null,Object? read = null,Object? claimed = null,}) {
  return _then(_MailDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as MailKind,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,story: freezed == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as String?,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<Seed>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
