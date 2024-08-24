part of '../../x_game_res.dart';

class XGameQuickStartWaitingPhase extends XGamePhase {
  XGameQuickStartWaitingPhase() : super(type: XGamePhaseType.quickStartWaiting);

  @override
  GameState toEntity(int myId) {
    return GameQuickStartWaitingState();
  }
}
