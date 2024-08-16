import 'package:flutter/material.dart';

class GameDrawingRoundState {
  final Animation<double> fadeAnim;
  final Animation<int> counterAnim;
  final Animation<double> counterFadeAnim;
  final Animation<double> roundTransformAnim;

  GameDrawingRoundState({
    required this.fadeAnim,
    required this.counterAnim,
    required this.counterFadeAnim,
    required this.roundTransformAnim,
  });
}
