part of '../../x_game_res.dart';

class XGameTurnInfoPatch extends XGamePatch {
  final int round;
  final int turn;
  final DateTime startTurnTime;
  final int currentTurnUser;
  final List<Sketch> sketchList;
  XGameTurnInfoPatch({
    required this.round,
    required this.turn,
    required this.startTurnTime,
    required this.currentTurnUser,
    required this.sketchList,
  }) : super(type: XGamePatchType.turnInfo);

  factory XGameTurnInfoPatch.fromJson(Map<String, dynamic> json) {
    return XGameTurnInfoPatch(
      round: json['round'],
      turn: json['turn'],
      startTurnTime: const TimeSerializer().fromJson(json['startTurnTime']),
      currentTurnUser: json['currentTurnUser'],
      sketchList: (json['draw'] ?? []).map<Sketch>((json) {
        return Sketch.fromJson(json);
      }).toList(),
    );
  }

  @override
  GameState call(GameState state) {
    return switch (state) {
      GameDrawingState(
        initAnimMs: final initAnimMs,
        roundAnimMs: final roundAnimMs,
      ) =>
        state.copyWith(
          currentRound: round,
          currentTurn: turn,
          currentTurnStartedAt: startTurnTime,
          sketchList: sketchList,
          currentSketch: Sketch.empty(),
          strokesLeft: state.maxStroke,
          stage: GameDrawingStage.from(
            round: round,
            turn: turn,
            turnStartedAt: startTurnTime,
            initAnimMs: initAnimMs,
            roundAnimMs: roundAnimMs,
          ),
        ),
      _ => state,
    };
  }
}
