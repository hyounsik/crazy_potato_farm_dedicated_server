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
 int get formatVersion; int get tick; int get nextId; List<int> get randomState; int get food; List<SeedStackData> get seeds; List<FieldDocument> get fields; List<BuildingDocument> get buildings; List<GuardDocument> get guards;/// Potatoes in the fridge; their `tile` is null.
 List<PotatoDocument> get fridge; List<AwayDocument> get away; Map<String, dynamic> get totals;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmDocument&&(identical(other.formatVersion, _this.formatVersion) || other.formatVersion == _this.formatVersion)&&(identical(other.tick, _this.tick) || other.tick == _this.tick)&&(identical(other.nextId, _this.nextId) || other.nextId == _this.nextId)&&const DeepCollectionEquality().equals(other.randomState, _this.randomState)&&(identical(other.food, _this.food) || other.food == _this.food)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds)&&const DeepCollectionEquality().equals(other.fields, _this.fields)&&const DeepCollectionEquality().equals(other.buildings, _this.buildings)&&const DeepCollectionEquality().equals(other.guards, _this.guards)&&const DeepCollectionEquality().equals(other.fridge, _this.fridge)&&const DeepCollectionEquality().equals(other.away, _this.away)&&const DeepCollectionEquality().equals(other.totals, _this.totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmDocument;
  return Object.hash(runtimeType,_this.formatVersion,_this.tick,_this.nextId,const DeepCollectionEquality().hash(_this.randomState),_this.food,const DeepCollectionEquality().hash(_this.seeds),const DeepCollectionEquality().hash(_this.fields),const DeepCollectionEquality().hash(_this.buildings),const DeepCollectionEquality().hash(_this.guards),const DeepCollectionEquality().hash(_this.fridge),const DeepCollectionEquality().hash(_this.away),const DeepCollectionEquality().hash(_this.totals));
}

@override
String toString() {
  final _this = this as FarmDocument;
  return 'FarmDocument(formatVersion: ${_this.formatVersion}, tick: ${_this.tick}, nextId: ${_this.nextId}, randomState: ${_this.randomState}, food: ${_this.food}, seeds: ${_this.seeds}, fields: ${_this.fields}, buildings: ${_this.buildings}, guards: ${_this.guards}, fridge: ${_this.fridge}, away: ${_this.away}, totals: ${_this.totals})';
}


}

