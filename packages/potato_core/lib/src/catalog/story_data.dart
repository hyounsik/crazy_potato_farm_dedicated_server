import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';

part 'story_data.freezed.dart';
part 'story_data.g.dart';

/// The main story's events and what they unlock (`story.json`).
///
/// A feature listed in [locked] stays closed until an event that unlocks it
/// is done; anything not listed is open from the start. The story's words
/// (letters, scenes) are the app's; this file only holds the rules.
@freezed
abstract class StoryData with _$StoryData {
  const factory StoryData({
    /// Unlock keys closed on a new farm. See [StoryUnlock] for the forms.
    @Default(<String>[]) List<String> locked,

    /// Events in story order.
    @Default(<StoryEventData>[]) List<StoryEventData> events,
  }) = _StoryData;

  factory StoryData.fromJson(Map<String, dynamic> json) =>
      _$StoryDataFromJson(json);
}

/// The forms an unlock key takes.
abstract final class StoryUnlock {
  /// Pests start appearing on the farm.
  static const String pests = 'pests';

  /// Locked blocks may be opened with baby potatoes.
  static const String farmExpansion = 'farm_expansion';

  /// The building kind `<id>` shows in the build menu.
  static String building(String id) => 'building:$id';

  /// Runs may go to zone `<id>`.
  static String zone(String id) => 'zone:$id';

  static const String _buildingPrefix = 'building:';
  static const String _zonePrefix = 'zone:';

  /// The building id in a `building:` key, or null.
  static String? buildingOf(String key) => key.startsWith(_buildingPrefix)
      ? key.substring(_buildingPrefix.length)
      : null;

  /// The zone id in a `zone:` key, or null.
  static String? zoneOf(String key) =>
      key.startsWith(_zonePrefix) ? key.substring(_zonePrefix.length) : null;
}

/// One story event: done when every goal holds, after the events [after].
@freezed
abstract class StoryEventData with _$StoryEventData {
  const factory StoryEventData({
    required String id,

    /// A working name for developers; players see the app's words.
    @Default('') String title,

    /// Events that must be done first. Null means the event before this one
    /// in the file (none for the first); an empty list means none.
    List<String>? after,

    /// All must hold at once. An empty list is done as soon as [after] is.
    @Default(<StoryGoalData>[]) List<StoryGoalData> goals,

    /// Unlock keys opened when the event is done.
    @Default(<String>[]) List<String> unlocks,

    /// Sent in the event's letter, taken by claiming it.
    @Default(0) int food,
    @Default(<SeedStackData>[]) List<SeedStackData> seeds,
  }) = _StoryEventData;

  factory StoryEventData.fromJson(Map<String, dynamic> json) =>
      _$StoryEventDataFromJson(json);
}

/// What a goal counts.
@JsonEnum(fieldRename: FieldRename.snake)
enum StoryGoalKind {
  /// Fields on the farm.
  fields,

  /// Buildings of kind [StoryGoalData.building] (any kind when null).
  buildings,

  /// Living potatoes on the farm, of [StoryGoalData.type] when set.
  potatoes,

  /// Baby potatoes the farm holds.
  food,

  /// Runs come home with success, to [StoryGoalData.zone] when set, or to
  /// danger (true) or safe (false) zones when [StoryGoalData.danger] is set.
  escapes,

  /// The farm's progress (highest zone score escaped from).
  progress,

  /// The player's combat power with worn gear and no companions.
  power,

  /// Pests that appeared on the farm.
  pestsAppeared,

  /// Pests cleared, by tap or by guards.
  pestsCleared,

  /// Potatoes that died of old age or were lost on runs.
  potatoesDied,

  /// Combat seeds trained in a training ground.
  potatoesTrained,

  /// Seconds since the event could start (its [StoryEventData.after] were
  /// done). Farm time, so it runs while the app is closed too.
  wait,
}

/// One condition of an event. [count] is the amount to reach (seconds for
/// [StoryGoalKind.wait]); counts are since the farm was made, not since the
/// event could start, except [StoryGoalKind.wait].
@freezed
abstract class StoryGoalData with _$StoryGoalData {
  const factory StoryGoalData({
    required StoryGoalKind kind,
    @Default(1) int count,
    String? building,
    PotatoType? type,
    String? zone,
    bool? danger,
  }) = _StoryGoalData;

  factory StoryGoalData.fromJson(Map<String, dynamic> json) =>
      _$StoryGoalDataFromJson(json);
}
