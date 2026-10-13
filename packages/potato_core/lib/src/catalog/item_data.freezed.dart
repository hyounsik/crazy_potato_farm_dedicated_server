// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemData {

 String get id; ItemKind get kind;/// How many fit in one bag slot.
 int get stack;/// What kind of seed a seed item is; required for [ItemKind.seed] only.
/// Each seed found gets its own level, ability and style.
 SeedKindData? get seed;
/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemDataCopyWith<ItemData> get copyWith => _$ItemDataCopyWithImpl<ItemData>(this as ItemData, _$identity);

  /// Serializes this ItemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ItemData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.stack, _this.stack) || other.stack == _this.stack)&&(identical(other.seed, _this.seed) || other.seed == _this.seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ItemData;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.stack,_this.seed);
}

@override
String toString() {
  final _this = this as ItemData;
  return 'ItemData(id: ${_this.id}, kind: ${_this.kind}, stack: ${_this.stack}, seed: ${_this.seed})';
}


}

/// @nodoc
abstract mixin class $ItemDataCopyWith<$Res>  {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) _then) = _$ItemDataCopyWithImpl;
@useResult
$Res call({
 String id, ItemKind kind, int stack, SeedKindData? seed
});


$SeedKindDataCopyWith<$Res>? get seed;

}
/// @nodoc
class _$ItemDataCopyWithImpl<$Res>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(this._self, this._then);

  final ItemData _self;
  final $Res Function(ItemData) _then;

/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? stack = null,Object? seed = freezed,}) {
  return _then(ItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ItemKind,stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as int,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as SeedKindData?,
  ));
}
/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedKindDataCopyWith<$Res>? get seed {
    if (_self.seed == null) {
    return null;
  }

  return $SeedKindDataCopyWith<$Res>(_self.seed!, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItemData].
extension ItemDataPatterns on ItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemData value)  $default,){
final _that = this;
switch (_that) {
case _ItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemData value)?  $default,){
final _that = this;
switch (_that) {
case _ItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ItemKind kind,  int stack,  SeedKindData? seed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemData() when $default != null:
return $default(_that.id,_that.kind,_that.stack,_that.seed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ItemKind kind,  int stack,  SeedKindData? seed)  $default,) {final _that = this;
switch (_that) {
case _ItemData():
return $default(_that.id,_that.kind,_that.stack,_that.seed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ItemKind kind,  int stack,  SeedKindData? seed)?  $default,) {final _that = this;
switch (_that) {
case _ItemData() when $default != null:
return $default(_that.id,_that.kind,_that.stack,_that.seed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItemData implements ItemData {
  const _ItemData({required this.id, required this.kind, required this.stack, this.seed});
  factory _ItemData.fromJson(Map<String, dynamic> json) => _$ItemDataFromJson(json);

@override final  String id;
@override final  ItemKind kind;
/// How many fit in one bag slot.
@override final  int stack;
/// What kind of seed a seed item is; required for [ItemKind.seed] only.
/// Each seed found gets its own level, ability and style.
@override final  SeedKindData? seed;

/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemDataCopyWith<_ItemData> get copyWith => __$ItemDataCopyWithImpl<_ItemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemData&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.stack, stack) || other.stack == stack)&&(identical(other.seed, seed) || other.seed == seed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,stack,seed);
}

@override
String toString() {
    return 'ItemData(id: $id, kind: $kind, stack: $stack, seed: $seed)';
}


}

/// @nodoc
abstract mixin class _$ItemDataCopyWith<$Res> implements $ItemDataCopyWith<$Res> {
  factory _$ItemDataCopyWith(_ItemData value, $Res Function(_ItemData) _then) = __$ItemDataCopyWithImpl;
@override @useResult
$Res call({
 String id, ItemKind kind, int stack, SeedKindData? seed
});


@override $SeedKindDataCopyWith<$Res>? get seed;

}
/// @nodoc
class __$ItemDataCopyWithImpl<$Res>
    implements _$ItemDataCopyWith<$Res> {
  __$ItemDataCopyWithImpl(this._self, this._then);

  final _ItemData _self;
  final $Res Function(_ItemData) _then;

/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? stack = null,Object? seed = freezed,}) {
  return _then(_ItemData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ItemKind,stack: null == stack ? _self.stack : stack // ignore: cast_nullable_to_non_nullable
as int,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as SeedKindData?,
  ));
}

