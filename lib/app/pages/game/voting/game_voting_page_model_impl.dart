import 'package:x_pr/app/pages/game/voting/game_voting_page_model.dart';
import 'package:x_pr/features/game/domain/entities/game_req/game_req.dart';
import 'package:x_pr/features/game/domain/service/game_service.dart';

class GameVotingPageModelImpl extends GameVotingPageModel {
  GameVotingPageModelImpl(super.buildState);

  @override
  void vote(int index) {
    super.vote(index);
    ref.read(GameService.$.notifier).request(
          GameVoteReq(votedUser: state.userList[index]),
        );
  }
}
