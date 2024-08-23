part of 'app_event.dart';

enum AppEventScreen {
  /// Splash
  splashPage,
  updateDialog,
  maintenanceDialog,

  /// Nickname
  nicknamePage,

  /// Home
  homePage,
  noticeDialog,

  /// Join
  joinPage,

  /// Game
  waitingPage,
  readyPage,
  drawingPage,
  votingPage,
  guessPage,
  resultPage,

  /// Setting
  settingPage,
  languageBottomSheet,

  /// EditNickname
  editNicknamePage,

  /// License
  licensePage,
  ;

  factory AppEventScreen.fromRoutes(Routes routes) {
    for (final value in values) {
      if (value.name == routes.name) return value;
    }
    throw UnsupportedError("$routes cannot be converted to AppEventScreen");
  }

  factory AppEventScreen.fromGameState(GameState state) {
    return switch (state) {
      GameWaitingState() => waitingPage,
      GameReadyState() => readyPage,
      GameDrawingState() => drawingPage,
      GameVotingState() => votingPage,
      GameGuessState() => guessPage,
      GameResultState() => resultPage,
      GameDisconnectedState() =>
        throw UnsupportedError("$state cannot be converted AppEventScreen"),
    };
  }
}
