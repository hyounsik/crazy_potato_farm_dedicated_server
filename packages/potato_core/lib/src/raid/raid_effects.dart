import 'package:potato_core/src/catalog/ability_data.dart';
import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/potatoes/potato_effects.dart';

/// The parts of a companion its abilities depend on. Both a companion about
/// to start a run and one in it fit.
typedef CompanionTraits = ({
  PotatoType type,
  int level,
  List<String> abilities,

  /// Health left, 0 to 1.
  double hpRatio,

  /// Life left on the farm, 0 to 1.
  double lifeLeft,

  /// Its belt slot's boost: a buff potato's effects grow by it.
  double boost,
});

/// Works out what companions' abilities do in a run: on themselves, and from
/// buff potatoes on the whole party (the player and every companion).
///
/// Effects for the farm only are skipped; "always" effects count here too.
/// A buff potato's effects grow with its level, as on the farm.
final class RaidEffects {
  const RaidEffects(this.catalog);

  final Catalog catalog;

  double _power(CompanionTraits potato) => potato.type == PotatoType.buff
      ? (1 +
                potato.level *
                    catalog.rules.potatoes.level.buffPowerPermille /
                    1000) *
            (1 + potato.boost)
      : 1;

  Iterable<AbilityEffectData> _effects(
    CompanionTraits potato,
    EffectTarget target,
  ) sync* {
    for (final id in potato.abilities) {
      final ability = catalog.abilities[id];
      if (ability == null) continue;
      for (final effect in ability.effects) {
        if (effect.context == EffectContext.farm) continue;
        if (effect.target != target) continue;
        if (!_holds(effect.condition, potato)) continue;
        yield effect;
      }
    }
  }

  static bool _holds(EffectConditionData? condition, CompanionTraits potato) =>
      switch (condition?.type) {
        null => true,
        EffectConditionType.hpBelow => potato.hpRatio < condition!.ratio,
        EffectConditionType.lifespanBelow => potato.lifeLeft < condition!.ratio,
      };

  /// Stat effects of [potato]'s abilities on itself.
  StatSums own(CompanionTraits potato) {
    final sums = <String, StatSum>{};
    final power = _power(potato);
    for (final effect in _effects(potato, EffectTarget.self)) {
      final stat = effect.stat;
      if (effect.kind != EffectKind.stat || stat == null) continue;
      sums.putIfAbsent(stat, StatSum.new).addEffect(effect, power);
    }
    return sums;
  }

  /// Stat effects reaching the whole party from [team] (standing ones only).
  StatSums party(Iterable<CompanionTraits> team) {
    final sums = <String, StatSum>{};
    for (final potato in team) {
      final power = _power(potato);
      for (final effect in _effects(potato, EffectTarget.party)) {
        final stat = effect.stat;
        if (effect.kind != EffectKind.stat || stat == null) continue;
        sums.putIfAbsent(stat, StatSum.new).addEffect(effect, power);
      }
    }
    return sums;
  }

  /// [potato]'s periodic effects (on itself or the party), each with how
  /// strong it is at the potato's level.
  Iterable<({AbilityEffectData effect, double power})> periodic(
    CompanionTraits potato,
  ) sync* {
    final power = _power(potato);
    for (final target in EffectTarget.values) {
      for (final effect in _effects(potato, target)) {
        if (effect.kind == EffectKind.periodic) {
          yield (effect: effect, power: power);
        }
      }
    }
  }
}
