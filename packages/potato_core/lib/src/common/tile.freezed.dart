// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TilePos {

 int get x; int get y;
/// Create a copy of TilePos
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TilePosCopyWith<TilePos> get copyWith => _$TilePosCopyWithImpl<TilePos>(this as TilePos, _$identity);

  /// Serializes this TilePos to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TilePos;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TilePos&&(identical(other.x, _this.x) || other.x == _this.x)&&(identical(other.y, _this.y) || other.y == _this.y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TilePos;
  return Object.hash(runtimeType,_this.x,_this.y);
}

@override
String toString() {
  final _this = this as TilePos;
  return 'TilePos(x: ${_this.x}, y: ${_this.y})';
}


}

/// @nodoc
abstract mixin class $TilePosCopyWith<$Res>  {
  factory $TilePosCopyWith(TilePos value, $Res Function(TilePos) _then) = _$TilePosCopyWithImpl;
@useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class _$TilePosCopyWithImpl<$Res>
    implements $TilePosCopyWith<$Res> {
  _$TilePosCopyWithImpl(this._self, this._then);

  final TilePos _self;
  final $Res Function(TilePos) _then;

/// Create a copy of TilePos
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(TilePos(
null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TilePos].
extension TilePosPatterns on TilePos {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TilePos value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TilePos() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TilePos value)  $default,){
final _that = this;
switch (_that) {
case _TilePos():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TilePos value)?  $default,){
final _that = this;
switch (_that) {
case _TilePos() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int x,  int y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TilePos() when $default != null:
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int x,  int y)  $default,) {final _that = this;
switch (_that) {
case _TilePos():
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int x,  int y)?  $default,) {final _that = this;
switch (_that) {
case _TilePos() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TilePos extends TilePos {
  const _TilePos(this.x, this.y): super._();
  factory _TilePos.fromJson(Map<String, dynamic> json) => _$TilePosFromJson(json);

@override final  int x;
@override final  int y;

/// Create a copy of TilePos
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TilePosCopyWith<_TilePos> get copyWith => __$TilePosCopyWithImpl<_TilePos>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TilePosToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TilePos&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,x,y);
}

@override
String toString() {
    return 'TilePos(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$TilePosCopyWith<$Res> implements $TilePosCopyWith<$Res> {
  factory _$TilePosCopyWith(_TilePos value, $Res Function(_TilePos) _then) = __$TilePosCopyWithImpl;
@override @useResult
$Res call({
 int x, int y
});




}
/// @nodoc
class __$TilePosCopyWithImpl<$Res>
    implements _$TilePosCopyWith<$Res> {
  __$TilePosCopyWithImpl(this._self, this._then);

  final _TilePos _self;
  final $Res Function(_TilePos) _then;

/// Create a copy of TilePos
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_TilePos(
null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as int,null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TileRect {

 TilePos get origin; int get width; int get height;
/// Create a copy of TileRect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TileRectCopyWith<TileRect> get copyWith => _$TileRectCopyWithImpl<TileRect>(this as TileRect, _$identity);

  /// Serializes this TileRect to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TileRect;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TileRect&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TileRect;
  return Object.hash(runtimeType,_this.origin,_this.width,_this.height);
}

@override
String toString() {
  final _this = this as TileRect;
  return 'TileRect(origin: ${_this.origin}, width: ${_this.width}, height: ${_this.height})';
}


}

/// @nodoc
abstract mixin class $TileRectCopyWith<$Res>  {
  factory $TileRectCopyWith(TileRect value, $Res Function(TileRect) _then) = _$TileRectCopyWithImpl;
@useResult
$Res call({
 TilePos origin, int width, int height
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$TileRectCopyWithImpl<$Res>
    implements $TileRectCopyWith<$Res> {
  _$TileRectCopyWithImpl(this._self, this._then);

  final TileRect _self;
  final $Res Function(TileRect) _then;

/// Create a copy of TileRect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? origin = null,Object? width = null,Object? height = null,}) {
  return _then(TileRect(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TileRect
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get origin {
  
  return $TilePosCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}
}


/// Adds pattern-matching-related methods to [TileRect].
extension TileRectPatterns on TileRect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TileRect value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TileRect() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TileRect value)  $default,){
final _that = this;
switch (_that) {
case _TileRect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TileRect value)?  $default,){
final _that = this;
switch (_that) {
case _TileRect() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TilePos origin,  int width,  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TileRect() when $default != null:
return $default(_that.origin,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TilePos origin,  int width,  int height)  $default,) {final _that = this;
switch (_that) {
case _TileRect():
return $default(_that.origin,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TilePos origin,  int width,  int height)?  $default,) {final _that = this;
switch (_that) {
case _TileRect() when $default != null:
return $default(_that.origin,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TileRect extends TileRect {
  const _TileRect({required this.origin, required this.width, required this.height}): super._();
  factory _TileRect.fromJson(Map<String, dynamic> json) => _$TileRectFromJson(json);

@override final  TilePos origin;
@override final  int width;
@override final  int height;

/// Create a copy of TileRect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TileRectCopyWith<_TileRect> get copyWith => __$TileRectCopyWithImpl<_TileRect>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TileRectToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TileRect&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,origin,width,height);
}

@override
String toString() {
    return 'TileRect(origin: $origin, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$TileRectCopyWith<$Res> implements $TileRectCopyWith<$Res> {
  factory _$TileRectCopyWith(_TileRect value, $Res Function(_TileRect) _then) = __$TileRectCopyWithImpl;
@override @useResult
$Res call({
 TilePos origin, int width, int height
});


@override $TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class __$TileRectCopyWithImpl<$Res>
    implements _$TileRectCopyWith<$Res> {
  __$TileRectCopyWithImpl(this._self, this._then);

  final _TileRect _self;
  final $Res Function(_TileRect) _then;

/// Create a copy of TileRect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? origin = null,Object? width = null,Object? height = null,}) {
  return _then(_TileRect(
origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TileRect
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
