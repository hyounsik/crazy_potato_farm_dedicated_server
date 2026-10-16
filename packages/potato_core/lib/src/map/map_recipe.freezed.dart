// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapRecipe {

/// Tiles along one side of the square map.
 int get size;/// Where the player starts.
 TilePos get entry;/// Places the player may leave from, all reachable from [entry].
 List<TilePos> get exits;/// Extra exit sites the generator picks per seed on open ground, at
/// least [exitSpacing] tiles (Chebyshev) from the entry and each other.
/// They follow the fixed [exits] in the built map.
 int get exitSites; int get exitSpacing;/// Places clones walk in from, picked per seed like exit sites and kept
/// as the [cloneEntryMarker] marker.
 int get cloneEntrySites;/// Scattered obstacles stay at least this many tiles (Chebyshev) from
/// [entry], [exits] and chunk markers.
 int get clearRadius;/// Terrain placed as given, before scattering.
 List<TerrainPiece> get terrain; ScatterRule get scatter;/// Turns the whole map a random quarter turn per seed, so the same
/// terrain reads differently from run to run.
 bool get rotate;
/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapRecipeCopyWith<MapRecipe> get copyWith => _$MapRecipeCopyWithImpl<MapRecipe>(this as MapRecipe, _$identity);

  /// Serializes this MapRecipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapRecipe;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapRecipe&&(identical(other.size, _this.size) || other.size == _this.size)&&(identical(other.entry, _this.entry) || other.entry == _this.entry)&&const DeepCollectionEquality().equals(other.exits, _this.exits)&&(identical(other.exitSites, _this.exitSites) || other.exitSites == _this.exitSites)&&(identical(other.exitSpacing, _this.exitSpacing) || other.exitSpacing == _this.exitSpacing)&&(identical(other.cloneEntrySites, _this.cloneEntrySites) || other.cloneEntrySites == _this.cloneEntrySites)&&(identical(other.clearRadius, _this.clearRadius) || other.clearRadius == _this.clearRadius)&&const DeepCollectionEquality().equals(other.terrain, _this.terrain)&&(identical(other.scatter, _this.scatter) || other.scatter == _this.scatter)&&(identical(other.rotate, _this.rotate) || other.rotate == _this.rotate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapRecipe;
  return Object.hash(runtimeType,_this.size,_this.entry,const DeepCollectionEquality().hash(_this.exits),_this.exitSites,_this.exitSpacing,_this.cloneEntrySites,_this.clearRadius,const DeepCollectionEquality().hash(_this.terrain),_this.scatter,_this.rotate);
}

@override
String toString() {
  final _this = this as MapRecipe;
  return 'MapRecipe(size: ${_this.size}, entry: ${_this.entry}, exits: ${_this.exits}, exitSites: ${_this.exitSites}, exitSpacing: ${_this.exitSpacing}, cloneEntrySites: ${_this.cloneEntrySites}, clearRadius: ${_this.clearRadius}, terrain: ${_this.terrain}, scatter: ${_this.scatter}, rotate: ${_this.rotate})';
}


}

