import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';

class GameAnsweringPageModel extends BaseViewModel<GameRoundLoadedState> {
  GameAnsweringPageModel(super.buildState);
  Timer? timer;
  GameDrawing? drawing;
  TextEditingController controller = TextEditingController();
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
      if (state.round.secondsLeft <= 1) {
        timer?.cancel();
        submit(false);
      } else {
        await gameRoundRepository.updateSecondsLeft(
          state.round.id,
          state.round.secondsLeft - 1,
        );
      }
    });
  }

  Future<void> getDrawing() async {
    final res = await gameDrawingRepository.get(state.round.drawingId!);
    if (res is Success<GameDrawing>) {
      drawing = res.value;
      state = state.copyWith();
    }
  }

  Future<void> updateKeyword(String keyword) async {
    if (!state.isSpy) return;
    Logger.d("UpdateKeyword : $keyword");
    await gameRoundRepository.updateKeyword(
      state.round.id,
      keyword.trim(),
    );
  }

  void submit([bool checkEmpty = true]) async {
    final keyword = controller.text.trim();
    if (checkEmpty && keyword.isEmpty) {
      Toast.showText(S.current.keywordRequired);
      return;
    }
    await updateKeyword(keyword);
    await goToEnding();
  }

  Future<void> goToEnding() async {
    await gameRoundRepository.startEnding(state.round.id);
  }
}
