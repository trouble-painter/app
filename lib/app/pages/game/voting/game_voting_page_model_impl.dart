import 'package:trouble_painter/app/pages/game/voting/game_voting_page_model.dart';
import 'package:trouble_painter/features/game/domain/entities/game_req/game_req.dart';
import 'package:trouble_painter/features/game/domain/services/game_service.dart';

class GameVotingPageModelImpl extends GameVotingPageModel {
  GameVotingPageModelImpl(super.buildState);

  @override
  void vote(int index, {bool isFromCanvas = false}) {
    super.vote(index, isFromCanvas: isFromCanvas);
    ref.read(GameService.$.notifier).request(
          GameVoteReq(
            targetId: isCancel(index) ? null : state.userList[index].id,
          ),
        );
  }
}
