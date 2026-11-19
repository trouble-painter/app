import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/features/game/data/models/protocol/protocol_enums.dart';
import 'package:trouble_painter/features/game/data/models/protocol/views.dart';
import 'package:trouble_painter/features/game/data/models/protocol/wire.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/stroke.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';

/// protocol.md 5. Server messages. Frame: `{type, data}`
sealed class ServerMessage {
  const ServerMessage();

  /// Returns null for an unknown `type` (protocol.md 3.6).
  /// Throws [FormatException] or [TypeError] for a malformed frame.
  static ServerMessage? decode(String text) {
    final Json frame = jsonDecode(text);
    final type = fromWire(ServerMessageType.values, frame['type']);
    if (type == null) return null;
    final Json data = frame['data'] ?? const {};
    return switch (type) {
      ServerMessageType.hello => HelloMessage.fromJson(data),
      ServerMessageType.room => RoomMessage(RoomView.fromJson(data['room'])),
      ServerMessageType.matching =>
        MatchingMessage(MatchingView.fromJson(data)),
      ServerMessageType.idle =>
        IdleMessage(requireWire(IdleReason.values, data['reason'])),
      ServerMessageType.players => PlayersMessage(
          players: PlayerView.listFromJson(data['players']),
          hostId: data['hostId'],
        ),
      ServerMessageType.turn => TurnMessage(
          turn: TurnView.fromJson(data['turn']),
          sketch: SketchView.maybeFromJson(data['sketch']),
        ),
      ServerMessageType.stroke => StrokeMessage(
          index: data['index'],
          stroke: strokeFromJson(data['stroke']),
          canvas: canvasFromJson(data['canvas']),
        ),
      ServerMessageType.sketchCleared => const SketchClearedMessage(),
      ServerMessageType.reaction => ReactionMessage(
          userId: data['userId'],
          reaction:
              requireWire(ProtocolReaction.values, data['reaction']).entity,
        ),
      ServerMessageType.votes => VotesMessage(votesFromJson(data['votes'])),
      ServerMessageType.answerTyping => AnswerTypingMessage(data['answer']),
      ServerMessageType.error => ErrorMessage(
          request: fromWire(ClientMessageType.values, data['request']),
          code: fromWire(ProtocolErrorCode.values, data['code']) ??
              ProtocolErrorCode.internal,
        ),
    };
  }
}

class HelloMessage extends ServerMessage {
  final DateTime serverTime;
  final LimitsView limits;
  final RoomView? room;
  final MatchingView? matching;

  const HelloMessage({
    required this.serverTime,
    required this.limits,
    required this.room,
    required this.matching,
  });

  factory HelloMessage.fromJson(Json json) => HelloMessage(
        serverTime: epochMs(json['serverTime']),
        limits: LimitsView.fromJson(json['limits']),
        room: RoomView.maybeFromJson(json['room']),
        matching: MatchingView.maybeFromJson(json['matching']),
      );
}

class RoomMessage extends ServerMessage {
  final RoomView room;
  const RoomMessage(this.room);
}

class MatchingMessage extends ServerMessage {
  final MatchingView matching;
  const MatchingMessage(this.matching);
}

class IdleMessage extends ServerMessage {
  final IdleReason reason;
  const IdleMessage(this.reason);
}

class PlayersMessage extends ServerMessage {
  final List<PlayerView> players;
  final int hostId;
  const PlayersMessage({required this.players, required this.hostId});
}

class TurnMessage extends ServerMessage {
  final TurnView turn;

  /// Sketch of the turn that just ended. Null when nothing was drawn.
  final SketchView? sketch;
  const TurnMessage({required this.turn, required this.sketch});
}

class StrokeMessage extends ServerMessage {
  final int index;
  final Stroke stroke;
  final Size canvas;
  const StrokeMessage({
    required this.index,
    required this.stroke,
    required this.canvas,
  });
}

/// The drawer cleared the sketch of the current turn
class SketchClearedMessage extends ServerMessage {
  const SketchClearedMessage();
}

class ReactionMessage extends ServerMessage {
  final int userId;
  final GameReaction reaction;
  const ReactionMessage({required this.userId, required this.reaction});
}

class VotesMessage extends ServerMessage {
  final VotesView votes;
  const VotesMessage(this.votes);
}

class AnswerTypingMessage extends ServerMessage {
  final String answer;
  const AnswerTypingMessage(this.answer);
}

class ErrorMessage extends ServerMessage {
  /// Null when the server could not tell the request type
  final ClientMessageType? request;
  final ProtocolErrorCode code;
  const ErrorMessage({required this.request, required this.code});
}
