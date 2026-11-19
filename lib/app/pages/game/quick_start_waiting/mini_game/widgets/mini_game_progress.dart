import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';

class MiniGameProgress extends StatefulWidget {
  const MiniGameProgress({
    super.key,
    required this.nClick,
    required this.waitingStartedAt,
    required this.startsAt,
    required this.waitMs,
  });

  final int nClick;
  final DateTime waitingStartedAt;

  /// Server clock. While set, a countdown to the start replaces the waiting time.
  final DateTime? startsAt;

  /// How long the countdown to [startsAt] runs
  final int waitMs;

  @override
  State<MiniGameProgress> createState() => _MiniGameProgressState();
}

class _MiniGameProgressState extends State<MiniGameProgress> {
  /// Below this many seconds left the countdown turns primary.
  static const int _urgentSec = 5;

  late Duration waitingDuration = Duration.zero;
  Timer? timer;

  static String _mmss(int totalSec) {
    final minutes = (totalSec ~/ 60 % 60).toString().padLeft(2, '0');
    final seconds = (totalSec % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  /// Whole seconds left to the start, rounded up
  int get startsInSec {
    final startsAt = widget.startsAt;
    if (startsAt == null) return 0;
    final remain = startsAt.difference(ServerTime.now).inMilliseconds;
    return max((remain / 1000).ceil(), 0);
  }

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
        horizontal: 44,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 30),
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
              key: ValueKey(widget.startsAt == null),
              children: [
                /// Title
                Text(
                  widget.startsAt == null
                      ? S.current.gameQuickStartWaitingTimer
                      : S.current.gameQuickStartStartsIn(
                          widget.waitMs ~/ Duration.millisecondsPerSecond,
                        ),
                  style: context.typo.subHeader2.copyWith(
                    color: widget.startsAt == null
                        ? context.color.subtext4
                        : context.color.primary,
                  ),
                ),

                /// Waiting time, or the countdown to the start
                Text(
                  widget.startsAt == null
                      ? _mmss(waitingDuration.inSeconds)
                      : _mmss(startsInSec),
                  style: context.typoTertiary.header0.copyWith(
                    color: widget.startsAt != null && startsInSec < _urgentSec
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

              /// Progress
              LayoutBuilder(
                builder: (context, constraints) {
                  final w = constraints.maxWidth /
                      miniGameFinishNClick *
                      widget.nClick;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 333),
                    width: w.clamp(0, constraints.maxWidth),
                    height: 8,
                    decoration: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: BorderRadius.circular(21),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
