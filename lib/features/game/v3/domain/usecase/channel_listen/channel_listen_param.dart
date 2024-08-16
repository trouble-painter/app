part of 'channel_listen_usecase.dart';

class ChannelListenParam {
  final Jwt jwt;
  final GameChannel channel;
  final StreamController<GameState> state$Ctrl;
  final StreamController<GameException> exception$Ctrl;

  ChannelListenParam({
    required this.jwt,
    required this.channel,
    required this.state$Ctrl,
    required this.exception$Ctrl,
  });
}
