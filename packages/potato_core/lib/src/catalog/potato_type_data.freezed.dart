// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'potato_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PotatoTypeData {

 PotatoType get type;/// Game time from planting a seed to a fully grown potato.
 int get growSeconds;/// Game time a fully grown potato lives before it dies and leaves a seed.
 int get lifespanSeconds;/// The building the farm needs before seeds of this type can be planted.
/// Null means the type can always be planted.
 String? get unlockBuilding;/// What a fully grown potato makes on the farm. Food potatoes only.
 ProductionData? get production;/// Baby potatoes each potato of this type eats every upkeep interval
/// (`rules.potatoes.upkeep_every_seconds`). Food potatoes eat nothing.
 int get upkeep;
/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PotatoTypeDataCopyWith<PotatoTypeData> get copyWith => _$PotatoTypeDataCopyWithImpl<PotatoTypeData>(this as PotatoTypeData, _$identity);

  /// Serializes this PotatoTypeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PotatoTypeData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PotatoTypeData&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.growSeconds, _this.growSeconds) || other.growSeconds == _this.growSeconds)&&(identical(other.lifespanSeconds, _this.lifespanSeconds) || other.lifespanSeconds == _this.lifespanSeconds)&&(identical(other.unlockBuilding, _this.unlockBuilding) || other.unlockBuilding == _this.unlockBuilding)&&(identical(other.production, _this.production) || other.production == _this.production)&&(identical(other.upkeep, _this.upkeep) || other.upkeep == _this.upkeep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PotatoTypeData;
  return Object.hash(runtimeType,_this.type,_this.growSeconds,_this.lifespanSeconds,_this.unlockBuilding,_this.production,_this.upkeep);
}

@override
String toString() {
  final _this = this as PotatoTypeData;
  return 'PotatoTypeData(type: ${_this.type}, growSeconds: ${_this.growSeconds}, lifespanSeconds: ${_this.lifespanSeconds}, unlockBuilding: ${_this.unlockBuilding}, production: ${_this.production}, upkeep: ${_this.upkeep})';
}


}

/// @nodoc
abstract mixin class $PotatoTypeDataCopyWith<$Res>  {
  factory $PotatoTypeDataCopyWith(PotatoTypeData value, $Res Function(PotatoTypeData) _then) = _$PotatoTypeDataCopyWithImpl;
@useResult
$Res call({
 PotatoType type, int growSeconds, int lifespanSeconds, String? unlockBuilding, ProductionData? production, int upkeep
});


$ProductionDataCopyWith<$Res>? get production;

}
/// @nodoc
class _$PotatoTypeDataCopyWithImpl<$Res>
    implements $PotatoTypeDataCopyWith<$Res> {
  _$PotatoTypeDataCopyWithImpl(this._self, this._then);

  final PotatoTypeData _self;
  final $Res Function(PotatoTypeData) _then;

/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? growSeconds = null,Object? lifespanSeconds = null,Object? unlockBuilding = freezed,Object? production = freezed,Object? upkeep = null,}) {
  return _then(PotatoTypeData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,growSeconds: null == growSeconds ? _self.growSeconds : growSeconds // ignore: cast_nullable_to_non_nullable
as int,lifespanSeconds: null == lifespanSeconds ? _self.lifespanSeconds : lifespanSeconds // ignore: cast_nullable_to_non_nullable
as int,unlockBuilding: freezed == unlockBuilding ? _self.unlockBuilding : unlockBuilding // ignore: cast_nullable_to_non_nullable
as String?,production: freezed == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as ProductionData?,upkeep: null == upkeep ? _self.upkeep : upkeep // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionDataCopyWith<$Res>? get production {
    if (_self.production == null) {
    return null;
  }

  return $ProductionDataCopyWith<$Res>(_self.production!, (value) {
    return _then(_self.copyWith(production: value));
  });
}
}


