part of '../../x_game_res.dart';

class XGameVoteStatusPatch extends XGamePatch {
  final Map<int, List<int>> result;
  XGameVoteStatusPatch({
    required this.result,
  }) : super(type: XGamePatchType.voteStatus);

  factory XGameVoteStatusPatch.fromJson(Map<String, dynamic> json) {
    return XGameVoteStatusPatch(
      result: json['players'].map<int, List<int>>((key, value) {
        return MapEntry(int.parse(key), List<int>.from(value));
      }),
    );
  }

  @override
  GameState call(GameState state) {
    switch (state) {
      case GameVotingState(userList: final userList, me: final me):
        final List<List<GameUser>> voteResult = [];
        int myVoteIndex = state.myVoteIndex;
        for (int i = 0; i < userList.length; i++) {
          voteResult.add([]);
          for (final voterId in result[userList[i].id]!) {
            if (voterId == me.id) {
              myVoteIndex = i;
            }
            final voter = userList.firstWhere((user) => user.id == voterId);
            voteResult.last.add(voter);
          }
        }
        return state.copyWith(
          voteResult: voteResult,
          myVoteIndex: myVoteIndex,
        );
      default:
        return state;
    }
  }
}
