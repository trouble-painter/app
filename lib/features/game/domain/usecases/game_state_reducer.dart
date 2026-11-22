import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_role.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';
import 'package:trouble_painter/features/game/domain/entities/player_color.dart';

/// Converts server messages to [GameState]. The server is the single source of truth,
/// so a snapshot ([RoomView], [MatchingView]) always replaces the state.
abstract final class GameStateReducer {
  /// State right after `HELLO`: room -> phase page, queue -> matching, neither -> home.
  static GameState fromHello(
    HelloMessage hello,
    int myId, [
    GameState? current,
  ]) {
    final room = hello.room;
    final matching = hello.matching;
    if (room != null) return fromRoom(room, myId, current);
    if (matching != null) return fromMatching(matching);
    return GameDisconnectedState();
  }

  static GameState fromMatching(MatchingView matching) {
    return GameQuickStartWaitingState(
      waitingCount: matching.waitingCount,
      ready: matching.ready?.toEntity(),
    );
  }

  /// [previous] keeps the reaction stream the drawing page listens to.
  static GameState fromRoom(RoomView room, int myId, [GameState? previous]) {
    final phase = room.phase;
    final option = room.option;
    switch (phase) {
      case WaitPhaseView(:final categories):
        return GameWaitingState(
          roomId: room.id,
          userList: room.players.map((p) => p.toEntity()).toList(),
          myId: myId,
          hostIndex: room.players.indexWhere((p) => p.id == room.hostId),
          minPlayer: option.minPlayers,
          maxPlayer: option.maxPlayers,
          rule: room.rule.toEntity(),
          defaultStrokesPerTurn: option.defaultStrokesPerTurn,
          roomLanguage: room.locale.language,
          categories: categories.map((c) => c.toEntity()).toList(),
        );
      case ReadyPhaseView(:final game):
        return GameReadyState(
          roomId: room.id,
          deadline: phase.deadline,
          readyMs: option.readyMs,
          isMafia: game.role == GameRole.mafia,
          category: game.category,
          keyword: game.keyword,
        );
      case DrawingPhaseView(:final game, :final turn):
        final userList = _turnOrderUsers(room, game);
        final strokesPerTurn = room.rule.strokesPerTurn;
        final current = phase.current;
        return GameDrawingState(
          userList: userList,
          myId: myId,
          isMafia: game.role == GameRole.mafia,
          category: game.category,
          keyword: game.keyword,
          rounds: option.rounds,
          strokesPerTurn: strokesPerTurn,
          introAnimMs: option.introAnimationMs,
          roundAnimMs: option.roundAnimationMs,
          currentRound: turn.round,
          drawerId: turn.drawerId,
          currentTurnStartedAt: turn.startedAt,
          drawFrom: turn.drawFrom,
          deadline: turn.deadline,
          sketchList: _sketches(phase.sketches, userList),
          currentSketch: current == null
              ? _emptySketch(turn.drawerId, userList)
              : _sketch(current, userList),
          strokesLeft: strokesPerTurn == null
              ? null
              : max(strokesPerTurn - (current?.strokes.length ?? 0), 0),
          stage: GameDrawingStage.from(turn.drawFrom),
          reaction$Ctrl: previous is GameDrawingState
              ? previous.reaction$Ctrl
              : StreamController<GameReactionSent>.broadcast(),
        );
      case VotePhaseView(:final game):
        final userList = _turnOrderUsers(room, game);
        return GameVotingState(
          deadline: phase.deadline,
          voteMs: option.voteMs,
          myId: myId,
          category: game.category,
          keyword: game.keyword,
          isMafia: game.role == GameRole.mafia,
          votes: phase.votes,
          userList: userList,
          sketchList: _sketches(phase.sketches, userList),
        );
      case AnswerPhaseView(:final game):
        final userList = _turnOrderUsers(room, game);
        return GameGuessState(
          deadline: phase.deadline,
          answerMs: option.answerMs,
          mafiaAnswer: phase.typing,
          category: game.category,
          keyword: game.keyword,
          isMafia: game.role == GameRole.mafia,
          accusedId: phase.accusedId,
          userList: userList,
          sketchList: _sketches(phase.sketches, userList),
        );
      case EndPhaseView(:final game, :final result):
        final userList = _turnOrderUsers(room, game);
        return GameResultState(
          roomId: room.id,
          myId: myId,
          category: game.category,
          keyword: result.answer,
          mafiaId: result.mafiaId,
          mafiaGuess: result.mafiaGuess,
          winner: result.winner,
          isQuickStartGame: room.isQuickStart,
          sketchList: _sketches(phase.sketches, userList),
          userList: userList,
        );
    }
  }

