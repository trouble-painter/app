import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

sealed class GameDrawingPageState {}

class GameDrawingInitState extends GameDrawingPageState {}

class GameDrawingFailureState extends GameDrawingPageState {}

class GameDrawingLoadedState extends GameDrawingPageState {
  final GameRound round;
  final GamePlayer player;
  final GameDrawing drawing;
  final GameSketch localSketch;
  final int strokesLeft;
  final int secondsLeft;
  final DateTime? lastPointedAt;

  bool get isSpy => player.id == round.spyId;
  bool get isHost => player.id == round.hostId;
  bool get isMyTurn => myTurn == drawing.turn;
  bool get isDrawable => isMyTurn && strokesLeft >= 0 && round.secondsLeft > 0;
  int get myTurn => round.players.indexWhere((p) => p.id == player.id);

  GamePlayer get drawingPlayer => players[drawing.turn];
  List<GamePlayer> get players => round.players;

  GameDrawingLoadedState({
    required this.round,
    required this.player,
    required this.drawing,
    required this.localSketch,
    required this.strokesLeft,
    required this.secondsLeft,
    this.lastPointedAt,
  });

  GameDrawingLoadedState copyWith({
    GameRound? round,
    GamePlayer? player,
    GameDrawing? drawing,
    GameSketch? localSketch,
    int? strokesLeft,
    int? secondsLeft,
    DateTime? lastPointedAt,
  }) {
    return GameDrawingLoadedState(
      round: round ?? this.round,
      player: player ?? this.player,
      drawing: drawing ?? this.drawing,
      localSketch: localSketch ?? this.localSketch,
      strokesLeft: strokesLeft ?? this.strokesLeft,
      secondsLeft: secondsLeft ?? this.secondsLeft,
      lastPointedAt: lastPointedAt ?? this.lastPointedAt,
    );
  }
}
