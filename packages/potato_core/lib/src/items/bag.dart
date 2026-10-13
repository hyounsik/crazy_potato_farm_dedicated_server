import 'dart:math' as math;

import 'package:potato_core/src/catalog/item_data.dart';
import 'package:potato_core/src/common/game_random.dart';
import 'package:potato_core/src/potatoes/seed.dart';

/// Some amount of one item, in a bag slot or a loot pile.
final class ItemStack {
  ItemStack(this.item, this.count, {this.seed});

  factory ItemStack.fromJson(Map<String, dynamic> json) => ItemStack(
    json['item'] as String,
    json['count'] as int,
    seed: switch (json['seed']) {
      final Map<String, dynamic> seed => Seed.fromJson(seed),
      _ => null,
    },
  );

  /// The item's catalog id.
  final String item;
  int count;

  /// The seed itself, for seed items: each one found has its own level,
  /// ability and style, so only equal seeds share a stack.
  final Seed? seed;

  /// Whether [other] may top up this stack.
  bool sameAs(ItemStack other) => other.item == item && other.seed == seed;

  Map<String, dynamic> toJson() => {
    'item': item,
    'count': count,
    if (seed != null) 'seed': seed!.toJson(),
  };
}

/// Makes the seed for one seed item found, or null for other items.
typedef SeedMaker = Seed? Function(String item);

/// Looks up how many of an item fit in one slot.
typedef StackSize = int Function(String item);

/// A bag: a fixed number of slots, each empty or holding one stack.
final class Bag {
  Bag(int slotCount, this.stackSize)
    : slots = List<ItemStack?>.filled(slotCount, null);

  Bag.restore(List<ItemStack?> slots, this.stackSize)
    : slots = List.of(slots, growable: false);

  final List<ItemStack?> slots;
  final StackSize stackSize;

  int get capacity => slots.length;

  int countOf(String item) =>
      slots.where((s) => s?.item == item).fold(0, (sum, s) => sum + s!.count);

  /// Moves as much of [from] in as fits: tops up stacks of the same item
  /// first, then fills empty slots. Lowers `from.count` by the amount moved
  /// and returns it.
  int addFrom(ItemStack from) {
    final max = stackSize(from.item);
    var moved = 0;
    for (final slot in slots) {
      if (from.count == 0) break;
      if (slot == null || !slot.sameAs(from)) continue;
      final n = math.min(max - slot.count, from.count);
      if (n <= 0) continue;
      slot.count += n;
      from.count -= n;
      moved += n;
    }
    for (var i = 0; i < slots.length && from.count > 0; i++) {
      if (slots[i] != null) continue;
      final n = math.min(max, from.count);
      slots[i] = ItemStack(from.item, n, seed: from.seed);
      from.count -= n;
      moved += n;
    }
    return moved;
  }

  /// Takes up to [amount] of [item] out, smallest stack first so slots free
  /// up early. Returns how many were taken.
  int remove(String item, int amount) {
    var taken = 0;
    while (taken < amount) {
      var index = -1;
      for (var i = 0; i < slots.length; i++) {
        final s = slots[i];
        if (s == null || s.item != item) continue;
        if (index < 0 || s.count < slots[index]!.count) index = i;
      }
      if (index < 0) break;
      final slot = slots[index]!;
      final n = math.min(slot.count, amount - taken);
      slot.count -= n;
      taken += n;
      if (slot.count == 0) slots[index] = null;
    }
    return taken;
  }

  /// Puts [stack] in slot [index] and returns what was there.
  ItemStack? replace(int index, ItemStack? stack) {
    final old = slots[index];
    slots[index] = stack;
    return old;
  }

  List<Map<String, dynamic>?> toJson() => [for (final s in slots) s?.toJson()];
}

/// What a gathering spot or a bundle holds until someone takes it.
final class LootPile {
  LootPile([List<ItemStack>? items]) : items = items ?? [];

  /// Rolls [table] and merges the same items into as few stacks as fit.
  /// Seed items get a seed each from [makeSeed].
  factory LootPile.roll(
    LootTableData table,
    StackSize stackSize,
    GameRandom random, {
    SeedMaker? makeSeed,
  }) {
    final pile = LootPile();
    final total = table.entries.fold(0, (sum, e) => sum + e.weight);
    final rolls =
        table.rollsMin + random.nextInt(table.rollsMax - table.rollsMin + 1);
    for (var i = 0; i < rolls; i++) {
      var roll = random.nextInt(total);
      final entry = table.entries.firstWhere((e) {
        roll -= e.weight;
        return roll < 0;
      });
      final count = entry.min + random.nextInt(entry.max - entry.min + 1);
      final first = makeSeed?.call(entry.item);
      if (first == null) {
        pile._merge(ItemStack(entry.item, count), stackSize);
        continue;
      }
      pile._merge(ItemStack(entry.item, 1, seed: first), stackSize);
      for (var n = 1; n < count; n++) {
        final seed = makeSeed!(entry.item)!;
        pile._merge(ItemStack(entry.item, 1, seed: seed), stackSize);
      }
    }
    return pile;
  }

  final List<ItemStack> items;

  bool get isEmpty => items.isEmpty;

  void _merge(ItemStack stack, StackSize stackSize) {
    final max = stackSize(stack.item);
    for (final existing in items) {
      if (stack.count == 0) return;
      if (!existing.sameAs(stack)) continue;
      final n = math.min(max - existing.count, stack.count);
      if (n <= 0) continue;
      existing.count += n;
      stack.count -= n;
    }
    while (stack.count > 0) {
      final n = math.min(max, stack.count);
      items.add(ItemStack(stack.item, n, seed: stack.seed));
      stack.count -= n;
    }
  }

  /// Moves item [index] into [bag] as far as it fits. False when nothing fit,
  /// which is when the window offers a swap.
  bool takeInto(Bag bag, int index) {
    final stack = items[index];
    final moved = bag.addFrom(stack);
    if (stack.count == 0) items.removeAt(index);
    return moved > 0;
  }

  /// Takes everything that fits, in order. True when the pile ends up empty.
  bool takeAllInto(Bag bag) {
    for (final stack in items) {
      bag.addFrom(stack);
    }
    items.removeWhere((s) => s.count == 0);
    return isEmpty;
  }

  /// Swaps item [index] with bag slot [slot]. What leaves the bag stays in
  /// the pile at the same place.
  void swapWith(Bag bag, int index, int slot) {
    final old = bag.replace(slot, items[index]);
    if (old == null) {
      items.removeAt(index);
    } else {
      items[index] = old;
    }
  }

  List<Map<String, dynamic>> toJson() => [for (final s in items) s.toJson()];

  static LootPile fromJson(List<Object?> json) => LootPile([
    for (final s in json) ItemStack.fromJson(s! as Map<String, dynamic>),
  ]);
}
