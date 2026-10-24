import 'package:potato_core/potato_core.dart';
import 'package:test/test.dart';

void main() {
  const converter = LocalizedTextConverter();

  test('a plain string is English, a map has each language (2026-10-24)', () {
    final plain = converter.fromJson('Rookie');
    expect(plain.text, 'Rookie');
    expect(plain.of('ko'), 'Rookie');

    final both = converter.fromJson({'en': 'Rookie', 'ko': '초보'});
    expect(both.of('ko'), '초보');
    expect(both.of('ja'), 'Rookie');
    expect(converter.toJson(both), {'en': 'Rookie', 'ko': '초보'});
  });

  test('without English any text there is stands in', () {
    expect(converter.fromJson({'ko': '초보'}).text, '초보');
  });
}
