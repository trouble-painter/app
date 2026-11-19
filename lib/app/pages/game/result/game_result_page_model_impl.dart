import 'package:trouble_painter/app/pages/game/result/game_result_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameResultPageModelImpl extends GameResultPageModel {
  GameResultPageModelImpl(super.buildState);

  @override
  void restart() {
    ref.read(GameService.$.notifier).request(GameRestartReq());
  }
}
