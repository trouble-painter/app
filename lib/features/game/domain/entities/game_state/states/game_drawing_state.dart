part of '../game_state.dart';

Duration getRemainRoundAnimDuration({
  required DateTime turnStartedAt,
  required int round,
  required int turn,
  required int initAnimMs,
  required int roundAnimMs,
}) {
  final animDuration = Duration(
    milliseconds: round == 0 ? initAnimMs + roundAnimMs : roundAnimMs,
  );
  final roundEndedAt = turnStartedAt.add(animDuration);
  final result = roundEndedAt.difference(NetworkTime.now);
  return result;
}

enum GameDrawingStage {
  round,
  play;

  factory GameDrawingStage.from({
    required int round,
    required int initAnimMs,
    required int roundAnimMs,
    required int turn,
    required DateTime turnStartedAt,
  }) {
    final remainAnimDuration = getRemainRoundAnimDuration(
      turnStartedAt: turnStartedAt,
      round: round,
      turn: turn,
      initAnimMs: initAnimMs,
      roundAnimMs: roundAnimMs,
    );

    /// Hide animation time 400ms
    if (turn == 0 && remainAnimDuration.inMilliseconds > 400) {
      return GameDrawingStage.round;
    } else {
      return GameDrawingStage.play;
    }
  }
}

class GameDrawingState extends GameState {
  final GameStep step = GameStep.drawing;
  final List<GameUser> userList;
  final bool isMafia;
  final int myTurn;
  final int maxRound;
  final int currentRound;
  final int currentTurn;
  final int roundAnimMs;
  final int initAnimMs;
  final int turnMaxMs;
  final int maxStroke;
  final int strokesLeft;
  final String category;
  final String keyword;
  final DateTime? lastPointedAt;
  final DateTime currentTurnStartedAt;
  final Sketch currentSketch;
  final List<Sketch> sketchList;
  final GameDrawingStage stage;

  GameDrawingState({
    super.exception,
    required this.maxRound,
    required this.maxStroke,
    required this.currentRound,
    required this.currentTurn,
    required this.currentTurnStartedAt,
    required this.currentSketch,
    required this.sketchList,
    required this.userList,
    required this.isMafia,
    required this.myTurn,
    required this.category,
    required this.strokesLeft,
    required this.keyword,
    required this.roundAnimMs,
    required this.initAnimMs,
    required this.turnMaxMs,
    required this.stage,
    this.lastPointedAt,
  }) : super(isPlaying: true);

  GameUser get me => userList[myTurn];

  bool get isMyTurn => myTurn == currentTurn;
  bool get isPlayStage => stage == GameDrawingStage.play;
  bool get isNextRound => currentRound < maxRound;
  bool get isFinalTurn => !isNextRound && currentTurn == userList.length - 1;
  bool get isShowRoundAnim {
    return stage == GameDrawingStage.round &&
        remainRoundAnimDuration.inMilliseconds > 0;
  }

  bool get noStrokesLeft {
    return isMyTurn && strokesLeft == 0 && isPlayStage && remainTurnMs > 0;
  }

  bool get isDrawable {
    return isMyTurn && strokesLeft >= 1 && isPlayStage && remainTurnMs > 0;
  }

  Duration get currentAnimDuration {
    final bool isFirstTurn = currentTurn == 0;
    final bool isInit = currentRound == 0 && currentTurn == 0 && isFirstTurn;
    return Duration(
      milliseconds: isInit
          ? roundAnimMs + initAnimMs
          : isFirstTurn
              ? roundAnimMs
              : 0,
    );
  }

  int get currentTurmMaxMs {
    final bool isFirstTurn = currentTurn == 0;
    final bool isInit = currentTurn == 0 && isFirstTurn;
    return isInit
        ? turnMaxMs + roundAnimMs + initAnimMs
        : isFirstTurn
            ? turnMaxMs + roundAnimMs
            : turnMaxMs;
  }

  int get remainTurnMs {
    final endTime = currentTurnStartedAt.add(
      Duration(milliseconds: currentTurmMaxMs),
    );
    return max(endTime.difference(NetworkTime.now).inMilliseconds, 0);
  }

  Duration get remainRoundAnimDuration {
    if (stage != GameDrawingStage.round) return Duration.zero;
    return getRemainRoundAnimDuration(
      turnStartedAt: currentTurnStartedAt,
      round: currentRound,
      turn: currentTurn,
      initAnimMs: initAnimMs,
      roundAnimMs: roundAnimMs,
    );
  }

  GameDrawingState copyWith({
    GameException? exception,
    List<GameUser>? userList,
    bool? isMafia,
    int? myTurn,
    int? maxRound,
    int? currentRound,
    int? currentTurn,
    int? roundAnimMs,
    int? initAnimMs,
    int? turnMaxMs,
    int? maxStroke,
    int? strokesLeft,
    String? category,
    String? keyword,
    DateTime? currentTurnStartedAt,
    DateTime? lastPointedAt,
    Sketch? currentSketch,
    List<Sketch>? sketchList,
    GameDrawingStage? stage,
  }) {
    return GameDrawingState(
      exception: exception,
      userList: userList ?? this.userList,
      isMafia: isMafia ?? this.isMafia,
      myTurn: myTurn ?? this.myTurn,
      strokesLeft: strokesLeft ?? this.strokesLeft,
      maxRound: maxRound ?? this.maxRound,
      currentRound: currentRound ?? this.currentRound,
      currentTurn: currentTurn ?? this.currentTurn,
      roundAnimMs: roundAnimMs ?? this.roundAnimMs,
      initAnimMs: initAnimMs ?? this.initAnimMs,
      turnMaxMs: turnMaxMs ?? this.turnMaxMs,
      maxStroke: maxStroke ?? this.maxStroke,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
      currentTurnStartedAt: currentTurnStartedAt ?? this.currentTurnStartedAt,
      currentSketch: currentSketch ?? this.currentSketch,
      sketchList: sketchList ?? this.sketchList,
      lastPointedAt: lastPointedAt ?? this.lastPointedAt,
      stage: stage ?? this.stage,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }

  @override
  String toString() {
    return 'GameDrawingState(userList: $userList, isMafia: $isMafia, myTurn: $myTurn, maxRound: $maxRound, currentRound: $currentRound, currentTurn: $currentTurn, roundAnimMs: $roundAnimMs, initAnimMs: $initAnimMs, turnMaxSec: $turnMaxMs, category: $category, keyword: $keyword, currentTurnStartedAt: $currentTurnStartedAt, currentSketch: $currentSketch, sketchList: $sketchList, stage: $stage)';
  }
}