/// @nodoc
abstract mixin class $FarmDocumentCopyWith<$Res>  {
  factory $FarmDocumentCopyWith(FarmDocument value, $Res Function(FarmDocument) _then) = _$FarmDocumentCopyWithImpl;
@useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedStackData> seeds, List<FieldDocument> fields, List<BuildingDocument> buildings, List<GuardDocument> guards, List<PotatoDocument> fridge, List<AwayDocument> away, Map<String, dynamic> totals
});




}
/// @nodoc
class _$FarmDocumentCopyWithImpl<$Res>
    implements $FarmDocumentCopyWith<$Res> {
  _$FarmDocumentCopyWithImpl(this._self, this._then);

  final FarmDocument _self;
  final $Res Function(FarmDocument) _then;

/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,Object? buildings = null,Object? guards = null,Object? fridge = null,Object? away = null,Object? totals = null,}) {
  return _then(FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self.randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,buildings: null == buildings ? _self.buildings : buildings // ignore: cast_nullable_to_non_nullable
as List<BuildingDocument>,guards: null == guards ? _self.guards : guards // ignore: cast_nullable_to_non_nullable
as List<GuardDocument>,fridge: null == fridge ? _self.fridge : fridge // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as List<AwayDocument>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<PotatoDocument> fridge,  List<AwayDocument> away,  Map<String, dynamic> totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.fridge,_that.away,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<PotatoDocument> fridge,  List<AwayDocument> away,  Map<String, dynamic> totals)  $default,) {final _that = this;
switch (_that) {
case _FarmDocument():
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.fridge,_that.away,_that.totals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields,  List<BuildingDocument> buildings,  List<GuardDocument> guards,  List<PotatoDocument> fridge,  List<AwayDocument> away,  Map<String, dynamic> totals)?  $default,) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields,_that.buildings,_that.guards,_that.fridge,_that.away,_that.totals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FarmDocument extends FarmDocument {
  const _FarmDocument({required this.formatVersion, required this.tick, required this.nextId, required  List<int> randomState, required this.food, required  List<SeedStackData> seeds, required  List<FieldDocument> fields,  List<BuildingDocument> buildings = const <BuildingDocument>[],  List<GuardDocument> guards = const <GuardDocument>[],  List<PotatoDocument> fridge = const <PotatoDocument>[],  List<AwayDocument> away = const <AwayDocument>[],  Map<String, dynamic> totals = const <String, dynamic>{}}): _randomState = randomState,_seeds = seeds,_fields = fields,_buildings = buildings,_guards = guards,_fridge = fridge,_away = away,_totals = totals,super._();
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
 final  List<SeedStackData> _seeds;
@override List<SeedStackData> get seeds {
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

 final  Map<String, dynamic> _totals;
@override@JsonKey() Map<String, dynamic> get totals {
  if (_totals is EqualUnmodifiableMapView) return _totals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_totals);
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmDocument&&(identical(other.formatVersion, formatVersion) || other.formatVersion == formatVersion)&&(identical(other.tick, tick) || other.tick == tick)&&(identical(other.nextId, nextId) || other.nextId == nextId)&&const DeepCollectionEquality().equals(other.randomState, _randomState)&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&const DeepCollectionEquality().equals(other.fields, _fields)&&const DeepCollectionEquality().equals(other.buildings, _buildings)&&const DeepCollectionEquality().equals(other.guards, _guards)&&const DeepCollectionEquality().equals(other.fridge, _fridge)&&const DeepCollectionEquality().equals(other.away, _away)&&const DeepCollectionEquality().equals(other.totals, _totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,formatVersion,tick,nextId,const DeepCollectionEquality().hash(_randomState),food,const DeepCollectionEquality().hash(_seeds),const DeepCollectionEquality().hash(_fields),const DeepCollectionEquality().hash(_buildings),const DeepCollectionEquality().hash(_guards),const DeepCollectionEquality().hash(_fridge),const DeepCollectionEquality().hash(_away),const DeepCollectionEquality().hash(_totals));
}

@override
String toString() {
    return 'FarmDocument(formatVersion: $formatVersion, tick: $tick, nextId: $nextId, randomState: $randomState, food: $food, seeds: $seeds, fields: $fields, buildings: $buildings, guards: $guards, fridge: $fridge, away: $away, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$FarmDocumentCopyWith<$Res> implements $FarmDocumentCopyWith<$Res> {
  factory _$FarmDocumentCopyWith(_FarmDocument value, $Res Function(_FarmDocument) _then) = __$FarmDocumentCopyWithImpl;
@override @useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedStackData> seeds, List<FieldDocument> fields, List<BuildingDocument> buildings, List<GuardDocument> guards, List<PotatoDocument> fridge, List<AwayDocument> away, Map<String, dynamic> totals
});




}
/// @nodoc
class __$FarmDocumentCopyWithImpl<$Res>
    implements _$FarmDocumentCopyWith<$Res> {
  __$FarmDocumentCopyWithImpl(this._self, this._then);

  final _FarmDocument _self;
  final $Res Function(_FarmDocument) _then;

/// Create a copy of FarmDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,Object? buildings = null,Object? guards = null,Object? fridge = null,Object? away = null,Object? totals = null,}) {
  return _then(_FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self._randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,buildings: null == buildings ? _self._buildings : buildings // ignore: cast_nullable_to_non_nullable
as List<BuildingDocument>,guards: null == guards ? _self._guards : guards // ignore: cast_nullable_to_non_nullable
as List<GuardDocument>,fridge: null == fridge ? _self._fridge : fridge // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,away: null == away ? _self._away : away // ignore: cast_nullable_to_non_nullable
as List<AwayDocument>,totals: null == totals ? _self._totals : totals // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
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

 int get id; String get kind; TilePos get origin; int get level;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.level, _this.level) || other.level == _this.level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BuildingDocument;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.origin,_this.level);
}

