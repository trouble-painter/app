part of '../game_state.dart';

class GameDisconnectedState extends GameState {
  GameDisconnectedState([this.playingRoomId]) : super(exception: null);

  final String? playingRoomId;

  @override
  GameState sinkException(GameException exception) {
    return this;
  }
}
