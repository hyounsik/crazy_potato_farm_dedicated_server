// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gear.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gear {

 GearKind get kind;/// Weapons: the weapon's catalog id, which sets how it shoots.
 String get family; Grade get grade; int get level; int get enhance;/// Belts: the potato type each slot takes.
 List<PotatoType> get slots;
/// Create a copy of Gear
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GearCopyWith<Gear> get copyWith => _$GearCopyWithImpl<Gear>(this as Gear, _$identity);

  /// Serializes this Gear to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Gear;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gear&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.family, _this.family) || other.family == _this.family)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.enhance, _this.enhance) || other.enhance == _this.enhance)&&const DeepCollectionEquality().equals(other.slots, _this.slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Gear;
  return Object.hash(runtimeType,_this.kind,_this.family,_this.grade,_this.level,_this.enhance,const DeepCollectionEquality().hash(_this.slots));
}

@override
String toString() {
  final _this = this as Gear;
  return 'Gear(kind: ${_this.kind}, family: ${_this.family}, grade: ${_this.grade}, level: ${_this.level}, enhance: ${_this.enhance}, slots: ${_this.slots})';
}


}

/// @nodoc
abstract mixin class $GearCopyWith<$Res>  {
  factory $GearCopyWith(Gear value, $Res Function(Gear) _then) = _$GearCopyWithImpl;
@useResult
$Res call({
 GearKind kind, String family, Grade grade, int level, int enhance, List<PotatoType> slots
});




}
/// @nodoc
class _$GearCopyWithImpl<$Res>
    implements $GearCopyWith<$Res> {
  _$GearCopyWithImpl(this._self, this._then);

  final Gear _self;
  final $Res Function(Gear) _then;

/// Create a copy of Gear
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? family = null,Object? grade = null,Object? level = null,Object? enhance = null,Object? slots = null,}) {
  return _then(Gear(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GearKind,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,enhance: null == enhance ? _self.enhance : enhance // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<PotatoType>,
  ));
}

}


/// Adds pattern-matching-related methods to [Gear].
extension GearPatterns on Gear {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gear value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gear() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gear value)  $default,){
final _that = this;
switch (_that) {
case _Gear():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gear value)?  $default,){
final _that = this;
switch (_that) {
case _Gear() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GearKind kind,  String family,  Grade grade,  int level,  int enhance,  List<PotatoType> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gear() when $default != null:
return $default(_that.kind,_that.family,_that.grade,_that.level,_that.enhance,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GearKind kind,  String family,  Grade grade,  int level,  int enhance,  List<PotatoType> slots)  $default,) {final _that = this;
switch (_that) {
case _Gear():
return $default(_that.kind,_that.family,_that.grade,_that.level,_that.enhance,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GearKind kind,  String family,  Grade grade,  int level,  int enhance,  List<PotatoType> slots)?  $default,) {final _that = this;
switch (_that) {
case _Gear() when $default != null:
return $default(_that.kind,_that.family,_that.grade,_that.level,_that.enhance,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Gear implements Gear {
  const _Gear({required this.kind, this.family = '', required this.grade, required this.level, this.enhance = 0,  List<PotatoType> slots = const <PotatoType>[]}): _slots = slots;
  factory _Gear.fromJson(Map<String, dynamic> json) => _$GearFromJson(json);

@override final  GearKind kind;
/// Weapons: the weapon's catalog id, which sets how it shoots.
@override@JsonKey() final  String family;
@override final  Grade grade;
@override final  int level;
@override@JsonKey() final  int enhance;
/// Belts: the potato type each slot takes.
 final  List<PotatoType> _slots;
/// Belts: the potato type each slot takes.
@override@JsonKey() List<PotatoType> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of Gear
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GearCopyWith<_Gear> get copyWith => __$GearCopyWithImpl<_Gear>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GearToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gear&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.family, family) || other.family == family)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.level, level) || other.level == level)&&(identical(other.enhance, enhance) || other.enhance == enhance)&&const DeepCollectionEquality().equals(other.slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,family,grade,level,enhance,const DeepCollectionEquality().hash(_slots));
}

@override
String toString() {
    return 'Gear(kind: $kind, family: $family, grade: $grade, level: $level, enhance: $enhance, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$GearCopyWith<$Res> implements $GearCopyWith<$Res> {
  factory _$GearCopyWith(_Gear value, $Res Function(_Gear) _then) = __$GearCopyWithImpl;
@override @useResult
$Res call({
 GearKind kind, String family, Grade grade, int level, int enhance, List<PotatoType> slots
});




}
/// @nodoc
class __$GearCopyWithImpl<$Res>
    implements _$GearCopyWith<$Res> {
  __$GearCopyWithImpl(this._self, this._then);

  final _Gear _self;
  final $Res Function(_Gear) _then;

/// Create a copy of Gear
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? family = null,Object? grade = null,Object? level = null,Object? enhance = null,Object? slots = null,}) {
  return _then(_Gear(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as GearKind,family: null == family ? _self.family : family // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,enhance: null == enhance ? _self.enhance : enhance // ignore: cast_nullable_to_non_nullable
as int,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<PotatoType>,
  ));
}


}


/// @nodoc
mixin _$Equipped {

 Gear? get weapon; Gear? get bag; Gear? get belt;
/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EquippedCopyWith<Equipped> get copyWith => _$EquippedCopyWithImpl<Equipped>(this as Equipped, _$identity);

  /// Serializes this Equipped to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Equipped;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Equipped&&(identical(other.weapon, _this.weapon) || other.weapon == _this.weapon)&&(identical(other.bag, _this.bag) || other.bag == _this.bag)&&(identical(other.belt, _this.belt) || other.belt == _this.belt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Equipped;
  return Object.hash(runtimeType,_this.weapon,_this.bag,_this.belt);
}

