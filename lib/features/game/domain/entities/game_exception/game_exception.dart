import 'package:trouble_painter/core/localization/generated/l10n.dart';

enum GameException {
  /// Client
  unauthenticated,
  networkNotConnected,
  channelDisconnected,

  /// Close code 4000: another connection of the same user took over
  replaced,

  /// Close code 4001
  rateLimited,
  error,

  /// Server error codes (protocol.md 5.3)
  invalidRequest,
  roomNotFound,
  roomFull,
  roomInGame,
  alreadyInGame,
  notInRoom,
  notHost,
  notEnoughPlayers,
  notAllReady,
  invalidPhase,
  notYourTurn;

  String get toast => switch (this) {
        unauthenticated => S.current.tryAgain,
        networkNotConnected => S.current.exceptionCheckNetwork,
        channelDisconnected => S.current.gamePageReconnecting,
        replaced => S.current.exceptionReplaced,
        rateLimited => S.current.exceptionRateLimited,
        error => S.current.tryAgain,
        invalidRequest => S.current.tryAgain,
        roomNotFound => S.current.homeNoRoom,
        roomFull => S.current.homeMaxRoom,
        roomInGame => S.current.exceptionAlreadyPlayingRoom,
        alreadyInGame => S.current.exceptionOngoingGame,
        notInRoom => S.current.exceptionNotInRoom,
        notHost => S.current.exceptionNotHost,
        notEnoughPlayers => S.current.exceptionNotEnoughPlayers,
        notAllReady => S.current.exceptionNotAllReady,
        invalidPhase => S.current.exceptionInvalidPhase,
        notYourTurn => S.current.exceptionNotMyTurn,
      };
}
