import 'dart:async';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/core/view/anim/timer_tween.dart';

class CircularTimer extends StatefulWidget {
  const CircularTimer({
    super.key,
    required this.startedAt,
    required this.totalMs,
    this.startTimer = true,
    this.resetTimer = false,
    this.color,
    this.trackColor,
    this.builder,
    this.warningMs = 5000,
  });

  final DateTime startedAt;
  final int totalMs;
  final int warningMs;
  final bool startTimer;
  final bool resetTimer;
  final Color? color;
  final Color? trackColor;
  final Widget Function(Animation<int> secAnimation)? builder;

  @override
  State<CircularTimer> createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> secAnimation;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void init() {
    final now = NetworkTime.now;
    final isBeforeStart = now.isBefore(widget.startedAt);
    final wait =
        isBeforeStart ? widget.startedAt.difference(now) : Duration.zero;
    final initRemainMs = isBeforeStart
        ? widget.totalMs
        : widget.totalMs - now.difference(widget.startedAt).inMilliseconds;
    final value = 1 - initRemainMs / widget.totalMs;
    final duration = Duration(milliseconds: widget.totalMs);
    controller = AnimationController(
      value: value,
      duration: duration,
      vsync: this,
    );
    secAnimation = TimerTween(
      begin: (widget.totalMs / 1000).ceil(),
      end: 0,
    ).animate(controller);

    timer = Timer.periodic(wait, (t) {
      if (widget.startTimer) {
        if (context.mounted) {
          t.cancel();
          controller.forward();
        }
      }
    });
  }

  @override
  void didUpdateWidget(CircularTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.startedAt != widget.startedAt ||
        oldWidget.totalMs != widget.totalMs) {
      if (controller.isAnimating) {
        controller.stop();
      }
      controller.reset();
    }

    if (widget.startTimer && !controller.isAnimating) {
      controller.forward();
    } else if (!widget.startTimer && controller.isAnimating) {
      controller.stop();
    }

    if (oldWidget.resetTimer != widget.resetTimer) {
      if (widget.resetTimer) {
        controller.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.builder != null) {
      return AnimatedBuilder(
        animation: secAnimation,
        builder: (context, child) => widget.builder!(secAnimation),
      );
    }

    return SizedBox.square(
      dimension: 42,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Timer
          Transform.flip(
            flipX: true,
            child: AnimatedBuilder(
              animation: secAnimation,
              builder: (context, child) => CircularProgressIndicator(
                value: 1 - controller.value,
                backgroundColor:
                    widget.trackColor ?? context.color.iconContainer,
                color: secAnimation.value <= 5
                    ? context.color.warning
                    : context.color.success,
              ),
            ),
          ),

          /// Sec
          AnimatedBuilder(
            animation: secAnimation,
            builder: (context, child) {
              return Text(
                "${secAnimation.value}",
                style: context.typo.header3.copyWith(
                  color: secAnimation.value <= 5
                      ? context.color.warning
                      : widget.color ?? context.color.text,
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
