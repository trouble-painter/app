import 'package:x_pr/app/pages/game/v2/lobby/game_lobby_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';

class GameLobbyPageModel extends BaseViewModel<GameLobbyState> {
  GameLobbyPageModel(super.buildState);

  GameRoomRepository get gameRoomRepository => ref.read(GameRoomRepository.$);

  void onNicknameEdited(String nickname) async {
    await ref.read(ConfigService.$.notifier).updateNickname(nickname);
  }

  Future<GameRoom?> getLatestRoom() async {
    return switch (await gameRoomRepository.getLatest()) {
      Success(value: final room) => room,
      _ => null,
    };
  }

  Future<Result<GameRoom>> createRoom() {
    return gameRoomRepository.create(state.uuid, state.nickname);
  }

  Future<Result<GameRoom>> joinRoom(String roomId) async {
    return gameRoomRepository.join(
      roomId: roomId,
      uuid: state.uuid,
      nickname: state.nickname,
    );
  }
}
