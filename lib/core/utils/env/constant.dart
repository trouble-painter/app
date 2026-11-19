abstract class Constant {
  /// Game setting
  static const invitationCodeLength = 6;
  static const minPlayer = 3;
  static const maxPlayer = 10;
  static const connectionTimeout = Duration(seconds: 10);

  /// Reconnect for this long after an abnormal closure (server restart, network drop).
  static const reconnectionWindow = Duration(seconds: 20);

  /// Backoff between reconnection attempts: 1s, 2s, 4s, 4s, ...
  static const reconnectionFirstDelay = Duration(seconds: 1);
  static const reconnectionMaxDelay = Duration(seconds: 4);

  /// Loader exposure minimum milliseconds
  static const minLoaderDisplayMillies = 0;

  /// Page transition animation time
  static const pageTransitionMillies = 200;

  /// Emoji
  static const eRouter = "🚪";
  static const eData = "🧐";
  static const eRemoteConfig = "🍥";
  static const eFrom = "🥚";
  static const eTo = "🐣";
}