/// Adds pattern-matching-related methods to [PotatoTypeData].
extension PotatoTypeDataPatterns on PotatoTypeData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PotatoTypeData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PotatoTypeData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PotatoTypeData value)  $default,){
final _that = this;
switch (_that) {
case _PotatoTypeData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PotatoTypeData value)?  $default,){
final _that = this;
switch (_that) {
case _PotatoTypeData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  int growSeconds,  int lifespanSeconds,  String? unlockBuilding,  ProductionData? production,  int upkeep)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PotatoTypeData() when $default != null:
return $default(_that.type,_that.growSeconds,_that.lifespanSeconds,_that.unlockBuilding,_that.production,_that.upkeep);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  int growSeconds,  int lifespanSeconds,  String? unlockBuilding,  ProductionData? production,  int upkeep)  $default,) {final _that = this;
switch (_that) {
case _PotatoTypeData():
return $default(_that.type,_that.growSeconds,_that.lifespanSeconds,_that.unlockBuilding,_that.production,_that.upkeep);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  int growSeconds,  int lifespanSeconds,  String? unlockBuilding,  ProductionData? production,  int upkeep)?  $default,) {final _that = this;
switch (_that) {
case _PotatoTypeData() when $default != null:
return $default(_that.type,_that.growSeconds,_that.lifespanSeconds,_that.unlockBuilding,_that.production,_that.upkeep);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PotatoTypeData extends PotatoTypeData {
  const _PotatoTypeData({required this.type, required this.growSeconds, required this.lifespanSeconds, this.unlockBuilding, this.production, this.upkeep = 0}): super._();
  factory _PotatoTypeData.fromJson(Map<String, dynamic> json) => _$PotatoTypeDataFromJson(json);

@override final  PotatoType type;
/// Game time from planting a seed to a fully grown potato.
@override final  int growSeconds;
/// Game time a fully grown potato lives before it dies and leaves a seed.
@override final  int lifespanSeconds;
/// The building the farm needs before seeds of this type can be planted.
/// Null means the type can always be planted.
@override final  String? unlockBuilding;
/// What a fully grown potato makes on the farm. Food potatoes only.
@override final  ProductionData? production;
/// Baby potatoes each potato of this type eats every upkeep interval
/// (`rules.potatoes.upkeep_every_seconds`). Food potatoes eat nothing.
@override@JsonKey() final  int upkeep;

/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PotatoTypeDataCopyWith<_PotatoTypeData> get copyWith => __$PotatoTypeDataCopyWithImpl<_PotatoTypeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PotatoTypeDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PotatoTypeData&&(identical(other.type, type) || other.type == type)&&(identical(other.growSeconds, growSeconds) || other.growSeconds == growSeconds)&&(identical(other.lifespanSeconds, lifespanSeconds) || other.lifespanSeconds == lifespanSeconds)&&(identical(other.unlockBuilding, unlockBuilding) || other.unlockBuilding == unlockBuilding)&&(identical(other.production, production) || other.production == production)&&(identical(other.upkeep, upkeep) || other.upkeep == upkeep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,growSeconds,lifespanSeconds,unlockBuilding,production,upkeep);
}

@override
String toString() {
    return 'PotatoTypeData(type: $type, growSeconds: $growSeconds, lifespanSeconds: $lifespanSeconds, unlockBuilding: $unlockBuilding, production: $production, upkeep: $upkeep)';
}


}

/// @nodoc
abstract mixin class _$PotatoTypeDataCopyWith<$Res> implements $PotatoTypeDataCopyWith<$Res> {
  factory _$PotatoTypeDataCopyWith(_PotatoTypeData value, $Res Function(_PotatoTypeData) _then) = __$PotatoTypeDataCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, int growSeconds, int lifespanSeconds, String? unlockBuilding, ProductionData? production, int upkeep
});


@override $ProductionDataCopyWith<$Res>? get production;

}
/// @nodoc
class __$PotatoTypeDataCopyWithImpl<$Res>
    implements _$PotatoTypeDataCopyWith<$Res> {
  __$PotatoTypeDataCopyWithImpl(this._self, this._then);

  final _PotatoTypeData _self;
  final $Res Function(_PotatoTypeData) _then;

/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? growSeconds = null,Object? lifespanSeconds = null,Object? unlockBuilding = freezed,Object? production = freezed,Object? upkeep = null,}) {
  return _then(_PotatoTypeData(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,growSeconds: null == growSeconds ? _self.growSeconds : growSeconds // ignore: cast_nullable_to_non_nullable
as int,lifespanSeconds: null == lifespanSeconds ? _self.lifespanSeconds : lifespanSeconds // ignore: cast_nullable_to_non_nullable
as int,unlockBuilding: freezed == unlockBuilding ? _self.unlockBuilding : unlockBuilding // ignore: cast_nullable_to_non_nullable
as String?,production: freezed == production ? _self.production : production // ignore: cast_nullable_to_non_nullable
as ProductionData?,upkeep: null == upkeep ? _self.upkeep : upkeep // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PotatoTypeData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductionDataCopyWith<$Res>? get production {
    if (_self.production == null) {
    return null;
  }

  return $ProductionDataCopyWith<$Res>(_self.production!, (value) {
    return _then(_self.copyWith(production: value));
  });
}
}


/// @nodoc
mixin _$ProductionData {

/// Working time between two batches.
 int get everySeconds;/// Baby potatoes in one batch, by the potato's grade.
 Map<Grade, int> get amount;/// Baby potatoes kept on the potato until harvested. Batches past this
/// are lost, so a farm left alone stops piling up.
 int get storeMax;
/// Create a copy of ProductionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductionDataCopyWith<ProductionData> get copyWith => _$ProductionDataCopyWithImpl<ProductionData>(this as ProductionData, _$identity);

  /// Serializes this ProductionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProductionData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductionData&&(identical(other.everySeconds, _this.everySeconds) || other.everySeconds == _this.everySeconds)&&const DeepCollectionEquality().equals(other.amount, _this.amount)&&(identical(other.storeMax, _this.storeMax) || other.storeMax == _this.storeMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProductionData;
  return Object.hash(runtimeType,_this.everySeconds,const DeepCollectionEquality().hash(_this.amount),_this.storeMax);
}

@override
String toString() {
  final _this = this as ProductionData;
  return 'ProductionData(everySeconds: ${_this.everySeconds}, amount: ${_this.amount}, storeMax: ${_this.storeMax})';
}


}