/// @nodoc
abstract mixin class $MapRecipeCopyWith<$Res>  {
  factory $MapRecipeCopyWith(MapRecipe value, $Res Function(MapRecipe) _then) = _$MapRecipeCopyWithImpl;
@useResult
$Res call({
 int size, TilePos entry, List<TilePos> exits, int exitSites, int exitSpacing, int cloneEntrySites, int clearRadius, List<TerrainPiece> terrain, ScatterRule scatter, bool rotate
});


$TilePosCopyWith<$Res> get entry;$ScatterRuleCopyWith<$Res> get scatter;

}
/// @nodoc
class _$MapRecipeCopyWithImpl<$Res>
    implements $MapRecipeCopyWith<$Res> {
  _$MapRecipeCopyWithImpl(this._self, this._then);

  final MapRecipe _self;
  final $Res Function(MapRecipe) _then;

/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? size = null,Object? entry = null,Object? exits = null,Object? exitSites = null,Object? exitSpacing = null,Object? cloneEntrySites = null,Object? clearRadius = null,Object? terrain = null,Object? scatter = null,Object? rotate = null,}) {
  return _then(MapRecipe(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as TilePos,exits: null == exits ? _self.exits : exits // ignore: cast_nullable_to_non_nullable
as List<TilePos>,exitSites: null == exitSites ? _self.exitSites : exitSites // ignore: cast_nullable_to_non_nullable
as int,exitSpacing: null == exitSpacing ? _self.exitSpacing : exitSpacing // ignore: cast_nullable_to_non_nullable
as int,cloneEntrySites: null == cloneEntrySites ? _self.cloneEntrySites : cloneEntrySites // ignore: cast_nullable_to_non_nullable
as int,clearRadius: null == clearRadius ? _self.clearRadius : clearRadius // ignore: cast_nullable_to_non_nullable
as int,terrain: null == terrain ? _self.terrain : terrain // ignore: cast_nullable_to_non_nullable
as List<TerrainPiece>,scatter: null == scatter ? _self.scatter : scatter // ignore: cast_nullable_to_non_nullable
as ScatterRule,rotate: null == rotate ? _self.rotate : rotate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get entry {
  
  return $TilePosCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScatterRuleCopyWith<$Res> get scatter {
  
  return $ScatterRuleCopyWith<$Res>(_self.scatter, (value) {
    return _then(_self.copyWith(scatter: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapRecipe].
extension MapRecipePatterns on MapRecipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapRecipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapRecipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapRecipe value)  $default,){
final _that = this;
switch (_that) {
case _MapRecipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapRecipe value)?  $default,){
final _that = this;
switch (_that) {
case _MapRecipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int size,  TilePos entry,  List<TilePos> exits,  int exitSites,  int exitSpacing,  int cloneEntrySites,  int clearRadius,  List<TerrainPiece> terrain,  ScatterRule scatter,  bool rotate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapRecipe() when $default != null:
return $default(_that.size,_that.entry,_that.exits,_that.exitSites,_that.exitSpacing,_that.cloneEntrySites,_that.clearRadius,_that.terrain,_that.scatter,_that.rotate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int size,  TilePos entry,  List<TilePos> exits,  int exitSites,  int exitSpacing,  int cloneEntrySites,  int clearRadius,  List<TerrainPiece> terrain,  ScatterRule scatter,  bool rotate)  $default,) {final _that = this;
switch (_that) {
case _MapRecipe():
return $default(_that.size,_that.entry,_that.exits,_that.exitSites,_that.exitSpacing,_that.cloneEntrySites,_that.clearRadius,_that.terrain,_that.scatter,_that.rotate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int size,  TilePos entry,  List<TilePos> exits,  int exitSites,  int exitSpacing,  int cloneEntrySites,  int clearRadius,  List<TerrainPiece> terrain,  ScatterRule scatter,  bool rotate)?  $default,) {final _that = this;
switch (_that) {
case _MapRecipe() when $default != null:
return $default(_that.size,_that.entry,_that.exits,_that.exitSites,_that.exitSpacing,_that.cloneEntrySites,_that.clearRadius,_that.terrain,_that.scatter,_that.rotate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapRecipe implements MapRecipe {
  const _MapRecipe({required this.size, required this.entry,  List<TilePos> exits = const <TilePos>[], this.exitSites = 0, this.exitSpacing = 0, this.cloneEntrySites = 0, required this.clearRadius,  List<TerrainPiece> terrain = const <TerrainPiece>[], required this.scatter, this.rotate = true}): _exits = exits,_terrain = terrain;
  factory _MapRecipe.fromJson(Map<String, dynamic> json) => _$MapRecipeFromJson(json);

/// Tiles along one side of the square map.
@override final  int size;
/// Where the player starts.
@override final  TilePos entry;
/// Places the player may leave from, all reachable from [entry].
 final  List<TilePos> _exits;
/// Places the player may leave from, all reachable from [entry].
@override@JsonKey() List<TilePos> get exits {
  if (_exits is EqualUnmodifiableListView) return _exits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exits);
}

/// Extra exit sites the generator picks per seed on open ground, at
/// least [exitSpacing] tiles (Chebyshev) from the entry and each other.
/// They follow the fixed [exits] in the built map.
@override@JsonKey() final  int exitSites;
@override@JsonKey() final  int exitSpacing;
/// Places clones walk in from, picked per seed like exit sites and kept
/// as the [cloneEntryMarker] marker.
@override@JsonKey() final  int cloneEntrySites;
/// Scattered obstacles stay at least this many tiles (Chebyshev) from
/// [entry], [exits] and chunk markers.
@override final  int clearRadius;
/// Terrain placed as given, before scattering.
 final  List<TerrainPiece> _terrain;
/// Terrain placed as given, before scattering.
@override@JsonKey() List<TerrainPiece> get terrain {
  if (_terrain is EqualUnmodifiableListView) return _terrain;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_terrain);
}

@override final  ScatterRule scatter;
/// Turns the whole map a random quarter turn per seed, so the same
/// terrain reads differently from run to run.
@override@JsonKey() final  bool rotate;

/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapRecipeCopyWith<_MapRecipe> get copyWith => __$MapRecipeCopyWithImpl<_MapRecipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapRecipeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapRecipe&&(identical(other.size, size) || other.size == size)&&(identical(other.entry, entry) || other.entry == entry)&&const DeepCollectionEquality().equals(other.exits, _exits)&&(identical(other.exitSites, exitSites) || other.exitSites == exitSites)&&(identical(other.exitSpacing, exitSpacing) || other.exitSpacing == exitSpacing)&&(identical(other.cloneEntrySites, cloneEntrySites) || other.cloneEntrySites == cloneEntrySites)&&(identical(other.clearRadius, clearRadius) || other.clearRadius == clearRadius)&&const DeepCollectionEquality().equals(other.terrain, _terrain)&&(identical(other.scatter, scatter) || other.scatter == scatter)&&(identical(other.rotate, rotate) || other.rotate == rotate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,size,entry,const DeepCollectionEquality().hash(_exits),exitSites,exitSpacing,cloneEntrySites,clearRadius,const DeepCollectionEquality().hash(_terrain),scatter,rotate);
}

@override
String toString() {
    return 'MapRecipe(size: $size, entry: $entry, exits: $exits, exitSites: $exitSites, exitSpacing: $exitSpacing, cloneEntrySites: $cloneEntrySites, clearRadius: $clearRadius, terrain: $terrain, scatter: $scatter, rotate: $rotate)';
}


}

/// @nodoc
abstract mixin class _$MapRecipeCopyWith<$Res> implements $MapRecipeCopyWith<$Res> {
  factory _$MapRecipeCopyWith(_MapRecipe value, $Res Function(_MapRecipe) _then) = __$MapRecipeCopyWithImpl;
@override @useResult
$Res call({
 int size, TilePos entry, List<TilePos> exits, int exitSites, int exitSpacing, int cloneEntrySites, int clearRadius, List<TerrainPiece> terrain, ScatterRule scatter, bool rotate
});


@override $TilePosCopyWith<$Res> get entry;@override $ScatterRuleCopyWith<$Res> get scatter;

}
/// @nodoc
class __$MapRecipeCopyWithImpl<$Res>
    implements _$MapRecipeCopyWith<$Res> {
  __$MapRecipeCopyWithImpl(this._self, this._then);

  final _MapRecipe _self;
  final $Res Function(_MapRecipe) _then;

/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? size = null,Object? entry = null,Object? exits = null,Object? exitSites = null,Object? exitSpacing = null,Object? cloneEntrySites = null,Object? clearRadius = null,Object? terrain = null,Object? scatter = null,Object? rotate = null,}) {
  return _then(_MapRecipe(
size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,entry: null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as TilePos,exits: null == exits ? _self._exits : exits // ignore: cast_nullable_to_non_nullable
as List<TilePos>,exitSites: null == exitSites ? _self.exitSites : exitSites // ignore: cast_nullable_to_non_nullable
as int,exitSpacing: null == exitSpacing ? _self.exitSpacing : exitSpacing // ignore: cast_nullable_to_non_nullable
as int,cloneEntrySites: null == cloneEntrySites ? _self.cloneEntrySites : cloneEntrySites // ignore: cast_nullable_to_non_nullable
as int,clearRadius: null == clearRadius ? _self.clearRadius : clearRadius // ignore: cast_nullable_to_non_nullable
as int,terrain: null == terrain ? _self._terrain : terrain // ignore: cast_nullable_to_non_nullable
as List<TerrainPiece>,scatter: null == scatter ? _self.scatter : scatter // ignore: cast_nullable_to_non_nullable
as ScatterRule,rotate: null == rotate ? _self.rotate : rotate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get entry {
  
  return $TilePosCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}/// Create a copy of MapRecipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScatterRuleCopyWith<$Res> get scatter {
  
  return $ScatterRuleCopyWith<$Res>(_self.scatter, (value) {
    return _then(_self.copyWith(scatter: value));
  });
}
}


/// @nodoc
mixin _$ScatterRule {

/// How many to place. Fewer when the map runs out of room.
 int get count;/// Chance that one is 2×2 instead of 1×1.
 double get bigChance;
/// Create a copy of ScatterRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScatterRuleCopyWith<ScatterRule> get copyWith => _$ScatterRuleCopyWithImpl<ScatterRule>(this as ScatterRule, _$identity);

  /// Serializes this ScatterRule to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScatterRule;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScatterRule&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.bigChance, _this.bigChance) || other.bigChance == _this.bigChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScatterRule;
  return Object.hash(runtimeType,_this.count,_this.bigChance);
}

@override
String toString() {
  final _this = this as ScatterRule;
  return 'ScatterRule(count: ${_this.count}, bigChance: ${_this.bigChance})';
}


}

/// @nodoc
abstract mixin class $ScatterRuleCopyWith<$Res>  {
  factory $ScatterRuleCopyWith(ScatterRule value, $Res Function(ScatterRule) _then) = _$ScatterRuleCopyWithImpl;
@useResult
$Res call({
 int count, double bigChance
});




}
/// @nodoc
class _$ScatterRuleCopyWithImpl<$Res>
    implements $ScatterRuleCopyWith<$Res> {
  _$ScatterRuleCopyWithImpl(this._self, this._then);

  final ScatterRule _self;
  final $Res Function(ScatterRule) _then;

/// Create a copy of ScatterRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? bigChance = null,}) {
  return _then(ScatterRule(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,bigChance: null == bigChance ? _self.bigChance : bigChance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ScatterRule].
extension ScatterRulePatterns on ScatterRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScatterRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScatterRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScatterRule value)  $default,){
final _that = this;
switch (_that) {
case _ScatterRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScatterRule value)?  $default,){
final _that = this;
switch (_that) {
case _ScatterRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  double bigChance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScatterRule() when $default != null:
return $default(_that.count,_that.bigChance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  double bigChance)  $default,) {final _that = this;
switch (_that) {
case _ScatterRule():
return $default(_that.count,_that.bigChance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  double bigChance)?  $default,) {final _that = this;
switch (_that) {
case _ScatterRule() when $default != null:
return $default(_that.count,_that.bigChance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScatterRule implements ScatterRule {
  const _ScatterRule({required this.count, this.bigChance = 0.0});
  factory _ScatterRule.fromJson(Map<String, dynamic> json) => _$ScatterRuleFromJson(json);

/// How many to place. Fewer when the map runs out of room.
@override final  int count;
/// Chance that one is 2×2 instead of 1×1.
@override@JsonKey() final  double bigChance;

/// Create a copy of ScatterRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScatterRuleCopyWith<_ScatterRule> get copyWith => __$ScatterRuleCopyWithImpl<_ScatterRule>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScatterRuleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScatterRule&&(identical(other.count, count) || other.count == count)&&(identical(other.bigChance, bigChance) || other.bigChance == bigChance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,count,bigChance);
}

@override
String toString() {
    return 'ScatterRule(count: $count, bigChance: $bigChance)';
}


}

/// @nodoc
abstract mixin class _$ScatterRuleCopyWith<$Res> implements $ScatterRuleCopyWith<$Res> {
  factory _$ScatterRuleCopyWith(_ScatterRule value, $Res Function(_ScatterRule) _then) = __$ScatterRuleCopyWithImpl;
@override @useResult
$Res call({
 int count, double bigChance
});




}
/// @nodoc
class __$ScatterRuleCopyWithImpl<$Res>
    implements _$ScatterRuleCopyWith<$Res> {
  __$ScatterRuleCopyWithImpl(this._self, this._then);

  final _ScatterRule _self;
  final $Res Function(_ScatterRule) _then;

/// Create a copy of ScatterRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? bigChance = null,}) {
  return _then(_ScatterRule(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,bigChance: null == bigChance ? _self.bigChance : bigChance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

TerrainPiece _$TerrainPieceFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'blob':
          return BlobPiece.fromJson(
            json
          );
                case 'wall':
          return WallPiece.fromJson(
            json
          );
                case 'ring':
          return RingPiece.fromJson(
            json
          );
                case 'plateau':
          return PlateauPiece.fromJson(
            json
          );
                case 'chunk':
          return ChunkPiece.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'TerrainPiece',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$TerrainPiece {



  /// Serializes this TerrainPiece to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TerrainPiece);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TerrainPiece()';
}


}

/// @nodoc
class $TerrainPieceCopyWith<$Res>  {
$TerrainPieceCopyWith(TerrainPiece _, $Res Function(TerrainPiece) __);
}


/// Adds pattern-matching-related methods to [TerrainPiece].
extension TerrainPiecePatterns on TerrainPiece {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BlobPiece value)?  blob,TResult Function( WallPiece value)?  wall,TResult Function( RingPiece value)?  ring,TResult Function( PlateauPiece value)?  plateau,TResult Function( ChunkPiece value)?  chunk,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BlobPiece() when blob != null:
return blob(_that);case WallPiece() when wall != null:
return wall(_that);case RingPiece() when ring != null:
return ring(_that);case PlateauPiece() when plateau != null:
return plateau(_that);case ChunkPiece() when chunk != null:
return chunk(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BlobPiece value)  blob,required TResult Function( WallPiece value)  wall,required TResult Function( RingPiece value)  ring,required TResult Function( PlateauPiece value)  plateau,required TResult Function( ChunkPiece value)  chunk,}){
final _that = this;
switch (_that) {
case BlobPiece():
return blob(_that);case WallPiece():
return wall(_that);case RingPiece():
return ring(_that);case PlateauPiece():
return plateau(_that);case ChunkPiece():
return chunk(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BlobPiece value)?  blob,TResult? Function( WallPiece value)?  wall,TResult? Function( RingPiece value)?  ring,TResult? Function( PlateauPiece value)?  plateau,TResult? Function( ChunkPiece value)?  chunk,}){
final _that = this;
switch (_that) {
case BlobPiece() when blob != null:
return blob(_that);case WallPiece() when wall != null:
return wall(_that);case RingPiece() when ring != null:
return ring(_that);case PlateauPiece() when plateau != null:
return plateau(_that);case ChunkPiece() when chunk != null:
return chunk(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TilePos center,  int area)?  blob,TResult Function( TilePos from,  TilePos to,  int thickness,  int gap)?  wall,TResult Function( TilePos center,  int radius,  int thickness,  TilePos facing,  int gap)?  ring,TResult Function( TilePos center,  int area,  int ramps)?  plateau,TResult Function( String chunk,  TilePos origin,  int quarterTurns)?  chunk,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BlobPiece() when blob != null:
return blob(_that.center,_that.area);case WallPiece() when wall != null:
return wall(_that.from,_that.to,_that.thickness,_that.gap);case RingPiece() when ring != null:
return ring(_that.center,_that.radius,_that.thickness,_that.facing,_that.gap);case PlateauPiece() when plateau != null:
return plateau(_that.center,_that.area,_that.ramps);case ChunkPiece() when chunk != null:
return chunk(_that.chunk,_that.origin,_that.quarterTurns);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TilePos center,  int area)  blob,required TResult Function( TilePos from,  TilePos to,  int thickness,  int gap)  wall,required TResult Function( TilePos center,  int radius,  int thickness,  TilePos facing,  int gap)  ring,required TResult Function( TilePos center,  int area,  int ramps)  plateau,required TResult Function( String chunk,  TilePos origin,  int quarterTurns)  chunk,}) {final _that = this;
switch (_that) {
case BlobPiece():
return blob(_that.center,_that.area);case WallPiece():
return wall(_that.from,_that.to,_that.thickness,_that.gap);case RingPiece():
return ring(_that.center,_that.radius,_that.thickness,_that.facing,_that.gap);case PlateauPiece():
return plateau(_that.center,_that.area,_that.ramps);case ChunkPiece():
return chunk(_that.chunk,_that.origin,_that.quarterTurns);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TilePos center,  int area)?  blob,TResult? Function( TilePos from,  TilePos to,  int thickness,  int gap)?  wall,TResult? Function( TilePos center,  int radius,  int thickness,  TilePos facing,  int gap)?  ring,TResult? Function( TilePos center,  int area,  int ramps)?  plateau,TResult? Function( String chunk,  TilePos origin,  int quarterTurns)?  chunk,}) {final _that = this;
switch (_that) {
case BlobPiece() when blob != null:
return blob(_that.center,_that.area);case WallPiece() when wall != null:
return wall(_that.from,_that.to,_that.thickness,_that.gap);case RingPiece() when ring != null:
return ring(_that.center,_that.radius,_that.thickness,_that.facing,_that.gap);case PlateauPiece() when plateau != null:
return plateau(_that.center,_that.area,_that.ramps);case ChunkPiece() when chunk != null:
return chunk(_that.chunk,_that.origin,_that.quarterTurns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class BlobPiece implements TerrainPiece {
  const BlobPiece({required this.center, required this.area,  String? $type}): $type = $type ?? 'blob';
  factory BlobPiece.fromJson(Map<String, dynamic> json) => _$BlobPieceFromJson(json);

 final  TilePos center;
 final  int area;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlobPieceCopyWith<BlobPiece> get copyWith => _$BlobPieceCopyWithImpl<BlobPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlobPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BlobPiece&&(identical(other.center, center) || other.center == center)&&(identical(other.area, area) || other.area == area));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,center,area);
}

@override
String toString() {
    return 'TerrainPiece.blob(center: $center, area: $area)';
}


}

/// @nodoc
abstract mixin class $BlobPieceCopyWith<$Res> implements $TerrainPieceCopyWith<$Res> {
  factory $BlobPieceCopyWith(BlobPiece value, $Res Function(BlobPiece) _then) = _$BlobPieceCopyWithImpl;
@useResult
$Res call({
 TilePos center, int area
});


$TilePosCopyWith<$Res> get center;

}
/// @nodoc
class _$BlobPieceCopyWithImpl<$Res>
    implements $BlobPieceCopyWith<$Res> {
  _$BlobPieceCopyWithImpl(this._self, this._then);

  final BlobPiece _self;
  final $Res Function(BlobPiece) _then;

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? center = null,Object? area = null,}) {
  return _then(BlobPiece(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as TilePos,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get center {
  
  return $TilePosCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class WallPiece implements TerrainPiece {
  const WallPiece({required this.from, required this.to, required this.thickness, required this.gap,  String? $type}): $type = $type ?? 'wall';
  factory WallPiece.fromJson(Map<String, dynamic> json) => _$WallPieceFromJson(json);

 final  TilePos from;
 final  TilePos to;
 final  int thickness;
 final  int gap;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WallPieceCopyWith<WallPiece> get copyWith => _$WallPieceCopyWithImpl<WallPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WallPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WallPiece&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.gap, gap) || other.gap == gap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,from,to,thickness,gap);
}

@override
String toString() {
    return 'TerrainPiece.wall(from: $from, to: $to, thickness: $thickness, gap: $gap)';
}


}

/// @nodoc
abstract mixin class $WallPieceCopyWith<$Res> implements $TerrainPieceCopyWith<$Res> {
  factory $WallPieceCopyWith(WallPiece value, $Res Function(WallPiece) _then) = _$WallPieceCopyWithImpl;
@useResult
$Res call({
 TilePos from, TilePos to, int thickness, int gap
});


$TilePosCopyWith<$Res> get from;$TilePosCopyWith<$Res> get to;

}
/// @nodoc
class _$WallPieceCopyWithImpl<$Res>
    implements $WallPieceCopyWith<$Res> {
  _$WallPieceCopyWithImpl(this._self, this._then);

  final WallPiece _self;
  final $Res Function(WallPiece) _then;

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? thickness = null,Object? gap = null,}) {
  return _then(WallPiece(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as TilePos,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as TilePos,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,gap: null == gap ? _self.gap : gap // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get from {
  
  return $TilePosCopyWith<$Res>(_self.from, (value) {
    return _then(_self.copyWith(from: value));
  });
}/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get to {
  
  return $TilePosCopyWith<$Res>(_self.to, (value) {
    return _then(_self.copyWith(to: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class RingPiece implements TerrainPiece {
  const RingPiece({required this.center, required this.radius, required this.thickness, required this.facing, required this.gap,  String? $type}): $type = $type ?? 'ring';
  factory RingPiece.fromJson(Map<String, dynamic> json) => _$RingPieceFromJson(json);

 final  TilePos center;
 final  int radius;
 final  int thickness;
 final  TilePos facing;
 final  int gap;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RingPieceCopyWith<RingPiece> get copyWith => _$RingPieceCopyWithImpl<RingPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RingPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is RingPiece&&(identical(other.center, center) || other.center == center)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.thickness, thickness) || other.thickness == thickness)&&(identical(other.facing, facing) || other.facing == facing)&&(identical(other.gap, gap) || other.gap == gap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,center,radius,thickness,facing,gap);
}

@override
String toString() {
    return 'TerrainPiece.ring(center: $center, radius: $radius, thickness: $thickness, facing: $facing, gap: $gap)';
}


}

/// @nodoc
abstract mixin class $RingPieceCopyWith<$Res> implements $TerrainPieceCopyWith<$Res> {
  factory $RingPieceCopyWith(RingPiece value, $Res Function(RingPiece) _then) = _$RingPieceCopyWithImpl;
@useResult
$Res call({
 TilePos center, int radius, int thickness, TilePos facing, int gap
});


$TilePosCopyWith<$Res> get center;$TilePosCopyWith<$Res> get facing;

}
/// @nodoc
class _$RingPieceCopyWithImpl<$Res>
    implements $RingPieceCopyWith<$Res> {
  _$RingPieceCopyWithImpl(this._self, this._then);

  final RingPiece _self;
  final $Res Function(RingPiece) _then;

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? center = null,Object? radius = null,Object? thickness = null,Object? facing = null,Object? gap = null,}) {
  return _then(RingPiece(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as TilePos,radius: null == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as int,thickness: null == thickness ? _self.thickness : thickness // ignore: cast_nullable_to_non_nullable
as int,facing: null == facing ? _self.facing : facing // ignore: cast_nullable_to_non_nullable
as TilePos,gap: null == gap ? _self.gap : gap // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get center {
  
  return $TilePosCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get facing {
  
  return $TilePosCopyWith<$Res>(_self.facing, (value) {
    return _then(_self.copyWith(facing: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class PlateauPiece implements TerrainPiece {
  const PlateauPiece({required this.center, required this.area, this.ramps = 2,  String? $type}): $type = $type ?? 'plateau';
  factory PlateauPiece.fromJson(Map<String, dynamic> json) => _$PlateauPieceFromJson(json);

 final  TilePos center;
 final  int area;
@JsonKey() final  int ramps;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlateauPieceCopyWith<PlateauPiece> get copyWith => _$PlateauPieceCopyWithImpl<PlateauPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlateauPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is PlateauPiece&&(identical(other.center, center) || other.center == center)&&(identical(other.area, area) || other.area == area)&&(identical(other.ramps, ramps) || other.ramps == ramps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,center,area,ramps);
}

@override
String toString() {
    return 'TerrainPiece.plateau(center: $center, area: $area, ramps: $ramps)';
}


}

/// @nodoc
abstract mixin class $PlateauPieceCopyWith<$Res> implements $TerrainPieceCopyWith<$Res> {
  factory $PlateauPieceCopyWith(PlateauPiece value, $Res Function(PlateauPiece) _then) = _$PlateauPieceCopyWithImpl;
@useResult
$Res call({
 TilePos center, int area, int ramps
});


$TilePosCopyWith<$Res> get center;

}
/// @nodoc
class _$PlateauPieceCopyWithImpl<$Res>
    implements $PlateauPieceCopyWith<$Res> {
  _$PlateauPieceCopyWithImpl(this._self, this._then);

  final PlateauPiece _self;
  final $Res Function(PlateauPiece) _then;

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? center = null,Object? area = null,Object? ramps = null,}) {
  return _then(PlateauPiece(
center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as TilePos,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as int,ramps: null == ramps ? _self.ramps : ramps // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TilePosCopyWith<$Res> get center {
  
  return $TilePosCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ChunkPiece implements TerrainPiece {
  const ChunkPiece({required this.chunk, required this.origin, this.quarterTurns = 0,  String? $type}): $type = $type ?? 'chunk';
  factory ChunkPiece.fromJson(Map<String, dynamic> json) => _$ChunkPieceFromJson(json);

 final  String chunk;
 final  TilePos origin;
@JsonKey() final  int quarterTurns;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChunkPieceCopyWith<ChunkPiece> get copyWith => _$ChunkPieceCopyWithImpl<ChunkPiece>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChunkPieceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ChunkPiece&&(identical(other.chunk, chunk) || other.chunk == chunk)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.quarterTurns, quarterTurns) || other.quarterTurns == quarterTurns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chunk,origin,quarterTurns);
}

@override
String toString() {
    return 'TerrainPiece.chunk(chunk: $chunk, origin: $origin, quarterTurns: $quarterTurns)';
}


}

/// @nodoc
abstract mixin class $ChunkPieceCopyWith<$Res> implements $TerrainPieceCopyWith<$Res> {
  factory $ChunkPieceCopyWith(ChunkPiece value, $Res Function(ChunkPiece) _then) = _$ChunkPieceCopyWithImpl;
@useResult
$Res call({
 String chunk, TilePos origin, int quarterTurns
});


$TilePosCopyWith<$Res> get origin;

}
/// @nodoc
class _$ChunkPieceCopyWithImpl<$Res>
    implements $ChunkPieceCopyWith<$Res> {
  _$ChunkPieceCopyWithImpl(this._self, this._then);

  final ChunkPiece _self;
  final $Res Function(ChunkPiece) _then;

/// Create a copy of TerrainPiece
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? chunk = null,Object? origin = null,Object? quarterTurns = null,}) {
  return _then(ChunkPiece(
chunk: null == chunk ? _self.chunk : chunk // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as TilePos,quarterTurns: null == quarterTurns ? _self.quarterTurns : quarterTurns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TerrainPiece
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
