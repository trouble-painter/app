import 'package:trouble_painter/app/pages/game/waiting/game_waiting_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/entities/game_user.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameWaitingPageModelImpl extends GameWaitingViewModel {
  GameWaitingPageModelImpl(super.buildState);

  @override
  void start() {
    super.start();
    ref.read(GameService.$.notifier).request(const GameStartReq());
  }

  @override
  void kick(GameUser kickUser) {
    super.kick(kickUser);
    ref
        .read(GameService.$.notifier)
        .request(GameKickPlayerReq(targetId: kickUser.id));
  }

  @override
  void toggleReady() {
    final isReady = !state.isMyReady;
    super.toggleReady();
    ref
        .read(GameService.$.notifier)
        .request(GameSetReadyReq(isReady: isReady));
  }
}
