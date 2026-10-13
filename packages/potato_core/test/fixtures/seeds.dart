import 'package:potato_core/potato_core.dart';

/// A level 0 seed whose ability does nothing on the farm (the sample
/// `<type>.plain`), so tests about other rules are not bent by abilities.
Seed plainSeed(PotatoType type, [Grade grade = Grade.normal]) => Seed(
  type: type,
  grade: grade,
  level: 0,
  ability: '${type.name}.plain',
  style: type == PotatoType.combat ? CombatStyle.escort : null,
);

/// Seeds of [type] and [grade] in [pouch], whatever their ability and
/// level.
int countOf(SeedPouch pouch, PotatoType type, [Grade? grade]) => pouch
    .counts
    .entries
    .where((e) => e.key.type == type && (grade == null || e.key.grade == grade))
    .fold(0, (sum, e) => sum + e.value);
