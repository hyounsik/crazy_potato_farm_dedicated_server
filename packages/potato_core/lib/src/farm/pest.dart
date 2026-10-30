import 'package:json_annotation/json_annotation.dart';

/// What troubles a field. A field has at most one pest at a time.
@JsonEnum(fieldRename: FieldRename.snake)
enum PestKind {
  /// Eats the baby potatoes stored on the field's potatoes.
  bug,

  /// Makes the field's potatoes use up their life faster.
  blight,
}

/// A pest on a field. It stays until cleared by tapping or by guards.
final class Pest {
  Pest({required this.kind, this.clearedMillis = 0, this.biteMillis = 0});

  final PestKind kind;

  /// Guard work done on it; cleared at the kind's `clear_seconds`.
  int clearedMillis;

  /// Time toward the next bite (bugs only).
  int biteMillis;
}

/// How the farm's grown combat potatoes keep up with pests, in pests an
/// hour (2026-10-30, 사용자: the farm's pest control on the status bar).
/// Both are estimates from what the farm is like now.
final class PestBalance {
  const PestBalance({required this.appearing, required this.clearing});

  /// Pests expected to appear an hour.
  final double appearing;

  /// Pests the guards could clear an hour, walking aside.
  final double clearing;

  /// Above 0 when guards keep up with more than appears, below when pests
  /// pile up.
  double get margin => clearing - appearing;
}
