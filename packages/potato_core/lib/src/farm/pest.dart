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
