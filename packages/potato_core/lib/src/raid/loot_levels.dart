import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/items/gear.dart';

/// The levels of seeds and gear found in a run (2026-10-30, 사용자): the
/// party's own level plus 0 to 2, kept inside the zone's range. Gear grows
/// from what the party wears of that kind, seeds from the best potato of
/// that type on their farms; each averaged over the party, a bare slot or a
/// missing type counting as the range's bottom. So each run gives a little
/// more, and going past a zone's range takes the next zone.
final class LootLevels {
  LootLevels(ZoneData zone, {required this._worn, required this._seedLevels})
    : min = zone.levelMin ?? zone.score,
      max = zone.levelMax ?? zone.score;

  final int min;
  final int max;
  final List<Equipped> _worn;
  final List<Map<PotatoType, int>> _seedLevels;

  /// How many levels above the party's a find may be.
  static const int spread = 2;

  int gear(GearKind kind, GameRandom random) =>
      _roll([for (final e in _worn) e.of(kind)?.level], random);

  int seed(PotatoType type, GameRandom random) =>
      _roll([for (final levels in _seedLevels) levels[type]], random);

  int _roll(List<int?> levels, GameRandom random) {
    final base = levels.isEmpty
        ? min
        : (levels.fold(0, (sum, l) => sum + (l ?? min)) / levels.length)
              .round();
    return (base + random.nextInt(spread + 1)).clamp(min, max);
  }
}
