import 'dart:math' as math;

import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/raid_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// How a zone looks against a party's combat power.
enum PowerVerdict { easy, fair, risky }

/// What equipment does, in numbers. A null piece is bare hands.
final class GearStats {
  const GearStats(this.catalog);

  final Catalog catalog;

  GearRulesData get rules => catalog.rules.gear;

  /// The weapon id that shoots: the piece's family, or bare hands'.
  String weaponOf(Gear? weapon) => switch (weapon) {
    null => rules.bareWeapon,
    _ when _bareInstead(weapon) => rules.bareWeapon,
    _ => weapon.family,
  };

  /// A broken weapon weaker than bare hands shoots as bare hands
  /// (2026-10-30, 사용자: the stronger of the two).
  bool _bareInstead(Gear weapon) {
    if (!isBroken(weapon)) return false;
    double dps(String id, double scale) {
      final data = catalog.weapons[id];
      if (data == null) return 0;
      return data.damage *
          scale *
          data.pellets /
          (data.interval + data.aimSeconds);
    }

    return dps(weapon.family, _brokenScale) < dps(rules.bareWeapon, 1);
  }

  /// A broken weapon's damage scale: a share of a plain level 1 one's.
  double get _brokenScale =>
      (rules.gradeDamage[Grade.normal] ?? 1) *
      levelGrowth(rules.levelDamagePermille, 1) *
      rules.brokenDamage;

  /// Whether [gear] is worn out (2026-10-30, 사용자): a weapon keeps its
  /// family at a share of a plain level 1 one's damage
  /// ([GearRulesData.brokenDamage]), or shoots as bare hands if those are
  /// stronger; a bag or belt works as bare hands.
  bool isBroken(Gear gear) => gear.wear >= rules.durability;

  /// How much use [gear] has left, from 1 (as new) to 0 (broken).
  double durabilityLeft(Gear gear) =>
      (1 - gear.wear / rules.durability).clamp(0, 1);

  /// [equipped] after a run of [seconds]: each piece worn a little more.
  Equipped afterRun(Equipped equipped, double seconds) {
    final wear = (seconds / 60 * rules.wearPerMinute).ceil().clamp(
      0,
      rules.wearPerRunMax,
    );
    Gear? worn(Gear? gear) =>
        gear?.copyWith(wear: (gear.wear + wear).clamp(0, rules.durability));
    return Equipped(
      weapon: worn(equipped.weapon),
      bag: worn(equipped.bag),
      belt: worn(equipped.belt),
    );
  }

  /// How much a weapon's base damage is multiplied: grade, level and
  /// workbench levels.
  double damageScale(Gear? weapon) {
    if (weapon == null) return 1;
    if (_bareInstead(weapon)) return 1;
    if (isBroken(weapon)) return _brokenScale;
    return (rules.gradeDamage[weapon.grade] ?? 1) *
        levelGrowth(rules.levelDamagePermille, weapon.level) *
        (1 + weapon.enhance * catalog.rules.workbench.damagePercent / 100) *
        (1 + percentOf([weapon], GearStat.damage) / 100);
  }

  /// The percent [pieces]' abilities add up to for [stat]; broken pieces
  /// count for nothing (2026-11-01, 사용자: gear abilities).
  double percentOf(Iterable<Gear?> pieces, GearStat stat) {
    var total = 0.0;
    for (final piece in pieces) {
      if (piece == null || isBroken(piece)) continue;
      for (final ability in piece.abilities) {
        final data = rules.ability(ability.id);
        if (data == null || data.stat != stat) continue;
        if (ability.tier < 0 || ability.tier >= data.tiers.length) continue;
        total += data.tiers[ability.tier].percent;
      }
    }
    return total;
  }

  /// [equipped]'s abilities for [stat], as a factor (1.05 for +5%).
  double factorOf(Equipped equipped, GearStat stat) =>
      math.max(0.05, 1 + percentOf(equipped.all, stat) / 100);

