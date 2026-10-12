import 'package:json_annotation/json_annotation.dart';
import 'package:potato_core/src/catalog/grade.dart';
import 'package:potato_core/src/catalog/potato_type_data.dart';
import 'package:potato_core/src/catalog/rules_data.dart';

/// Read-only game data: numbers and content definitions loaded at startup.
///
/// This package does no file I/O. The client reads its assets and the server
/// reads files, then both pass the decoded JSON to [Catalog.load]. Sessions
/// take a catalog in their constructor instead of reading a global one, so
/// tests and servers can run different data side by side.
final class Catalog {
  Catalog._({
    required this.rules,
    required Map<PotatoType, PotatoTypeData> potatoTypes,
  }) : _potatoTypes = Map.unmodifiable(potatoTypes);

  /// The format version each data file must declare in its `version` field.
  ///
  /// Data ships with the app, so files are not migrated: a file with another
  /// version is an error.
  static const Map<String, int> fileVersions = {'rules': 1, 'potato_types': 1};

  final RulesData rules;
  final Map<PotatoType, PotatoTypeData> _potatoTypes;

  PotatoTypeData potatoType(PotatoType type) => _potatoTypes[type]!;

  /// Builds a catalog from decoded data files keyed by file name without the
  /// extension (`rules`, `potato_types`).
  ///
  /// Returns every problem found rather than stopping at the first one; the
  /// catalog is null unless the list is empty.
  static CatalogLoadResult load(Map<String, Object?> files) {
    final issues = <CatalogIssue>[];

    final rules = _readFile(files, 'rules', issues, (check, json) {
      final rules = check.parse('', json, RulesData.fromJson);
      if (rules != null) _checkRules(check, rules);
      return rules;
    });

    final potatoTypes = _readFile(files, 'potato_types', issues, (check, json) {
      final byType = <PotatoType, PotatoTypeData>{};
      for (final (index, entry) in check.list(json).indexed) {
        final path = '${check.file}[$index]';
        final data = check.parse(path, entry, PotatoTypeData.fromJson);
        if (data == null) continue;
        if (byType.containsKey(data.type)) {
          check.issue('$path.type', 'duplicate ${data.type.name}');
        }
        byType[data.type] = data;
        _checkPotatoType(check, path, data);
      }
      for (final type in PotatoType.values) {
        if (!byType.containsKey(type)) {
          check.issue(check.file, 'missing ${type.name}');
        }
      }
      return byType;
    });

    if (issues.isNotEmpty || rules == null || potatoTypes == null) {
      return CatalogLoadResult._(null, List.unmodifiable(issues));
    }
    return CatalogLoadResult._(
      Catalog._(rules: rules, potatoTypes: potatoTypes),
      const [],
    );
  }

  static void _checkRules(_FileCheck check, RulesData rules) {
    final farm = rules.farm;
    check.positive('farm.step_millis', farm.stepMillis);
    check.positive('farm.offline_cap_minutes', farm.offlineCapMinutes);
    check.positive('farm.size', farm.size);
    check.positive('farm.field_max_size', farm.fieldMaxSize);
    check.probability(
      'potatoes.grade_drop_chance',
      rules.potatoes.gradeDropChance,
    );

    final newFarm = rules.newFarm;
    check.atLeast('new_farm.food', newFarm.food, 0);
    for (final (index, field) in newFarm.fields.indexed) {
      final path = 'new_farm.fields[$index]';
      final tooBig =
          field.width > farm.fieldMaxSize || field.height > farm.fieldMaxSize;
      if (field.width < 1 || field.height < 1 || tooBig) {
        check.issue(
          path,
          'size must be 1 to ${farm.fieldMaxSize}, '
          'found ${field.width}x${field.height}',
        );
      }
      if (field.left < 0 ||
          field.top < 0 ||
          field.right > farm.size ||
          field.bottom > farm.size) {
        check.issue(path, 'must lie inside the ${farm.size}x${farm.size} farm');
      }
      for (final (other, earlier) in newFarm.fields.take(index).indexed) {
        if (field.overlaps(earlier)) {
          check.issue(path, 'overlaps new_farm.fields[$other]');
        }
      }
    }
    for (final (index, stack) in newFarm.seeds.indexed) {
      check.positive('new_farm.seeds[$index].count', stack.count);
    }
  }

