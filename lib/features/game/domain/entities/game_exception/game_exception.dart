import 'package:x_pr/core/localization/generated/l10n.dart';

enum GameException {
  unauthenticated,
  networkNotConnected,
  channelDisconnected,
  accessTokenExpired,
  maxRoom,
  notMyTurn,
  noRoom,
  ongoingGame,
  alreadyPlayingRoom,
  error;

  String get toast => switch (this) {
        notMyTurn => S.current.exceptionNotMyTurn,
        ongoingGame => S.current.exceptionOngoingGame,
        networkNotConnected => S.current.exceptionCheckNetwork,
        alreadyPlayingRoom => S.current.exceptionAlreadyPlayingRoom,
        unauthenticated => S.current.tryAgain,
        channelDisconnected => S.current.gamePageReconnecting,
        accessTokenExpired => S.current.tryAgain,
        maxRoom => S.current.homeMaxRoom,
        noRoom => S.current.homeNoRoom,
        error => S.current.tryAgain,
      };
}
