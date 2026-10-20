import 'package:potato_core/src/catalog/catalog.dart';
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
  });

  factory RaidMemberStart.fromJson(Map<String, dynamic> json) =>
      RaidMemberStart(
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
      );

  final String name;
  final int food;
  final Equipped equipped;
  final int progress;
  final List<CompanionStart> companions;

  Map<String, dynamic> toJson() => {
    if (name.isNotEmpty) 'name': name,
    'food': food,
    'equipped': equipped.toJson(),
    'progress': progress,
    'companions': [for (final c in companions) c.toJson()],
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

  /// The stick: a direction on the world plane, at most 1 long. Not saved.
  Vec2 move = Vec2.zero;

  int get id => player.id;
  bool get isOut => outcome != null;

  Map<String, dynamic> toJson() => {
    'player': player.toJson(),
    'bag': bag.toJson(),
    'companions': [for (final c in companions) c.toJson()],
    'progress': progress,
    'signal': signal?.toJson(),
    'kept': kept?.toJson(),
    'outcome': outcome?.name,
  };
}
