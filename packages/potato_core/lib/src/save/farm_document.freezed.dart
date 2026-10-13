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
 int get formatVersion; int get tick; int get nextId; List<int> get randomState; int get food; List<SeedStackData> get seeds; List<FieldDocument> get fields;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FarmDocument&&(identical(other.formatVersion, _this.formatVersion) || other.formatVersion == _this.formatVersion)&&(identical(other.tick, _this.tick) || other.tick == _this.tick)&&(identical(other.nextId, _this.nextId) || other.nextId == _this.nextId)&&const DeepCollectionEquality().equals(other.randomState, _this.randomState)&&(identical(other.food, _this.food) || other.food == _this.food)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds)&&const DeepCollectionEquality().equals(other.fields, _this.fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FarmDocument;
  return Object.hash(runtimeType,_this.formatVersion,_this.tick,_this.nextId,const DeepCollectionEquality().hash(_this.randomState),_this.food,const DeepCollectionEquality().hash(_this.seeds),const DeepCollectionEquality().hash(_this.fields));
}

@override
String toString() {
  final _this = this as FarmDocument;
  return 'FarmDocument(formatVersion: ${_this.formatVersion}, tick: ${_this.tick}, nextId: ${_this.nextId}, randomState: ${_this.randomState}, food: ${_this.food}, seeds: ${_this.seeds}, fields: ${_this.fields})';
}


}