  /// The value of [ability], in percent, or null if the catalog lost it.
  double? percentOfAbility(GearAbility ability) {
    final tiers = rules.ability(ability.id)?.tiers;
    if (tiers == null || ability.tier < 0 || ability.tier >= tiers.length) {
      return null;
    }
    return tiers[ability.tier].percent;
  }

  /// The stat [ability] changes, or null if the catalog lost it.
  GearStat? statOf(GearAbility ability) => rules.ability(ability.id)?.stat;

  /// The potato types a belt of [grade] takes, one a slot (as many as its
  /// grade gives), each food, combat or buff at random; other kinds have
  /// none. Found belts and the gear lab's roll both use it (2026-11-11,
  /// 사용자: rolling a belt rolls its slots too).
  List<PotatoType> rollSlots(GearKind kind, Grade grade, GameRandom random) {
    if (kind != GearKind.belt) return const [];
    const types = [PotatoType.food, PotatoType.combat, PotatoType.buff];
    return [
      for (var i = 0; i < (rules.beltSlots[grade] ?? 1); i++)
        types[random.nextInt(types.length)],
    ];
  }

  /// Abilities a new piece of [kind], [family] and [grade] rolls: one pool
  /// of every tier of every ability that fits, weighed by its rarity; an
  /// ability comes once a piece.
  List<GearAbility> rollAbilities(
    GearKind kind,
    String family,
    Grade grade,
    GameRandom random,
  ) {
    final picked = <GearAbility>[];
    final count = rules.abilitySlots[grade] ?? 0;
    for (var n = 0; n < count; n++) {
      final options = <(GearAbility, int)>[
        for (final data in rules.abilities)
          if (data.fits(kind, family) && !picked.any((a) => a.id == data.id))
            for (final (tier, t) in data.tiers.indexed)
              (
                GearAbility(id: data.id, tier: tier),
                rules.abilityRarityWeights[t.rarity] ?? 0,
              ),
      ];
      final total = options.fold(0, (sum, o) => sum + o.$2);
      if (total <= 0) break;
      var roll = random.nextInt(total);
      for (final (ability, weight) in options) {
        if (roll < weight) {
          picked.add(ability);
          break;
        }
        roll -= weight;
      }
    }
    return picked;
  }

  /// How [weapon] shoots with its abilities: range, spread and fire rate.
  WeaponData tuned(WeaponData data, Gear? weapon) {
    if (weapon == null || isBroken(weapon) || weapon.abilities.isEmpty) {
      return data;
    }
    double factor(GearStat stat) =>
        math.max(0.05, 1 + percentOf([weapon], stat) / 100);
    return data.copyWith(
      range: data.range * factor(GearStat.range),
      spreadDegrees: data.spreadDegrees * factor(GearStat.spread),
      interval: data.interval / factor(GearStat.fireRate),
    );
  }

  int bagSlots(Gear? bag) => bag == null || isBroken(bag)
      ? rules.bareBagSlots
      : (rules.bagSlots[bag.grade] ?? rules.bareBagSlots) +
            bag.enhance * rules.bagEnhanceSlots;

  /// How much more max health [bag] gives its wearer, as a share (0.1 is
  /// +10%): its level only (2026-10-30, 사용자).
  double bagHp(Gear? bag) => bag == null || isBroken(bag)
      ? 0
      : bag.level / 10 * rules.bagHpPercentPerTenLevels / 100;

  /// How much more max health [equipped] gives its wearer, as a share:
  /// the bag's level and every piece's health abilities.
  double hpBonus(Equipped equipped) =>
      bagHp(equipped.bag) + percentOf(equipped.all, GearStat.hp) / 100;

  /// Each belt slot's potato type; null takes any (bare hands).
  List<PotatoType?> beltSlots(Gear? belt) => belt == null || isBroken(belt)
      ? List.filled(rules.bareBeltSlots, null)
      : belt.slots;

