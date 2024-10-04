enum MiniGamePhase {
  ready,
  start,
  half,
  finish;
}

const int miniGameHalfNClick = 50;
const int miniGameFinishNClick = 100;

class MiniGameState {
  final int nClick;
  final DateTime waitingStartedAt;
  bool get isBeforeHalf => nClick < miniGameHalfNClick;
  bool get isBeforeFinish => nClick < miniGameFinishNClick;
  MiniGamePhase get phase => switch (nClick) {
        0 => MiniGamePhase.ready,
        < miniGameHalfNClick => MiniGamePhase.start,
        < miniGameFinishNClick => MiniGamePhase.half,
        _ => MiniGamePhase.finish,
      };

  const MiniGameState({
    this.nClick = 0,
    required this.waitingStartedAt,
  });

  MiniGameState copyWith({
    int? nClick,
    DateTime? waitingStartedAt,
  }) {
    return MiniGameState(
      nClick: nClick ?? this.nClick,
      waitingStartedAt: waitingStartedAt ?? this.waitingStartedAt,
    );
  }
}
