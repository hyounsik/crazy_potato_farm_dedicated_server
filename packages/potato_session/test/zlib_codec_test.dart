import 'package:potato_session/potato_session.dart';
import 'package:potato_session/zlib_codec.dart';
import 'package:test/test.dart';

void main() {
  const codec = ZlibSessionCodec();
  const json = JsonSessionCodec();

  test('small messages go as plain JSON', () {
    const message = MoveMessage(direction: Vec2(1, 0), seq: 3);
    final bytes = codec.encode(message);
    expect(bytes, json.encode(message));
    expect((codec.decode(bytes) as MoveMessage).seq, 3);
  });

  test('large messages are deflated and read back', () {
    final message = CatalogMessage({'note': 'x' * 4000});
    final bytes = codec.encode(message);
    expect(bytes.first, isNot(0x7B));
    expect(bytes.length, lessThan(json.encode(message).length ~/ 10));
    expect((codec.decode(bytes) as CatalogMessage).files['note'], 'x' * 4000);
  });

  test('plain JSON from an older peer still reads', () {
    final message = CatalogMessage({'note': 'y' * 4000});
    expect(
      (codec.decode(json.encode(message)) as CatalogMessage).files['note'],
      'y' * 4000,
    );
  });
}
