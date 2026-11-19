import 'dart:math';

enum MiniGamePhase {
  ready,
  start,
  half,
  finish;
}

/// Shaking starts here
const int miniGameHalfNClick = 100;

/// Every this many clicks the shaking gets one step faster (x2 at 200, x3 at 300, ...).
const int miniGameShakeSpeedUpNClick = 100;

/// Sunglasses come off and the shaking stops; clicks keep counting.
const int miniGameFinishNClick = 500;

class MiniGameState {
  final int nClick;
  final DateTime waitingStartedAt;
  bool get isBeforeHalf => nClick < miniGameHalfNClick;
  bool get isBeforeFinish => nClick < miniGameFinishNClick;

  /// How many times faster than the first shaking
  int get shakeSpeed => max(nClick ~/ miniGameShakeSpeedUpNClick, 1);
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
