part of '../game_state.dart';

class GameVotingState extends GameState {
  final GameStep step = GameStep.voting;
  final DateTime startedAt;
  final int maxVotingMs;
  final int myTurn;
  final int myVoteIndex;
  final String category;
  final String keyword;
  final bool isMafia;
  final List<List<GameUser>> voteResult;
  final List<GameUser> userList;
  final List<Sketch> sketchList;

  GameVotingState({
    super.exception,
    required this.startedAt,
    required this.voteResult,
    required this.category,
    required this.keyword,
    required this.myVoteIndex,
    required this.myTurn,
    required this.isMafia,
    required this.maxVotingMs,
    required this.userList,
    required this.sketchList,
  });

  GameUser get me => userList[myTurn];
  int get remainMs {
    final endedAt = startedAt.add(Duration(milliseconds: maxVotingMs));
    final remainTime = endedAt.difference(NetworkTime.now);
    return remainTime.inMilliseconds.clamp(0, maxVotingMs);
  }

  GameVotingState copyWith({
    GameException? exception,
    DateTime? startedAt,
    int? maxVotingMs,
    int? myTurn,
    int? myVoteIndex,
    String? category,
    String? keyword,
    bool? isMafia,
    List<List<GameUser>>? voteResult,
    List<GameUser>? userList,
    List<Sketch>? sketchList,
  }) {
    return GameVotingState(
      exception: exception,
      startedAt: startedAt ?? this.startedAt,
      maxVotingMs: maxVotingMs ?? this.maxVotingMs,
      myTurn: myTurn ?? this.myTurn,
      myVoteIndex: myVoteIndex ?? this.myVoteIndex,
      category: category ?? this.category,
      keyword: keyword ?? this.keyword,
      isMafia: isMafia ?? this.isMafia,
      voteResult: voteResult ?? this.voteResult,
      userList: userList ?? this.userList,
      sketchList: sketchList ?? this.sketchList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }

  @override
  String toString() {
    return 'GameVotingState(startedAt: $startedAt, maxVotingMs: $maxVotingMs, myTurn: $myTurn, myVoteIndex: $myVoteIndex, category: $category, keyword: $keyword, isMafia: $isMafia, voteResult: $voteResult, userList: $userList, sketchList: $sketchList)';
  }
}
