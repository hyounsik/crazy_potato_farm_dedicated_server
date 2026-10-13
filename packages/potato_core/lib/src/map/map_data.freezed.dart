// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapObstacle {

 TilePos get origin; int get size; ObstacleKind get kind;
/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapObstacleCopyWith<MapObstacle> get copyWith => _$MapObstacleCopyWithImpl<MapObstacle>(this as MapObstacle, _$identity);

  /// Serializes this MapObstacle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapObstacle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapObstacle&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.kind, _this.kind) || other.kind == _this.kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapObstacle;
  return Object.hash(runtimeType,_this.origin,_this.size,_this.kind);
}

@override
String toString() {
  final _this = this as MapObstacle;
  return 'MapObstacle(origin: ${_this.origin}, size: ${_this.size}, kind: ${_this.kind})';
}


}

/// @nodoc
abstract mixin class $MapObstacleCopyWith<$Res>  {
  factory $MapObstacleCopyWith(MapObstacle value, $Res Function(MapObstacle) _then) = _$MapObstacleCopyWithImpl;
@useResult
$Res call({
 TilePos origin, int size, ObstacleKind kind
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$MapObstacleCopyWithImpl<$Res>
    implements $MapObstacleCopyWith<$Res> {
  _$MapObstacleCopyWithImpl(this._self, this._then);

  final MapObstacle _self;
  final $Res Function(MapObstacle) _then;

/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? origin = null,Object? size = null,Object? kind = null,}) {
  return _then(MapObstacle(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ObstacleKind,
  ));
}
/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get origin {
  
  return $TilePosCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapObstacle].
extension MapObstaclePatterns on MapObstacle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapObstacle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapObstacle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapObstacle value)  $default,){
final _that = this;
switch (_that) {
case _MapObstacle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapObstacle value)?  $default,){
final _that = this;
switch (_that) {
case _MapObstacle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TilePos origin,  int size,  ObstacleKind kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapObstacle() when $default != null:
return $default(_that.origin,_that.size,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TilePos origin,  int size,  ObstacleKind kind)  $default,) {final _that = this;
switch (_that) {
case _MapObstacle():
return $default(_that.origin,_that.size,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TilePos origin,  int size,  ObstacleKind kind)?  $default,) {final _that = this;
switch (_that) {
case _MapObstacle() when $default != null:
return $default(_that.origin,_that.size,_that.kind);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapObstacle implements MapObstacle {
  const _MapObstacle({required this.origin, required this.size, required this.kind});
  factory _MapObstacle.fromJson(Map<String, dynamic> json) => _$MapObstacleFromJson(json);

@override final  TilePos origin;
@override final  int size;
@override final  ObstacleKind kind;

/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapObstacleCopyWith<_MapObstacle> get copyWith => __$MapObstacleCopyWithImpl<_MapObstacle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapObstacleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapObstacle&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.size, size) || other.size == size)&&(identical(other.kind, kind) || other.kind == kind));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,origin,size,kind);
}

@override
String toString() {
    return 'MapObstacle(origin: $origin, size: $size, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$MapObstacleCopyWith<$Res> implements $MapObstacleCopyWith<$Res> {
  factory _$MapObstacleCopyWith(_MapObstacle value, $Res Function(_MapObstacle) _then) = __$MapObstacleCopyWithImpl;
@override @useResult
$Res call({
 TilePos origin, int size, ObstacleKind kind
});


@override $TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class __$MapObstacleCopyWithImpl<$Res>
    implements _$MapObstacleCopyWith<$Res> {
  __$MapObstacleCopyWithImpl(this._self, this._then);

  final _MapObstacle _self;
  final $Res Function(_MapObstacle) _then;

/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? origin = null,Object? size = null,Object? kind = null,}) {
  return _then(_MapObstacle(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ObstacleKind,
  ));
}

/// Create a copy of MapObstacle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get origin {
  
  return $TilePosCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}

// dart format on
