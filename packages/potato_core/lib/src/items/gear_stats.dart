import 'package:potato_core/src/catalog/catalog.dart';
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
  String weaponOf(Gear? weapon) => weapon?.family ?? rules.bareWeapon;

  /// How much a weapon's base damage is multiplied: grade, level and
  /// workbench levels.
  double damageScale(Gear? weapon) {
    if (weapon == null) return 1;
    return (rules.gradeDamage[weapon.grade] ?? 1) *
        (1 + weapon.level * rules.levelDamagePermille / 1000) *
        (1 + weapon.enhance * catalog.rules.workbench.damagePercent / 100);
  }

  int bagSlots(Gear? bag) => bag == null
      ? rules.bareBagSlots
      : (rules.bagSlots[bag.grade] ?? rules.bareBagSlots) +
            bag.enhance * rules.bagEnhanceSlots;

  /// Each belt slot's potato type; null takes any (bare hands).
  List<PotatoType?> beltSlots(Gear? belt) =>
      belt == null ? List.filled(rules.bareBeltSlots, null) : belt.slots;

  /// How much stronger a potato in one of [belt]'s slots is at its job, as
  /// a share (0.1 is +10%).
  double beltBoost(Gear? belt) {
    if (belt == null) return 0;
    return ((rules.beltPercent[belt.grade] ?? 0) +
            belt.level / 10 * rules.beltPercentPerTenLevels +
            belt.enhance * rules.beltEnhancePercent) /
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
    final data = catalog.weapons[weaponOf(weapon)];
    if (data == null) return 0;
    final damage = data.damage * damageScale(weapon) * data.pellets;
    return damage / (data.interval + data.aimSeconds);
  }

  /// One number for how strong [equipped] and [companions] are, from their
  /// final stats (combat potatoes' health and attack with level and belt).
  int combatPower(
    Equipped equipped,
    List<({PotatoType type, int level, CombatStyle? style})> companions,
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
          (1 + c.level * companion.levelHpPermille / 1000) *
          (1 + boost);
      final attack =
          style.damage *
          (1 + c.level * companion.levelAttackPermille / 1000) *
          (1 + boost);
      points += hp * power.potatoHp + attack / style.interval * power.potatoDps;
    }
    return points.round();
  }

  /// What a zone of [score] calls for.
  int recommendedPower(int score) {
    final power = catalog.rules.combatPower;
    return (power.recommendedBase + power.recommendedPerScore * score).round();
  }

  PowerVerdict verdict(int power, int recommended) {
    final rules = catalog.rules.combatPower;
    final ratio = recommended <= 0 ? double.infinity : power / recommended;
    if (ratio >= rules.easyRatio) return PowerVerdict.easy;
    if (ratio >= rules.fairRatio) return PowerVerdict.fair;
    return PowerVerdict.risky;
  }
}
