part of '../game_state.dart';

class GameResultState extends GameState {
  final GameStep step = GameStep.result;
  final String category;

  /// The keyword of this game (`Result.answer`)
  final String keyword;
  final int mafiaId;

  /// Null when there was no ANSWER phase
  final String? mafiaGuess;
  final GameRole winner;
  final bool isQuickStartGame;
  final DateTime deadline;
  final int endMs;
  final List<Sketch> sketchList;
  final List<GameUser> userList;

  GameResultState({
    super.exception,
    required this.category,
    required this.keyword,
    required this.mafiaId,
    required this.mafiaGuess,
    required this.winner,
    required this.isQuickStartGame,
    required this.deadline,
    required this.endMs,
    required this.sketchList,
    required this.userList,
  }) : super(isPlaying: true);

  bool get isMafiaWin => winner == GameRole.mafia;

  /// The mafia was caught and guessed the keyword. The server judges it.
  bool get isMafiaCorrect => isMafiaWin && mafiaGuess != null;
  String get mafiaAnswer => mafiaGuess ?? '';
  GameUser get mafia => userList.firstWhere((user) => user.id == mafiaId);
  int get showResultMs => endMs;
  DateTime get resultStartedAt =>
      deadline.subtract(Duration(milliseconds: endMs));

  GameResultState copyWith({
    GameException? exception,
    String? mafiaGuess,
    GameRole? winner,
    List<GameUser>? userList,
  }) {
    return GameResultState(
      exception: exception,
      category: category,
      keyword: keyword,
      mafiaId: mafiaId,
      mafiaGuess: mafiaGuess ?? this.mafiaGuess,
      winner: winner ?? this.winner,
      isQuickStartGame: isQuickStartGame,
      deadline: deadline,
      endMs: endMs,
      sketchList: sketchList,
      userList: userList ?? this.userList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
