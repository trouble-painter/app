import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/quick_start_waiting/mini_game/mini_game_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class MiniGameProgress extends StatefulWidget {
  const MiniGameProgress({
    super.key,
    required this.nClick,
    required this.waitingStartedAt,
  });

  final int nClick;
  final DateTime waitingStartedAt;

  @override
  State<MiniGameProgress> createState() => _MiniGameProgressState();
}

class _MiniGameProgressState extends State<MiniGameProgress> {
  late Duration waitingDuration = Duration.zero;
  Timer? timer;

  String get waitingTime {
    final minutes = (waitingDuration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (waitingDuration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
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
          /// Waiting time
          Text(
            S.current.gameQuickStartWaitingTimer,
            style: context.typo.subHeader2.copyWith(
              color: context.color.subtext4,
            ),
          ),

          /// Timer
          Text(
            waitingTime,
            style: context.typoTertiary.header0.copyWith(
              fontFeatures: [const FontFeature.tabularFigures()],
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
