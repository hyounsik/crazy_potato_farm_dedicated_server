import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

import '../fixtures/sample_catalog.dart';

void main() {
  group('Catalog.load', () {
    test('loads the sample data', () {
      final catalog = sampleCatalog();
      expect(catalog.rules.farm.step, const Duration(seconds: 1));
      expect(
        catalog.potatoType(PotatoType.food).growTime,
        const Duration(minutes: 2),
      );
    });

    test('reports a missing file', () {
      final files = sampleCatalogFiles()..remove('rules');
      final result = Catalog.load(files);
      expect(result.isValid, isFalse);
      expect(result.issues.single.toString(), 'rules: file is missing');
    });

    test('reports a version mismatch', () {
      final files = sampleCatalogFiles();
      (files['rules']! as Map<String, dynamic>)['version'] = 1;
      expect(
        Catalog.load(files).issues.single.toString(),
        'rules: version: expected 2, found 1',
      );
    });

    test('points at the field that is missing', () {
      final files = sampleCatalogFiles();
      final entries = _potatoTypes(files);
      (entries[1] as Map<String, dynamic>).remove('grow_seconds');
      // The broken entry is skipped, so its type also counts as missing.
      expect(Catalog.load(files).issues.map((issue) => issue.path), [
        'potato_types[1].grow_seconds',
        'potato_types',
      ]);
    });

    test('reports an unknown enum value', () {
      final files = sampleCatalogFiles();
      (_potatoTypes(files)[0] as Map<String, dynamic>)['type'] = 'rock';
      final issues = Catalog.load(files).issues;
      expect(issues.map((issue) => issue.path), [
        'potato_types[0].type',
        'potato_types',
      ]);
      expect(issues.last.message, 'missing food');
    });

    test('reports duplicates and values that must be positive', () {
      final files = sampleCatalogFiles();
      _potatoTypes(files)
          .add({'type': 'buff', 'grow_seconds': 0, 'lifespan_seconds': 10});
      expect(Catalog.load(files).issues.map((issue) => issue.toString()), [
        'potato_types: potato_types[4].type: duplicate buff',
        'potato_types: potato_types[4].grow_seconds: must be positive, found 0',
      ]);
    });

    test('requires production on food potatoes only', () {
      final files = sampleCatalogFiles();
      final entries = _potatoTypes(files);
      final food = entries[0] as Map<String, dynamic>;
      (entries[1] as Map<String, dynamic>)['production'] = food['production'];
      final amount =
          (food.remove('production') as Map<String, dynamic>)['amount']
              as Map<String, dynamic>;
      amount.remove('rare');
      expect(Catalog.load(files).issues.map((issue) => issue.toString()), [
        'potato_types: potato_types[0].production: food potatoes need production',
        'potato_types: potato_types[1].production: only food potatoes make food',
        'potato_types: potato_types[1].production.amount: missing rare',
      ]);
    });

    test('checks the new farm layout', () {
      final files = sampleCatalogFiles();
      final newFarm =
          (files['rules']! as Map<String, dynamic>)['new_farm']
              as Map<String, dynamic>;
      (newFarm['fields'] as List).addAll([
        {
          'origin': {'x': 13, 'y': 10},
          'width': 1,
          'height': 1,
        },
        {
          'origin': {'x': 22, 'y': 0},
          'width': 4,
          'height': 1,
        },
      ]);
      expect(Catalog.load(files).issues.map((issue) => issue.toString()), [
        'rules: new_farm.fields[1]: overlaps new_farm.fields[0]',
        'rules: new_farm.fields[2]: size must be 1 to 3, found 4x1',
        'rules: new_farm.fields[2]: must lie inside the 24x24 farm',
      ]);
    });

    test('loads exploration data', () {
      final catalog = sampleCatalog();
      expect(catalog.rules.raid.food.item, 'food');
      expect(catalog.stackOf('food'), 100);
      expect(catalog.items['seed_food_rare']!.seed!.grade, Grade.rare);
      expect(catalog.weapons['spread']!.pellets, 6);
      expect(catalog.enemies['spitter']!.attack, EnemyAttack.ranged);
      expect(catalog.zones['sample_zone']!.map.size, 40);
    });

    test('reports ids that point nowhere', () {
      final files = sampleCatalogFiles();
      final raid = (files['rules']! as Map<String, dynamic>)['raid'] as Map;
      (raid['food'] as Map)['item'] = 'material';
      raid['start_weapon'] = 'nothing';
      final tables = _list(files, 'loot_tables');
      (((tables[0] as Map)['entries'] as List)[0] as Map)['item'] = 'ghost';
      final zone = _list(files, 'zones')[0] as Map;
      ((zone['enemies'] as Map)['pack_kinds'] as List)[0] = 'yeti';
      (zone['drops'] as Map)['bundle'] = 'missing_table';

      expect(Catalog.load(files).issues.map((issue) => issue.toString()), [
        'rules: raid.food.item: "material" is not a food item',
        'rules: raid.start_weapon: no weapon "nothing"',
        'loot_tables: spot.entries[0].item: no item "ghost"',
        'zones: sample_zone.enemies.pack_kinds[0]: no enemy "yeti"',
        'zones: sample_zone.drops.bundle: no loot table "missing_table"',
      ]);
    });

    test('checks entries within each file', () {
      final files = sampleCatalogFiles();
      final items = _list(files, 'items');
      ((items[1] as Map)).remove('seed');
      (items[2] as Map)['id'] = 'seed_food_normal';
      final enemies = _list(files, 'enemies');
      (enemies[2] as Map)['range'] = 0;

      expect(Catalog.load(files).issues.map((issue) => issue.toString()), [
        'items: items[1].seed: seed items need a seed',
        'items: items[2].id: duplicate "seed_food_normal"',
        'enemies: enemies[2].range: must be positive, found 0.0',
        // Renaming the rare seed leaves the tables that used it pointing
        // nowhere.
        'loot_tables: spot.entries[2].item: no item "seed_food_rare"',
        'loot_tables: bundle.entries[1].item: no item "seed_food_rare"',
      ]);
    });

    test('collects issues from every file at once', () {
      final files = sampleCatalogFiles();
      ((files['rules']! as Map<String, dynamic>)['farm']
              as Map<String, dynamic>)['step_millis'] =
          -1;
      _potatoTypes(files).removeLast();
      expect(Catalog.load(files).issues.map((issue) => issue.file), [
        'rules',
        'potato_types',
      ]);
    });
  });
}

List<Object?> _potatoTypes(Map<String, Object?> files) =>
    (files['potato_types']! as Map<String, dynamic>)['potato_types']
        as List<Object?>;

List<Object?> _list(Map<String, Object?> files, String name) =>
    (files[name]! as Map<String, dynamic>)[name] as List<Object?>;
