part of '../game_state.dart';

class GameGuessState extends GameState {
  final GameStep step = GameStep.guess;
  final DateTime startedAt;
  final String mafiaAnswer;
  final String category;
  final String keyword;
  final bool isMafia;
  final int mafiaIndex;
  final int maxGuessMs;
  final List<GameUser> userList;
  final List<Sketch> sketchList;

  GameGuessState({
    super.exception,
    required this.startedAt,
    required this.mafiaAnswer,
    required this.category,
    required this.keyword,
    required this.mafiaIndex,
    required this.isMafia,
    required this.userList,
    required this.maxGuessMs,
    required this.sketchList,
  }) : super(isPlaying: true);

  GameUser get mafia => userList[mafiaIndex];
  int get remainMs {
    final endedAt = startedAt.add(Duration(milliseconds: maxGuessMs));
    final remainTime = endedAt.difference(NetworkTime.now);
    return remainTime.inMilliseconds.clamp(0, maxGuessMs);
  }

  GameGuessState copyWith({
    GameException? exception,
    DateTime? startedAt,
    String? mafiaAnswer,
    String? category,
    String? keyword,
    bool? isMafia,
    int? mafiaIndex,
    int? maxGuessMs,
    List<GameUser>? userList,
    List<Sketch>? sketchList,
  }) {
    return GameGuessState(
      exception: exception,
      startedAt: startedAt ?? this.startedAt,
      mafiaAnswer: mafiaAnswer ?? this.mafiaAnswer,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
      isMafia: isMafia ?? this.isMafia,
      mafiaIndex: mafiaIndex ?? this.mafiaIndex,
      maxGuessMs: maxGuessMs ?? this.maxGuessMs,
      userList: userList ?? this.userList,
      sketchList: sketchList ?? this.sketchList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }
}