/// @nodoc
abstract mixin class $FarmDocumentCopyWith<$Res>  {
  factory $FarmDocumentCopyWith(FarmDocument value, $Res Function(FarmDocument) _then) = _$FarmDocumentCopyWithImpl;
@useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedStackData> seeds, List<FieldDocument> fields
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
@pragma('vm:prefer-inline') @override $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,}) {
  return _then(FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self.randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields)  $default,) {final _that = this;
switch (_that) {
case _FarmDocument():
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int formatVersion,  int tick,  int nextId,  List<int> randomState,  int food,  List<SeedStackData> seeds,  List<FieldDocument> fields)?  $default,) {final _that = this;
switch (_that) {
case _FarmDocument() when $default != null:
return $default(_that.formatVersion,_that.tick,_that.nextId,_that.randomState,_that.food,_that.seeds,_that.fields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FarmDocument extends FarmDocument {
  const _FarmDocument({required this.formatVersion, required this.tick, required this.nextId, required  List<int> randomState, required this.food, required  List<SeedStackData> seeds, required  List<FieldDocument> fields}): _randomState = randomState,_seeds = seeds,_fields = fields,super._();
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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FarmDocument&&(identical(other.formatVersion, formatVersion) || other.formatVersion == formatVersion)&&(identical(other.tick, tick) || other.tick == tick)&&(identical(other.nextId, nextId) || other.nextId == nextId)&&const DeepCollectionEquality().equals(other.randomState, _randomState)&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds)&&const DeepCollectionEquality().equals(other.fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,formatVersion,tick,nextId,const DeepCollectionEquality().hash(_randomState),food,const DeepCollectionEquality().hash(_seeds),const DeepCollectionEquality().hash(_fields));
}

@override
String toString() {
    return 'FarmDocument(formatVersion: $formatVersion, tick: $tick, nextId: $nextId, randomState: $randomState, food: $food, seeds: $seeds, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$FarmDocumentCopyWith<$Res> implements $FarmDocumentCopyWith<$Res> {
  factory _$FarmDocumentCopyWith(_FarmDocument value, $Res Function(_FarmDocument) _then) = __$FarmDocumentCopyWithImpl;
@override @useResult
$Res call({
 int formatVersion, int tick, int nextId, List<int> randomState, int food, List<SeedStackData> seeds, List<FieldDocument> fields
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
@override @pragma('vm:prefer-inline') $Res call({Object? formatVersion = null,Object? tick = null,Object? nextId = null,Object? randomState = null,Object? food = null,Object? seeds = null,Object? fields = null,}) {
  return _then(_FarmDocument(
formatVersion: null == formatVersion ? _self.formatVersion : formatVersion // ignore: cast_nullable_to_non_nullable
as int,tick: null == tick ? _self.tick : tick // ignore: cast_nullable_to_non_nullable
as int,nextId: null == nextId ? _self.nextId : nextId // ignore: cast_nullable_to_non_nullable
as int,randomState: null == randomState ? _self._randomState : randomState // ignore: cast_nullable_to_non_nullable
as List<int>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<FieldDocument>,
  ));
}


}


/// @nodoc
mixin _$FieldDocument {

 int get id; TileRect get rect; List<PotatoDocument> get potatoes;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FieldDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rect, _this.rect) || other.rect == _this.rect)&&const DeepCollectionEquality().equals(other.potatoes, _this.potatoes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FieldDocument;
  return Object.hash(runtimeType,_this.id,_this.rect,const DeepCollectionEquality().hash(_this.potatoes));
}

@override
String toString() {
  final _this = this as FieldDocument;
  return 'FieldDocument(id: ${_this.id}, rect: ${_this.rect}, potatoes: ${_this.potatoes})';
}


}

/// @nodoc
abstract mixin class $FieldDocumentCopyWith<$Res>  {
  factory $FieldDocumentCopyWith(FieldDocument value, $Res Function(FieldDocument) _then) = _$FieldDocumentCopyWithImpl;
@useResult
$Res call({
 int id, TileRect rect, List<PotatoDocument> potatoes
});


$TileRectCopyWith<$Res> get rect;

}
/// @nodoc
class _$FieldDocumentCopyWithImpl<$Res>
    implements $FieldDocumentCopyWith<$Res> {
  _$FieldDocumentCopyWithImpl(this._self, this._then);

  final FieldDocument _self;
  final $Res Function(FieldDocument) _then;

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rect = null,Object? potatoes = null,}) {
  return _then(FieldDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,potatoes: null == potatoes ? _self.potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TileRect rect,  List<PotatoDocument> potatoes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
return $default(_that.id,_that.rect,_that.potatoes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TileRect rect,  List<PotatoDocument> potatoes)  $default,) {final _that = this;
switch (_that) {
case _FieldDocument():
return $default(_that.id,_that.rect,_that.potatoes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TileRect rect,  List<PotatoDocument> potatoes)?  $default,) {final _that = this;
switch (_that) {
case _FieldDocument() when $default != null:
return $default(_that.id,_that.rect,_that.potatoes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FieldDocument implements FieldDocument {
  const _FieldDocument({required this.id, required this.rect, required  List<PotatoDocument> potatoes}): _potatoes = potatoes;
  factory _FieldDocument.fromJson(Map<String, dynamic> json) => _$FieldDocumentFromJson(json);

@override final  int id;
@override final  TileRect rect;
 final  List<PotatoDocument> _potatoes;
@override List<PotatoDocument> get potatoes {
  if (_potatoes is EqualUnmodifiableListView) return _potatoes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoes);
}


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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FieldDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.rect, rect) || other.rect == rect)&&const DeepCollectionEquality().equals(other.potatoes, _potatoes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,rect,const DeepCollectionEquality().hash(_potatoes));
}

@override
String toString() {
    return 'FieldDocument(id: $id, rect: $rect, potatoes: $potatoes)';
}


}

/// @nodoc
abstract mixin class _$FieldDocumentCopyWith<$Res> implements $FieldDocumentCopyWith<$Res> {
  factory _$FieldDocumentCopyWith(_FieldDocument value, $Res Function(_FieldDocument) _then) = __$FieldDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, TileRect rect, List<PotatoDocument> potatoes
});


@override $TileRectCopyWith<$Res> get rect;

}
/// @nodoc
class __$FieldDocumentCopyWithImpl<$Res>
    implements _$FieldDocumentCopyWith<$Res> {
  __$FieldDocumentCopyWithImpl(this._self, this._then);

  final _FieldDocument _self;
  final $Res Function(_FieldDocument) _then;

/// Create a copy of FieldDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rect = null,Object? potatoes = null,}) {
  return _then(_FieldDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rect: null == rect ? _self.rect : rect // ignore: cast_nullable_to_non_nullable
as TileRect,potatoes: null == potatoes ? _self._potatoes : potatoes // ignore: cast_nullable_to_non_nullable
as List<PotatoDocument>,
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
}
}


/// @nodoc
mixin _$PotatoDocument {

 int get id; TilePos get tile; PotatoType get type; Grade get grade; int get grownMillis; int get livedMillis; int get productionMillis; int get stored; bool get away;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.tile, _this.tile) || other.tile == _this.tile)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.grownMillis, _this.grownMillis) || other.grownMillis == _this.grownMillis)&&(identical(other.livedMillis, _this.livedMillis) || other.livedMillis == _this.livedMillis)&&(identical(other.productionMillis, _this.productionMillis) || other.productionMillis == _this.productionMillis)&&(identical(other.stored, _this.stored) || other.stored == _this.stored)&&(identical(other.away, _this.away) || other.away == _this.away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoDocument;
  return Object.hash(runtimeType,_this.id,_this.tile,_this.type,_this.grade,_this.grownMillis,_this.livedMillis,_this.productionMillis,_this.stored,_this.away);
}

@override
String toString() {
  final _this = this as PotatoDocument;
  return 'PotatoDocument(id: ${_this.id}, tile: ${_this.tile}, type: ${_this.type}, grade: ${_this.grade}, grownMillis: ${_this.grownMillis}, livedMillis: ${_this.livedMillis}, productionMillis: ${_this.productionMillis}, stored: ${_this.stored}, away: ${_this.away})';
}


}

