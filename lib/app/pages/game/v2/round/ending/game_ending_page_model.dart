import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/ending/game_ending_page_state.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_model.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/result/game_result_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_keyword.dart';
import 'package:x_pr/features/game/v2/domain/entities/room/game_room.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round.dart';

class GameEndingPageModel extends BaseViewModel<GameEndingPageState> {
  GameEndingPageModel(super.buildState);
  GameKeyword? keyword;
  ValueNotifier<GameDrawing?> drawingNotier = ValueNotifier(null);
  GameRound get round {
    return (ref.read(GameRoundPageModel.$) as GameRoundLoadedState).round;
  }

  GameDrawingRepository get gameDrawingRepository {
    return ref.read(GameDrawingRepository.$);
  }

  Config get config {
    return ref.read(ConfigService.$);
  }

  void init() {
    final result = ref.read(GameResultRepository.$).getGameResult(round);
    keyword = result.round.keyword;
    if (!result.isSpyFound) {
      /// Spy win by voting
      final citizens = result.mostVotedCitizens;
      state = SpyWinByVotingState(
        result,
        citizens.length == 1 ? citizens.first : null,
      );
      return;
    } else if (result.isSpyAnswering) {
      /// Spy win by answering
      state = SpyWinByAnsweringState(result);
      return;
    } else {
      /// Citizen win
      state = CitizenWinState(result);
      return;
    }
  }

  Future<Result<GameRoom>> playAgain() {
    return ref.read(GameRoomRepository.$).join(
          roomId: round.roomId,
          uuid: config.uuid,
          nickname: config.nickname,
        );
  }

  Future<void> getDrawing() async {
    final res = await gameDrawingRepository.get(round.drawingId!);
    if (res is Success<GameDrawing>) {
      drawingNotier.value = res.value;
    }
  }
}
