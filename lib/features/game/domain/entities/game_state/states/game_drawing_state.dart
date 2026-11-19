part of '../game_state.dart';

enum GameDrawingStage {
  /// Round animation before `drawFrom`
  round,
  play;

  /// Skip an animation that has less than this left.
  static const Duration _minRoundAnim = Duration(milliseconds: 400);

  factory GameDrawingStage.from(DateTime drawFrom) {
    return drawFrom.difference(ServerTime.now) > _minRoundAnim
        ? GameDrawingStage.round
        : GameDrawingStage.play;
  }
}

class GameDrawingState extends GameState {
  final GameStep step = GameStep.drawing;

  /// In turn order
  final List<GameUser> userList;
  final int myId;
  final bool isMafia;
  final String category;

  /// Null for the mafia
  final String? keyword;
  final int rounds;

  /// Null means no limit
  final int? strokesPerTurn;
  final int introAnimMs;
  final int roundAnimMs;

  /// Current turn (`TurnView`)
  final int currentRound;
  final int drawerId;
  final DateTime currentTurnStartedAt;
  final DateTime drawFrom;
  final DateTime deadline;

  /// Finished turns
  final List<Sketch> sketchList;

  /// Sketch of the current turn
  final Sketch currentSketch;

  /// Null means no limit
  final int? strokesLeft;
  final DateTime? lastPointedAt;
  final GameDrawingStage stage;
  final StreamController<GameReactionSent> reaction$Ctrl;

  GameDrawingState({
    super.exception,
    required this.userList,
    required this.myId,
    required this.isMafia,
    required this.category,
    required this.keyword,
    required this.rounds,
    required this.strokesPerTurn,
    required this.introAnimMs,
    required this.roundAnimMs,
    required this.currentRound,
    required this.drawerId,
    required this.currentTurnStartedAt,
    required this.drawFrom,
    required this.deadline,
    required this.sketchList,
    required this.currentSketch,
    required this.strokesLeft,
    required this.stage,
    required this.reaction$Ctrl,
    this.lastPointedAt,
  }) : super(isPlaying: true);

  int get myTurn => userList.indexWhere((user) => user.id == myId);
  int get currentTurn => userList.indexWhere((user) => user.id == drawerId);
  GameUser get me => userList[myTurn];

  bool get isMyTurn => drawerId == myId;
  bool get isPlayStage => stage == GameDrawingStage.play;
  bool get isFinalTurn =>
      currentRound == rounds - 1 && currentTurn == userList.length - 1;
  bool get isShowRoundAnim {
    return stage == GameDrawingStage.round &&
        remainRoundAnimDuration > Duration.zero;
  }

  bool get noStrokesLeft {
    return isMyTurn && strokesLeft == 0 && isPlayStage && remainTurnMs > 0;
  }

  bool get isDrawable {
    final strokesLeft = this.strokesLeft;
    return isMyTurn &&
        (strokesLeft == null || strokesLeft >= 1) &&
        isPlayStage &&
        remainTurnMs > 0;
  }

  /// Strokes left once one more is drawn
  int? get strokesLeftAfterStroke {
    final strokesLeft = this.strokesLeft;
    return strokesLeft == null ? null : strokesLeft - 1;
  }

  /// Drawing time of this turn
  int get turnMs => deadline.difference(drawFrom).inMilliseconds;

  int get remainTurnMs {
    return max(deadline.difference(ServerTime.now).inMilliseconds, 0);
  }

  Duration get remainRoundAnimDuration {
    if (stage != GameDrawingStage.round) return Duration.zero;
    return drawFrom.difference(ServerTime.now);
  }

  GameDrawingState copyWith({
    GameException? exception,
    List<GameUser>? userList,
    bool? isMafia,
    String? Function()? keyword,
    int? currentRound,
    int? drawerId,
    DateTime? currentTurnStartedAt,
    DateTime? drawFrom,
    DateTime? deadline,
    List<Sketch>? sketchList,
    Sketch? currentSketch,
    int? strokesLeft,
    DateTime? lastPointedAt,
    GameDrawingStage? stage,
  }) {
    return GameDrawingState(
      exception: exception,
      userList: userList ?? this.userList,
      myId: myId,
      isMafia: isMafia ?? this.isMafia,
      category: category,
      keyword: keyword != null ? keyword() : this.keyword,
      rounds: rounds,
      strokesPerTurn: strokesPerTurn,
      introAnimMs: introAnimMs,
      roundAnimMs: roundAnimMs,
      currentRound: currentRound ?? this.currentRound,
      drawerId: drawerId ?? this.drawerId,
      currentTurnStartedAt: currentTurnStartedAt ?? this.currentTurnStartedAt,
      drawFrom: drawFrom ?? this.drawFrom,
      deadline: deadline ?? this.deadline,
      sketchList: sketchList ?? this.sketchList,
      currentSketch: currentSketch ?? this.currentSketch,
      strokesLeft: strokesLeft ?? this.strokesLeft,
      lastPointedAt: lastPointedAt ?? this.lastPointedAt,
      stage: stage ?? this.stage,
      reaction$Ctrl: reaction$Ctrl,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }

  @override
  String toString() {
    return 'GameDrawingState(myId: $myId, isMafia: $isMafia, round: $currentRound, drawerId: $drawerId, drawFrom: $drawFrom, deadline: $deadline, strokesLeft: $strokesLeft, sketches: ${sketchList.length}, stage: $stage)';
  }
}