/// Create a copy of ItemData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedKindDataCopyWith<$Res>? get seed {
    if (_self.seed == null) {
    return null;
  }

  return $SeedKindDataCopyWith<$Res>(_self.seed!, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}


/// @nodoc
mixin _$SeedKindData {

 PotatoType get type; Grade get grade;
/// Create a copy of SeedKindData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedKindDataCopyWith<SeedKindData> get copyWith => _$SeedKindDataCopyWithImpl<SeedKindData>(this as SeedKindData, _$identity);

  /// Serializes this SeedKindData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SeedKindData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedKindData&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeedKindData;
  return Object.hash(runtimeType,_this.type,_this.grade);
}

@override
String toString() {
  final _this = this as SeedKindData;
  return 'SeedKindData(type: ${_this.type}, grade: ${_this.grade})';
}


}

/// @nodoc
abstract mixin class $SeedKindDataCopyWith<$Res>  {
  factory $SeedKindDataCopyWith(SeedKindData value, $Res Function(SeedKindData) _then) = _$SeedKindDataCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade
});




}
/// @nodoc
class _$SeedKindDataCopyWithImpl<$Res>
    implements $SeedKindDataCopyWith<$Res> {
  _$SeedKindDataCopyWithImpl(this._self, this._then);

  final SeedKindData _self;
  final $Res Function(SeedKindData) _then;

/// Create a copy of SeedKindData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,}) {
  return _then(SeedKindData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedKindData].
extension SeedKindDataPatterns on SeedKindData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedKindData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedKindData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedKindData value)  $default,){
final _that = this;
switch (_that) {
case _SeedKindData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedKindData value)?  $default,){
final _that = this;
switch (_that) {
case _SeedKindData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedKindData() when $default != null:
return $default(_that.type,_that.grade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade)  $default,) {final _that = this;
switch (_that) {
case _SeedKindData():
return $default(_that.type,_that.grade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  Grade grade)?  $default,) {final _that = this;
switch (_that) {
case _SeedKindData() when $default != null:
return $default(_that.type,_that.grade);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeedKindData implements SeedKindData {
  const _SeedKindData({required this.type, required this.grade});
  factory _SeedKindData.fromJson(Map<String, dynamic> json) => _$SeedKindDataFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;

/// Create a copy of SeedKindData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedKindDataCopyWith<_SeedKindData> get copyWith => __$SeedKindDataCopyWithImpl<_SeedKindData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedKindDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedKindData&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade);
}

@override
String toString() {
    return 'SeedKindData(type: $type, grade: $grade)';
}


}

/// @nodoc
abstract mixin class _$SeedKindDataCopyWith<$Res> implements $SeedKindDataCopyWith<$Res> {
  factory _$SeedKindDataCopyWith(_SeedKindData value, $Res Function(_SeedKindData) _then) = __$SeedKindDataCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade
});




}
/// @nodoc
class __$SeedKindDataCopyWithImpl<$Res>
    implements _$SeedKindDataCopyWith<$Res> {
  __$SeedKindDataCopyWithImpl(this._self, this._then);

  final _SeedKindData _self;
  final $Res Function(_SeedKindData) _then;

/// Create a copy of SeedKindData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,}) {
  return _then(_SeedKindData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
  ));
}


}


/// @nodoc
mixin _$LootTableData {

 String get id; int get rollsMin; int get rollsMax; List<LootEntryData> get entries;
/// Create a copy of LootTableData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LootTableDataCopyWith<LootTableData> get copyWith => _$LootTableDataCopyWithImpl<LootTableData>(this as LootTableData, _$identity);

  /// Serializes this LootTableData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LootTableData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LootTableData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.rollsMin, _this.rollsMin) || other.rollsMin == _this.rollsMin)&&(identical(other.rollsMax, _this.rollsMax) || other.rollsMax == _this.rollsMax)&&const DeepCollectionEquality().equals(other.entries, _this.entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LootTableData;
  return Object.hash(runtimeType,_this.id,_this.rollsMin,_this.rollsMax,const DeepCollectionEquality().hash(_this.entries));
}

