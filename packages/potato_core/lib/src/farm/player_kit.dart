import 'package:potato_core/src/catalog/catalog.dart';
import 'package:potato_core/src/items/bag.dart';
import 'package:potato_core/src/items/gear.dart';
import 'package:potato_core/src/items/gear_stats.dart';

/// What one player carries, apart from the farm they stand on
/// (`save-and-online.md`, 2026-10-28, 사용자): the gear they wear, their
/// bag, and their truck bed. A farm of one's own has one kit;
/// a dedicated server's shared farm has one for each player there, so the
/// farm's rules stay the same and only the number of kits differs.
final class PlayerKit {
  PlayerKit(
    Catalog catalog, {
    this.equipped = const Equipped(),
    List<ItemStack?> bed = const [],
    List<ItemStack?> bag = const [],
    List<MealEffect> meals = const [],
  }) : meals = List.of(meals),
       _catalog = catalog,
       _gearStats = GearStats(catalog),
       bed = Bag.restore([
         ...bed,
         for (var i = bed.length; i < catalog.rules.storage.bedSlots; i++) null,
       ], catalog.stackOf) {
    _bag = Bag.restore([
      ...bag,
      for (var i = bag.length; i < _gearStats.bagSlots(equipped.bag); i++) null,
    ], catalog.stackOf);
  }

  final Catalog _catalog;
  final GearStats _gearStats;

  /// Dishes eaten that still last, oldest first, at most
  /// `MealRulesData.maxMeals` (2026-11-04, 사용자).
  final List<MealEffect> meals;

  /// What the player wears (and takes on runs).
  Equipped equipped;

  /// The truck bed: the player's own, carried to friends' farms and shared
  /// there while open (`multiplayer.md`, 2026-10-28).
  final Bag bed;

  /// What the player packed or brought back (2026-10-28, 사용자: the farm
  /// has a bag too). Sized by the worn bag once what is in it fits.
  Bag get bag => _bag;
  late Bag _bag;

  /// Copies of the stacks in [bag], to take along on a run.
  List<ItemStack> get bagItems => [
    for (final s in _bag.slots)
      if (s != null) s.copyWithCount(s.count),
  ];

  /// Whether what is in the bag fits [bag] (null for none worn).
  bool bagFits(Gear? bag) => bagItems.length <= _gearStats.bagSlots(bag);

  /// The bag takes the size of the worn one once what is in it fits.
  void fitBag() {
    final slots = _gearStats.bagSlots(equipped.bag);
    if (_bag.capacity == slots) return;
    final items = bagItems;
    if (items.length > slots) return;
    _bag = Bag(slots, _catalog.stackOf);
    for (final stack in items) {
      _bag.addFrom(stack);
    }
  }

  /// The kit as saved: what is worn, and the filled slots of the bed and
  /// the bag (trailing empty ones left out).
  Map<String, dynamic> toJson() => {
    'equipped': equipped.toJson(),
    'bed': _slots(bed),
    'bag': _slots(_bag),
    if (meals.isNotEmpty) 'meals': [for (final m in meals) m.toJson()],
  };

  /// Rebuilds a kit saved with [toJson].
  factory PlayerKit.fromJson(Catalog catalog, Map<String, dynamic> json) {
    List<ItemStack?> slots(Object? list) => [
      for (final s in (list as List<Object?>?) ?? const [])
        s == null ? null : ItemStack.fromJson(s as Map<String, dynamic>),
    ];
    return PlayerKit(
      catalog,
      equipped: switch (json['equipped']) {
        final Map<String, dynamic> e => Equipped.fromJson(e),
        _ => const Equipped(),
      },
      bed: slots(json['bed']),
      bag: slots(json['bag']),
      meals: MealEffect.listFromJson(json),
    );
  }

  static List<Map<String, dynamic>?> _slots(Bag bag) {
    final slots = bag.slots;
    var end = slots.length;
    while (end > 0 && slots[end - 1] == null) {
      end--;
    }
    return [for (final s in slots.take(end)) s?.toJson()];
  }

  /// Puts [items] in the bag in place of what was there: what a run brought
  /// home. The bag grows past the worn one's size if it must.
  void refillBag(List<ItemStack> items) {
    final slots = _gearStats.bagSlots(equipped.bag);
    _bag = Bag(slots < items.length ? items.length : slots, _catalog.stackOf);
    for (final stack in items) {
      _bag.addFrom(stack.copyWithCount(stack.count));
    }
  }
}

/// One dish eaten at home, lasting until farm tick [untilTick]
/// (2026-11-03, 사용자).
final class MealEffect {
  const MealEffect({required this.dish, required this.untilTick});

  factory MealEffect.fromJson(Map<String, dynamic> json) => MealEffect(
    dish: json['dish'] as String,
    untilTick: json['until_tick'] as int,
  );

  /// The [MealEffect]s saved under `meals` in [json], or the one dish of
  /// saves from before they could stack (`meal_until_tick`).
  static List<MealEffect> listFromJson(Map<String, dynamic> json) => [
    for (final m in json['meals'] as List<Object?>? ?? const [])
      MealEffect.fromJson(m! as Map<String, dynamic>),
    if (json['meal_until_tick'] case final int until when until > 0)
      MealEffect(dish: 'steamed_potato', untilTick: until),
  ];

  final String dish;
  final int untilTick;

  Map<String, dynamic> toJson() => {'dish': dish, 'until_tick': untilTick};

  @override
  bool operator ==(Object other) =>
      other is MealEffect && other.dish == dish && other.untilTick == untilTick;

  @override
  int get hashCode => Object.hash(dish, untilTick);
}
