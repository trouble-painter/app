import 'dart:math';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/drawing/round/game_drawing_round_state.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';

class GameDrawingRoundModel {
  GameDrawingRoundModel({
    required this.animCtrl,
    required this.initAnimMs,
    required this.roundAnimMs,
    this.dialogSize = 280,
    this.roundWidth = 115,
  });

  late GameDrawingRoundState state;
  late AnimationController animCtrl;
  final double dialogSize;
  final double roundWidth;
  final int initAnimMs;
  final int roundAnimMs;

  void init({
    required int currentRound,
    required DateTime turnStartedAt,
  }) {
    if (animCtrl.status == AnimationStatus.completed) {
      animCtrl.reset();
    }

    final isFirstRund = currentRound == 0;
    final int totalMs = (isFirstRund ? initAnimMs : 0) + roundAnimMs;
    final Duration totalDuration = Duration(milliseconds: totalMs);
    final double progress = _getProgress(turnStartedAt, totalDuration);
    animCtrl
      ..value = progress
      ..duration = totalDuration;

    Logger.d("⏱️ Round animation init progress : $progress");
    state = GameDrawingRoundState(
      fadeAnim: _getFadeAnim(
        totalMs: totalMs,
        animMs: 400,
      ),
      counterAnim: _getCountAnim(
        isFirstRound: isFirstRund,
        totalMs: totalMs,
        unitMs: 1000,
      ),
      counterFadeAnim: _getCounterFadeAnim(
        isFirstRund: isFirstRund,
        totalMs: totalMs,
        startMs: initAnimMs,
        animMs: 100,
      ),
      roundTransformAnim: _getRoundTransformAnim(
        totalMs: totalMs,
        startMs: isFirstRund ? initAnimMs : 0,
        animMs: 200,
        endMs: 150,
      ),
    );
    animCtrl.forward();
  }

  double _getProgress(DateTime turnStartedAt, Duration totalDuration) {
    final animEndedAt = turnStartedAt.add(totalDuration);
    final remainTime = animEndedAt.difference(NetworkTime.now);
    final remainMs = max(0, remainTime.inMilliseconds);
    return 1 - (remainMs / totalDuration.inMilliseconds);
  }

  Animation<double> _getFadeAnim({required int totalMs, required int animMs}) {
    return TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 1).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
          weight: animMs / totalMs,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween(1),
          weight: (totalMs - 2 * animMs) / totalMs,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 0).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
          weight: animMs / totalMs,
        ),
      ],
    ).animate(animCtrl);
  }

  Animation<int> _getCountAnim({
    required bool isFirstRound,
    required int totalMs,
    required int unitMs,
  }) {
    return TweenSequence<int>(
      isFirstRound
          ? [
              TweenSequenceItem(
                tween: ConstantTween<int>(3),
                weight: unitMs / totalMs,
              ),
              TweenSequenceItem(
                tween: ConstantTween<int>(2),
                weight: unitMs / totalMs,
              ),
              TweenSequenceItem(
                tween: ConstantTween(1),
                weight: unitMs / totalMs,
              ),
              TweenSequenceItem(
                tween: ConstantTween(1),
                weight: (totalMs - 3 * unitMs) / totalMs,
              ),
            ]
          : [
              TweenSequenceItem(
                tween: ConstantTween(0),
                weight: 1,
              ),
            ],
    ).animate(animCtrl);
  }

  Animation<double> _getCounterFadeAnim({
    required bool isFirstRund,
    required int totalMs,
    required int startMs,
    required int animMs,
  }) {
    return TweenSequence<double>(
      isFirstRund
          ? [
              TweenSequenceItem<double>(
                tween: ConstantTween<double>(1),
                weight: startMs / totalMs,
              ),
              TweenSequenceItem<double>(
                tween: Tween<double>(begin: 1, end: 0).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
                weight: animMs / totalMs,
              ),
              TweenSequenceItem<double>(
                tween: ConstantTween(0),
                weight: (totalMs - startMs - animMs) / totalMs,
              ),
            ]
          : [
              TweenSequenceItem(
                tween: ConstantTween(0),
                weight: 1,
              ),
            ],
    ).animate(animCtrl);
  }

  Animation<double> _getRoundTransformAnim({
    required int totalMs,
    required int startMs,
    required int animMs,
    required int endMs,
  }) {
    return TweenSequence<double>(
      [
        if (startMs > 0)
          TweenSequenceItem<double>(
            tween: ConstantTween(dialogSize),
            weight: startMs / totalMs,
          ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: dialogSize,
            end: (dialogSize - roundWidth) / 2,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
          weight: animMs / totalMs,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween((dialogSize - roundWidth) / 2),
          weight: (totalMs - startMs - animMs * 2 - endMs) / totalMs,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (dialogSize - roundWidth) / 2,
            end: -roundWidth,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
          weight: animMs / totalMs,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween(-roundWidth),
          weight: endMs / totalMs,
        ),
      ],
    ).animate(animCtrl);
  }
}
