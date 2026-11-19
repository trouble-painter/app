part of '../game_state.dart';

class GameReadyState extends GameState {
  final GameStep step = GameStep.ready;
  final String roomId;
  final DateTime deadline;
  final int readyMs;
  final bool isMafia;
  final String category;

  /// Null for the mafia
  final String? keyword;

  GameReadyState({
    super.exception,
    required this.roomId,
    required this.deadline,
    required this.readyMs,
    required this.isMafia,
    required this.category,
    required this.keyword,
  }) : super(isPlaying: true);

  DateTime get startedAt => deadline.subtract(Duration(milliseconds: readyMs));

  GameReadyState copyWith({
    GameException? exception,
    DateTime? deadline,
    bool? isMafia,
  }) {
    return GameReadyState(
      exception: exception,
      roomId: roomId,
      deadline: deadline ?? this.deadline,
      readyMs: readyMs,
      isMafia: isMafia ?? this.isMafia,
      category: category,
      keyword: keyword,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
