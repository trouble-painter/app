part of '../game_state.dart';

class GameGuessState extends GameState {
  final GameStep step = GameStep.guess;
  final DateTime deadline;
  final int answerMs;

  /// What the mafia has typed so far
  final String mafiaAnswer;
  final String category;

  /// Null for the mafia
  final String? keyword;
  final bool isMafia;

  /// The accused, who is the mafia
  final int accusedId;
  final List<GameUser> userList;
  final List<Sketch> sketchList;

  GameGuessState({
    super.exception,
    required this.deadline,
    required this.answerMs,
    required this.mafiaAnswer,
    required this.category,
    required this.keyword,
    required this.isMafia,
    required this.accusedId,
    required this.userList,
    required this.sketchList,
  }) : super(isPlaying: true);

  GameUser get mafia => userList.firstWhere((user) => user.id == accusedId);

  DateTime get startedAt => deadline.subtract(Duration(milliseconds: answerMs));

  int get remainMs {
    final remainTime = deadline.difference(ServerTime.now);
    return remainTime.inMilliseconds.clamp(0, answerMs);
  }

  GameGuessState copyWith({
    GameException? exception,
    String? mafiaAnswer,
    bool? isMafia,
    List<GameUser>? userList,
  }) {
    return GameGuessState(
      exception: exception,
      deadline: deadline,
      answerMs: answerMs,
      mafiaAnswer: mafiaAnswer ?? this.mafiaAnswer,
      category: category,
      keyword: keyword,
      isMafia: isMafia ?? this.isMafia,
      accusedId: accusedId,
      userList: userList ?? this.userList,
      sketchList: sketchList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
