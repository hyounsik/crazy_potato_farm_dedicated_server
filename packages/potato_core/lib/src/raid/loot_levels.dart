import 'dart:math' as math;

import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/items/gear_stats.dart';

/// The levels of seeds and gear found in a run (2026-10-30, 사용자): the
/// party's own level plus 0 to 2, kept inside the zone's range. Gear grows
/// as [mode] says, seeds from the best potato of that type on their farms;
/// each averaged over the party, a bare slot or a missing type counting as
/// the range's bottom. So each run gives a little more, and going past a
/// zone's range takes the next zone.
final class LootLevels {
  LootLevels(
    ZoneData zone, {
    this.mode = LootLevelMode.worn,
    required this._worn,
    this._owned = const [],
    required this._seedLevels,
  }) : min = zone.levelMin ?? zone.score,
       max = zone.levelMax ?? zone.score;

  final int min;
  final int max;
  final LootLevelMode mode;
  final List<Equipped> _worn;
  final List<Map<GearKind, int>> _owned;
  final List<Map<PotatoType, int>> _seedLevels;

  /// How many levels above the party's a find may be.
  static const int spread = 2;

  /// The best level of each kind among [pieces] that are not broken and
  /// may be worn at [progress], on top of [stored]'s (already filtered).
  static Map<GearKind, int> ownedLevels(
    GearStats stats,
    Iterable<Gear> pieces,
    int progress, {
    Map<GearKind, int> stored = const {},
  }) {
    final best = {...stored};
    for (final piece in pieces) {
      if (stats.isBroken(piece) || !stats.canWear(piece, progress)) continue;
      best[piece.kind] = math.max(best[piece.kind] ?? 0, piece.level);
    }
    return best;
  }

  int gear(GearKind kind, GameRandom random) => _roll(switch (mode) {
    LootLevelMode.worn => [for (final e in _worn) e.of(kind)?.level],
    LootLevelMode.ownedBest => [for (final owned in _owned) owned[kind]],
    LootLevelMode.ownedAverage => [for (final owned in _owned) _average(owned)],
  }, random);

  int seed(PotatoType type, GameRandom random) =>
      _roll([for (final levels in _seedLevels) levels[type]], random);

  double _average(Map<GearKind, int> owned) =>
      GearKind.values.fold(0, (sum, kind) => sum + (owned[kind] ?? min)) /
      GearKind.values.length;

  int _roll(List<num?> levels, GameRandom random) {
    final base = levels.isEmpty
        ? min
        : (levels.fold<num>(0, (sum, l) => sum + (l ?? min)) / levels.length)
              .round();
    return (base + random.nextInt(spread + 1)).clamp(min, max);
  }
}
