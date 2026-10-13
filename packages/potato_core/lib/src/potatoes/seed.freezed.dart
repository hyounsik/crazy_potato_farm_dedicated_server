// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Seed {

 PotatoType get type; Grade get grade;/// The score of the region it came from; sets how strong it grows.
 int get level;/// The id of its first ability, from its type's own pool.
 String get ability;/// Combat seeds only.
 CombatStyle? get style;
/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedCopyWith<Seed> get copyWith => _$SeedCopyWithImpl<Seed>(this as Seed, _$identity);

  /// Serializes this Seed to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Seed;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seed&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.ability, _this.ability) || other.ability == _this.ability)&&(identical(other.style, _this.style) || other.style == _this.style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Seed;
  return Object.hash(runtimeType,_this.type,_this.grade,_this.level,_this.ability,_this.style);
}

@override
String toString() {
  final _this = this as Seed;
  return 'Seed(type: ${_this.type}, grade: ${_this.grade}, level: ${_this.level}, ability: ${_this.ability}, style: ${_this.style})';
}


}

/// @nodoc
abstract mixin class $SeedCopyWith<$Res>  {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) _then) = _$SeedCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade, int level, String ability, CombatStyle? style
});




}
/// @nodoc
class _$SeedCopyWithImpl<$Res>
    implements $SeedCopyWith<$Res> {
  _$SeedCopyWithImpl(this._self, this._then);

  final Seed _self;
  final $Res Function(Seed) _then;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,Object? level = null,Object? ability = null,Object? style = freezed,}) {
  return _then(Seed(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as String,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
  ));
}

}


/// Adds pattern-matching-related methods to [Seed].
extension SeedPatterns on Seed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seed value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seed() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seed value)  $default,){
final _that = this;
switch (_that) {
case _Seed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seed value)?  $default,){
final _that = this;
switch (_that) {
case _Seed() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int level,  String ability,  CombatStyle? style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seed() when $default != null:
return $default(_that.type,_that.grade,_that.level,_that.ability,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade,  int level,  String ability,  CombatStyle? style)  $default,) {final _that = this;
switch (_that) {
case _Seed():
return $default(_that.type,_that.grade,_that.level,_that.ability,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PotatoType type,  Grade grade,  int level,  String ability,  CombatStyle? style)?  $default,) {final _that = this;
switch (_that) {
case _Seed() when $default != null:
return $default(_that.type,_that.grade,_that.level,_that.ability,_that.style);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seed implements Seed {
  const _Seed({required this.type, required this.grade, required this.level, required this.ability, this.style});
  factory _Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;
/// The score of the region it came from; sets how strong it grows.
@override final  int level;
/// The id of its first ability, from its type's own pool.
@override final  String ability;
/// Combat seeds only.
@override final  CombatStyle? style;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedCopyWith<_Seed> get copyWith => __$SeedCopyWithImpl<_Seed>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seed&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.style, style) || other.style == style));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade,level,ability,style);
}

@override
String toString() {
    return 'Seed(type: $type, grade: $grade, level: $level, ability: $ability, style: $style)';
}


}

/// @nodoc
abstract mixin class _$SeedCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$SeedCopyWith(_Seed value, $Res Function(_Seed) _then) = __$SeedCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade, int level, String ability, CombatStyle? style
});




}
/// @nodoc
class __$SeedCopyWithImpl<$Res>
    implements _$SeedCopyWith<$Res> {
  __$SeedCopyWithImpl(this._self, this._then);

  final _Seed _self;
  final $Res Function(_Seed) _then;

/// Create a copy of Seed
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,Object? level = null,Object? ability = null,Object? style = freezed,}) {
  return _then(_Seed(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as String,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CombatStyle?,
  ));
}


}


/// @nodoc
mixin _$SeedCount {

 Seed get seed; int get count;
/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedCountCopyWith<SeedCount> get copyWith => _$SeedCountCopyWithImpl<SeedCount>(this as SeedCount, _$identity);

  /// Serializes this SeedCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SeedCount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedCount&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SeedCount;
  return Object.hash(runtimeType,_this.seed,_this.count);
}

@override
String toString() {
  final _this = this as SeedCount;
  return 'SeedCount(seed: ${_this.seed}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $SeedCountCopyWith<$Res>  {
  factory $SeedCountCopyWith(SeedCount value, $Res Function(SeedCount) _then) = _$SeedCountCopyWithImpl;
@useResult
$Res call({
 Seed seed, int count
});


$SeedCopyWith<$Res> get seed;

}
/// @nodoc
class _$SeedCountCopyWithImpl<$Res>
    implements $SeedCountCopyWith<$Res> {
  _$SeedCountCopyWithImpl(this._self, this._then);

  final SeedCount _self;
  final $Res Function(SeedCount) _then;

/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = null,Object? count = null,}) {
  return _then(SeedCount(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res> get seed {
  
  return $SeedCopyWith<$Res>(_self.seed, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeedCount].
extension SeedCountPatterns on SeedCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedCount value)  $default,){
final _that = this;
switch (_that) {
case _SeedCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedCount value)?  $default,){
final _that = this;
switch (_that) {
case _SeedCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Seed seed,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedCount() when $default != null:
return $default(_that.seed,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Seed seed,  int count)  $default,) {final _that = this;
switch (_that) {
case _SeedCount():
return $default(_that.seed,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Seed seed,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SeedCount() when $default != null:
return $default(_that.seed,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeedCount implements SeedCount {
  const _SeedCount({required this.seed, required this.count});
  factory _SeedCount.fromJson(Map<String, dynamic> json) => _$SeedCountFromJson(json);

@override final  Seed seed;
@override final  int count;

/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedCountCopyWith<_SeedCount> get copyWith => __$SeedCountCopyWithImpl<_SeedCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedCountToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedCount&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,seed,count);
}

@override
String toString() {
    return 'SeedCount(seed: $seed, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SeedCountCopyWith<$Res> implements $SeedCountCopyWith<$Res> {
  factory _$SeedCountCopyWith(_SeedCount value, $Res Function(_SeedCount) _then) = __$SeedCountCopyWithImpl;
@override @useResult
$Res call({
 Seed seed, int count
});


@override $SeedCopyWith<$Res> get seed;

}
/// @nodoc
class __$SeedCountCopyWithImpl<$Res>
    implements _$SeedCountCopyWith<$Res> {
  __$SeedCountCopyWithImpl(this._self, this._then);

  final _SeedCount _self;
  final $Res Function(_SeedCount) _then;

/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = null,Object? count = null,}) {
  return _then(_SeedCount(
seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as Seed,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SeedCount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeedCopyWith<$Res> get seed {
  
  return $SeedCopyWith<$Res>(_self.seed, (value) {
    return _then(_self.copyWith(seed: value));
  });
}
}

// dart format on
