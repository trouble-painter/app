import 'package:x_pr/features/game/domain/entities/game_channel.dart';

sealed class GameServiceState {}

class GameNotConnectedState extends GameServiceState {}

class GameConnectState extends GameServiceState {
  final String nickname;
  final GameChannel channel;

  GameConnectState({
    required this.nickname,
    required this.channel,
  });

  GameConnectState copyWith({
    String? nickname,
    GameChannel? channel,
  }) {
    return GameConnectState(
      nickname: nickname ?? this.nickname,
      channel: channel ?? this.channel,
    );
  }
}
