import 'package:x_pr/features/game/v1/domain/entities/playing/game_drawing.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';

class GamePlayingPageState {
  /// Time remaining (ms)
  final int timeLeftSec;

  /// Number of strokes remaining
  final int strokesLeft;

  /// The time of the last dot on the same stroke. Reset when you release the stroke
  final DateTime? lastPointedAt;

  /// Turn change time.
  final DateTime turnStartedAt;
  final GameDrawing? localDrawing;
  final List<GameDrawing> remoteDrawingList;
  final InGameState inGameState;

  GameRoom get room => inGameState.room;
  GamePlayer get player => inGameState.player;
  GamePlayer get drawingPlayer => players[room.currentDrawingOrder];
  List<GamePlayer> get players => inGameState.players;
  bool get isMyTurn => drawingPlayer.id == player.id;

  GamePlayingPageState({
    this.lastPointedAt,
    this.localDrawing,
    required this.turnStartedAt,
    required this.timeLeftSec,
    required this.strokesLeft,
    required this.remoteDrawingList,
    required this.inGameState,
  });

  GamePlayingPageState copyWith({
    int? timeLeftSec,
    int? strokesLeft,
    DateTime? lastPointedAt,
    DateTime? turnStartedAt,
    GameDrawing? localDrawing,
    List<GameDrawing>? remoteDrawingList,
    InGameState? inGameState,
  }) {
    return GamePlayingPageState(
      timeLeftSec: timeLeftSec ?? this.timeLeftSec,
      strokesLeft: strokesLeft ?? this.strokesLeft,
      lastPointedAt: lastPointedAt ?? this.lastPointedAt,
      turnStartedAt: turnStartedAt ?? this.turnStartedAt,
      localDrawing: localDrawing ?? this.localDrawing,
      remoteDrawingList: remoteDrawingList ?? this.remoteDrawingList,
      inGameState: inGameState ?? this.inGameState,
    );
  }

  @override
  String toString() {
    return 'GamePlayingPageState(localDrawing: ${localDrawing?.strokeList.length}, remoteDrawingList: ${remoteDrawingList.length})';
  }
}
