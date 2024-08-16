import 'dart:async';

import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/result/game_result_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/game_round_step.dart';

class GameVotingPageModel extends BaseViewModel<GameRoundLoadedState> {
  GameVotingPageModel(super.buildState);

  Timer? timer;
  GameDrawing? drawing;

  GameRoundRepository get gameRoundRepository {
    return ref.read(GameRoundRepository.$);
  }

  GameDrawingRepository get gameDrawingRepository {
    return ref.read(GameDrawingRepository.$);
  }

  bool get isGameDevMode => ref.read(ConfigService.$).isGameDevMode;

  void startTimer() {
    if (!state.isHost) return;
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (state.round.secondsLeft <= 0) {
        goToNext();
      } else {
        await gameRoundRepository.updateSecondsLeft(
          state.round.id,
          state.round.secondsLeft - 1,
        );
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> resetTimer() async {
    if (!state.isHost) return;
    await gameRoundRepository.updateSecondsLeft(
      state.round.id,
      state.round.setting.waitingSec,
    );
    timer?.cancel();
    startTimer();
  }

  Future<void> goToNext() async {
    final result = ref.read(GameResultRepository.$).getGameResult(state.round);
    if (result.isSpyFound) {
      Logger.d("Go to answering");
      await gameRoundRepository.startAnswering(state.round);
    } else {
      Logger.d("Go to ending");
      await gameRoundRepository.startEnding(state.round.id);
    }
  }

  Future<void> goToDrawing() async {
    await gameRoundRepository.updateStep(
      state.round.id,
      GameRoundStep.drawing,
    );
  }

  Future<void> onVoted(int target) async {
    final isCancel = state.round.voting[state.myTurn] == target;
    await gameRoundRepository.vote(
      state.round.id,
      state.myTurn,
      isCancel ? -1 : target,
    );
  }

  Future<void> getDrawing() async {
    final res = await gameDrawingRepository.get(state.round.drawingId!);
    if (res is Success<GameDrawing>) {
      drawing = res.value;
      state = state.copyWith();
    }
  }
}
