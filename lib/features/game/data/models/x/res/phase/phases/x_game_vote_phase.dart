part of '../../x_game_res.dart';

class XGameVotePhase extends XGamePhase {
  final DateTime startTime;
  final XGameInfo gameInfo;
  final Map<int, List<int>> result;
  final List<Sketch> sketchList;

  XGameVotePhase({
    required this.startTime,
    required this.gameInfo,
    required this.result,
    required this.sketchList,
  }) : super(type: XGamePhaseType.vote);

  factory XGameVotePhase.fromJson(
    Map<String, dynamic> json,
    XGameInfo gameInfo,
  ) {
    return XGameVotePhase(
      startTime: const TimeSerializer().fromJson(json['startTime']),
      gameInfo: gameInfo,
      result: (json['players'] ?? []).map<int, List<int>>(
        (key, value) {
          return MapEntry(int.parse(key), List<int>.from(value));
        },
      ),
      sketchList: (json['draw'] ?? []).map<Sketch>((json) {
        return Sketch.fromJson(json);
      }).toList(),
    );
  }

  @override
  GameVotingState toEntity(int myId) {
    int myTurn = -1;
    final List<List<GameUser>> voteResult = [];
    final userList = gameInfo.turnList.asMap().entries.map((entry) {
      final (index, xUser) = (entry.key, entry.value);
      if (xUser.id == myId) {
        myTurn = index;
      }
      voteResult.add([]);
      return xUser.toEntity();
    }).toList();

    final values = result.values.toList();
    int myVoteIndex = -1;
    for (int i = 0; i < userList.length; i++) {
      voteResult[i] = [
        ...values[i].map((userId) {
          if (userId == myId) {
            myVoteIndex = i;
          }
          return userList.firstWhere((user) => user.id == userId);
        }),
      ];
    }
    return GameVotingState(
      startedAt: startTime,
      isMafia: gameInfo.mafiaUserId == myId,
      category: gameInfo.category,
      keyword: gameInfo.answer,
      voteResult: voteResult,
      myVoteIndex: myVoteIndex,
      myTurn: myTurn,
      maxVotingMs: gameInfo.option.voteTime,
      userList: userList,
      sketchList: sketchList,
    );
  }

  @override
  String toString() {
    return 'XGameVotePhase(startTime: $startTime, gameInfo: $gameInfo, result: $result, sketchList: $sketchList)';
  }
}
