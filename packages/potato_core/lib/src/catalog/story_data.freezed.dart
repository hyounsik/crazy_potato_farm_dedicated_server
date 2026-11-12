// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoryData {

/// The file's format version (`Catalog` checks it against the one it
/// reads).
 int get version;/// For people reading the file; the game ignores it.
 String get note;/// Unlock keys closed on a new farm. See [StoryUnlock] for the forms.
 List<String> get locked;/// Events in story order.
 List<StoryEventData> get events;
/// Create a copy of StoryData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryDataCopyWith<StoryData> get copyWith => _$StoryDataCopyWithImpl<StoryData>(this as StoryData, _$identity);

  /// Serializes this StoryData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoryData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryData&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.note, _this.note) || other.note == _this.note)&&const DeepCollectionEquality().equals(other.locked, _this.locked)&&const DeepCollectionEquality().equals(other.events, _this.events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoryData;
  return Object.hash(runtimeType,_this.version,_this.note,const DeepCollectionEquality().hash(_this.locked),const DeepCollectionEquality().hash(_this.events));
}

@override
String toString() {
  final _this = this as StoryData;
  return 'StoryData(version: ${_this.version}, note: ${_this.note}, locked: ${_this.locked}, events: ${_this.events})';
}


}

/// @nodoc
abstract mixin class $StoryDataCopyWith<$Res>  {
  factory $StoryDataCopyWith(StoryData value, $Res Function(StoryData) _then) = _$StoryDataCopyWithImpl;
@useResult
$Res call({
 int version, String note, List<String> locked, List<StoryEventData> events
});




}
/// @nodoc
class _$StoryDataCopyWithImpl<$Res>
    implements $StoryDataCopyWith<$Res> {
  _$StoryDataCopyWithImpl(this._self, this._then);

  final StoryData _self;
  final $Res Function(StoryData) _then;

/// Create a copy of StoryData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? note = null,Object? locked = null,Object? events = null,}) {
  return _then(StoryData(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,locked: null == locked ? _self.locked : locked // ignore: cast_nullable_to_non_nullable
as List<String>,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<StoryEventData>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryData].
extension StoryDataPatterns on StoryData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryData value)  $default,){
final _that = this;
switch (_that) {
case _StoryData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryData value)?  $default,){
final _that = this;
switch (_that) {
case _StoryData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  String note,  List<String> locked,  List<StoryEventData> events)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryData() when $default != null:
return $default(_that.version,_that.note,_that.locked,_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  String note,  List<String> locked,  List<StoryEventData> events)  $default,) {final _that = this;
switch (_that) {
case _StoryData():
return $default(_that.version,_that.note,_that.locked,_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  String note,  List<String> locked,  List<StoryEventData> events)?  $default,) {final _that = this;
switch (_that) {
case _StoryData() when $default != null:
return $default(_that.version,_that.note,_that.locked,_that.events);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _StoryData implements StoryData {
  const _StoryData({this.version = 1, this.note = '',  List<String> locked = const <String>[],  List<StoryEventData> events = const <StoryEventData>[]}): _locked = locked,_events = events;
  factory _StoryData.fromJson(Map<String, dynamic> json) => _$StoryDataFromJson(json);

/// The file's format version (`Catalog` checks it against the one it
/// reads).
@override@JsonKey() final  int version;
/// For people reading the file; the game ignores it.
@override@JsonKey() final  String note;
/// Unlock keys closed on a new farm. See [StoryUnlock] for the forms.
 final  List<String> _locked;
/// Unlock keys closed on a new farm. See [StoryUnlock] for the forms.
@override@JsonKey() List<String> get locked {
  if (_locked is EqualUnmodifiableListView) return _locked;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locked);
}

/// Events in story order.
 final  List<StoryEventData> _events;
/// Events in story order.
@override@JsonKey() List<StoryEventData> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of StoryData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryDataCopyWith<_StoryData> get copyWith => __$StoryDataCopyWithImpl<_StoryData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryData&&(identical(other.version, version) || other.version == version)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.locked, _locked)&&const DeepCollectionEquality().equals(other.events, _events));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,version,note,const DeepCollectionEquality().hash(_locked),const DeepCollectionEquality().hash(_events));
}

@override
String toString() {
    return 'StoryData(version: $version, note: $note, locked: $locked, events: $events)';
}


}

