import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/game/domain/entities/game_exception/game_exception.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';

/// protocol.md 4. Client requests
enum ClientMessageType {
  createRoom,
  joinRoom,
  leaveRoom,
  updateRule,
  setReady,
  kickPlayer,
  startGame,
  drawStroke,
  undoStroke,
  endTurn,
  reaction,
  vote,
  typeAnswer,
  submitAnswer,
  matchJoin,
  matchCancel,
  pushToken;
}

/// protocol.md 5. Server messages
enum ServerMessageType {
  hello,
  room,
  matching,
  idle,
  players,
  turn,
  stroke,
  sketchCleared,
  strokeUndone,
  reaction,
  votes,
  answerTyping,
  error;
}

enum ProtocolLocale {
  ko(Language.korean),
  en(Language.english);

  const ProtocolLocale(this.language);
  final Language language;

  factory ProtocolLocale.fromLanguage(Language language) =>
      values.firstWhere((locale) => locale.language == language);
}

enum PhaseType { wait, ready, drawing, vote, answer, end }

enum IdleReason { left, kicked, matchCanceled }

enum ProtocolReaction {
  hamster(GameReaction.mafia),
  bear(GameReaction.citizen),
  heart(GameReaction.like),
  poop(GameReaction.bad),
  best(GameReaction.good),
  question(GameReaction.question);

  const ProtocolReaction(this.entity);
  final GameReaction entity;

  factory ProtocolReaction.fromEntity(GameReaction entity) =>
      values.firstWhere((reaction) => reaction.entity == entity);
}

/// protocol.md 5.3 Errors
enum ProtocolErrorCode {
  invalidRequest(GameException.invalidRequest),
  roomNotFound(GameException.roomNotFound),
  roomFull(GameException.roomFull),
  roomInGame(GameException.roomInGame),
  alreadyInGame(GameException.alreadyInGame),
  notInRoom(GameException.notInRoom),
  notHost(GameException.notHost),
  notEnoughPlayers(GameException.notEnoughPlayers),
  notAllReady(GameException.notAllReady),
  invalidPhase(GameException.invalidPhase),
  notYourTurn(GameException.notYourTurn),
  internal(GameException.error);

  const ProtocolErrorCode(this.exception);
  final GameException exception;
}

/// protocol.md 3.4 close codes
abstract final class ProtocolCloseCode {
  /// Replaced by a newer connection of the same user
  static const replaced = 4000;

  /// Too many requests or repeated bad frames
  static const rateLimited = 4001;
}
