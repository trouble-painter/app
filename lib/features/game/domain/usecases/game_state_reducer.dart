import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/features/game/data/models/protocol/server_message.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/domain/entities/game_state/game_state.dart';

/// Converts server messages to [GameState]. The server is the single source of truth,
/// so a snapshot ([RoomView], [MatchingView]) always replaces the state.
abstract final class GameStateReducer {
  /// State right after `HELLO`: room -> phase page, queue -> matching, neither -> home.
  static GameState fromHello(HelloMessage hello, int myId) {
    final room = hello.room;
    final matching = hello.matching;
    if (room != null) return fromRoom(room, myId) ?? GameDisconnectedState();
    if (matching != null) return fromMatching(matching);
    return GameDisconnectedState();
  }

  static GameState fromMatching(MatchingView matching) {
    return GameQuickStartWaitingState(waitingCount: matching.waitingCount);
  }

  /// Returns null for a phase the app does not show yet.
  static GameState? fromRoom(RoomView room, int myId) {
    final phase = room.phase;
    switch (phase) {
      case WaitPhaseView():
        return GameWaitingState(
          roomId: room.id,
          userList: room.players.map((p) => p.toEntity()).toList(),
          myId: myId,
          hostIndex: room.players.indexWhere((p) => p.id == room.hostId),
          minPlayer: room.option.minPlayers,
          maxPlayer: room.option.maxPlayers,
        );
      case ReadyPhaseView():
      case DrawingPhaseView():
      case VotePhaseView():
      case AnswerPhaseView():
      case EndPhaseView():
        // TODO(app-changes G1): map game phases.
        Logger.d("🧩 Unsupported phase yet: ${phase.runtimeType}");
        return null;
    }
  }

  /// Returns null to keep [current].
  static GameState? reduce(GameState current, ServerMessage message, int myId) {
    return switch (message) {
      RoomMessage(room: final room) => fromRoom(room, myId),
      MatchingMessage(matching: final matching) => fromMatching(matching),
      IdleMessage() => GameDisconnectedState(),
      PlayersMessage() => _applyPlayers(current, message),
      HelloMessage() => fromHello(message, myId),
      TurnMessage() ||
      StrokeMessage() ||
      ReactionMessage() ||
      VotesMessage() ||
      AnswerTypingMessage() ||
      ErrorMessage() =>
        null,
    };
  }

  static GameState? _applyPlayers(GameState current, PlayersMessage message) {
    final players = message.players;
    return switch (current) {
      GameWaitingState() => current.copyWith(
          userList: players.map((p) => p.toEntity()).toList(),
          hostIndex: players.indexWhere((p) => p.id == message.hostId),
        ),
      _ => null,
    };
  }
}