/// @nodoc
abstract mixin class $ProductionDataCopyWith<$Res>  {
  factory $ProductionDataCopyWith(ProductionData value, $Res Function(ProductionData) _then) = _$ProductionDataCopyWithImpl;
@useResult
$Res call({
 int everySeconds, Map<Grade, int> amount, int storeMax
});




}
/// @nodoc
class _$ProductionDataCopyWithImpl<$Res>
    implements $ProductionDataCopyWith<$Res> {
  _$ProductionDataCopyWithImpl(this._self, this._then);

  final ProductionData _self;
  final $Res Function(ProductionData) _then;

/// Create a copy of ProductionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? everySeconds = null,Object? amount = null,Object? storeMax = null,}) {
  return _then(ProductionData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,storeMax: null == storeMax ? _self.storeMax : storeMax // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductionData].
extension ProductionDataPatterns on ProductionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductionData value)  $default,){
final _that = this;
switch (_that) {
case _ProductionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductionData value)?  $default,){
final _that = this;
switch (_that) {
case _ProductionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int everySeconds,  Map<Grade, int> amount,  int storeMax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductionData() when $default != null:
return $default(_that.everySeconds,_that.amount,_that.storeMax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int everySeconds,  Map<Grade, int> amount,  int storeMax)  $default,) {final _that = this;
switch (_that) {
case _ProductionData():
return $default(_that.everySeconds,_that.amount,_that.storeMax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int everySeconds,  Map<Grade, int> amount,  int storeMax)?  $default,) {final _that = this;
switch (_that) {
case _ProductionData() when $default != null:
return $default(_that.everySeconds,_that.amount,_that.storeMax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductionData implements ProductionData {
  const _ProductionData({required this.everySeconds, required  Map<Grade, int> amount, required this.storeMax}): _amount = amount;
  factory _ProductionData.fromJson(Map<String, dynamic> json) => _$ProductionDataFromJson(json);

/// Working time between two batches.
@override final  int everySeconds;
/// Baby potatoes in one batch, by the potato's grade.
 final  Map<Grade, int> _amount;
/// Baby potatoes in one batch, by the potato's grade.
@override Map<Grade, int> get amount {
  if (_amount is EqualUnmodifiableMapView) return _amount;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_amount);
}

/// Baby potatoes kept on the potato until harvested. Batches past this
/// are lost, so a farm left alone stops piling up.
@override final  int storeMax;

/// Create a copy of ProductionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductionDataCopyWith<_ProductionData> get copyWith => __$ProductionDataCopyWithImpl<_ProductionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductionDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductionData&&(identical(other.everySeconds, everySeconds) || other.everySeconds == everySeconds)&&const DeepCollectionEquality().equals(other.amount, _amount)&&(identical(other.storeMax, storeMax) || other.storeMax == storeMax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,everySeconds,const DeepCollectionEquality().hash(_amount),storeMax);
}

@override
String toString() {
    return 'ProductionData(everySeconds: $everySeconds, amount: $amount, storeMax: $storeMax)';
}


}

/// @nodoc
abstract mixin class _$ProductionDataCopyWith<$Res> implements $ProductionDataCopyWith<$Res> {
  factory _$ProductionDataCopyWith(_ProductionData value, $Res Function(_ProductionData) _then) = __$ProductionDataCopyWithImpl;
@override @useResult
$Res call({
 int everySeconds, Map<Grade, int> amount, int storeMax
});




}
/// @nodoc
class __$ProductionDataCopyWithImpl<$Res>
    implements _$ProductionDataCopyWith<$Res> {
  __$ProductionDataCopyWithImpl(this._self, this._then);

  final _ProductionData _self;
  final $Res Function(_ProductionData) _then;

/// Create a copy of ProductionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? everySeconds = null,Object? amount = null,Object? storeMax = null,}) {
  return _then(_ProductionData(
everySeconds: null == everySeconds ? _self.everySeconds : everySeconds // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self._amount : amount // ignore: cast_nullable_to_non_nullable
as Map<Grade, int>,storeMax: null == storeMax ? _self.storeMax : storeMax // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
