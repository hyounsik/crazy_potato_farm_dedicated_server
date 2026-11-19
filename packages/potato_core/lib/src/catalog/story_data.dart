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
///
/// JSON has no comments, so the file and each event carry a [note] for
/// people. A key the file does not know is an error, not ignored: a typo
/// such as `unlock` for `unlocks` would otherwise leave an event that opens
/// nothing (2026-11-12, 사용자).
@freezed
abstract class StoryData with _$StoryData {
  // Freezed passes this on to the generated class (its documented way).
  // ignore: invalid_annotation_target
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory StoryData({
    /// The file's format version (`Catalog` checks it against the one it
    /// reads).
    @Default(1) int version,

    /// For people reading the file; the game ignores it.
    @Default('') String note,

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

  /// Using what stands on the farm (2026-11-16, 사용자: chapter 1 opens
  /// them scene by scene): fields (plant, harvest, pests, moving potatoes
  /// between fields).
  static const String useField = 'use:field';

  /// Making, resizing, moving and removing fields.
  static const String fieldBuild = 'field_build';

  /// The truck: loading its bed and setting out. A story map played once
  /// (`ZoneData.once`) is set out to without it: the story takes the farmer
  /// there.
  static const String useTruck = 'use:truck';

  /// The potato cellar: potatoes in and out of it.
  static const String useCellar = 'use:potato_cellar';

  /// Every `use:`-like key above.
  static const List<String> uses = [useField, fieldBuild, useTruck, useCellar];

  /// Story region `<id>` counts as cleared, as if its boss fell: the zones
  /// in its [ZoneData.clearOpens] open and its score counts toward progress
  /// (2026-11-08, 사용자: the story may clear a region on its own).
  static String clear(String id) => 'clear:$id';

  static const String _buildingPrefix = 'building:';
  static const String _zonePrefix = 'zone:';
  static const String _clearPrefix = 'clear:';

  /// The building id in a `building:` key, or null.
  static String? buildingOf(String key) => key.startsWith(_buildingPrefix)
      ? key.substring(_buildingPrefix.length)
      : null;

  /// The zone id in a `zone:` key, or null.
  static String? zoneOf(String key) =>
      key.startsWith(_zonePrefix) ? key.substring(_zonePrefix.length) : null;

  /// The zone id in a `clear:` key, or null.
  static String? clearOf(String key) =>
      key.startsWith(_clearPrefix) ? key.substring(_clearPrefix.length) : null;
}

/// Story actions the game counts (`StoryGoalKind.action`, 2026-11-16,
/// 사용자: chapter 1).
abstract final class StoryActions {
  /// A seed planted (the farm counts it).
  static const String plant = 'plant';

  /// Into the house (the app says so).
  static const String enterHouse = 'enter_house';

  /// Out of the house onto the farm (the app says so).
  static const String leaveHouse = 'leave_house';
}

/// One story event: done when every goal holds, after the events [after].
@freezed
abstract class StoryEventData with _$StoryEventData {
  // ignore: invalid_annotation_target
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory StoryEventData({
    required String id,

    /// A working name for developers; players see the app's words.
    @Default('') String title,

    /// Why the event is there, for people: which part of the story it
    /// follows and what it is meant to teach. What it counts and opens the
    /// other fields already say. The game ignores it.
    @Default('') String note,

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

  /// Seeds in the pouch, of [StoryGoalData.type] when set (2026-11-19,
  /// 사용자: chapter 4 starts with the first buff seed in hand).
  seeds,

  /// Runs come home with success, to [StoryGoalData.zone] when set, or to
  /// danger (true) or safe (false) zones when [StoryGoalData.danger] is set.
  escapes,

  /// Runs in which the boss of [StoryGoalData.zone] (any zone when null)
  /// fell, however the run ended (2026-11-02, 사용자).
  bossKills,

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

  /// Times the player did [StoryGoalData.action] (2026-11-16, 사용자:
  /// chapter 1): `plant` (a seed planted), `enter_house`, `leave_house`
  /// (sent by the app), any other name the app sends.
  action,

  /// Seconds since the event could start (its [StoryEventData.after] were
  /// done). Farm time, so it runs while the app is closed too.
  wait,
}

/// One condition of an event. [count] is the amount to reach (seconds for
/// [StoryGoalKind.wait]); counts are since the farm was made, not since the
/// event could start, except [StoryGoalKind.wait].
@freezed
abstract class StoryGoalData with _$StoryGoalData {
  // ignore: invalid_annotation_target
  @JsonSerializable(disallowUnrecognizedKeys: true)
  const factory StoryGoalData({
    required StoryGoalKind kind,
    @Default(1) int count,
    String? building,
    PotatoType? type,
    String? zone,
    bool? danger,

    /// The action counted by [StoryGoalKind.action].
    String? action,
  }) = _StoryGoalData;

  factory StoryGoalData.fromJson(Map<String, dynamic> json) =>
      _$StoryGoalDataFromJson(json);
}
