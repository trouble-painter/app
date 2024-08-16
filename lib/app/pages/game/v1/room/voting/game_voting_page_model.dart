import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_change_step_usecase.dart';

class GameVotingPageModel extends BaseViewModel<InGameState> {
  GameVotingPageModel(super.buildState);

  Future<void> backToPlaying() async {
    final param = GameChangeStepUsecaseParam(
      room: state.room,
      step: GameRoomState.playing,
    );
    await ref.read(GameChangeStepUsecase.$).call(param);
  }
}
