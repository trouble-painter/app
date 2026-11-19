import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';

abstract interface class GameChannel {
  /// Decoded server messages. Unknown types are skipped. Done when the socket closes.
  Stream<ServerMessage> get stream;

  /// Close code after the socket closed. Null for an abnormal closure.
  int? get closeCode;

  void send(GameReq req);

  Future<void> close();
}
