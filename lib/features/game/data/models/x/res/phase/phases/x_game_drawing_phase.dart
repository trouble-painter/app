part of '../../x_game_res.dart';

class XGameDrawingPhase extends XGamePhase {
  final int round;
  final int turn;
  final DateTime startTurnTime;
  final List<Sketch> sketchList;
  final Sketch sketch;
  final XGameInfo gameInfo;

  XGameDrawingPhase({
    required this.round,
    required this.turn,
    required this.startTurnTime,
    required this.sketchList,
    required this.sketch,
    required this.gameInfo,
  }) : super(type: XGamePhaseType.drawing);

  factory XGameDrawingPhase.fromJson(
    Map<String, dynamic> json,
    XGameInfo gameInfo,
  ) {
    return XGameDrawingPhase(
      gameInfo: gameInfo,
      round: json['round'],
      turn: json['turn'],
      startTurnTime: const TimeSerializer().fromJson(json['startTurnTime']),
      sketchList: (json['draw'] ?? []).map<Sketch>((json) {
        return Sketch.fromJson(json);
      }).toList(),
      sketch: Sketch.fromJson(json['currentDraw']),
    );
  }

  @override
  GameDrawingState toEntity(int myId) {
    return GameDrawingState(
      maxRound: gameInfo.option.round,
      maxStroke: gameInfo.option.turnCount,
      currentRound: round,
      currentTurn: turn,
      currentTurnStartedAt: startTurnTime,
      currentSketch: sketch,
      sketchList: sketchList,
      userList: gameInfo.turnList.map((xUser) {
        return xUser.toEntity();
      }).toList(),
      isMafia: myId == gameInfo.mafiaUserId,
      myTurn: gameInfo.turnList.indexWhere((xUser) {
        return xUser.id == myId;
      }),
      category: gameInfo.category,
      keyword: gameInfo.answer,
      roundAnimMs: gameInfo.option.roundAnimationTime,
      initAnimMs: gameInfo.option.introAnimationTime,
      turnMaxMs: gameInfo.option.turnTime,
      reaction$Ctrl: StreamController(),
      stage: GameDrawingStage.from(
        turn: turn,
        round: round,
        turnStartedAt: startTurnTime,
        roundAnimMs: gameInfo.option.roundAnimationTime,
        initAnimMs: gameInfo.option.introAnimationTime,
      ),
      strokesLeft: gameInfo.option.turnCount,
    );
  }
}
