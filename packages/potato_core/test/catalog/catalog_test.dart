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
      (files['rules']! as Map<String, dynamic>)['version'] = 2;
      expect(
        Catalog.load(files).issues.single.toString(),
        'rules: version: expected 1, found 2',
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
