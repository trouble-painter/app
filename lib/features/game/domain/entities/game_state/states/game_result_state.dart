part of '../game_state.dart';

/// The server has already taken everyone out of the room.
class GameResultState extends GameState {
  final GameStep step = GameStep.result;

  /// The finished game's room, to join again
  final String roomId;
  final String category;

  /// The keyword of this game (`Result.answer`)
  final String keyword;
  final int mafiaId;

  /// Null when there was no ANSWER phase
  final String? mafiaGuess;
  final GameRole winner;
  final bool isQuickStartGame;
  final List<Sketch> sketchList;
  final List<GameUser> userList;

  GameResultState({
    super.exception,
    required this.roomId,
    required this.category,
    required this.keyword,
    required this.mafiaId,
    required this.mafiaGuess,
    required this.winner,
    required this.isQuickStartGame,
    required this.sketchList,
    required this.userList,
  }) : super(isPlaying: true);

  bool get isMafiaWin => winner == GameRole.mafia;

  /// The mafia was caught and guessed the keyword. The server judges it.
  bool get isMafiaCorrect => isMafiaWin && mafiaGuess != null;
  String get mafiaAnswer => mafiaGuess ?? '';
  GameUser get mafia => userList.firstWhere((user) => user.id == mafiaId);

  GameResultState copyWith({
    GameException? exception,
    String? mafiaGuess,
    GameRole? winner,
    List<GameUser>? userList,
  }) {
    return GameResultState(
      exception: exception,
      roomId: roomId,
      category: category,
      keyword: keyword,
      mafiaId: mafiaId,
      mafiaGuess: mafiaGuess ?? this.mafiaGuess,
      winner: winner ?? this.winner,
      isQuickStartGame: isQuickStartGame,
      sketchList: sketchList,
      userList: userList ?? this.userList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
