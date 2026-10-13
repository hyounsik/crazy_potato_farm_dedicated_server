// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbilityData {

/// `<pool>.<name>`.
 String get id; String get pool; List<AbilityEffectData> get effects; Rarity get rarity;/// Replaces the rarity's weight when set. Whole numbers only.
 int? get weight;
/// Create a copy of AbilityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityDataCopyWith<AbilityData> get copyWith => _$AbilityDataCopyWithImpl<AbilityData>(this as AbilityData, _$identity);

  /// Serializes this AbilityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AbilityData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.pool, _this.pool) || other.pool == _this.pool)&&const DeepCollectionEquality().equals(other.effects, _this.effects)&&(identical(other.rarity, _this.rarity) || other.rarity == _this.rarity)&&(identical(other.weight, _this.weight) || other.weight == _this.weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AbilityData;
  return Object.hash(runtimeType,_this.id,_this.pool,const DeepCollectionEquality().hash(_this.effects),_this.rarity,_this.weight);
}

@override
String toString() {
  final _this = this as AbilityData;
  return 'AbilityData(id: ${_this.id}, pool: ${_this.pool}, effects: ${_this.effects}, rarity: ${_this.rarity}, weight: ${_this.weight})';
}


}

/// @nodoc
abstract mixin class $AbilityDataCopyWith<$Res>  {
  factory $AbilityDataCopyWith(AbilityData value, $Res Function(AbilityData) _then) = _$AbilityDataCopyWithImpl;
@useResult
$Res call({
 String id, String pool, List<AbilityEffectData> effects, Rarity rarity, int? weight
});




}
/// @nodoc
class _$AbilityDataCopyWithImpl<$Res>
    implements $AbilityDataCopyWith<$Res> {
  _$AbilityDataCopyWithImpl(this._self, this._then);

  final AbilityData _self;
  final $Res Function(AbilityData) _then;

/// Create a copy of AbilityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? pool = null,Object? effects = null,Object? rarity = null,Object? weight = freezed,}) {
  return _then(AbilityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pool: null == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as String,effects: null == effects ? _self.effects : effects // ignore: cast_nullable_to_non_nullable
as List<AbilityEffectData>,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as Rarity,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityData].
extension AbilityDataPatterns on AbilityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityData value)  $default,){
final _that = this;
switch (_that) {
case _AbilityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityData value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String pool,  List<AbilityEffectData> effects,  Rarity rarity,  int? weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityData() when $default != null:
return $default(_that.id,_that.pool,_that.effects,_that.rarity,_that.weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String pool,  List<AbilityEffectData> effects,  Rarity rarity,  int? weight)  $default,) {final _that = this;
switch (_that) {
case _AbilityData():
return $default(_that.id,_that.pool,_that.effects,_that.rarity,_that.weight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String pool,  List<AbilityEffectData> effects,  Rarity rarity,  int? weight)?  $default,) {final _that = this;
switch (_that) {
case _AbilityData() when $default != null:
return $default(_that.id,_that.pool,_that.effects,_that.rarity,_that.weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityData implements AbilityData {
  const _AbilityData({required this.id, required this.pool, required  List<AbilityEffectData> effects, required this.rarity, this.weight}): _effects = effects;
  factory _AbilityData.fromJson(Map<String, dynamic> json) => _$AbilityDataFromJson(json);

/// `<pool>.<name>`.
@override final  String id;
@override final  String pool;
 final  List<AbilityEffectData> _effects;
@override List<AbilityEffectData> get effects {
  if (_effects is EqualUnmodifiableListView) return _effects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_effects);
}

@override final  Rarity rarity;
/// Replaces the rarity's weight when set. Whole numbers only.
@override final  int? weight;

/// Create a copy of AbilityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityDataCopyWith<_AbilityData> get copyWith => __$AbilityDataCopyWithImpl<_AbilityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityData&&(identical(other.id, id) || other.id == id)&&(identical(other.pool, pool) || other.pool == pool)&&const DeepCollectionEquality().equals(other.effects, _effects)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,pool,const DeepCollectionEquality().hash(_effects),rarity,weight);
}

@override
String toString() {
    return 'AbilityData(id: $id, pool: $pool, effects: $effects, rarity: $rarity, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$AbilityDataCopyWith<$Res> implements $AbilityDataCopyWith<$Res> {
  factory _$AbilityDataCopyWith(_AbilityData value, $Res Function(_AbilityData) _then) = __$AbilityDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String pool, List<AbilityEffectData> effects, Rarity rarity, int? weight
});




}
/// @nodoc
class __$AbilityDataCopyWithImpl<$Res>
    implements _$AbilityDataCopyWith<$Res> {
  __$AbilityDataCopyWithImpl(this._self, this._then);

  final _AbilityData _self;
  final $Res Function(_AbilityData) _then;

/// Create a copy of AbilityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? pool = null,Object? effects = null,Object? rarity = null,Object? weight = freezed,}) {
  return _then(_AbilityData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,pool: null == pool ? _self.pool : pool // ignore: cast_nullable_to_non_nullable
as String,effects: null == effects ? _self._effects : effects // ignore: cast_nullable_to_non_nullable
as List<AbilityEffectData>,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as Rarity,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AbilityEffectData {

 EffectContext get context; EffectTarget get target; EffectKind get kind;/// For [EffectKind.stat].
 String? get stat; EffectOp? get op;/// Null until the balance phase sets it; [tempValue] stands in meanwhile.
 double? get value; double? get tempValue;/// For [EffectKind.periodic]: every so many seconds, run [action].
/// Null until the balance phase; [tempIntervalSec] stands in.
 int? get intervalSec; int? get tempIntervalSec; String? get action;/// The line a `say` action shows. Screens only; no rule reads it.
 String? get text;
/// Create a copy of AbilityEffectData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityEffectDataCopyWith<AbilityEffectData> get copyWith => _$AbilityEffectDataCopyWithImpl<AbilityEffectData>(this as AbilityEffectData, _$identity);

  /// Serializes this AbilityEffectData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AbilityEffectData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityEffectData&&(identical(other.context, _this.context) || other.context == _this.context)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.stat, _this.stat) || other.stat == _this.stat)&&(identical(other.op, _this.op) || other.op == _this.op)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.tempValue, _this.tempValue) || other.tempValue == _this.tempValue)&&(identical(other.intervalSec, _this.intervalSec) || other.intervalSec == _this.intervalSec)&&(identical(other.tempIntervalSec, _this.tempIntervalSec) || other.tempIntervalSec == _this.tempIntervalSec)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.text, _this.text) || other.text == _this.text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AbilityEffectData;
  return Object.hash(runtimeType,_this.context,_this.target,_this.kind,_this.stat,_this.op,_this.value,_this.tempValue,_this.intervalSec,_this.tempIntervalSec,_this.action,_this.text);
}

@override
String toString() {
  final _this = this as AbilityEffectData;
  return 'AbilityEffectData(context: ${_this.context}, target: ${_this.target}, kind: ${_this.kind}, stat: ${_this.stat}, op: ${_this.op}, value: ${_this.value}, tempValue: ${_this.tempValue}, intervalSec: ${_this.intervalSec}, tempIntervalSec: ${_this.tempIntervalSec}, action: ${_this.action}, text: ${_this.text})';
}


}

/// @nodoc
abstract mixin class $AbilityEffectDataCopyWith<$Res>  {
  factory $AbilityEffectDataCopyWith(AbilityEffectData value, $Res Function(AbilityEffectData) _then) = _$AbilityEffectDataCopyWithImpl;
@useResult
$Res call({
 EffectContext context, EffectTarget target, EffectKind kind, String? stat, EffectOp? op, double? value, double? tempValue, int? intervalSec, int? tempIntervalSec, String? action, String? text
});




}
/// @nodoc
class _$AbilityEffectDataCopyWithImpl<$Res>
    implements $AbilityEffectDataCopyWith<$Res> {
  _$AbilityEffectDataCopyWithImpl(this._self, this._then);

  final AbilityEffectData _self;
  final $Res Function(AbilityEffectData) _then;

/// Create a copy of AbilityEffectData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? context = null,Object? target = null,Object? kind = null,Object? stat = freezed,Object? op = freezed,Object? value = freezed,Object? tempValue = freezed,Object? intervalSec = freezed,Object? tempIntervalSec = freezed,Object? action = freezed,Object? text = freezed,}) {
  return _then(AbilityEffectData(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as EffectContext,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as EffectTarget,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EffectKind,stat: freezed == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String?,op: freezed == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as EffectOp?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,tempValue: freezed == tempValue ? _self.tempValue : tempValue // ignore: cast_nullable_to_non_nullable
as double?,intervalSec: freezed == intervalSec ? _self.intervalSec : intervalSec // ignore: cast_nullable_to_non_nullable
as int?,tempIntervalSec: freezed == tempIntervalSec ? _self.tempIntervalSec : tempIntervalSec // ignore: cast_nullable_to_non_nullable
as int?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityEffectData].
extension AbilityEffectDataPatterns on AbilityEffectData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityEffectData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityEffectData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityEffectData value)  $default,){
final _that = this;
switch (_that) {
case _AbilityEffectData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityEffectData value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityEffectData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EffectContext context,  EffectTarget target,  EffectKind kind,  String? stat,  EffectOp? op,  double? value,  double? tempValue,  int? intervalSec,  int? tempIntervalSec,  String? action,  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityEffectData() when $default != null:
return $default(_that.context,_that.target,_that.kind,_that.stat,_that.op,_that.value,_that.tempValue,_that.intervalSec,_that.tempIntervalSec,_that.action,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EffectContext context,  EffectTarget target,  EffectKind kind,  String? stat,  EffectOp? op,  double? value,  double? tempValue,  int? intervalSec,  int? tempIntervalSec,  String? action,  String? text)  $default,) {final _that = this;
switch (_that) {
case _AbilityEffectData():
return $default(_that.context,_that.target,_that.kind,_that.stat,_that.op,_that.value,_that.tempValue,_that.intervalSec,_that.tempIntervalSec,_that.action,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EffectContext context,  EffectTarget target,  EffectKind kind,  String? stat,  EffectOp? op,  double? value,  double? tempValue,  int? intervalSec,  int? tempIntervalSec,  String? action,  String? text)?  $default,) {final _that = this;
switch (_that) {
case _AbilityEffectData() when $default != null:
return $default(_that.context,_that.target,_that.kind,_that.stat,_that.op,_that.value,_that.tempValue,_that.intervalSec,_that.tempIntervalSec,_that.action,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityEffectData extends AbilityEffectData {
  const _AbilityEffectData({required this.context, required this.target, required this.kind, this.stat, this.op, this.value, this.tempValue, this.intervalSec, this.tempIntervalSec, this.action, this.text}): super._();
  factory _AbilityEffectData.fromJson(Map<String, dynamic> json) => _$AbilityEffectDataFromJson(json);

@override final  EffectContext context;
@override final  EffectTarget target;
@override final  EffectKind kind;
/// For [EffectKind.stat].
@override final  String? stat;
@override final  EffectOp? op;
/// Null until the balance phase sets it; [tempValue] stands in meanwhile.
@override final  double? value;
@override final  double? tempValue;
/// For [EffectKind.periodic]: every so many seconds, run [action].
/// Null until the balance phase; [tempIntervalSec] stands in.
@override final  int? intervalSec;
@override final  int? tempIntervalSec;
@override final  String? action;
/// The line a `say` action shows. Screens only; no rule reads it.
@override final  String? text;

/// Create a copy of AbilityEffectData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityEffectDataCopyWith<_AbilityEffectData> get copyWith => __$AbilityEffectDataCopyWithImpl<_AbilityEffectData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityEffectDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityEffectData&&(identical(other.context, context) || other.context == context)&&(identical(other.target, target) || other.target == target)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.stat, stat) || other.stat == stat)&&(identical(other.op, op) || other.op == op)&&(identical(other.value, value) || other.value == value)&&(identical(other.tempValue, tempValue) || other.tempValue == tempValue)&&(identical(other.intervalSec, intervalSec) || other.intervalSec == intervalSec)&&(identical(other.tempIntervalSec, tempIntervalSec) || other.tempIntervalSec == tempIntervalSec)&&(identical(other.action, action) || other.action == action)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,context,target,kind,stat,op,value,tempValue,intervalSec,tempIntervalSec,action,text);
}

@override
String toString() {
    return 'AbilityEffectData(context: $context, target: $target, kind: $kind, stat: $stat, op: $op, value: $value, tempValue: $tempValue, intervalSec: $intervalSec, tempIntervalSec: $tempIntervalSec, action: $action, text: $text)';
}


}

/// @nodoc
abstract mixin class _$AbilityEffectDataCopyWith<$Res> implements $AbilityEffectDataCopyWith<$Res> {
  factory _$AbilityEffectDataCopyWith(_AbilityEffectData value, $Res Function(_AbilityEffectData) _then) = __$AbilityEffectDataCopyWithImpl;
@override @useResult
$Res call({
 EffectContext context, EffectTarget target, EffectKind kind, String? stat, EffectOp? op, double? value, double? tempValue, int? intervalSec, int? tempIntervalSec, String? action, String? text
});




}
/// @nodoc
class __$AbilityEffectDataCopyWithImpl<$Res>
    implements _$AbilityEffectDataCopyWith<$Res> {
  __$AbilityEffectDataCopyWithImpl(this._self, this._then);

  final _AbilityEffectData _self;
  final $Res Function(_AbilityEffectData) _then;

/// Create a copy of AbilityEffectData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? context = null,Object? target = null,Object? kind = null,Object? stat = freezed,Object? op = freezed,Object? value = freezed,Object? tempValue = freezed,Object? intervalSec = freezed,Object? tempIntervalSec = freezed,Object? action = freezed,Object? text = freezed,}) {
  return _then(_AbilityEffectData(
context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as EffectContext,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as EffectTarget,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as EffectKind,stat: freezed == stat ? _self.stat : stat // ignore: cast_nullable_to_non_nullable
as String?,op: freezed == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as EffectOp?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,tempValue: freezed == tempValue ? _self.tempValue : tempValue // ignore: cast_nullable_to_non_nullable
as double?,intervalSec: freezed == intervalSec ? _self.intervalSec : intervalSec // ignore: cast_nullable_to_non_nullable
as int?,tempIntervalSec: freezed == tempIntervalSec ? _self.tempIntervalSec : tempIntervalSec // ignore: cast_nullable_to_non_nullable
as int?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AbilityPoolData {

 String get id; List<PotatoType> get potatoTypes;
/// Create a copy of AbilityPoolData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityPoolDataCopyWith<AbilityPoolData> get copyWith => _$AbilityPoolDataCopyWithImpl<AbilityPoolData>(this as AbilityPoolData, _$identity);

  /// Serializes this AbilityPoolData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AbilityPoolData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityPoolData&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.potatoTypes, _this.potatoTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AbilityPoolData;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.potatoTypes));
}

@override
String toString() {
  final _this = this as AbilityPoolData;
  return 'AbilityPoolData(id: ${_this.id}, potatoTypes: ${_this.potatoTypes})';
}


}

/// @nodoc
abstract mixin class $AbilityPoolDataCopyWith<$Res>  {
  factory $AbilityPoolDataCopyWith(AbilityPoolData value, $Res Function(AbilityPoolData) _then) = _$AbilityPoolDataCopyWithImpl;
@useResult
$Res call({
 String id, List<PotatoType> potatoTypes
});




}
/// @nodoc
class _$AbilityPoolDataCopyWithImpl<$Res>
    implements $AbilityPoolDataCopyWith<$Res> {
  _$AbilityPoolDataCopyWithImpl(this._self, this._then);

  final AbilityPoolData _self;
  final $Res Function(AbilityPoolData) _then;

/// Create a copy of AbilityPoolData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? potatoTypes = null,}) {
  return _then(AbilityPoolData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,potatoTypes: null == potatoTypes ? _self.potatoTypes : potatoTypes // ignore: cast_nullable_to_non_nullable
as List<PotatoType>,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityPoolData].
extension AbilityPoolDataPatterns on AbilityPoolData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityPoolData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityPoolData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityPoolData value)  $default,){
final _that = this;
switch (_that) {
case _AbilityPoolData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityPoolData value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityPoolData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<PotatoType> potatoTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityPoolData() when $default != null:
return $default(_that.id,_that.potatoTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<PotatoType> potatoTypes)  $default,) {final _that = this;
switch (_that) {
case _AbilityPoolData():
return $default(_that.id,_that.potatoTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<PotatoType> potatoTypes)?  $default,) {final _that = this;
switch (_that) {
case _AbilityPoolData() when $default != null:
return $default(_that.id,_that.potatoTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityPoolData implements AbilityPoolData {
  const _AbilityPoolData({required this.id, required  List<PotatoType> potatoTypes}): _potatoTypes = potatoTypes;
  factory _AbilityPoolData.fromJson(Map<String, dynamic> json) => _$AbilityPoolDataFromJson(json);

@override final  String id;
 final  List<PotatoType> _potatoTypes;
@override List<PotatoType> get potatoTypes {
  if (_potatoTypes is EqualUnmodifiableListView) return _potatoTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_potatoTypes);
}


/// Create a copy of AbilityPoolData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityPoolDataCopyWith<_AbilityPoolData> get copyWith => __$AbilityPoolDataCopyWithImpl<_AbilityPoolData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityPoolDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityPoolData&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.potatoTypes, _potatoTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_potatoTypes));
}

@override
String toString() {
    return 'AbilityPoolData(id: $id, potatoTypes: $potatoTypes)';
}


}

/// @nodoc
abstract mixin class _$AbilityPoolDataCopyWith<$Res> implements $AbilityPoolDataCopyWith<$Res> {
  factory _$AbilityPoolDataCopyWith(_AbilityPoolData value, $Res Function(_AbilityPoolData) _then) = __$AbilityPoolDataCopyWithImpl;
@override @useResult
$Res call({
 String id, List<PotatoType> potatoTypes
});




}
/// @nodoc
class __$AbilityPoolDataCopyWithImpl<$Res>
    implements _$AbilityPoolDataCopyWith<$Res> {
  __$AbilityPoolDataCopyWithImpl(this._self, this._then);

  final _AbilityPoolData _self;
  final $Res Function(_AbilityPoolData) _then;

/// Create a copy of AbilityPoolData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? potatoTypes = null,}) {
  return _then(_AbilityPoolData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,potatoTypes: null == potatoTypes ? _self._potatoTypes : potatoTypes // ignore: cast_nullable_to_non_nullable
as List<PotatoType>,
  ));
}


}


/// @nodoc
mixin _$AbilityRulesData {

/// Ability slots by grade; the first is the seed's own.
 Map<Grade, int> get slotsByGrade;/// For slots after the first: odds of drawing from the shared pool
/// against the type's own.
 ExtraSlotPoolWeightData get extraSlotPoolWeight; Map<Rarity, int> get rarityWeights;
/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityRulesDataCopyWith<AbilityRulesData> get copyWith => _$AbilityRulesDataCopyWithImpl<AbilityRulesData>(this as AbilityRulesData, _$identity);

  /// Serializes this AbilityRulesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AbilityRulesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityRulesData&&const DeepCollectionEquality().equals(other.slotsByGrade, _this.slotsByGrade)&&(identical(other.extraSlotPoolWeight, _this.extraSlotPoolWeight) || other.extraSlotPoolWeight == _this.extraSlotPoolWeight)&&const DeepCollectionEquality().equals(other.rarityWeights, _this.rarityWeights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AbilityRulesData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.slotsByGrade),_this.extraSlotPoolWeight,const DeepCollectionEquality().hash(_this.rarityWeights));
}

@override
String toString() {
  final _this = this as AbilityRulesData;
  return 'AbilityRulesData(slotsByGrade: ${_this.slotsByGrade}, extraSlotPoolWeight: ${_this.extraSlotPoolWeight}, rarityWeights: ${_this.rarityWeights})';
}


}

/// @nodoc
abstract mixin class $AbilityRulesDataCopyWith<$Res>  {
  factory $AbilityRulesDataCopyWith(AbilityRulesData value, $Res Function(AbilityRulesData) _then) = _$AbilityRulesDataCopyWithImpl;
@useResult
$Res call({
 Map<Grade, int> slotsByGrade, ExtraSlotPoolWeightData extraSlotPoolWeight, Map<Rarity, int> rarityWeights
});


$ExtraSlotPoolWeightDataCopyWith<$Res> get extraSlotPoolWeight;

}
/// @nodoc
class _$AbilityRulesDataCopyWithImpl<$Res>
    implements $AbilityRulesDataCopyWith<$Res> {
  _$AbilityRulesDataCopyWithImpl(this._self, this._then);

  final AbilityRulesData _self;
  final $Res Function(AbilityRulesData) _then;

/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slotsByGrade = null,Object? extraSlotPoolWeight = null,Object? rarityWeights = null,}) {
  return _then(AbilityRulesData(
slotsByGrade: null == slotsByGrade ? _self.slotsByGrade : slotsByGrade // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,extraSlotPoolWeight: null == extraSlotPoolWeight ? _self.extraSlotPoolWeight : extraSlotPoolWeight // ignore: cast_nullable_to_non_nullable
as ExtraSlotPoolWeightData,rarityWeights: null == rarityWeights ? _self.rarityWeights : rarityWeights // ignore: cast_nullable_to_non_nullable
as Map<Rarity, int>,
  ));
}
/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtraSlotPoolWeightDataCopyWith<$Res> get extraSlotPoolWeight {
  
  return $ExtraSlotPoolWeightDataCopyWith<$Res>(_self.extraSlotPoolWeight, (value) {
    return _then(_self.copyWith(extraSlotPoolWeight: value));
  });
}
}


/// Adds pattern-matching-related methods to [AbilityRulesData].
extension AbilityRulesDataPatterns on AbilityRulesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilityRulesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilityRulesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilityRulesData value)  $default,){
final _that = this;
switch (_that) {
case _AbilityRulesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilityRulesData value)?  $default,){
final _that = this;
switch (_that) {
case _AbilityRulesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<Grade, int> slotsByGrade,  ExtraSlotPoolWeightData extraSlotPoolWeight,  Map<Rarity, int> rarityWeights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilityRulesData() when $default != null:
return $default(_that.slotsByGrade,_that.extraSlotPoolWeight,_that.rarityWeights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<Grade, int> slotsByGrade,  ExtraSlotPoolWeightData extraSlotPoolWeight,  Map<Rarity, int> rarityWeights)  $default,) {final _that = this;
switch (_that) {
case _AbilityRulesData():
return $default(_that.slotsByGrade,_that.extraSlotPoolWeight,_that.rarityWeights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<Grade, int> slotsByGrade,  ExtraSlotPoolWeightData extraSlotPoolWeight,  Map<Rarity, int> rarityWeights)?  $default,) {final _that = this;
switch (_that) {
case _AbilityRulesData() when $default != null:
return $default(_that.slotsByGrade,_that.extraSlotPoolWeight,_that.rarityWeights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilityRulesData implements AbilityRulesData {
  const _AbilityRulesData({required  Map<Grade, int> slotsByGrade, required this.extraSlotPoolWeight, required  Map<Rarity, int> rarityWeights}): _slotsByGrade = slotsByGrade,_rarityWeights = rarityWeights;
  factory _AbilityRulesData.fromJson(Map<String, dynamic> json) => _$AbilityRulesDataFromJson(json);

/// Ability slots by grade; the first is the seed's own.
 final  Map<Grade, int> _slotsByGrade;
/// Ability slots by grade; the first is the seed's own.
@override Map<Grade, int> get slotsByGrade {
  if (_slotsByGrade is EqualUnmodifiableMapView) return _slotsByGrade;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_slotsByGrade);
}

/// For slots after the first: odds of drawing from the shared pool
/// against the type's own.
@override final  ExtraSlotPoolWeightData extraSlotPoolWeight;
 final  Map<Rarity, int> _rarityWeights;
@override Map<Rarity, int> get rarityWeights {
  if (_rarityWeights is EqualUnmodifiableMapView) return _rarityWeights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rarityWeights);
}


/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilityRulesDataCopyWith<_AbilityRulesData> get copyWith => __$AbilityRulesDataCopyWithImpl<_AbilityRulesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilityRulesDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilityRulesData&&const DeepCollectionEquality().equals(other.slotsByGrade, _slotsByGrade)&&(identical(other.extraSlotPoolWeight, extraSlotPoolWeight) || other.extraSlotPoolWeight == extraSlotPoolWeight)&&const DeepCollectionEquality().equals(other.rarityWeights, _rarityWeights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_slotsByGrade),extraSlotPoolWeight,const DeepCollectionEquality().hash(_rarityWeights));
}

@override
String toString() {
    return 'AbilityRulesData(slotsByGrade: $slotsByGrade, extraSlotPoolWeight: $extraSlotPoolWeight, rarityWeights: $rarityWeights)';
}


}

/// @nodoc
abstract mixin class _$AbilityRulesDataCopyWith<$Res> implements $AbilityRulesDataCopyWith<$Res> {
  factory _$AbilityRulesDataCopyWith(_AbilityRulesData value, $Res Function(_AbilityRulesData) _then) = __$AbilityRulesDataCopyWithImpl;
@override @useResult
$Res call({
 Map<Grade, int> slotsByGrade, ExtraSlotPoolWeightData extraSlotPoolWeight, Map<Rarity, int> rarityWeights
});


@override $ExtraSlotPoolWeightDataCopyWith<$Res> get extraSlotPoolWeight;

}
/// @nodoc
class __$AbilityRulesDataCopyWithImpl<$Res>
    implements _$AbilityRulesDataCopyWith<$Res> {
  __$AbilityRulesDataCopyWithImpl(this._self, this._then);

  final _AbilityRulesData _self;
  final $Res Function(_AbilityRulesData) _then;

/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slotsByGrade = null,Object? extraSlotPoolWeight = null,Object? rarityWeights = null,}) {
  return _then(_AbilityRulesData(
slotsByGrade: null == slotsByGrade ? _self._slotsByGrade : slotsByGrade // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,extraSlotPoolWeight: null == extraSlotPoolWeight ? _self.extraSlotPoolWeight : extraSlotPoolWeight // ignore: cast_nullable_to_non_nullable
as ExtraSlotPoolWeightData,rarityWeights: null == rarityWeights ? _self._rarityWeights : rarityWeights // ignore: cast_nullable_to_non_nullable
as Map<Rarity, int>,
  ));
}

/// Create a copy of AbilityRulesData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExtraSlotPoolWeightDataCopyWith<$Res> get extraSlotPoolWeight {
  
  return $ExtraSlotPoolWeightDataCopyWith<$Res>(_self.extraSlotPoolWeight, (value) {
    return _then(_self.copyWith(extraSlotPoolWeight: value));
  });
}
}


/// @nodoc
mixin _$ExtraSlotPoolWeightData {

 int get common; int get unique;
/// Create a copy of ExtraSlotPoolWeightData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtraSlotPoolWeightDataCopyWith<ExtraSlotPoolWeightData> get copyWith => _$ExtraSlotPoolWeightDataCopyWithImpl<ExtraSlotPoolWeightData>(this as ExtraSlotPoolWeightData, _$identity);

  /// Serializes this ExtraSlotPoolWeightData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ExtraSlotPoolWeightData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtraSlotPoolWeightData&&(identical(other.common, _this.common) || other.common == _this.common)&&(identical(other.unique, _this.unique) || other.unique == _this.unique));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ExtraSlotPoolWeightData;
  return Object.hash(runtimeType,_this.common,_this.unique);
}

@override
String toString() {
  final _this = this as ExtraSlotPoolWeightData;
  return 'ExtraSlotPoolWeightData(common: ${_this.common}, unique: ${_this.unique})';
}


}

/// @nodoc
abstract mixin class $ExtraSlotPoolWeightDataCopyWith<$Res>  {
  factory $ExtraSlotPoolWeightDataCopyWith(ExtraSlotPoolWeightData value, $Res Function(ExtraSlotPoolWeightData) _then) = _$ExtraSlotPoolWeightDataCopyWithImpl;
@useResult
$Res call({
 int common, int unique
});




}
/// @nodoc
class _$ExtraSlotPoolWeightDataCopyWithImpl<$Res>
    implements $ExtraSlotPoolWeightDataCopyWith<$Res> {
  _$ExtraSlotPoolWeightDataCopyWithImpl(this._self, this._then);

  final ExtraSlotPoolWeightData _self;
  final $Res Function(ExtraSlotPoolWeightData) _then;

/// Create a copy of ExtraSlotPoolWeightData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? common = null,Object? unique = null,}) {
  return _then(ExtraSlotPoolWeightData(
common: null == common ? _self.common : common // ignore: cast_nullable_to_non_nullable
as int,unique: null == unique ? _self.unique : unique // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExtraSlotPoolWeightData].
extension ExtraSlotPoolWeightDataPatterns on ExtraSlotPoolWeightData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtraSlotPoolWeightData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtraSlotPoolWeightData value)  $default,){
final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtraSlotPoolWeightData value)?  $default,){
final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int common,  int unique)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData() when $default != null:
return $default(_that.common,_that.unique);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int common,  int unique)  $default,) {final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData():
return $default(_that.common,_that.unique);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int common,  int unique)?  $default,) {final _that = this;
switch (_that) {
case _ExtraSlotPoolWeightData() when $default != null:
return $default(_that.common,_that.unique);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtraSlotPoolWeightData implements ExtraSlotPoolWeightData {
  const _ExtraSlotPoolWeightData({required this.common, required this.unique});
  factory _ExtraSlotPoolWeightData.fromJson(Map<String, dynamic> json) => _$ExtraSlotPoolWeightDataFromJson(json);

@override final  int common;
@override final  int unique;

/// Create a copy of ExtraSlotPoolWeightData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtraSlotPoolWeightDataCopyWith<_ExtraSlotPoolWeightData> get copyWith => __$ExtraSlotPoolWeightDataCopyWithImpl<_ExtraSlotPoolWeightData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtraSlotPoolWeightDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtraSlotPoolWeightData&&(identical(other.common, common) || other.common == common)&&(identical(other.unique, unique) || other.unique == unique));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,common,unique);
}

@override
String toString() {
    return 'ExtraSlotPoolWeightData(common: $common, unique: $unique)';
}


}

/// @nodoc
abstract mixin class _$ExtraSlotPoolWeightDataCopyWith<$Res> implements $ExtraSlotPoolWeightDataCopyWith<$Res> {
  factory _$ExtraSlotPoolWeightDataCopyWith(_ExtraSlotPoolWeightData value, $Res Function(_ExtraSlotPoolWeightData) _then) = __$ExtraSlotPoolWeightDataCopyWithImpl;
@override @useResult
$Res call({
 int common, int unique
});




}
/// @nodoc
class __$ExtraSlotPoolWeightDataCopyWithImpl<$Res>
    implements _$ExtraSlotPoolWeightDataCopyWith<$Res> {
  __$ExtraSlotPoolWeightDataCopyWithImpl(this._self, this._then);

  final _ExtraSlotPoolWeightData _self;
  final $Res Function(_ExtraSlotPoolWeightData) _then;

/// Create a copy of ExtraSlotPoolWeightData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? common = null,Object? unique = null,}) {
  return _then(_ExtraSlotPoolWeightData(
common: null == common ? _self.common : common // ignore: cast_nullable_to_non_nullable
as int,unique: null == unique ? _self.unique : unique // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
