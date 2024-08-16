import 'package:x_pr/app/pages/game/v1/room/assigning/game_assigning_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_step.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_v1.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/usecase/assigning/game_play_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_change_step_usecase.dart';

class GameAssigningPageModel extends BaseViewModel<GameAssigningPageState> {
  GameAssigningPageModel(super.buildState);

  Future<void> goToPlaying() async {
    if (!state.isHost) return;
    final inGameState = ref.read(GameServiceV1.$) as InGameState;
    final (room, player) = (inGameState.room, inGameState.player);
    final param = GamePlayUsecaseParam(room: room, player: player);
    await ref.read(GamePlayUsecase.$).call(param);
  }

  Future<void> goToWaiting() async {
    final inGameState = ref.read(GameServiceV1.$) as InGameState;
    final param = GameChangeStepUsecaseParam(
      room: inGameState.room,
      step: GameRoomState.waiting,
    );
    ref.read(GameChangeStepUsecase.$).call(param);
  }
}
