import 'package:x_pr/app/pages/game/waiting/game_waiting_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameWaitingPageModelImpl extends GameWaitingViewModel {
  GameWaitingPageModelImpl(super.buildState);

  @override
  void start() {
    super.start();
    final gameService = ref.read(GameService.$.notifier);
    if (gameService.currentRoomId == null) return;
    gameService.request(
      GameStartReq(roomId: gameService.currentRoomId!),
    );
  }
}
