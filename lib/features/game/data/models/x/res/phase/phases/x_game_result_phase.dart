part of '../../x_game_res.dart';

class XGameResultPhase extends XGamePhase {
  final XGameInfo gameInfo;
  final String mafiaAnswer;
  final bool isMafiaWin;
  final List<Sketch> sketchList;
  final DateTime startTime;

  XGameResultPhase({
    required this.gameInfo,
    required this.mafiaAnswer,
    required this.isMafiaWin,
    required this.sketchList,
    required this.startTime,
  }) : super(type: XGamePhaseType.end);

  factory XGameResultPhase.fromJson(
    Map<String, dynamic> json,
    XGameInfo gameInfo,
  ) {
    return XGameResultPhase(
      gameInfo: gameInfo,
      mafiaAnswer: json['mafiaAnswer'] ?? "",
      isMafiaWin: json['isMafiaWin'],
      sketchList: (json['draw'] ?? [])
          .map<Sketch>((json) => Sketch.fromJson(json))
          .toList(),
      startTime: const TimeSerializer().fromJson(json['startTime']),
    );
  }

  @override
  GameResultState toEntity(int myId) {
    int mafiaIndex = -1;
    final users = gameInfo.turnList.asMap().entries.map((entry) {
      final (index, xUser) = (entry.key, entry.value);
      if (xUser.id == gameInfo.mafiaUserId) {
        mafiaIndex = index;
      }
      return xUser.toEntity();
    }).toList();
    return GameResultState(
      category: gameInfo.category,
      keyword: gameInfo.answer,
      sketchList: sketchList,
      mafiaAnswer: mafiaAnswer,
      mafiaIndex: mafiaIndex,
      isMafiaWin: isMafiaWin,
      isQuickStartGame: gameInfo.isRandomMatching,
      userList: users,
      showResultMs: gameInfo.option.endTime,
      resultStartedAt: startTime,
    );
  }
}
