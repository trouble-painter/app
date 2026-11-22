import 'package:flutter/scheduler.dart';
import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/widgets/canvas/sketch_playback.dart';
import 'package:trouble_painter/features/game/domain/entities/drawing/sketch.dart';

/// Builds [sketch] as it is played back by [SketchPlayback], frame by frame.
/// What was already drawn when this widget appears is shown at once.
class SketchPlayer extends StatefulWidget {
  const SketchPlayer({
    super.key,
    required this.sketch,
    required this.drawThrottleMs,
    required this.builder,
  });

  final Sketch sketch;
  final int drawThrottleMs;
  final Widget Function(Sketch shown) builder;

  @override
  State<SketchPlayer> createState() => _SketchPlayerState();
}

class _SketchPlayerState extends State<SketchPlayer>
    with SingleTickerProviderStateMixin {
  late final SketchPlayback _playback =
      SketchPlayback.forDrawThrottle(widget.drawThrottleMs)
        ..skip(widget.sketch);
  late final Ticker _ticker = createTicker(_onTick);
  late Sketch _shown = widget.sketch;
  Duration _lastTick = Duration.zero;

  @override
  void didUpdateWidget(covariant SketchPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.sketch, widget.sketch)) return;
    _shown = _playback.advance(widget.sketch, 0);
    if (!_ticker.isActive && !_playback.isDone(widget.sketch)) {
      _lastTick = Duration.zero;
      _ticker.start();
    }
  }

  void _onTick(Duration elapsed) {
    final elapsedMs = (elapsed - _lastTick).inMicroseconds / 1000;
    _lastTick = elapsed;
    setState(() => _shown = _playback.advance(widget.sketch, elapsedMs));
    if (_playback.isDone(widget.sketch)) _ticker.stop();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(_shown);
}
