import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/vec2.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/raid/raid_bodies.dart';
import 'package:potato_core/src/raid/raid_command.dart';
import 'package:potato_core/src/raid/raid_simulation.dart';

/// What one party member brings into a run at the start.
final class RaidMemberStart {
  const RaidMemberStart({
    this.name = '',
    this.food = 0,
    this.equipped = const Equipped(),
    this.progress = 0,
    this.companions = const [],
    this.bag = const [],
    this.seedLevels = const {},
    this.storedGearLevels = const {},
  });

  factory RaidMemberStart.fromJson(
    Map<String, dynamic> json,
  ) => RaidMemberStart(
    name: json['name'] as String? ?? '',
    food: json['food'] as int? ?? 0,
    equipped: switch (json['equipped']) {
      final Map<String, dynamic> e => Equipped.fromJson(e),
      _ => const Equipped(),
    },
    progress: json['progress'] as int? ?? 0,
    companions: [
      for (final c in json['companions'] as List<Object?>? ?? const [])
        CompanionStart.fromJson(c! as Map<String, dynamic>),
    ],
    bag: [
      for (final s in json['bag'] as List<Object?>? ?? const [])
        ItemStack.fromJson(s! as Map<String, dynamic>),
    ],
    seedLevels: {
      for (final MapEntry(:key, :value)
          in (json['seed_levels'] as Map<String, dynamic>? ?? const {}).entries)
        PotatoType.values.byName(key): value as int,
    },
    storedGearLevels: {
      for (final MapEntry(:key, :value)
          in (json['stored_gear_levels'] as Map<String, dynamic>? ?? const {})
              .entries)
        GearKind.values.byName(key): value as int,
    },
  );

  final String name;
  final int food;
  final Equipped equipped;
  final int progress;
  final List<CompanionStart> companions;

  /// What is already in the bag besides [food]: at a friend's farm, what
  /// came back from the last run there and what was taken from truck beds
  /// (2026-10-28, 사용자).
  final List<ItemStack> bag;

  /// The highest level of each potato type on the member's farm: seeds found
  /// in the run grow from it (2026-10-30, 사용자). → [LootLevels]
  final Map<PotatoType, int> seedLevels;

  /// The best level of each gear kind the member keeps in their farm's
  /// storage and could wear: gear found may grow from it, as
  /// `GearRulesData.lootLevelMode` says (2026-10-30, 사용자). → [LootLevels]
  final Map<GearKind, int> storedGearLevels;

  Map<String, dynamic> toJson() => {
    if (name.isNotEmpty) 'name': name,
    'food': food,
    'equipped': equipped.toJson(),
    'progress': progress,
    'companions': [for (final c in companions) c.toJson()],
    if (bag.isNotEmpty) 'bag': [for (final s in bag) s.toJson()],
    if (seedLevels.isNotEmpty)
      'seed_levels': {
        for (final MapEntry(:key, :value) in seedLevels.entries)
          key.name: value,
      },
    if (storedGearLevels.isNotEmpty)
      'stored_gear_levels': {
        for (final MapEntry(:key, :value) in storedGearLevels.entries)
          key.name: value,
      },
  };
}

/// One player in a run, with what only they carry: their bag, their
/// companions, their signal and how their run ended.
///
/// Party members share a team, so they never hurt each other and buff
/// potatoes reach all of them. Each leaves on their own: once [outcome] is
/// set the member is out of the run while the others go on.
final class RaidMember {
  RaidMember({
    required this.player,
    required this.bag,
    required this.companions,
    this.progress = 0,
    this.signal,
    this.kept,
    this.outcome,
    this.downLeft,
    this.revive = 0,
  });

  factory RaidMember.fromJson(Map<String, dynamic> json, Catalog catalog) {
    final outcome = json['outcome'] as String?;
    return RaidMember(
      player: RaidPlayer.fromJson(json['player'] as Map<String, dynamic>),
      bag: Bag.restore([
        for (final s in json['bag'] as List<Object?>)
          s == null ? null : ItemStack.fromJson(s as Map<String, dynamic>),
      ], catalog.stackOf),
      companions: [
        for (final c in json['companions'] as List<Object?>)
          RaidCompanion.fromJson(c! as Map<String, dynamic>),
      ],
      progress: json['progress'] as int,
      signal: switch (json['signal']) {
        final Map<String, dynamic> signal => RaidSignal.fromJson(signal),
        _ => null,
      },
      kept: switch (json['kept']) {
        final Map<String, dynamic> kept => Equipped.fromJson(kept),
        _ => null,
      },
      outcome: outcome == null ? null : RaidOutcome.values.byName(outcome),
      downLeft: (json['down_left'] as num?)?.toDouble(),
      revive: (json['revive'] as num?)?.toDouble() ?? 0,
    );
  }

  final RaidPlayer player;

  /// The member's bag; changing bags replaces it.
  Bag bag;
  final List<RaidCompanion> companions;

  /// The member's farm progress: gear above it plus the margin cannot be
  /// worn.
  final int progress;

  /// The countdown after this member's signal, if one is running.
  RaidSignal? signal;

  /// After a lost danger run, the worn gear that was not lost.
  Equipped? kept;

  /// Set once this member's run is over.
  RaidOutcome? outcome;

  /// Seconds left to be revived while this member is down in a party
  /// (`PartyRulesData.downSeconds`); null when standing. At zero they fail.
  double? downLeft;

  /// Seconds of revive built up by teammates standing close; it drains
  /// slowly while nobody is.
  double revive;

  /// The stick: a direction on the world plane, at most 1 long. Not saved.
  Vec2 move = Vec2.zero;

  int get id => player.id;
  bool get isOut => outcome != null;

  /// Down in a party, waiting for a teammate (not out yet).
  bool get isDowned => downLeft != null && outcome == null;

  Map<String, dynamic> toJson() => {
    'player': player.toJson(),
    'bag': bag.toJson(),
    'companions': [for (final c in companions) c.toJson()],
    'progress': progress,
    'signal': signal?.toJson(),
    'kept': kept?.toJson(),
    'outcome': outcome?.name,
    if (downLeft != null) 'down_left': downLeft,
    if (revive > 0) 'revive': revive,
  };
}