/// @nodoc
abstract mixin class _$StoryDataCopyWith<$Res> implements $StoryDataCopyWith<$Res> {
  factory _$StoryDataCopyWith(_StoryData value, $Res Function(_StoryData) _then) = __$StoryDataCopyWithImpl;
@override @useResult
$Res call({
 int version, String note, List<String> locked, List<StoryEventData> events
});




}
/// @nodoc
class __$StoryDataCopyWithImpl<$Res>
    implements _$StoryDataCopyWith<$Res> {
  __$StoryDataCopyWithImpl(this._self, this._then);

  final _StoryData _self;
  final $Res Function(_StoryData) _then;

/// Create a copy of StoryData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? note = null,Object? locked = null,Object? events = null,}) {
  return _then(_StoryData(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,locked: null == locked ? _self._locked : locked // ignore: cast_nullable_to_non_nullable
as List<String>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<StoryEventData>,
  ));
}


}


/// @nodoc
mixin _$StoryEventData {

 String get id;/// A working name for developers; players see the app's words.
 String get title;/// Why the event is there, for people: which part of the story it
/// follows and what it is meant to teach. What it counts and opens the
/// other fields already say. The game ignores it.
 String get note;/// Events that must be done first. Null means the event before this one
/// in the file (none for the first); an empty list means none.
 List<String>? get after;/// All must hold at once. An empty list is done as soon as [after] is.
 List<StoryGoalData> get goals;/// Unlock keys opened when the event is done.
 List<String> get unlocks;/// Sent in the event's letter, taken by claiming it.
 int get food; List<SeedStackData> get seeds;
/// Create a copy of StoryEventData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryEventDataCopyWith<StoryEventData> get copyWith => _$StoryEventDataCopyWithImpl<StoryEventData>(this as StoryEventData, _$identity);

  /// Serializes this StoryEventData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoryEventData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryEventData&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.note, _this.note) || other.note == _this.note)&&const DeepCollectionEquality().equals(other.after, _this.after)&&const DeepCollectionEquality().equals(other.goals, _this.goals)&&const DeepCollectionEquality().equals(other.unlocks, _this.unlocks)&&(identical(other.food, _this.food) || other.food == _this.food)&&const DeepCollectionEquality().equals(other.seeds, _this.seeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoryEventData;
  return Object.hash(runtimeType,_this.id,_this.title,_this.note,const DeepCollectionEquality().hash(_this.after),const DeepCollectionEquality().hash(_this.goals),const DeepCollectionEquality().hash(_this.unlocks),_this.food,const DeepCollectionEquality().hash(_this.seeds));
}

@override
String toString() {
  final _this = this as StoryEventData;
  return 'StoryEventData(id: ${_this.id}, title: ${_this.title}, note: ${_this.note}, after: ${_this.after}, goals: ${_this.goals}, unlocks: ${_this.unlocks}, food: ${_this.food}, seeds: ${_this.seeds})';
}


}

