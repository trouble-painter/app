import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/utils/time/server_time.dart';
import 'package:trouble_painter/features/game/domain/entities/game_match_ready.dart';

/// The accept step after a match: press accept before the countdown ends.
class GameQuickStartAcceptView extends StatefulWidget {
  const GameQuickStartAcceptView({
    super.key,
    required this.ready,
    required this.onAcceptPressed,
  });

  final GameMatchReady ready;
  final VoidCallback onAcceptPressed;

  @override
  State<GameQuickStartAcceptView> createState() =>
      _GameQuickStartAcceptViewState();
}

class _GameQuickStartAcceptViewState extends State<GameQuickStartAcceptView> {
  /// Below this many seconds left the countdown turns primary.
  static const int _urgentSec = 3;

  Timer? timer;

  int get remainMs {
    final remain =
        widget.ready.endsAt.difference(ServerTime.now).inMilliseconds;
    return max(remain, 0);
  }

  /// Whole seconds left, rounded up
  int get remainSec => (remainMs / Duration.millisecondsPerSecond).ceil();

  @override
  void initState() {
    super.initState();

    /// Ticks faster than a second so the countdown turns on time.
    timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ready = widget.ready;
    return Column(
      children: [
        const SizedBox(height: 16),

        /// Title
        TextBalancer(
          S.current.gameMatchFoundTitle,
          style: context.typo.header1,
          textAlign: TextAlign.center,
          minLines: 1,
        ),

        const SizedBox(height: 6),

        /// Subtitle
        Text(
          S.current.gameMatchFoundSubtitle(
            ready.acceptMs ~/ Duration.millisecondsPerSecond,
          ),
          style: context.typo.body1.copyWith(color: context.color.subtext3),
          textAlign: TextAlign.center,
        ),

        /// Countdown
        Expanded(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 44),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: context.color.hintContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$remainSec",
                    style: context.typoTertiary.header0.copyWith(
                      color: remainSec <= _urgentSec
                          ? context.color.primary
                          : null,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Remaining time
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21),
                    child: LinearProgressIndicator(
                      value: remainMs / ready.acceptMs,
                      minHeight: 8,
                      color: context.color.primary,
                      backgroundColor: context.color.hint,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Accept
        Button(
          text: ready.isAccepted
              ? S.current.gameMatchAccepted
              : S.current.gameMatchAccept,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          size: ButtonSize.large,
          disabled: ready.isAccepted,
          onPressed: widget.onAcceptPressed,
        ),
      ],
    );
  }
}
