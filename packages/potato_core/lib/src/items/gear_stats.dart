import 'package:potato_core/src/catalog/catalog.dart';
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
        (1 + weapon.enhance * catalog.rules.workbench.damagePercent / 100);
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
          levelGrowth(companion.levelHpPermille, c.level) *
          (1 + boost);
      final attack =
          style.damage *
          levelGrowth(companion.levelAttackPermille, c.level) *
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
