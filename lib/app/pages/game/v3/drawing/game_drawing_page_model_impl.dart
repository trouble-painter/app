import 'package:x_pr/app/pages/game/v3/drawing/game_drawing_page_model.dart';
import 'package:x_pr/features/game/v3/domain/entities/drawing/sketch.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_req/game_req.dart';

class GameDrawingPageModelImpl extends GameDrawingPageModel {
  GameDrawingPageModelImpl(super.buildState);

  @override
  void endTurn() {
    gameService.request(GameEndTurnReq());
  }

  @override
  void onSketch(Sketch sketch) {
    gameService.request(
      GameDrawReq(sketch: sketch),
    );
  }
}