/// @nodoc
abstract mixin class $PotatoDocumentCopyWith<$Res>  {
  factory $PotatoDocumentCopyWith(PotatoDocument value, $Res Function(PotatoDocument) _then) = _$PotatoDocumentCopyWithImpl;
@useResult
$Res call({
 int id, TilePos tile, PotatoType type, Grade grade, int grownMillis, int livedMillis, int productionMillis, int stored, bool away
});


$TilePosCopyWith<$Res> get tile;

}
/// @nodoc
class _$PotatoDocumentCopyWithImpl<$Res>
    implements $PotatoDocumentCopyWith<$Res> {
  _$PotatoDocumentCopyWithImpl(this._self, this._then);

  final PotatoDocument _self;
  final $Res Function(PotatoDocument) _then;

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tile = null,Object? type = null,Object? grade = null,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? away = null,}) {
  return _then(PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  TilePos tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool away)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.away);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  TilePos tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool away)  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument():
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.away);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  TilePos tile,  PotatoType type,  Grade grade,  int grownMillis,  int livedMillis,  int productionMillis,  int stored,  bool away)?  $default,) {final _that = this;
switch (_that) {
case _PotatoDocument() when $default != null:
return $default(_that.id,_that.tile,_that.type,_that.grade,_that.grownMillis,_that.livedMillis,_that.productionMillis,_that.stored,_that.away);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoDocument extends PotatoDocument {
  const _PotatoDocument({required this.id, required this.tile, required this.type, required this.grade, required this.grownMillis, required this.livedMillis, required this.productionMillis, required this.stored, required this.away}): super._();
  factory _PotatoDocument.fromJson(Map<String, dynamic> json) => _$PotatoDocumentFromJson(json);

@override final  int id;
@override final  TilePos tile;
@override final  PotatoType type;
@override final  Grade grade;
@override final  int grownMillis;
@override final  int livedMillis;
@override final  int productionMillis;
@override final  int stored;
@override final  bool away;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.tile, tile) || other.tile == tile)&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.grownMillis, grownMillis) || other.grownMillis == grownMillis)&&(identical(other.livedMillis, livedMillis) || other.livedMillis == livedMillis)&&(identical(other.productionMillis, productionMillis) || other.productionMillis == productionMillis)&&(identical(other.stored, stored) || other.stored == stored)&&(identical(other.away, away) || other.away == away));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,tile,type,grade,grownMillis,livedMillis,productionMillis,stored,away);
}

@override
String toString() {
    return 'PotatoDocument(id: $id, tile: $tile, type: $type, grade: $grade, grownMillis: $grownMillis, livedMillis: $livedMillis, productionMillis: $productionMillis, stored: $stored, away: $away)';
}


}

/// @nodoc
abstract mixin class _$PotatoDocumentCopyWith<$Res> implements $PotatoDocumentCopyWith<$Res> {
  factory _$PotatoDocumentCopyWith(_PotatoDocument value, $Res Function(_PotatoDocument) _then) = __$PotatoDocumentCopyWithImpl;
@override @useResult
$Res call({
 int id, TilePos tile, PotatoType type, Grade grade, int grownMillis, int livedMillis, int productionMillis, int stored, bool away
});


@override $TilePosCopyWith<$Res> get tile;

}
/// @nodoc
class __$PotatoDocumentCopyWithImpl<$Res>
    implements _$PotatoDocumentCopyWith<$Res> {
  __$PotatoDocumentCopyWithImpl(this._self, this._then);

  final _PotatoDocument _self;
  final $Res Function(_PotatoDocument) _then;

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tile = null,Object? type = null,Object? grade = null,Object? grownMillis = null,Object? livedMillis = null,Object? productionMillis = null,Object? stored = null,Object? away = null,}) {
  return _then(_PotatoDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tile: null == tile ? _self.tile : tile // ignore: cast_nullable_to_non_nullable
as TilePos,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,grownMillis: null == grownMillis ? _self.grownMillis : grownMillis // ignore: cast_nullable_to_non_nullable
as int,livedMillis: null == livedMillis ? _self.livedMillis : livedMillis // ignore: cast_nullable_to_non_nullable
as int,productionMillis: null == productionMillis ? _self.productionMillis : productionMillis // ignore: cast_nullable_to_non_nullable
as int,stored: null == stored ? _self.stored : stored // ignore: cast_nullable_to_non_nullable
as int,away: null == away ? _self.away : away // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PotatoDocument
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get tile {
  
  return $TilePosCopyWith<$Res>(_self.tile, (value) {
    return _then(_self.copyWith(tile: value));
  });
}
}

// dart format on
