part of '../game_state.dart';

class GameDisconnectedState extends GameState {
  GameDisconnectedState([this.playingRoomId])
      : isKicked = false,
        super(
          isPlaying: false,
          exception: null,
        );

  /// Removed from the room by the host
  GameDisconnectedState.kicked()
      : playingRoomId = null,
        isKicked = true,
        super(
          isPlaying: false,
          exception: null,
        );

  final String? playingRoomId;
  final bool isKicked;

  @override
  GameState sinkException(GameException exception) {
    return this;
  }
}
