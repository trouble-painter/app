import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_req/game_req.dart';

abstract class GameChannel {
  WebSocketChannel get channel;
  Stream<dynamic> get stream;

  void send(GameReq req);
  void close();
}
