part of '../game_state.dart';

class GameResultState extends GameState {
  final GameStep step = GameStep.result;
  final String mafiaAnswer;
  final String category;
  final String keyword;
  final bool isMafiaWin;
  final bool isQuickStartGame;
  final int mafiaIndex;
  final int showResultMs;
  final DateTime resultStartedAt;
  final List<Sketch> sketchList;
  final List<GameUser> userList;

  GameResultState({
    super.exception,
    required this.sketchList,
    required this.mafiaAnswer,
    required this.category,
    required this.keyword,
    required this.mafiaIndex,
    required this.isMafiaWin,
    required this.isQuickStartGame,
    required this.userList,
    required this.showResultMs,
    required this.resultStartedAt,
  }) : super(isPlaying: true);

  bool get isMafiaCorrect => mafiaAnswer.toLowerCase() == keyword.toLowerCase();
  GameUser get mafia => userList[mafiaIndex];

  GameResultState copyWith({
    GameException? exception,
    String? mafiaAnswer,
    String? category,
    String? keyword,
    bool? isMafiaWin,
    bool? isQuickStartGame,
    int? mafiaIndex,
    List<Sketch>? sketchList,
    List<GameUser>? userList,
    int? showResultMs,
    DateTime? resultStartedAt,
  }) {
    return GameResultState(
      exception: exception,
      sketchList: sketchList ?? this.sketchList,
      mafiaAnswer: mafiaAnswer ?? this.mafiaAnswer,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
      isMafiaWin: isMafiaWin ?? this.isMafiaWin,
      isQuickStartGame: isQuickStartGame ?? this.isQuickStartGame,
      mafiaIndex: mafiaIndex ?? this.mafiaIndex,
      userList: userList ?? this.userList,
      showResultMs: showResultMs ?? this.showResultMs,
      resultStartedAt: resultStartedAt ?? this.resultStartedAt,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
