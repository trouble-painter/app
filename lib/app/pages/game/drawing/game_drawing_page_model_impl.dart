import 'package:trouble_painter/app/pages/game/drawing/game_drawing_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_reaction.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';

class GameDrawingPageModelImpl extends GameDrawingPageModel {
  GameDrawingPageModelImpl(super.buildState);

  @override
  void endTurn() {
    super.endTurn();
    gameService.request(const GameEndTurnReq());
  }

  @override
  void sendStrokePiece(GameDrawReq piece) {
    gameService.request(piece);
  }

  @override
  void sendUndoStroke() {
    gameService.request(const GameUndoStrokeReq());
  }

  @override
  void onReactionPressed(GameReaction reaction) {
    /// Pressed within `reactionThrottleMs`: the server would drop it, so it is not played either.
    reactionThrottle.run(gameService.limits.reactionThrottleMs, () {
      super.onReactionPressed(reaction);
      gameService.request(GameReactionReq(reaction: reaction));
    });
  }
}