  /// How much stronger a potato in one of [belt]'s slots is at its job, as
  /// a share (0.1 is +10%).
  double beltBoost(Gear? belt) {
    if (belt == null || isBroken(belt)) return 0;
    return ((rules.beltPercent[belt.grade] ?? 0) +
            belt.level / 10 * rules.beltPercentPerTenLevels +
            belt.enhance * rules.beltEnhancePercent +
            percentOf([belt], GearStat.beltBonus)) /
        100;
  }

  /// The slot each of [types] takes in [belt], in order: a slot of its own
  /// type first, else one that takes any. Null when they do not all fit.
  List<int>? fitBelt(Gear? belt, List<PotatoType> types) {
    final slots = beltSlots(belt);
    final taken = List.filled(slots.length, false);
    final placed = <int>[];
    for (final type in types) {
      var at = -1;
      for (var i = 0; i < slots.length && at < 0; i++) {
        if (!taken[i] && slots[i] == type) at = i;
      }
      for (var i = 0; i < slots.length && at < 0; i++) {
        if (!taken[i] && slots[i] == null) at = i;
      }
      if (at < 0) return null;
      taken[at] = true;
      placed.add(at);
    }
    return placed;
  }

  /// Whether a farm at [progress] may wear [gear].
  bool canWear(Gear gear, int progress) =>
      gear.level <= progress + rules.useMargin;

  /// Materials [gear] breaks down into: its grade's, plus a share of what
  /// its workbench levels took.
  int disassembly(Gear gear) {
    final bench = catalog.rules.workbench;
    var spent = 0;
    for (var level = 0; level < gear.enhance; level++) {
      spent += bench.nextFrom(level).materials;
    }
    return (rules.disassemble[gear.grade] ?? 0) +
        spent * rules.enhanceRefundPercent ~/ 100;
  }

  /// Damage per second of [weapon] (charging time counts).
  double weaponDps(Gear? weapon) {
    final found = catalog.weapons[weaponOf(weapon)];
    if (found == null) return 0;
    final data = tuned(found, weapon);
    final damage = data.damage * damageScale(weapon) * data.pellets;
    return damage / (data.interval + data.aimSeconds);
  }

  /// One number for how strong [equipped] and [companions] are, from their
  /// final stats (combat potatoes' health and attack with level and belt).
  int combatPower(
    Equipped equipped,
    List<({PotatoType type, Grade grade, int level, CombatStyle? style})>
    companions,
  ) {
    final power = catalog.rules.combatPower;
    final companion = catalog.rules.raid.companion;
    final boost = beltBoost(equipped.belt);
    var points = weaponDps(equipped.weapon) * power.weaponDps;
    for (final c in companions) {
      final style = c.type == PotatoType.combat
          ? companion.styles[c.style]
          : null;
      if (style == null) {
        points += power.helper;
        continue;
      }
      final hp =
          style.maxHp *
          levelGrowth(companion.levelHpPermille, c.level) *
          factorOf(equipped, GearStat.companionHp) *
          (1 + boost);
      final attack =
          style.damage *
          levelGrowth(companion.levelAttackPermille, c.level) *
          catalog.rules.potatoes.attackOf(c.grade) *
          (1 + boost);
      points += hp * power.potatoHp + attack / style.interval * power.potatoDps;
    }
    return points.round();
  }

  /// What a zone of [score] calls for.
  int recommendedPower(int score) {
    final power = catalog.rules.combatPower;
    return ((power.recommendedBase + power.recommendedPerScore * score) *
            levelGrowth(power.recommendedGrowthPermille, score))
        .round();
  }

  PowerVerdict verdict(int power, int recommended) {
    final rules = catalog.rules.combatPower;
    final ratio = recommended <= 0 ? double.infinity : power / recommended;
    if (ratio >= rules.easyRatio) return PowerVerdict.easy;
    if (ratio >= rules.fairRatio) return PowerVerdict.fair;
    return PowerVerdict.risky;
  }
}
