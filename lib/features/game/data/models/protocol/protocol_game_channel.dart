import 'dart:async';

import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/game/data/models/protocol/client_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/domain/entities/game_channel.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';

class ProtocolGameChannel implements GameChannel {
  ProtocolGameChannel(this._channel);

  final WebSocketChannel _channel;

  @override
  int? get closeCode => _channel.closeCode;

  @override
  Stream<ServerMessage> get stream => _channel.stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            Logger.d("🧩 ⚪️ Server | $data");
            try {
              final message = ServerMessage.decode(data as String);
              if (message != null) sink.add(message);
            } catch (e, s) {
              Logger.e("Failed to decode server message", e, s);
            }
          },
        ),
      );

  @override
  void send(GameReq req) {
    final text = ClientMessage.encode(req);
    Logger.d("🧩 🟠 Client | $text");
    _channel.sink.add(text);
  }

  @override
  Future<void> close() => _channel.sink.close(status.normalClosure);
}
