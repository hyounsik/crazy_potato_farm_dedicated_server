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
