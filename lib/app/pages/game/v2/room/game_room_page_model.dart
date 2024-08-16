import 'dart:async';

import 'package:talker_flutter/talker_flutter.dart';
import 'package:x_pr/app/pages/game/v2/room/game_room_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameRoomPageModel extends BaseViewModel<GameRoomPageState> {
  static late var $;
  GameRoomPageModel(super.buildState);
  GameRoomRepository get gameRoomRepository {
    return ref.read(GameRoomRepository.$);
  }

  GameRoundRepository get gameRoundRepository {
    return ref.read(GameRoundRepository.$);
  }

  StreamSubscription? subs;

  Future<void> subscribeRoom(String roomId) async {
    final uuid = ref.read(ConfigService.$).uuid;
    switch (await gameRoomRepository.subscribe(roomId)) {
      case Success(value: final stream):
        subs = stream.listen((room) async {
          final roundId = room.roundId;
          if (roundId != null) {
            /// Round linked
            final roundResult = await gameRoundRepository.get(roundId);
            if (roundResult is Success<GameRound>) {
              final round = roundResult.value;
              if (round.step.isPlaying) {
                /// Go to round
                subs?.cancel();
                state = GameRoomRoundStartedState(round);
                return;
              } else {
                /// Unlink round
                await gameRoomRepository.unlinkToRound(room, round);
                return;
              }
            }
          }

          final me = room.players.firstWhereOrNull(
            (player) => player.id == uuid,
          );
          if (me != null) {
            /// Room info changed
            state = GameRoomLoadedState(
              room,
              me,
            );
          } else {
            /// Left
            subs?.cancel();
          }
        });
        break;
      case Failure():
        state = GameRoomFailureState();
        break;
      case Cancel():
        break;
    }
  }

  @override
  void dispose() {
    subs?.cancel();
    super.dispose();
  }
}
