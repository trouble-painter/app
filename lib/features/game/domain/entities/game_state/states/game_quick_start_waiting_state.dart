part of '../game_state.dart';

class GameQuickStartWaitingState extends GameState {
  GameStep step = GameStep.quickStartWaiting;

  /// Connected people in the queue, including me
  final int waitingCount;

  GameQuickStartWaitingState({
    super.exception,
    this.waitingCount = 1,
  }) : super(isPlaying: false);

  GameQuickStartWaitingState copyWith({
    GameException? exception,
    int? waitingCount,
  }) {
    return GameQuickStartWaitingState(
      exception: exception,
      waitingCount: waitingCount ?? this.waitingCount,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
