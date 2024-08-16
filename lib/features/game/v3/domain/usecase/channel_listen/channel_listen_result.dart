part of 'channel_listen_usecase.dart';

class ChannelListenResult {
  final Stream<GameState> stateStream;
  final Stream<GameException> exceptionStream;

  ChannelListenResult({
    required this.stateStream,
    required this.exceptionStream,
  });
}
