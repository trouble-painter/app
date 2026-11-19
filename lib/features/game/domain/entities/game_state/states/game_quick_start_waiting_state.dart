part of '../game_state.dart';

class GameQuickStartWaitingState extends GameState {
  GameStep step = GameStep.quickStartWaiting;

  /// Connected people in the queue, including me
  final int waitingCount;

  /// Show the count only when someone else is waiting (protocol.md MatchingView)
  static const int minShownWaitingCount = 2;
  bool get isShowWaitingCount => waitingCount >= minShownWaitingCount;

  /// When the game starts (server clock); null until enough people are waiting
  final DateTime? startsAt;

  /// How many must wait before the countdown to [startsAt] runs
  final int minCount;

  /// How long the countdown to [startsAt] runs
  final int waitMs;

  GameQuickStartWaitingState({
    super.exception,
    this.waitingCount = 1,
    this.startsAt,
    required this.minCount,
    required this.waitMs,
  }) : super(isPlaying: false);

  GameQuickStartWaitingState copyWith({
    GameException? exception,
    int? waitingCount,
  }) {
    return GameQuickStartWaitingState(
      exception: exception,
      waitingCount: waitingCount ?? this.waitingCount,
      startsAt: startsAt,
      minCount: minCount,
      waitMs: waitMs,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
