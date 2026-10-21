import 'dart:typed_data';

import 'package:potato_session/src/transport.dart';

/// How a dedicated server and its guests frame session packets on one
/// WebSocket: a binary message whose first byte names the [SessionChannel]
/// (0 reliable, 1 unreliable) and whose rest is the payload.
///
/// A WebSocket is a single ordered stream, so both channels arrive in order;
/// the tag only tells the session which kind of message it is.
abstract final class WebSocketFrame {
  /// The WebSocket path a dedicated server takes session connections on.
  static const String path = '/session';

  /// The HTTP header carrying the server password, when one is set.
  static const String passwordHeader = 'x-potato-password';

  /// [bytes] on [channel], ready to send as one binary message.
  static Uint8List encode(SessionChannel channel, Uint8List bytes) {
    final frame = Uint8List(bytes.length + 1);
    frame[0] = channel.index;
    frame.setRange(1, frame.length, bytes);
    return frame;
  }

  /// The channel and payload of [frame], or null when it is not a frame
  /// (empty, or an unknown channel).
  static ({SessionChannel channel, Uint8List bytes})? decode(Uint8List frame) {
    if (frame.isEmpty || frame[0] >= SessionChannel.values.length) {
      return null;
    }
    return (
      channel: SessionChannel.values[frame[0]],
      bytes: Uint8List.sublistView(frame, 1),
    );
  }
}
