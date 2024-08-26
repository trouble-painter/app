part of '../game_state.dart';

class GameQuickStartWaitingState extends GameState {
  GameStep step = GameStep.quickStartWaiting;

  GameQuickStartWaitingState({
    super.exception,
  }) : super(isPlaying: false);

  GameQuickStartWaitingState copyWith({
    GameException? exception,
  }) {
    return GameQuickStartWaitingState(
      exception: exception,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
