import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  int stack(String item) => item == 'food' ? 100 : 1;

  group('Bag', () {
    test('tops up stacks before using empty slots', () {
      final bag = Bag(3, stack)..addFrom(ItemStack('food', 80));
      final more = ItemStack('food', 50);

      expect(bag.addFrom(more), 50);
      expect(more.count, 0);
      expect([for (final s in bag.slots) s?.count], [100, 30, null]);
    });

    test('keeps what does not fit', () {
      final bag = Bag(2, stack)..addFrom(ItemStack('seed', 1));
      final seeds = ItemStack('seed', 3);

      expect(bag.addFrom(seeds), 1);
      expect(seeds.count, 2);
    });

    test('removes from the smallest stack first', () {
      final bag = Bag(3, stack)
        ..addFrom(ItemStack('food', 100))
        ..addFrom(ItemStack('food', 20));

      expect(bag.remove('food', 25), 25);
      expect([for (final s in bag.slots) s?.count], [95, null, null]);
      expect(bag.countOf('food'), 95);
      expect(bag.remove('food', 500), 95);
    });
  });

  group('LootPile', () {
    const table = LootTableData(
      id: 't',
      rollsMin: 3,
      rollsMax: 3,
      entries: [LootEntryData(item: 'food', weight: 1, min: 60, max: 60)],
    );

    test('rolls the same pile for the same random state', () {
      final a = LootPile.roll(table, stack, GameRandom(4));
      final b = LootPile.roll(table, stack, GameRandom(4));
      expect(a.toJson(), b.toJson());
      // 180 food merges into full stacks.
      expect([for (final s in a.items) s.count], [100, 80]);
    });

    test('takes into a bag, all at once, or by swapping', () {
      final pile = LootPile([ItemStack('seed', 1), ItemStack('food', 10)]);
      final bag = Bag(1, stack);

      expect(pile.takeInto(bag, 0), isTrue);
      expect(pile.items.single.item, 'food');
      expect(pile.takeAllInto(bag), isFalse, reason: 'the bag is full');

      pile.swapWith(bag, 0, 0);
      expect(bag.slots.single!.item, 'food');
      expect(pile.items.single.item, 'seed');
    });
  });
}
