import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/palette.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/game/domain/entities/game_match_ready.dart';

class MiniGameProgress extends StatefulWidget {
  const MiniGameProgress({
    super.key,
    required this.nClick,
    required this.waitingStartedAt,
    required this.ready,
  });

  final int nClick;
  final DateTime waitingStartedAt;

  /// While set, the ready countdown and a shrinking gauge replace the waiting time.
  final GameMatchReady? ready;

  @override
  State<MiniGameProgress> createState() => _MiniGameProgressState();
}

class _MiniGameProgressState extends State<MiniGameProgress> {
  /// Below this many seconds left the ready countdown turns primary.
  static const int _urgentSec = 3;

  late Duration waitingDuration = Duration.zero;
  Timer? timer;

  static String _mmss(int totalSec) {
    final minutes = (totalSec ~/ 60 % 60).toString().padLeft(2, '0');
    final seconds = (totalSec % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  /// Milliseconds left to get ready; 0 when there is no ready step
  int get readyRemainMs {
    final ready = widget.ready;
    if (ready == null) return 0;
    final remain = ready.endsAt.difference(ServerTime.now).inMilliseconds;
    return min(max(remain, 0), ready.acceptMs);
  }

  /// Whole seconds left to get ready, rounded up: 5, 4, 3, 2, 1
  int get readyRemainSec =>
      (readyRemainMs / Duration.millisecondsPerSecond).ceil();

  @override
  void initState() {
    super.initState();

    /// Ticks faster than a second so the countdown turns on time.
    timer = Timer.periodic(const Duration(milliseconds: 200), (_) {
      setState(() {
        waitingDuration = DateTime.now().difference(widget.waitingStartedAt);
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 24,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.color.hintContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 333),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: Column(
              key: ValueKey(widget.ready == null),
              children: [
                /// Title
                Text(
                  widget.ready == null
                      ? S.current.gameQuickStartWaitingTimer
                      : S.current.gameMatchFoundTitle,
                  style: context.typo.subHeader2.copyWith(
                    color: widget.ready == null
                        ? context.color.subtext4
                        : context.color.primary,
                  ),
                ),

                /// Waiting time, or the ready countdown
                Text(
                  widget.ready == null
                      ? _mmss(waitingDuration.inSeconds)
                      : "$readyRemainSec",
                  style: context.typoTertiary.header0.copyWith(
                    color: widget.ready != null && readyRemainSec <= _urgentSec
                        ? context.color.primary
                        : null,
                    fontFeatures: [const FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              /// Background
              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                  color: context.color.hint,
                  borderRadius: BorderRadius.circular(21),
                ),
              ),

              /// Ready gauge: full at first, shrinking to empty as time runs out.
              if (widget.ready case final ready?)
                LayoutBuilder(
                  builder: (context, constraints) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    width:
                        constraints.maxWidth * readyRemainMs / ready.acceptMs,
                    height: 8,
                    decoration: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                )
              else

                /// Progress: each lap paints over the previous one in the next color.
                LayoutBuilder(
                  builder: (context, constraints) {
                    final lapColors = [
                      context.color.primary,
                      Palette.yellow,
                      Palette.mint,
                      Palette.drawingBlue,
                      Palette.drawingPurple,
                      Palette.drawingPink,
                    ];
                    final lap = widget.nClick ~/ miniGameProgressLapNClick;
                    final lapNClick = widget.nClick % miniGameProgressLapNClick;
                    return Stack(
                      children: [
                        /// The previous lap, filled
                        if (lap > 0)
                          _bar(
                            width: constraints.maxWidth,
                            color: lapColors[(lap - 1) % lapColors.length],
                          ),

                        /// The current lap. Keyed per lap so a new lap grows from zero.
                        AnimatedContainer(
                          key: ValueKey(lap),
                          duration: const Duration(milliseconds: 333),
                          width: constraints.maxWidth /
                              miniGameProgressLapNClick *
                              lapNClick,
                          height: 8,
                          decoration: BoxDecoration(
                            color: lapColors[lap % lapColors.length],
                            borderRadius: BorderRadius.circular(21),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bar({required double width, required Color color}) {
    return Container(
      width: width,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(21),
      ),
    );
  }
}
