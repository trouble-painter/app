import 'package:trouble_painter/app/pages/game/drawing/game_drawing_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';
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
  void sendCurrentSketch(Sketch sketch) {
    if (sketch.strokeList.isEmpty) return;

    /// Send only the last stroke. The server replaces it or appends it by index.
    gameService.request(
      GameDrawReq(
        index: sketch.strokeList.length - 1,
        stroke: sketch.strokeList.last,
        canvas: sketch.canvasSize,
      ),
    );
  }

  @override
  void onReactionPressed(GameReaction reaction) {
    reactionThrottle.run(config.reactionThrottleMs, () {
      gameService.request(GameReactionReq(reaction: reaction));
      super.onReactionPressed(reaction);
    });
  }
}
