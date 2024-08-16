part of '../../x_game_res.dart';

class XGameGuessPhase extends XGamePhase {
  final DateTime startTime;
  final XGameInfo gameInfo;
  final String mafiaAnswer;
  final List<Sketch> sketchList;

  XGameGuessPhase({
    required this.startTime,
    required this.gameInfo,
    required this.mafiaAnswer,
    required this.sketchList,
  }) : super(type: XGamePhaseType.guess);

  factory XGameGuessPhase.fromJson(
    Map<String, dynamic> json,
    XGameInfo gameInfo,
  ) {
    return XGameGuessPhase(
      startTime: const TimeSerializer().fromJson(json['startTime']),
      gameInfo: gameInfo,
      mafiaAnswer: json['mafiaAnswer'] ?? '',
      sketchList: (json['draw'] ?? []).map<Sketch>((json) {
        return Sketch.fromJson(json);
      }).toList(),
    );
  }

  @override
  GameGuessState toEntity(int myId) {
    return GameGuessState(
      startedAt: startTime,
      mafiaAnswer: mafiaAnswer,
      category: gameInfo.category,
      keyword: gameInfo.answer,
      mafiaIndex: gameInfo.turnList.indexWhere((user) {
        return user.id == gameInfo.mafiaUserId;
      }),
      sketchList: sketchList,
      isMafia: gameInfo.mafiaUserId == myId,
      userList: gameInfo.turnList.map((xUser) => xUser.toEntity()).toList(),
      maxGuessMs: gameInfo.option.answerTime,
    );
  }
}
