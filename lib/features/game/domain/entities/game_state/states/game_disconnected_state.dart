part of '../game_state.dart';

class GameDisconnectedState extends GameState {
  GameDisconnectedState([this.playingRoomId])
      : isKicked = false,
        isMatchDeclined = false,
        super(
          isPlaying: false,
          exception: null,
        );

  /// Removed from the room by the host
  GameDisconnectedState.kicked()
      : playingRoomId = null,
        isKicked = true,
        isMatchDeclined = false,
        super(
          isPlaying: false,
          exception: null,
        );

  /// Matched, but did not accept in time
  GameDisconnectedState.matchDeclined()
      : playingRoomId = null,
        isKicked = false,
        isMatchDeclined = true,
        super(
          isPlaying: false,
          exception: null,
        );

  final String? playingRoomId;
  final bool isKicked;
  final bool isMatchDeclined;

  @override
  GameState sinkException(GameException exception) {
    return this;
  }
}