  /// Returns null to keep [current].
  static GameState? reduce(GameState current, ServerMessage message, int myId) {
    return switch (message) {
      RoomMessage(room: final room) => fromRoom(room, myId, current),
      MatchingMessage(matching: final matching) => fromMatching(matching),
      IdleMessage(reason: final reason) => switch (reason) {
          IdleReason.kicked => GameDisconnectedState.kicked(),
          IdleReason.matchDeclined => GameDisconnectedState.matchDeclined(),
          IdleReason.left ||
          IdleReason.matchCanceled =>
            GameDisconnectedState(),
        },
      PlayersMessage() => _applyPlayers(current, message),
      HelloMessage() => fromHello(message, myId, current),
      TurnMessage() => _applyTurn(current, message),
      StrokeMessage() => _applyStroke(current, message),
      SketchClearedMessage() => _applySketchCleared(current),
      StrokeUndoneMessage() => _applyStrokeUndone(current),
      VotesMessage(votes: final votes) => switch (current) {
          GameVotingState() => current.copyWith(votes: votes),
          _ => null,
        },
      AnswerTypingMessage(answer: final answer) => switch (current) {
          GameGuessState() => current.copyWith(mafiaAnswer: answer),
          _ => null,
        },

      /// A reaction does not change the state. [GameService] passes it on.
      ReactionMessage() || ErrorMessage() => null,
    };
  }

  static GameState? _applyPlayers(GameState current, PlayersMessage message) {
    final players = message.players;
    List<GameUser> refresh(List<GameUser> userList) => [
          for (final user in userList)
            players
                    .where((p) => p.id == user.id)
                    .map((p) => p.toEntity())
                    .firstOrNull ??
                user,
        ];
    return switch (current) {
      GameWaitingState() => current.copyWith(
          userList: players.map((p) => p.toEntity()).toList(),
          hostIndex: players.indexWhere((p) => p.id == message.hostId),
        ),
      GameDrawingState() => current.copyWith(
          userList: refresh(current.userList),
        ),
      GameVotingState() => current.copyWith(
          userList: refresh(current.userList),
        ),
      GameGuessState() => current.copyWith(
          userList: refresh(current.userList),
        ),
      GameResultState() => current.copyWith(
          userList: refresh(current.userList),
        ),
      GameDisconnectedState() ||
      GameQuickStartWaitingState() ||
      GameReadyState() =>
        null,
    };
  }

  static GameState? _applyTurn(GameState current, TurnMessage message) {
    if (current is! GameDrawingState) return null;
    final turn = message.turn;
    final sketch = message.sketch;
    return current.copyWith(
      currentRound: turn.round,
      drawerId: turn.drawerId,
      currentTurnStartedAt: turn.startedAt,
      drawFrom: turn.drawFrom,
      deadline: turn.deadline,
      sketchList: sketch == null
          ? current.sketchList
          : [...current.sketchList, _sketch(sketch, current.userList)],
      currentSketch: _emptySketch(turn.drawerId, current.userList),
      strokesLeft: current.strokesPerTurn,
      stage: GameDrawingStage.from(turn.drawFrom),
    );
  }

  /// The piece is written over the last stroke from `from` on, or starts the next one.
  static GameState? _applyStroke(GameState current, StrokeMessage message) {
    if (current is! GameDrawingState || current.isMyTurn) return null;
    final strokes = current.currentSketch.strokeList;
    final index = message.index;
    final isNext = index == strokes.length;
    final Stroke? kept = isNext
        ? Stroke(x: [], y: [], t: [])
        : (index == strokes.length - 1 ? strokes[index] : null);

    /// The server relays the pieces in order, so this is a piece of a sketch not seen here.
    if (kept == null || message.from > kept.length) return null;

    final stroke = kept.sublist(0, message.from).add(message.stroke);
    return current.copyWith(
      currentSketch: current.currentSketch.copyWith(
        strokeList: [...strokes.sublist(0, index), stroke],
        canvasSize: message.canvas,
      ),
    );
  }

  static GameState? _applyStrokeUndone(GameState current) {
    if (current is! GameDrawingState || current.isMyTurn) return null;
    final strokes = current.currentSketch.strokeList;
    if (strokes.isEmpty) return null;
    return current.copyWith(
      currentSketch: current.currentSketch.copyWith(
        strokeList: strokes.sublist(0, strokes.length - 1),
      ),
    );
  }

  static GameState? _applySketchCleared(GameState current) {
    if (current is! GameDrawingState) return null;
    return current.copyWith(
      currentSketch: current.currentSketch.copyWith(strokeList: []),
      strokesLeft: current.strokesPerTurn,
    );
  }

  /// Players of the game in turn order
  static List<GameUser> _turnOrderUsers(RoomView room, GameView game) => [
        for (final id in game.turnOrder)
          ...room.players.where((p) => p.id == id).map((p) => p.toEntity()),
      ];

  /// The wire sketch has no color: it is the drawer's [PlayerColor].
  static Color _colorOf(int userId, List<GameUser> userList) {
    final drawer = userList.where((user) => user.id == userId).firstOrNull;
    return (drawer?.playerColor ?? PlayerColor.gray).drawing;
  }

  static Sketch _sketch(SketchView sketch, List<GameUser> userList) => Sketch(
        userId: sketch.userId,
        strokeList: sketch.strokes,
        canvasSize: sketch.canvas,
        color: _colorOf(sketch.userId, userList),
      );

  static List<Sketch> _sketches(
    List<SketchView> sketches,
    List<GameUser> userList,
  ) =>
      sketches.map((sketch) => _sketch(sketch, userList)).toList();

  static Sketch _emptySketch(int drawerId, List<GameUser> userList) => Sketch(
        userId: drawerId,
        strokeList: [],
        canvasSize: Size.zero,
        color: _colorOf(drawerId, userList),
      );
}
