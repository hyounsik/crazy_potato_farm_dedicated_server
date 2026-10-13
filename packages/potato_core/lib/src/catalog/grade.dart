import 'package:json_annotation/json_annotation.dart';

/// How good a seed or potato is. The grade sets the number of ability slots
/// and scales what a potato makes.
@JsonEnum(fieldRename: FieldRename.snake)
enum Grade {
  normal,
  rare,
  legendary;

  /// One grade down, or null at the bottom.
  Grade? get lower => index == 0 ? null : Grade.values[index - 1];

  /// One grade up, or null at the top.
  Grade? get higher =>
      index == Grade.values.length - 1 ? null : Grade.values[index + 1];
}
