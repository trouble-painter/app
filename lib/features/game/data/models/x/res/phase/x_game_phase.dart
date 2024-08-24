part of '../x_game_res.dart';

enum XGamePhaseType {
  quickStartWaiting('RANDOM_MATCHING'),
  waiting('PHASE_WAIT'),
  ready('PHASE_READY'),
  drawing('PHASE_PLAYING'),
  vote('PHASE_VOTE'),
  guess('PHASE_INFER_ANSWER'),
  end('PHASE_END');

  const XGamePhaseType(this.action);
  final String action;
}

sealed class XGamePhase extends XGameRes {
  final XGamePhaseType type;
  XGamePhase({
    required this.type,
  });

  GameState toEntity(int myId);
}
