import 'package:material_ui/material_ui.dart';

class TimerTween extends Tween<int> {
  TimerTween({super.begin, super.end});

  @override
  int lerp(double t) => (begin! + (end! - begin!) * t).ceil();
}
