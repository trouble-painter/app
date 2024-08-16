import 'package:uuid/v1.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_player.dart';
import 'package:x_pr/features/game/v1/domain/service/game_service_state.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_remove_player_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_join_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_start_usecase.dart';

class GameWaitingPageModel extends BaseViewModel<InGameState> {
  GameWaitingPageModel(super.buildState);

  Future<void> start() async {
    final (room, player) = (state.room, state.player);
    final param = GameStartUsecaseParam(room, player);
    await ref.read(GameStartUsecase.$).call(param);
  }

  Future<void> addDummyPlayer() async {
    final (room, players) = (state.room, state.players);
    final param = GameJoinUsecaseParam(
      uid: const UuidV1().generate(),
      nickname: "AI${players.length}",
      roomId: room.id,
    );
    await ref.read(GameJoinUsecase.$).call(param);
  }

  Future<void> removePlayer(GamePlayer targetPlayer) async {
    final param = GameRemovePlayerUsecaseParam(
      room: state.room,
      player: targetPlayer,
    );
    await ref.read(GameRemovePlayerUsecase.$).call(param);
  }
}
