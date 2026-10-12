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

 PotatoType get type; Grade get grade;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seed&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.grade, _this.grade) || other.grade == _this.grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Seed;
  return Object.hash(runtimeType,_this.type,_this.grade);
}

@override
String toString() {
  final _this = this as Seed;
  return 'Seed(type: ${_this.type}, grade: ${_this.grade})';
}


}

/// @nodoc
abstract mixin class $SeedCopyWith<$Res>  {
  factory $SeedCopyWith(Seed value, $Res Function(Seed) _then) = _$SeedCopyWithImpl;
@useResult
$Res call({
 PotatoType type, Grade grade
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
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? grade = null,}) {
  return _then(Seed(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PotatoType type,  Grade grade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seed() when $default != null:
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
case _Seed():
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
case _Seed() when $default != null:
return $default(_that.type,_that.grade);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seed implements Seed {
  const _Seed({required this.type, required this.grade});
  factory _Seed.fromJson(Map<String, dynamic> json) => _$SeedFromJson(json);

@override final  PotatoType type;
@override final  Grade grade;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seed&&(identical(other.type, type) || other.type == type)&&(identical(other.grade, grade) || other.grade == grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,grade);
}

@override
String toString() {
    return 'Seed(type: $type, grade: $grade)';
}


}

/// @nodoc
abstract mixin class _$SeedCopyWith<$Res> implements $SeedCopyWith<$Res> {
  factory _$SeedCopyWith(_Seed value, $Res Function(_Seed) _then) = __$SeedCopyWithImpl;
@override @useResult
$Res call({
 PotatoType type, Grade grade
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
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? grade = null,}) {
  return _then(_Seed(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
  ));
}


}

// dart format on
