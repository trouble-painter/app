part of '../game_state.dart';

class GameVotingState extends GameState {
  final GameStep step = GameStep.voting;
  final DateTime deadline;
  final int voteMs;
  final int myId;
  final String category;

  /// Null for the mafia
  final String? keyword;
  final bool isMafia;

  /// Voter id -> target id
  final Map<int, int> votes;

  /// In turn order
  final List<GameUser> userList;
  final List<Sketch> sketchList;

  GameVotingState({
    super.exception,
    required this.deadline,
    required this.voteMs,
    required this.myId,
    required this.category,
    required this.keyword,
    required this.isMafia,
    required this.votes,
    required this.userList,
    required this.sketchList,
  }) : super(isPlaying: true);

  int get myTurn => userList.indexWhere((user) => user.id == myId);
  GameUser get me => userList[myTurn];

  /// Voters of each user in [userList]
  List<List<GameUser>> get voteResult => [
        for (final target in userList)
          [
            for (final voter in userList)
              if (votes[voter.id] == target.id) voter,
          ],
      ];

  /// -1 before voting
  int get myVoteIndex => userList.indexWhere((user) => user.id == votes[myId]);

  DateTime get startedAt => deadline.subtract(Duration(milliseconds: voteMs));

  int get remainMs {
    final remainTime = deadline.difference(ServerTime.now);
    return remainTime.inMilliseconds.clamp(0, voteMs);
  }

  GameVotingState copyWith({
    GameException? exception,
    bool? isMafia,
    Map<int, int>? votes,
    List<GameUser>? userList,
  }) {
    return GameVotingState(
      exception: exception,
      deadline: deadline,
      voteMs: voteMs,
      myId: myId,
      category: category,
      keyword: keyword,
      isMafia: isMafia ?? this.isMafia,
      votes: votes ?? this.votes,
      userList: userList ?? this.userList,
      sketchList: sketchList,
    );
  }

  @override
  GameState sinkException(GameException exception) {
    return copyWith(exception: exception);
  }

  @override
  String toString() {
    return 'GameVotingState(deadline: $deadline, myId: $myId, isMafia: $isMafia, votes: $votes, sketches: ${sketchList.length})';
  }
}
