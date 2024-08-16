part of '../../x_game_res.dart';

class XGameReadyPhase extends XGamePhase {
  final DateTime startTime;
  final XGameInfo gameInfo;

  XGameReadyPhase({
    required this.startTime,
    required this.gameInfo,
  }) : super(type: XGamePhaseType.waiting);

  factory XGameReadyPhase.fromJson(
    Map<String, dynamic> json,
    XGameInfo gameInfo,
  ) {
    return XGameReadyPhase(
      startTime: const TimeSerializer().fromJson(json['startTime']),
      gameInfo: gameInfo,
    );
  }

  @override
  GameReadyState toEntity(int myId) => GameReadyState(
        showMyRoleMs: gameInfo.option.readyTime,
        startedAt: startTime,
        isMafia: gameInfo.mafiaUserId == myId,
        category: gameInfo.category,
        keyword: gameInfo.answer,
      );

  @override
  String toString() =>
      'XGameReadyPhase(startTime: $startTime, gameInfo: $gameInfo)';
}