/// @nodoc
abstract mixin class $StoryEventDataCopyWith<$Res>  {
  factory $StoryEventDataCopyWith(StoryEventData value, $Res Function(StoryEventData) _then) = _$StoryEventDataCopyWithImpl;
@useResult
$Res call({
 String id, String title, String note, List<String>? after, List<StoryGoalData> goals, List<String> unlocks, int food, List<SeedStackData> seeds
});




}
/// @nodoc
class _$StoryEventDataCopyWithImpl<$Res>
    implements $StoryEventDataCopyWith<$Res> {
  _$StoryEventDataCopyWithImpl(this._self, this._then);

  final StoryEventData _self;
  final $Res Function(StoryEventData) _then;

/// Create a copy of StoryEventData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? note = null,Object? after = freezed,Object? goals = null,Object? unlocks = null,Object? food = null,Object? seeds = null,}) {
  return _then(StoryEventData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,after: freezed == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as List<String>?,goals: null == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<StoryGoalData>,unlocks: null == unlocks ? _self.unlocks : unlocks // ignore: cast_nullable_to_non_nullable
as List<String>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryEventData].
extension StoryEventDataPatterns on StoryEventData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryEventData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryEventData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryEventData value)  $default,){
final _that = this;
switch (_that) {
case _StoryEventData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryEventData value)?  $default,){
final _that = this;
switch (_that) {
case _StoryEventData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String note,  List<String>? after,  List<StoryGoalData> goals,  List<String> unlocks,  int food,  List<SeedStackData> seeds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryEventData() when $default != null:
return $default(_that.id,_that.title,_that.note,_that.after,_that.goals,_that.unlocks,_that.food,_that.seeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String note,  List<String>? after,  List<StoryGoalData> goals,  List<String> unlocks,  int food,  List<SeedStackData> seeds)  $default,) {final _that = this;
switch (_that) {
case _StoryEventData():
return $default(_that.id,_that.title,_that.note,_that.after,_that.goals,_that.unlocks,_that.food,_that.seeds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String note,  List<String>? after,  List<StoryGoalData> goals,  List<String> unlocks,  int food,  List<SeedStackData> seeds)?  $default,) {final _that = this;
switch (_that) {
case _StoryEventData() when $default != null:
return $default(_that.id,_that.title,_that.note,_that.after,_that.goals,_that.unlocks,_that.food,_that.seeds);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _StoryEventData implements StoryEventData {
  const _StoryEventData({required this.id, this.title = '', this.note = '',  List<String>? after,  List<StoryGoalData> goals = const <StoryGoalData>[],  List<String> unlocks = const <String>[], this.food = 0,  List<SeedStackData> seeds = const <SeedStackData>[]}): _after = after,_goals = goals,_unlocks = unlocks,_seeds = seeds;
  factory _StoryEventData.fromJson(Map<String, dynamic> json) => _$StoryEventDataFromJson(json);

@override final  String id;
/// A working name for developers; players see the app's words.
@override@JsonKey() final  String title;
/// Why the event is there, for people: which part of the story it
/// follows and what it is meant to teach. What it counts and opens the
/// other fields already say. The game ignores it.
@override@JsonKey() final  String note;
/// Events that must be done first. Null means the event before this one
/// in the file (none for the first); an empty list means none.
 final  List<String>? _after;
/// Events that must be done first. Null means the event before this one
/// in the file (none for the first); an empty list means none.
@override List<String>? get after {
  final value = _after;
  if (value == null) return null;
  if (_after is EqualUnmodifiableListView) return _after;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// All must hold at once. An empty list is done as soon as [after] is.
 final  List<StoryGoalData> _goals;
/// All must hold at once. An empty list is done as soon as [after] is.
@override@JsonKey() List<StoryGoalData> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}

/// Unlock keys opened when the event is done.
 final  List<String> _unlocks;
/// Unlock keys opened when the event is done.
@override@JsonKey() List<String> get unlocks {
  if (_unlocks is EqualUnmodifiableListView) return _unlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlocks);
}

/// Sent in the event's letter, taken by claiming it.
@override@JsonKey() final  int food;
 final  List<SeedStackData> _seeds;
@override@JsonKey() List<SeedStackData> get seeds {
  if (_seeds is EqualUnmodifiableListView) return _seeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seeds);
}


/// Create a copy of StoryEventData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryEventDataCopyWith<_StoryEventData> get copyWith => __$StoryEventDataCopyWithImpl<_StoryEventData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryEventDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryEventData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.after, _after)&&const DeepCollectionEquality().equals(other.goals, _goals)&&const DeepCollectionEquality().equals(other.unlocks, _unlocks)&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.seeds, _seeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,note,const DeepCollectionEquality().hash(_after),const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_unlocks),food,const DeepCollectionEquality().hash(_seeds));
}

@override
String toString() {
    return 'StoryEventData(id: $id, title: $title, note: $note, after: $after, goals: $goals, unlocks: $unlocks, food: $food, seeds: $seeds)';
}


}

/// @nodoc
abstract mixin class _$StoryEventDataCopyWith<$Res> implements $StoryEventDataCopyWith<$Res> {
  factory _$StoryEventDataCopyWith(_StoryEventData value, $Res Function(_StoryEventData) _then) = __$StoryEventDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String note, List<String>? after, List<StoryGoalData> goals, List<String> unlocks, int food, List<SeedStackData> seeds
});




}
/// @nodoc
class __$StoryEventDataCopyWithImpl<$Res>
    implements _$StoryEventDataCopyWith<$Res> {
  __$StoryEventDataCopyWithImpl(this._self, this._then);

  final _StoryEventData _self;
  final $Res Function(_StoryEventData) _then;

/// Create a copy of StoryEventData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? note = null,Object? after = freezed,Object? goals = null,Object? unlocks = null,Object? food = null,Object? seeds = null,}) {
  return _then(_StoryEventData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,after: freezed == after ? _self._after : after // ignore: cast_nullable_to_non_nullable
as List<String>?,goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<StoryGoalData>,unlocks: null == unlocks ? _self._unlocks : unlocks // ignore: cast_nullable_to_non_nullable
as List<String>,food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as int,seeds: null == seeds ? _self._seeds : seeds // ignore: cast_nullable_to_non_nullable
as List<SeedStackData>,
  ));
}


}


/// @nodoc
mixin _$StoryGoalData {

 StoryGoalKind get kind; int get count; String? get building; PotatoType? get type; String? get zone; bool? get danger;
/// Create a copy of StoryGoalData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryGoalDataCopyWith<StoryGoalData> get copyWith => _$StoryGoalDataCopyWithImpl<StoryGoalData>(this as StoryGoalData, _$identity);

  /// Serializes this StoryGoalData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StoryGoalData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryGoalData&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.building, _this.building) || other.building == _this.building)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.zone, _this.zone) || other.zone == _this.zone)&&(identical(other.danger, _this.danger) || other.danger == _this.danger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StoryGoalData;
  return Object.hash(runtimeType,_this.kind,_this.count,_this.building,_this.type,_this.zone,_this.danger);
}

