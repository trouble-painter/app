part of '../x_game_res.dart';

enum XGamePatchType {
  playerList('PLAYER_LIST'),
  turnInfo('TURN_INFO'),
  voteStatus('VOTE_STATUS'),
  answer('ANSWER'),
  draw('DRAW'),
  reaction('REACTION'),
  ;

  const XGamePatchType(this.action);
  final String action;
}

sealed class XGamePatch extends XGameRes {
  final XGamePatchType type;
  XGamePatch({
    required this.type,
  });

  GameState call(GameState state);
}
