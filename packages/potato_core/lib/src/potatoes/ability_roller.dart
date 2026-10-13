import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// Hands out abilities and combat styles with the catalog's hidden odds.
///
/// Every draw goes through the caller's [GameRandom], so a saved random
/// state gives the same seeds and potatoes again.
final class AbilityRoller {
  const AbilityRoller(this.catalog);

  final Catalog catalog;

  /// A new seed: its first ability from the type's own pool, and a combat
  /// style for combat seeds.
  Seed seed({
    required PotatoType type,
    required Grade grade,
    required int level,
    required GameRandom random,
  }) => Seed(
    type: type,
    grade: grade,
    level: level,
    ability: _pick(catalog.abilitiesIn(type.name), const {}, random)!.id,
    style: type == PotatoType.combat
        ? CombatStyle.values[random.nextInt(CombatStyle.values.length)]
        : null,
  );

  /// The abilities a potato of [type] and [grade] comes up with: [first]
  /// (the seed's), then one per remaining slot. Each later slot picks the
  /// shared or the type's pool by the catalog's odds, then an ability there
  /// by hidden rarity; an ability never comes twice, and an empty pool
  /// falls back to the other.
  List<String> slots({
    required PotatoType type,
    required Grade grade,
    required String first,
    required GameRandom random,
  }) {
    final rules = catalog.abilityRules;
    final count = rules.slotsByGrade[grade] ?? 1;
    final taken = {first};
    final common = catalog.abilitiesIn(Catalog.commonPool).toList();
    final own = catalog.abilitiesIn(type.name).toList();
    final odds = rules.extraSlotPoolWeight;
    for (var slot = 1; slot < count; slot++) {
      final total = odds.common + odds.unique;
      final fromCommon = total > 0 && random.nextInt(total) < odds.common;
      final ability =
          _pick(fromCommon ? common : own, taken, random) ??
          _pick(fromCommon ? own : common, taken, random);
      if (ability == null) break;
      taken.add(ability.id);
    }
    return taken.toList();
  }

  /// An ability from [pool] not in [taken], by weight; null if none left.
  AbilityData? _pick(
    Iterable<AbilityData> pool,
    Set<String> taken,
    GameRandom random,
  ) {
    final weights = catalog.abilityRules.rarityWeights;
    final left = [
      for (final ability in pool)
        if (!taken.contains(ability.id))
          (ability, ability.weight ?? weights[ability.rarity]!),
    ];
    if (left.isEmpty) return null;
    var roll = random.nextInt(left.fold(0, (sum, e) => sum + e.$2));
    for (final (ability, weight) in left) {
      roll -= weight;
      if (roll < 0) return ability;
    }
    return left.last.$1;
  }
}