@override
String toString() {
  final _this = this as StoryGoalData;
  return 'StoryGoalData(kind: ${_this.kind}, count: ${_this.count}, building: ${_this.building}, type: ${_this.type}, zone: ${_this.zone}, danger: ${_this.danger})';
}


}

/// @nodoc
abstract mixin class $StoryGoalDataCopyWith<$Res>  {
  factory $StoryGoalDataCopyWith(StoryGoalData value, $Res Function(StoryGoalData) _then) = _$StoryGoalDataCopyWithImpl;
@useResult
$Res call({
 StoryGoalKind kind, int count, String? building, PotatoType? type, String? zone, bool? danger
});




}
/// @nodoc
class _$StoryGoalDataCopyWithImpl<$Res>
    implements $StoryGoalDataCopyWith<$Res> {
  _$StoryGoalDataCopyWithImpl(this._self, this._then);

  final StoryGoalData _self;
  final $Res Function(StoryGoalData) _then;

/// Create a copy of StoryGoalData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? count = null,Object? building = freezed,Object? type = freezed,Object? zone = freezed,Object? danger = freezed,}) {
  return _then(StoryGoalData(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as StoryGoalKind,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryGoalData].
extension StoryGoalDataPatterns on StoryGoalData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryGoalData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryGoalData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryGoalData value)  $default,){
final _that = this;
switch (_that) {
case _StoryGoalData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryGoalData value)?  $default,){
final _that = this;
switch (_that) {
case _StoryGoalData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoryGoalKind kind,  int count,  String? building,  PotatoType? type,  String? zone,  bool? danger)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryGoalData() when $default != null:
return $default(_that.kind,_that.count,_that.building,_that.type,_that.zone,_that.danger);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoryGoalKind kind,  int count,  String? building,  PotatoType? type,  String? zone,  bool? danger)  $default,) {final _that = this;
switch (_that) {
case _StoryGoalData():
return $default(_that.kind,_that.count,_that.building,_that.type,_that.zone,_that.danger);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoryGoalKind kind,  int count,  String? building,  PotatoType? type,  String? zone,  bool? danger)?  $default,) {final _that = this;
switch (_that) {
case _StoryGoalData() when $default != null:
return $default(_that.kind,_that.count,_that.building,_that.type,_that.zone,_that.danger);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(disallowUnrecognizedKeys: true)
class _StoryGoalData implements StoryGoalData {
  const _StoryGoalData({required this.kind, this.count = 1, this.building, this.type, this.zone, this.danger});
  factory _StoryGoalData.fromJson(Map<String, dynamic> json) => _$StoryGoalDataFromJson(json);

@override final  StoryGoalKind kind;
@override@JsonKey() final  int count;
@override final  String? building;
@override final  PotatoType? type;
@override final  String? zone;
@override final  bool? danger;

/// Create a copy of StoryGoalData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryGoalDataCopyWith<_StoryGoalData> get copyWith => __$StoryGoalDataCopyWithImpl<_StoryGoalData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryGoalDataToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryGoalData&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.count, count) || other.count == count)&&(identical(other.building, building) || other.building == building)&&(identical(other.type, type) || other.type == type)&&(identical(other.zone, zone) || other.zone == zone)&&(identical(other.danger, danger) || other.danger == danger));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,count,building,type,zone,danger);
}

@override
String toString() {
    return 'StoryGoalData(kind: $kind, count: $count, building: $building, type: $type, zone: $zone, danger: $danger)';
}


}

/// @nodoc
abstract mixin class _$StoryGoalDataCopyWith<$Res> implements $StoryGoalDataCopyWith<$Res> {
  factory _$StoryGoalDataCopyWith(_StoryGoalData value, $Res Function(_StoryGoalData) _then) = __$StoryGoalDataCopyWithImpl;
@override @useResult
$Res call({
 StoryGoalKind kind, int count, String? building, PotatoType? type, String? zone, bool? danger
});




}
/// @nodoc
class __$StoryGoalDataCopyWithImpl<$Res>
    implements _$StoryGoalDataCopyWith<$Res> {
  __$StoryGoalDataCopyWithImpl(this._self, this._then);

  final _StoryGoalData _self;
  final $Res Function(_StoryGoalData) _then;

/// Create a copy of StoryGoalData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? count = null,Object? building = freezed,Object? type = freezed,Object? zone = freezed,Object? danger = freezed,}) {
  return _then(_StoryGoalData(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as StoryGoalKind,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PotatoType?,zone: freezed == zone ? _self.zone : zone // ignore: cast_nullable_to_non_nullable
as String?,danger: freezed == danger ? _self.danger : danger // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