@override
String toString() {
  final _this = this as BuildingDocument;
  return 'BuildingDocument(id: ${_this.id}, kind: ${_this.kind}, origin: ${_this.origin}, level: ${_this.level})';
}


}

/// @nodoc
abstract mixin class $BuildingDocumentCopyWith<$Res>  {
  factory $BuildingDocumentCopyWith(BuildingDocument value, $Res Function(BuildingDocument) _then) = _$BuildingDocumentCopyWithImpl;
@useResult
$Res call({
 int id, String kind, TilePos origin, int level
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? origin = null,Object? level = null,}) {
  return _then(BuildingDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String kind,  TilePos origin,  int level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
return $default(_that.id,_that.kind,_that.origin,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String kind,  TilePos origin,  int level)  $default,) {final _that = this;
switch (_that) {
case _BuildingDocument():
return $default(_that.id,_that.kind,_that.origin,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String kind,  TilePos origin,  int level)?  $default,) {final _that = this;
switch (_that) {
case _BuildingDocument() when $default != null:
return $default(_that.id,_that.kind,_that.origin,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingDocument implements BuildingDocument {
  const _BuildingDocument({required this.id, required this.kind, required this.origin, required this.level});
  factory _BuildingDocument.fromJson(Map<String, dynamic> json) => _$BuildingDocumentFromJson(json);

@override final  int id;
@override final  String kind;
@override final  TilePos origin;
@override final  int level;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,origin,level);
}

@override
String toString() {
    return 'BuildingDocument(id: $id, kind: $kind, origin: $origin, level: $level)';
}


}

/// @nodoc
abstract mixin class _$BuildingDocumentCopyWith<$Res> implements $BuildingDocumentCopyWith<$Res> {
  factory _$BuildingDocumentCopyWith(_BuildingDocument value, $Res Function(_BuildingDocument) _then) = __$BuildingDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, String kind, TilePos origin, int level
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? origin = null,Object? level = null,}) {
  return _then(_BuildingDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
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

 PotatoDocument get potato; int get buildingId; TilePos get at; int? get targetFieldId; int get walkMillis;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuardDocument&&(identical(other.potato, _this.potato) || other.potato == _this.potato)&&(identical(other.buildingId, _this.buildingId) || other.buildingId == _this.buildingId)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.targetFieldId, _this.targetFieldId) || other.targetFieldId == _this.targetFieldId)&&(identical(other.walkMillis, _this.walkMillis) || other.walkMillis == _this.walkMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GuardDocument;
  return Object.hash(runtimeType,_this.potato,_this.buildingId,_this.at,_this.targetFieldId,_this.walkMillis);
}

@override
String toString() {
  final _this = this as GuardDocument;
  return 'GuardDocument(potato: ${_this.potato}, buildingId: ${_this.buildingId}, at: ${_this.at}, targetFieldId: ${_this.targetFieldId}, walkMillis: ${_this.walkMillis})';
}


}

/// @nodoc
abstract mixin class $GuardDocumentCopyWith<$Res>  {
  factory $GuardDocumentCopyWith(GuardDocument value, $Res Function(GuardDocument) _then) = _$GuardDocumentCopyWithImpl;
@useResult
$Res call({
 PotatoDocument potato, int buildingId, TilePos at, int? targetFieldId, int walkMillis
});


$PotatoDocumentCopyWith<$Res> get potato;$TilePosCopyWith<$Res> get at;

}
/// @nodoc
class _$GuardDocumentCopyWithImpl<$Res>
    implements $GuardDocumentCopyWith<$Res> {
  _$GuardDocumentCopyWithImpl(this._self, this._then);

  final GuardDocument _self;
  final $Res Function(GuardDocument) _then;

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? potato = null,Object? buildingId = null,Object? at = null,Object? targetFieldId = freezed,Object? walkMillis = null,}) {
  return _then(GuardDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as TilePos,targetFieldId: freezed == targetFieldId ? _self.targetFieldId : targetFieldId // ignore: cast_nullable_to_non_nullable
as int?,walkMillis: null == walkMillis ? _self.walkMillis : walkMillis // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  int walkMillis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.walkMillis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  int walkMillis)  $default,) {final _that = this;
switch (_that) {
case _GuardDocument():
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.walkMillis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoDocument potato,  int buildingId,  TilePos at,  int? targetFieldId,  int walkMillis)?  $default,) {final _that = this;
switch (_that) {
case _GuardDocument() when $default != null:
return $default(_that.potato,_that.buildingId,_that.at,_that.targetFieldId,_that.walkMillis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuardDocument implements GuardDocument {
  const _GuardDocument({required this.potato, required this.buildingId, required this.at, this.targetFieldId, required this.walkMillis});
  factory _GuardDocument.fromJson(Map<String, dynamic> json) => _$GuardDocumentFromJson(json);

@override final  PotatoDocument potato;
@override final  int buildingId;
@override final  TilePos at;
@override final  int? targetFieldId;
@override final  int walkMillis;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuardDocument&&(identical(other.potato, potato) || other.potato == potato)&&(identical(other.buildingId, buildingId) || other.buildingId == buildingId)&&(identical(other.at, at) || other.at == at)&&(identical(other.targetFieldId, targetFieldId) || other.targetFieldId == targetFieldId)&&(identical(other.walkMillis, walkMillis) || other.walkMillis == walkMillis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,potato,buildingId,at,targetFieldId,walkMillis);
}

@override
String toString() {
    return 'GuardDocument(potato: $potato, buildingId: $buildingId, at: $at, targetFieldId: $targetFieldId, walkMillis: $walkMillis)';
}


}

/// @nodoc
abstract mixin class _$GuardDocumentCopyWith<$Res> implements $GuardDocumentCopyWith<$Res> {
  factory _$GuardDocumentCopyWith(_GuardDocument value, $Res Function(_GuardDocument) _then) = __$GuardDocumentCopyWithImpl;
@override @useResult
$Res call({
 PotatoDocument potato, int buildingId, TilePos at, int? targetFieldId, int walkMillis
});


@override $PotatoDocumentCopyWith<$Res> get potato;@override $TilePosCopyWith<$Res> get at;

}
/// @nodoc
class __$GuardDocumentCopyWithImpl<$Res>
    implements _$GuardDocumentCopyWith<$Res> {
  __$GuardDocumentCopyWithImpl(this._self, this._then);

  final _GuardDocument _self;
  final $Res Function(_GuardDocument) _then;

/// Create a copy of GuardDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? potato = null,Object? buildingId = null,Object? at = null,Object? targetFieldId = freezed,Object? walkMillis = null,}) {
  return _then(_GuardDocument(
potato: null == potato ? _self.potato : potato // ignore: cast_nullable_to_non_nullable
as PotatoDocument,buildingId: null == buildingId ? _self.buildingId : buildingId // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as TilePos,targetFieldId: freezed == targetFieldId ? _self.targetFieldId : targetFieldId // ignore: cast_nullable_to_non_nullable
as int?,walkMillis: null == walkMillis ? _self.walkMillis : walkMillis // ignore: cast_nullable_to_non_nullable
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
 TilePos? get tile; PotatoType get type; Grade get grade; int get grownMillis; int get livedMillis; int get productionMillis; int get stored; bool get weak;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tile, _this.tile) || other.tile == _this.tile)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.grownMillis, _this.grownMillis) || other.grownMillis == _this.grownMillis)&&(identical(other.livedMillis, _this.livedMillis) || other.livedMillis == _this.livedMillis)&&(identical(other.productionMillis, _this.productionMillis) || other.productionMillis == _this.productionMillis)&&(identical(other.stored, _this.stored) || other.stored == _this.stored)&&(identical(other.weak, _this.weak) || other.weak == _this.weak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoDocument;
  return Object.hash(runtimeType,_this.id,_this.tile,_this.type,_this.grade,_this.grownMillis,_this.livedMillis,_this.productionMillis,_this.stored,_this.weak);
}

@override
String toString() {
  final _this = this as PotatoDocument;
  return 'PotatoDocument(id: ${_this.id}, tile: ${_this.tile}, type: ${_this.type}, grade: ${_this.grade}, grownMillis: ${_this.grownMillis}, livedMillis: ${_this.livedMillis}, productionMillis: ${_this.productionMillis}, stored: ${_this.stored}, weak: ${_this.weak})';
}


}

/// @nodoc
abstract mixin class $PotatoDocumentCopyWith<$Res>  {
  factory $PotatoDocumentCopyWith(PotatoDocument value, $Res Function(PotatoDocument) _then) = _$PotatoDocumentCopyWithImpl;
@useResult
$Res call({
 int id, TilePos? tile, PotatoType type, Grade grade, int grownMillis, int livedMillis, int productionMillis, int stored, bool weak
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tile = freezed,Object? type = null,Object? grade = null,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? weak = null,}) {
  return _then(PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,weak: null == weak ? _self.weak : weak // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool weak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.weak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool weak)  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument():
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.weak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TilePos? tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool weak)?  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.weak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoDocument extends PotatoDocument {
  const _PotatoDocument({required this.id, this.tile, required this.type, required this.grade, required this.grownMillis, required this.livedMillis, required this.productionMillis, required this.stored, this.weak = false}): super._();
  factory _PotatoDocument.fromJson(Map<String, dynamic> json) => _$PotatoDocumentFromJson(json);

@override final  int id;
/// Its field tile; null outside fields.
@override final  TilePos? tile;
@override final  PotatoType type;
@override final  Grade grade;
@override final  int grownMillis;
@override final  int livedMillis;
@override final  int productionMillis;
@override final  int stored;
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.grownMillis, grownMillis) || other.grownMillis == grownMillis)&&(identical(other.livedMillis, livedMillis) || other.livedMillis == livedMillis)&&(identical(other.productionMillis, productionMillis) || other.productionMillis == productionMillis)&&(identical(other.stored, stored) || other.stored == stored)&&(identical(other.weak, weak) || other.weak == weak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tile,type,grade,grownMillis,livedMillis,productionMillis,stored,weak);
}

@override
String toString() {
    return 'PotatoDocument(id: $id, tile: $tile, type: $type, grade: $grade, grownMillis: $grownMillis, livedMillis: $livedMillis, productionMillis: $productionMillis, stored: $stored, weak: $weak)';
}


}

/// @nodoc
abstract mixin class _$PotatoDocumentCopyWith<$Res> implements $PotatoDocumentCopyWith<$Res> {
  factory _$PotatoDocumentCopyWith(_PotatoDocument value, $Res Function(_PotatoDocument) _then) = __$PotatoDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, TilePos? tile, PotatoType type, Grade grade, int grownMillis, int livedMillis, int productionMillis, int stored, bool weak
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tile = freezed,Object? type = null,Object? grade = null,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? weak = null,}) {
  return _then(_PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: freezed == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,weak: null == weak ? _self.weak : weak // ignore: cast_nullable_to_non_nullable
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

// dart format on