  static void _checkPotatoType(
    _FileCheck check,
    String path,
    PotatoTypeData data,
  ) {
    check.positive('$path.grow_seconds', data.growSeconds);
    check.positive('$path.lifespan_seconds', data.lifespanSeconds);

    final production = data.production;
    final makesFood = data.type == PotatoType.food;
    if (makesFood && production == null) {
      check.issue('$path.production', 'food potatoes need production');
    } else if (!makesFood && production != null) {
      check.issue('$path.production', 'only food potatoes make food');
    }
    if (production == null) return;
    check.positive('$path.production.every_seconds', production.everySeconds);
    check.positive('$path.production.store_max', production.storeMax);
    for (final grade in Grade.values) {
      final amount = production.amount[grade];
      if (amount == null) {
        check.issue('$path.production.amount', 'missing ${grade.name}');
      } else {
        check.atLeast('$path.production.amount.${grade.name}', amount, 0);
      }
    }
  }

  /// Checks the file exists and has the expected `version`, then reads it.
  static T? _readFile<T>(
    Map<String, Object?> files,
    String file,
    List<CatalogIssue> issues,
    T? Function(_FileCheck check, Map<String, dynamic> json) read,
  ) {
    final check = _FileCheck(file, issues);
    final json = files[file];
    if (json is! Map<String, dynamic>) {
      check.issue('', json == null ? 'file is missing' : 'must be an object');
      return null;
    }
    final expected = fileVersions[file];
    if (json['version'] != expected) {
      check.issue('version', 'expected $expected, found ${json['version']}');
      return null;
    }
    return read(check, json);
  }
}

/// Collects issues for one data file.
final class _FileCheck {
  _FileCheck(this.file, this._issues);

  final String file;
  final List<CatalogIssue> _issues;

  void issue(String path, String message) =>
      _issues.add(CatalogIssue(file, path, message));

  /// The entry list stored under the file's own name, e.g. `potato_types`.
  List<Object?> list(Map<String, dynamic> json) {
    final list = json[file];
    if (list is List<Object?>) return list;
    issue(file, 'must be a list');
    return const [];
  }

  T? parse<T>(
    String path,
    Object? json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    if (json is! Map<String, dynamic>) {
      issue(path, 'must be an object');
      return null;
    }
    try {
      return fromJson(json);
    } on CheckedFromJsonException catch (e) {
      final key = e.key;
      final at = key == null ? path : (path.isEmpty ? key : '$path.$key');
      issue(at, e.message ?? '${e.innerError}');
      return null;
    }
  }

  void positive(String path, int value) {
    if (value <= 0) issue(path, 'must be positive, found $value');
  }

  void atLeast(String path, int value, int min) {
    if (value < min) issue(path, 'must be at least $min, found $value');
  }

  void probability(String path, double value) {
    if (value < 0 || value > 1) issue(path, 'must be 0 to 1, found $value');
  }
}

/// The outcome of [Catalog.load].
final class CatalogLoadResult {
  CatalogLoadResult._(this.catalog, this.issues);

  /// The loaded catalog, or null when [issues] is not empty.
  final Catalog? catalog;
  final List<CatalogIssue> issues;

  bool get isValid => catalog != null;
}

/// One problem in the data files, e.g. a missing field or a duplicate entry.
final class CatalogIssue {
  const CatalogIssue(this.file, this.path, this.message);

  /// The data file name without the extension.
  final String file;

  /// Where in the file, like `potato_types[2].grow_seconds`.
  final String path;
  final String message;

  @override
  String toString() =>
      path.isEmpty ? '$file: $message' : '$file: $path: $message';
}
