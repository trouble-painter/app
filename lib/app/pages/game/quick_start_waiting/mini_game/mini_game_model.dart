import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class MiniGameModel extends BaseViewModel<MiniGameState> {
  MiniGameModel(
    super.buildState,
  );

  BuildContext get context => ref.read(RoutesSetting.$).context;

  Config get config => ref.read(ConfigService.$);
  bool get isKo => config.language.isKorean;
  String get clickMeImg => "${isKo ? "ko" : "en"}/mini_game_click_me";

  final double mafiaWidth = 103.dw;
  final double mafiaHeight = 245.dw;
  final Duration animDuration = const Duration(milliseconds: 333);
  double get scale => switch (state.phase) {
        MiniGamePhase.ready => 1,
        MiniGamePhase.start => 0.8,
        MiniGamePhase.half => 0.8,
        MiniGamePhase.finish => 1,
      };

  /// Sweat
  Offset get sweat1Offset => switch (state.phase) {
        MiniGamePhase.ready => Offset(30.dw, 60.dw),
        MiniGamePhase.start => Offset(30.dw, 85.dw),
        MiniGamePhase.half => Offset(30.dw, 85.dw),
        MiniGamePhase.finish => Offset(20.dw, 75.dw),
      };
  Offset get sweat2Offset => switch (state.phase) {
        _ => Offset(31.dw, 58.dw),
      };
  Offset get sweat3Offset => switch (state.phase) {
        _ => Offset(77.dw, 70.dw),
      };

  /// Surprise
  Offset get surpriseOffset => switch (state.phase) {
        _ => Offset(-35.dw, 10.dw),
      };

  /// Sunglasses
  Offset get sunglassesOffset => switch (state.phase) {
        MiniGamePhase.ready => Offset(17.dw, 58.dw),
        MiniGamePhase.start => Offset(17.dw, 67.dw),
        MiniGamePhase.half => Offset(18.dw, 66.dw),
        MiniGamePhase.finish => Offset(
            LayoutExt.screenSize.width,
            -120.dw,
          ),
      };
  double get sunglassesRotate =>
      switch (state.phase) {
        MiniGamePhase.ready => 0,
        MiniGamePhase.start => state.nClick.isEven ? 0 : 1,
        MiniGamePhase.half => state.nClick.isEven ? 4 : 5,
        MiniGamePhase.finish => 100,
      } *
      pi /
      180;
  Duration get sunglassesPosDuration => switch (state.phase) {
        MiniGamePhase.finish => const Duration(milliseconds: 1000),
        _ => const Duration(milliseconds: 333),
      };
  Duration get sunglassesRotateDuration => switch (state.phase) {
        MiniGamePhase.finish => const Duration(milliseconds: 1000),
        _ => const Duration(milliseconds: 222),
      };

  void click() {
    if (state.phase == MiniGamePhase.finish) {
      return;
    }
    state = state.copyWith(
      nClick: state.nClick + 1,
    );
  }

  void reset() {
    if (!config.isUiTestMode) return;
    state = state.copyWith(nClick: 0, waitingStartedAt: DateTime.now());
  }
}
