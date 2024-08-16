import 'package:x_pr/app/pages/game/v1/home/game_home_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v1/domain/entities/game_room.dart';
import 'package:x_pr/features/game/v1/domain/usecase/dev/game_get_latest_room_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_create_usecase.dart';
import 'package:x_pr/features/game/v1/domain/usecase/waiting/game_join_usecase.dart';

class GameHomePageModel extends BaseViewModel<GameHomeState> {
  GameHomePageModel(super.buildState);

  void onNicknameEdited(String nickname) {
    state = state.copyWith(
      nickname: nickname,
    );
  }

  Future<GameRoom?> getLatestRoom() async {
    return switch (await ref.read(GameGetLatestRoom.$).call(null)) {
      Success(value: GameRoom? room) => room,
      _ => null,
    };
  }

  Future<Result<GameRoom>> createRoom() async {
    state = state.copyWith(isBusy: true);
    final param = GameCreateUsecaseParam(
      uid: state.uid,
      nickname: state.nickname,
      maxPlayers: 10,
      timeLimitSec: 10,
    );
    final res = ref.read(GameCreateUsecase.$).call(param);
    state = state.copyWith(isBusy: false);
    return res;
  }

  Future<Result<GameRoom>> joinRoom(String roomId) async {
    state = state.copyWith(isBusy: true);
    final param = GameJoinUsecaseParam(
      uid: state.uid,
      nickname: state.nickname,
      roomId: roomId,
    );
    final res = ref.read(GameJoinUsecase.$).call(param);
    state = state.copyWith(isBusy: false);
    return res;
  }
}
