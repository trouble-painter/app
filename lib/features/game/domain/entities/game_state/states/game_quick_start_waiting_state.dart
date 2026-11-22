part of '../game_state.dart';

class GameQuickStartWaitingState extends GameState {
  GameStep step = GameStep.quickStartWaiting;

  /// Connected people in the queue, including me
  final int waitingCount;

  /// Set once I am matched: accept before it ends or leave the queue.
  final GameMatchReady? ready;

  GameQuickStartWaitingState({
    super.exception,
    this.waitingCount = 1,
    this.ready,
  }) : super(isPlaying: false);

  GameQuickStartWaitingState copyWith({
    GameException? exception,
    int? waitingCount,
    GameMatchReady? ready,
  }) {
    return GameQuickStartWaitingState(
      exception: exception,
      waitingCount: waitingCount ?? this.waitingCount,
      ready: ready ?? this.ready,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
