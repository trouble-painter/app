part of '../game_state.dart';

class GameReadyState extends GameState {
  final GameStep step = GameStep.ready;
  final DateTime startedAt;
  final int showMyRoleMs;
  final bool isMafia;
  final String category;
  final String keyword;

  GameReadyState({
    super.exception,
    required this.showMyRoleMs,
    required this.startedAt,
    required this.isMafia,
    required this.category,
    required this.keyword,
  });
  GameReadyState copyWith({
    GameException? exception,
    DateTime? startedAt,
    int? showMyRoleMs,
    bool? isMafia,
    String? category,
    String? keyword,
  }) {
    return GameReadyState(
      exception: exception,
      startedAt: startedAt ?? this.startedAt,
      showMyRoleMs: showMyRoleMs ?? this.showMyRoleMs,
      isMafia: isMafia ?? this.isMafia,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