@override
String toString() {
  final _this = this as LootTableData;
  return 'LootTableData(id: ${_this.id}, rollsMin: ${_this.rollsMin}, rollsMax: ${_this.rollsMax}, entries: ${_this.entries})';
}


}

/// @nodoc
abstract mixin class $LootTableDataCopyWith<$Res>  {
  factory $LootTableDataCopyWith(LootTableData value, $Res Function(LootTableData) _then) = _$LootTableDataCopyWithImpl;
@useResult
$Res call({
 String id, int rollsMin, int rollsMax, List<LootEntryData> entries
});




}
/// @nodoc
class _$LootTableDataCopyWithImpl<$Res>
    implements $LootTableDataCopyWith<$Res> {
  _$LootTableDataCopyWithImpl(this._self, this._then);

  final LootTableData _self;
  final $Res Function(LootTableData) _then;

/// Create a copy of LootTableData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rollsMin = null,Object? rollsMax = null,Object? entries = null,}) {
  return _then(LootTableData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rollsMin: null == rollsMin ? _self.rollsMin : rollsMin // ignore: cast_nullable_to_non_nullable
as int,rollsMax: null == rollsMax ? _self.rollsMax : rollsMax // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<LootEntryData>,
  ));
}

}


/// Adds pattern-matching-related methods to [LootTableData].
extension LootTableDataPatterns on LootTableData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LootTableData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LootTableData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LootTableData value)  $default,){
final _that = this;
switch (_that) {
case _LootTableData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LootTableData value)?  $default,){
final _that = this;
switch (_that) {
case _LootTableData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int rollsMin,  int rollsMax,  List<LootEntryData> entries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LootTableData() when $default != null:
return $default(_that.id,_that.rollsMin,_that.rollsMax,_that.entries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int rollsMin,  int rollsMax,  List<LootEntryData> entries)  $default,) {final _that = this;
switch (_that) {
case _LootTableData():
return $default(_that.id,_that.rollsMin,_that.rollsMax,_that.entries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int rollsMin,  int rollsMax,  List<LootEntryData> entries)?  $default,) {final _that = this;
switch (_that) {
case _LootTableData() when $default != null:
return $default(_that.id,_that.rollsMin,_that.rollsMax,_that.entries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LootTableData implements LootTableData {
  const _LootTableData({required this.id, required this.rollsMin, required this.rollsMax, required  List<LootEntryData> entries}): _entries = entries;
  factory _LootTableData.fromJson(Map<String, dynamic> json) => _$LootTableDataFromJson(json);

@override final  String id;
@override final  int rollsMin;
@override final  int rollsMax;
 final  List<LootEntryData> _entries;
@override List<LootEntryData> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of LootTableData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LootTableDataCopyWith<_LootTableData> get copyWith => __$LootTableDataCopyWithImpl<_LootTableData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LootTableDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LootTableData&&(identical(other.id, id) || other.id == id)&&(identical(other.rollsMin, rollsMin) || other.rollsMin == rollsMin)&&(identical(other.rollsMax, rollsMax) || other.rollsMax == rollsMax)&&const DeepCollectionEquality().equals(other.entries, _entries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,rollsMin,rollsMax,const DeepCollectionEquality().hash(_entries));
}

@override
String toString() {
    return 'LootTableData(id: $id, rollsMin: $rollsMin, rollsMax: $rollsMax, entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$LootTableDataCopyWith<$Res> implements $LootTableDataCopyWith<$Res> {
  factory _$LootTableDataCopyWith(_LootTableData value, $Res Function(_LootTableData) _then) = __$LootTableDataCopyWithImpl;
@override @useResult
$Res call({
 String id, int rollsMin, int rollsMax, List<LootEntryData> entries
});




}
/// @nodoc
class __$LootTableDataCopyWithImpl<$Res>
    implements _$LootTableDataCopyWith<$Res> {
  __$LootTableDataCopyWithImpl(this._self, this._then);

  final _LootTableData _self;
  final $Res Function(_LootTableData) _then;

/// Create a copy of LootTableData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rollsMin = null,Object? rollsMax = null,Object? entries = null,}) {
  return _then(_LootTableData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rollsMin: null == rollsMin ? _self.rollsMin : rollsMin // ignore: cast_nullable_to_non_nullable
as int,rollsMax: null == rollsMax ? _self.rollsMax : rollsMax // ignore: cast_nullable_to_non_nullable
as int,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<LootEntryData>,
  ));
}


}


/// @nodoc
mixin _$LootEntryData {

 String get item; int get weight; int get min; int get max;
/// Create a copy of LootEntryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LootEntryDataCopyWith<LootEntryData> get copyWith => _$LootEntryDataCopyWithImpl<LootEntryData>(this as LootEntryData, _$identity);

  /// Serializes this LootEntryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LootEntryData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LootEntryData&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.weight, _this.weight) || other.weight == _this.weight)&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LootEntryData;
  return Object.hash(runtimeType,_this.item,_this.weight,_this.min,_this.max);
}

@override
String toString() {
  final _this = this as LootEntryData;
  return 'LootEntryData(item: ${_this.item}, weight: ${_this.weight}, min: ${_this.min}, max: ${_this.max})';
}


}

/// @nodoc
abstract mixin class $LootEntryDataCopyWith<$Res>  {
  factory $LootEntryDataCopyWith(LootEntryData value, $Res Function(LootEntryData) _then) = _$LootEntryDataCopyWithImpl;
@useResult
$Res call({
 String item, int weight, int min, int max
});




}
/// @nodoc
class _$LootEntryDataCopyWithImpl<$Res>
    implements $LootEntryDataCopyWith<$Res> {
  _$LootEntryDataCopyWithImpl(this._self, this._then);

  final LootEntryData _self;
  final $Res Function(LootEntryData) _then;

/// Create a copy of LootEntryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? weight = null,Object? min = null,Object? max = null,}) {
  return _then(LootEntryData(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LootEntryData].
extension LootEntryDataPatterns on LootEntryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LootEntryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LootEntryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LootEntryData value)  $default,){
final _that = this;
switch (_that) {
case _LootEntryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LootEntryData value)?  $default,){
final _that = this;
switch (_that) {
case _LootEntryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String item,  int weight,  int min,  int max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LootEntryData() when $default != null:
return $default(_that.item,_that.weight,_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String item,  int weight,  int min,  int max)  $default,) {final _that = this;
switch (_that) {
case _LootEntryData():
return $default(_that.item,_that.weight,_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String item,  int weight,  int min,  int max)?  $default,) {final _that = this;
switch (_that) {
case _LootEntryData() when $default != null:
return $default(_that.item,_that.weight,_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LootEntryData implements LootEntryData {
  const _LootEntryData({required this.item, required this.weight, required this.min, required this.max});
  factory _LootEntryData.fromJson(Map<String, dynamic> json) => _$LootEntryDataFromJson(json);

@override final  String item;
@override final  int weight;
@override final  int min;
@override final  int max;

/// Create a copy of LootEntryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LootEntryDataCopyWith<_LootEntryData> get copyWith => __$LootEntryDataCopyWithImpl<_LootEntryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LootEntryDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LootEntryData&&(identical(other.item, item) || other.item == item)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item,weight,min,max);
}

@override
String toString() {
    return 'LootEntryData(item: $item, weight: $weight, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$LootEntryDataCopyWith<$Res> implements $LootEntryDataCopyWith<$Res> {
  factory _$LootEntryDataCopyWith(_LootEntryData value, $Res Function(_LootEntryData) _then) = __$LootEntryDataCopyWithImpl;
@override @useResult
$Res call({
 String item, int weight, int min, int max
});




}
/// @nodoc
class __$LootEntryDataCopyWithImpl<$Res>
    implements _$LootEntryDataCopyWith<$Res> {
  __$LootEntryDataCopyWithImpl(this._self, this._then);

  final _LootEntryData _self;
  final $Res Function(_LootEntryData) _then;

/// Create a copy of LootEntryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? weight = null,Object? min = null,Object? max = null,}) {
  return _then(_LootEntryData(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
