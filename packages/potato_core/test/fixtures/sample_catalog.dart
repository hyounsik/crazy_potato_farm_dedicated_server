import 'dart:convert';
import 'dart:io';

import 'package:potato_core/potato_core.dart';

/// Decoded sample data files from `test/fixtures/catalog/`, keyed by file name
/// without the extension. Tests copy and change these to check bad data.
Map<String, Object?> sampleCatalogFiles() => {
  for (final file in Directory('test/fixtures/catalog').listSync())
    if (file is File && file.path.endsWith('.json'))
      file.uri.pathSegments.last.replaceAll('.json', ''): jsonDecode(
        file.readAsStringSync(),
      ),
};

/// The sample catalog, failing the test if the fixtures stop loading.
Catalog sampleCatalog() {
  final result = Catalog.load(sampleCatalogFiles());
  if (!result.isValid) {
    throw StateError('Sample catalog is invalid: ${result.issues}');
  }
  return result.catalog!;
}

/// The sample catalog with [change] applied to its decoded files.
Catalog sampleCatalogWith(void Function(Map<String, dynamic> files) change) {
  final files =
      jsonDecode(jsonEncode(sampleCatalogFiles())) as Map<String, dynamic>;
  change(files);
  final result = Catalog.load(files);
  if (!result.isValid) throw StateError('${result.issues}');
  return result.catalog!;
}

/// The rules part of decoded catalog files.
Map<String, dynamic> rulesOf(Map<String, dynamic> files) =>
    files['rules'] as Map<String, dynamic>;

/// No pests and no upkeep, so each test turns on only what it checks.
Catalog quietSampleCatalog([
  void Function(Map<String, dynamic> files)? change,
]) => sampleCatalogWith((files) {
  final pests = rulesOf(files)['pests'] as Map<String, dynamic>;
  // Bugs come with what is stored; more than any test stores keeps them off.
  (pests['bug'] as Map)['stored_per_bug'] = 1000000;
  (pests['blight'] as Map)['chance'] = 0.0;
  for (final type in (files['potato_types'] as Map)['potato_types'] as List) {
    (type as Map).remove('upkeep');
  }
  change?.call(files);
});
