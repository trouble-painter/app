import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/v4.dart';
import 'package:x_pr/app/pages/game/v2/round/game_round_page_state.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';
import 'package:x_pr/features/game/v2/data/repository/drawing/game_drawing_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/room/game_room_repository.dart';
import 'package:x_pr/features/game/v2/data/repository/round/game_round_repository.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_drawing.dart';
import 'package:x_pr/features/game/v2/domain/entities/round/drawing/game_sketch.dart';

class GameWaitingPageModel extends BaseViewModel<GameRoundLoadedState> {
  GameWaitingPageModel(super.buildState);

  Timer? timer;

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
        goToDrawing();
      } else {
        await gameRoundRepository.updateSecondsLeft(
          state.round.id,
          state.round.secondsLeft - 1,
        );
      }
    });
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

  Future<void> goToDrawing() async {
    /// Clear room players
    ref.read(GameRoomRepository.$).clearPlayers(state.round.roomId);

    if (state.round.drawingId == null) {
      /// Create GameDrawing & start playing
      final now = NetworkTime.now;
      final players = state.round.players;
      final sketchList = <GameSketch>[];
      for (int step = 0; step < state.round.setting.stepLimit; step++) {
        sketchList.addAll(
          List<GameSketch>.generate(
            players.length,
            (turn) => GameSketch(
              strokeList: [],
              canvasSize: const Size(0, 0),
              color: players[turn].color,
            ),
          ),
        );
      }
      final drawing = GameDrawing(
        id: const UuidV4().generate().split('-').first,
        roomId: state.round.roomId,
        roundId: state.round.id,
        turn: 0,
        step: 1,
        sketchList: sketchList,
        turnStartedAt: now,
        startedAt: now,
      );
      final drawingResult = await gameDrawingRepository.create(drawing);
      if (drawingResult is Success<GameDrawing>) {
        await gameRoundRepository.startPlaying(state.round, drawing.id);
      }
    } else {
      /// Start playing
      await gameRoundRepository.startPlaying(
        state.round,
        state.round.drawingId!,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
