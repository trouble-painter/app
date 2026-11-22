import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';

class WebSocketSource {
  static final $ = Provider.autoDispose<WebSocketSource>((ref) {
    return WebSocketSource();
  });

  /// Client ping to detect a dead connection (protocol.md 3.5).
  /// The socket closes with 1001 when a pong does not arrive in time.
  static const pingInterval = Duration(seconds: 10);

  /// Connects to `<baseSocketUrl>/ws` with the access token in the upgrade request.
  /// Fails with [GameException.unauthenticated] when the server answers HTTP 401.
  Future<Result<GameChannel>> connect({
    required Uri baseSocketUrl,
    required String accessToken,
    required Duration timeout,
  }) async {
    try {
      final base = baseSocketUrl.toString().replaceAll(RegExp(r'/+$'), '');
      final channel = IOWebSocketChannel.connect(
        Uri.parse('$base/ws'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
        pingInterval: pingInterval,
      );
      await channel.ready.timeout(timeout);
      return Success(ProtocolGameChannel(channel));
    } catch (e, s) {
      final cause = e is WebSocketChannelException ? e.inner : e;
      if (cause is WebSocketException &&
          cause.httpStatusCode == HttpStatus.unauthorized) {
        Logger.d("🧩 Socket upgrade rejected with 401");
        return const Failure(GameException.unauthenticated);
      }
      Logger.e('Failed to connect', e, s);
      return Failure(e);
    }
  }
}
