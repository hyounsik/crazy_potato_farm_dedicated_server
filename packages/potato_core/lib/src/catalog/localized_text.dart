import 'package:freezed_annotation/freezed_annotation.dart';

/// Text players read from the game data, in each language the data has
/// (`{"en": "...", "ko": "..."}`). English is the base: a plain string is
/// taken as English, and a language the data lacks shows English.
///
/// The rules never read it; the client shows it in the player's language.
class LocalizedText {
  LocalizedText(Map<String, String> byLanguage)
    : byLanguage = Map.unmodifiable(byLanguage);

  /// One text for every language.
  LocalizedText.plain(String text) : byLanguage = {base: text};

  /// The language every text has, and the one shown when another is missing.
  static const String base = 'en';

  /// Language code (`en`, `ko`, ...) → text.
  final Map<String, String> byLanguage;

  /// The base text, or any there is.
  String get text => byLanguage[base] ?? byLanguage.values.firstOrNull ?? '';

  /// The text in [language] (a code like `ko`), or [text].
  String of(String language) => byLanguage[language] ?? text;

  @override
  bool operator ==(Object other) =>
      other is LocalizedText &&
      other.byLanguage.length == byLanguage.length &&
      other.byLanguage.entries.every((e) => byLanguage[e.key] == e.value);

  @override
  int get hashCode => Object.hashAllUnordered(
    byLanguage.entries.map((e) => Object.hash(e.key, e.value)),
  );

  @override
  String toString() => text;
}

/// Reads a [LocalizedText] from a plain string or a language map, and
/// writes the map.
class LocalizedTextConverter extends JsonConverter<LocalizedText, Object> {
  const LocalizedTextConverter();

  @override
  LocalizedText fromJson(Object json) => switch (json) {
    String text => LocalizedText.plain(text),
    Map<String, dynamic> map => LocalizedText({
      for (final e in map.entries)
        if (e.value is String) e.key: e.value as String,
    }),
    _ => throw FormatException('Expected a string or a language map: $json'),
  };

  @override
  Object toJson(LocalizedText object) => object.byLanguage;
}
