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
  error;

  String get toast => switch (this) {
        notMyTurn => S.current.notMyTurn,
        ongoingGame => S.current.ongoingGame,
        unauthenticated => S.current.tryAgain,
        networkNotConnected => S.current.checkNetwork,
        channelDisconnected => S.current.gamePageReconnecting,
        accessTokenExpired => S.current.tryAgain,
        maxRoom => S.current.homeMaxRoom,
        noRoom => S.current.homeNoRoom,
        error => S.current.tryAgain,
      };
}