@override
String toString() {
  final _this = this as Equipped;
  return 'Equipped(weapon: ${_this.weapon}, bag: ${_this.bag}, belt: ${_this.belt})';
}


}

/// @nodoc
abstract mixin class $EquippedCopyWith<$Res>  {
  factory $EquippedCopyWith(Equipped value, $Res Function(Equipped) _then) = _$EquippedCopyWithImpl;
@useResult
$Res call({
 Gear? weapon, Gear? bag, Gear? belt
});


$GearCopyWith<$Res>? get weapon;$GearCopyWith<$Res>? get bag;$GearCopyWith<$Res>? get belt;

}
/// @nodoc
class _$EquippedCopyWithImpl<$Res>
    implements $EquippedCopyWith<$Res> {
  _$EquippedCopyWithImpl(this._self, this._then);

  final Equipped _self;
  final $Res Function(Equipped) _then;

/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weapon = freezed,Object? bag = freezed,Object? belt = freezed,}) {
  return _then(Equipped(
weapon: freezed == weapon ? _self.weapon : weapon // ignore: cast_nullable_to_non_nullable
as Gear?,bag: freezed == bag ? _self.bag : bag // ignore: cast_nullable_to_non_nullable
as Gear?,belt: freezed == belt ? _self.belt : belt // ignore: cast_nullable_to_non_nullable
as Gear?,
  ));
}
/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get weapon {
    if (_self.weapon == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.weapon!, (value) {
    return _then(_self.copyWith(weapon: value));
  });
}/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get bag {
    if (_self.bag == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.bag!, (value) {
    return _then(_self.copyWith(bag: value));
  });
}/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get belt {
    if (_self.belt == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.belt!, (value) {
    return _then(_self.copyWith(belt: value));
  });
}
}


/// Adds pattern-matching-related methods to [Equipped].
extension EquippedPatterns on Equipped {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Equipped value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Equipped() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Equipped value)  $default,){
final _that = this;
switch (_that) {
case _Equipped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Equipped value)?  $default,){
final _that = this;
switch (_that) {
case _Equipped() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gear? weapon,  Gear? bag,  Gear? belt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Equipped() when $default != null:
return $default(_that.weapon,_that.bag,_that.belt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gear? weapon,  Gear? bag,  Gear? belt)  $default,) {final _that = this;
switch (_that) {
case _Equipped():
return $default(_that.weapon,_that.bag,_that.belt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gear? weapon,  Gear? bag,  Gear? belt)?  $default,) {final _that = this;
switch (_that) {
case _Equipped() when $default != null:
return $default(_that.weapon,_that.bag,_that.belt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Equipped extends Equipped {
  const _Equipped({this.weapon, this.bag, this.belt}): super._();
  factory _Equipped.fromJson(Map<String, dynamic> json) => _$EquippedFromJson(json);

@override final  Gear? weapon;
@override final  Gear? bag;
@override final  Gear? belt;

/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EquippedCopyWith<_Equipped> get copyWith => __$EquippedCopyWithImpl<_Equipped>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EquippedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Equipped&&(identical(other.weapon, weapon) || other.weapon == weapon)&&(identical(other.bag, bag) || other.bag == bag)&&(identical(other.belt, belt) || other.belt == belt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,weapon,bag,belt);
}

@override
String toString() {
    return 'Equipped(weapon: $weapon, bag: $bag, belt: $belt)';
}


}

/// @nodoc
abstract mixin class _$EquippedCopyWith<$Res> implements $EquippedCopyWith<$Res> {
  factory _$EquippedCopyWith(_Equipped value, $Res Function(_Equipped) _then) = __$EquippedCopyWithImpl;
@override @useResult
$Res call({
 Gear? weapon, Gear? bag, Gear? belt
});


@override $GearCopyWith<$Res>? get weapon;@override $GearCopyWith<$Res>? get bag;@override $GearCopyWith<$Res>? get belt;

}
/// @nodoc
class __$EquippedCopyWithImpl<$Res>
    implements _$EquippedCopyWith<$Res> {
  __$EquippedCopyWithImpl(this._self, this._then);

  final _Equipped _self;
  final $Res Function(_Equipped) _then;

/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weapon = freezed,Object? bag = freezed,Object? belt = freezed,}) {
  return _then(_Equipped(
weapon: freezed == weapon ? _self.weapon : weapon // ignore: cast_nullable_to_non_nullable
as Gear?,bag: freezed == bag ? _self.bag : bag // ignore: cast_nullable_to_non_nullable
as Gear?,belt: freezed == belt ? _self.belt : belt // ignore: cast_nullable_to_non_nullable
as Gear?,
  ));
}

/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get weapon {
    if (_self.weapon == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.weapon!, (value) {
    return _then(_self.copyWith(weapon: value));
  });
}/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get bag {
    if (_self.bag == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.bag!, (value) {
    return _then(_self.copyWith(bag: value));
  });
}/// Create a copy of Equipped
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GearCopyWith<$Res>? get belt {
    if (_self.belt == null) {
    return null;
  }

  return $GearCopyWith<$Res>(_self.belt!, (value) {
    return _then(_self.copyWith(belt: value));
  });
}
}

// dart format on
