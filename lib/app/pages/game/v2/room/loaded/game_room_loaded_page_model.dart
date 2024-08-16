import 'package:flutter/foundation.dart';
import 'package:uuid/v1.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_player.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_setting.dart';

class GameRoomLoadedPageModel extends BaseViewModel<GameRoomLoadedState> {
  GameRoomLoadedPageModel(super.buildState);

  GameRoomRepository get gameRoomRepository => ref.read(GameRoomRepository.$);
  GameRoundRepository get gameRoundRepository =>
      ref.read(GameRoundRepository.$);

  void updateSetting(GameRoundSetting setting) async {
    /// Change room default setting
    await gameRoomRepository.updateSetting(
      state.room.copyWith(setting: setting),
    );
  }

  Future<void> start() async {
    if (!state.isHost) return;
    if (kReleaseMode && state.room.players.length < 3) {
      return Toast.showText(S.current.playRequirements);
    }

    /// Create round
    switch (await gameRoundRepository.startWaiting(state.room, state.setting)) {
      case Success(value: final round):
        final result = await gameRoomRepository.linkToRound(state.room, round);
        if (result.isSuccess) {
          break;
        }
      case Failure():
        Toast.showText(S.current.tryAgain);
        break;
      case Cancel():
        break;
    }
  }

  Future<void> left() async {
    await gameRoomRepository.left(state.room, state.player);
  }

  Future<void> addDummyPlayer() async {
    final (room, players) = (state.room, state.room.players);
    final result = await gameRoomRepository.join(
      roomId: room.id,
      uuid: const UuidV1().generate(),
      nickname: "AI${players.length}",
    );
    switch (result) {
      case Failure(e: final e):
        if (e is GameRoomRepositoryException) {
          switch (e) {
            case GameRoomRepositoryException.full:
              Toast.showText(S.current.roomIsFull);
              break;
            case GameRoomRepositoryException.notFound:
              Toast.showText(S.current.roomNotFound);
              break;
          }
        } else {
          Toast.showText(S.current.tryAgain);
        }
      default:
        break;
    }
  }

  Future<void> removePlayer(GamePlayer targetPlayer) async {
    await gameRoomRepository.left(state.room, targetPlayer);
  }

  @override
  void dispose() {
    left();
    super.dispose();
  }
}
