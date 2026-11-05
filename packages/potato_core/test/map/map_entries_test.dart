import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  const plain = MapRecipe(
    size: 20,
    entry: TilePos(2, 2),
    clearRadius: 2,
    rotate: false,
    scatter: ScatterRule(count: 30),
  );
  const others = [TilePos(17, 2), TilePos(2, 17)];

  test('without any, the map starts at its entry', () {
    for (var seed = 0; seed < 8; seed++) {
      expect(generateMap(plain, seed: seed).entry, plain.entry);
    }
  });

  test('the seed picks among all of them, and repeats itself', () {
    final recipe = plain.copyWith(entries: others);
    final seen = {
      for (var seed = 0; seed < 64; seed++)
        generateMap(recipe, seed: seed).entry,
    };
    expect(seen, {plain.entry, ...others});
    expect(
      generateMap(recipe, seed: 7).toJson(),
      generateMap(recipe, seed: 7).toJson(),
    );
  });

  test('only the picked one keeps scatter away', () {
    final recipe = plain.copyWith(
      entries: others,
      scatter: const ScatterRule(count: 400),
    );
    bool clear(MapData map, TilePos at) {
      for (var dy = -2; dy <= 2; dy++) {
        for (var dx = -2; dx <= 2; dx++) {
          if (map.isInside(at.x + dx, at.y + dy) &&
              map.isBlocked(at.x + dx, at.y + dy)) {
            return false;
          }
        }
      }
      return true;
    }

    var otherBlocked = false;
    for (var seed = 0; seed < 32; seed++) {
      final map = generateMap(recipe, seed: seed);
      expect(clear(map, map.entry), isTrue, reason: 'seed $seed');
      otherBlocked =
          otherBlocked || [plain.entry, ...others].any((at) => !clear(map, at));
    }
    expect(otherBlocked, isTrue);
  });

  test('a blocked candidate is built around', () {
    final recipe = plain.copyWith(
      entries: const [TilePos(10, 10)],
      scatter: const ScatterRule(count: 0),
      terrain: const [
        TerrainPiece.wall(
          from: TilePos(8, 10),
          to: TilePos(12, 10),
          thickness: 1,
          gap: 0,
        ),
      ],
    );
    for (var seed = 0; seed < 32; seed++) {
      expect(generateMap(recipe, seed: seed).entry, plain.entry);
    }
  });

  test('they survive JSON', () {
    final recipe = plain.copyWith(entries: others);
    expect(
      MapRecipe.fromJson(
        recipe.toJson().map(
          (key, value) => MapEntry(
            key,
            value is List
                ? [
                    for (final item in value)
                      item is TilePos ? item.toJson() : item,
                  ]
                : value is TilePos
                ? value.toJson()
                : value is ScatterRule
                ? value.toJson()
                : value,
          ),
        ),
      ).entries,
      others,
    );
  });
}
