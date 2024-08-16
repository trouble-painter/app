import 'package:flutter/material.dart';

class AnimTransOpacity extends StatefulWidget {
  const AnimTransOpacity({
    super.key,
    required this.child,
    this.opacity,
    this.offset,
    this.curve,
    this.delayIndex = 0,
    Duration? initDelay,
    Duration? delay,
    Duration? duration,
    bool? isReverse,
    double? offsetDelta,
    AxisDirection? direction,
  })  : initDelay = initDelay ?? Duration.zero,
        delay = delay ?? const Duration(milliseconds: 55),
        duration = duration ?? const Duration(milliseconds: 333),
        isReverse = isReverse ?? false,
        offsetDelta = offsetDelta ?? 12,
        direction = direction ?? AxisDirection.up;

  final Widget child;

  /// Opacity
  final Tween<double>? opacity;

  /// Transition
  final Tween<Offset>? offset;
  final double offsetDelta;

  /// Curve
  final Curve? curve;

  /// Start delay
  final Duration initDelay;
  final Duration delay;
  final int delayIndex;

  /// Animate duration
  final Duration duration;

  /// Reverse
  final bool isReverse;

  /// Direction
  final AxisDirection direction;

  @override
  State<AnimTransOpacity> createState() => _AnimTransOpacityState();
}

class _AnimTransOpacityState extends State<AnimTransOpacity>
    with SingleTickerProviderStateMixin {
  /// Anim controller
  late final AnimationController controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  /// Animation
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: widget.curve ?? Curves.easeInOutCubic,
  );

  /// Opacity
  late final Animation<double> opacity = (widget.opacity ??
          Tween<double>(
            begin: 0.0,
            end: 1.0,
          ))
      .animate(animation);

  /// Offset
  Tween<Offset> get offsetByDirection {
    return switch (widget.direction) {
      AxisDirection.up => Tween<Offset>(
          begin: Offset(0, widget.offsetDelta),
          end: const Offset(0, 0),
        ),
      AxisDirection.down => Tween<Offset>(
          begin: Offset(0, -widget.offsetDelta),
          end: const Offset(0, 0),
        ),
      AxisDirection.left => Tween<Offset>(
          begin: Offset(widget.offsetDelta, 0),
          end: const Offset(0, 0),
        ),
      AxisDirection.right => Tween<Offset>(
          begin: Offset(-widget.offsetDelta, 0),
          end: const Offset(0, 0),
        ),
    };
  }

  late final Animation<Offset> offset =
      (widget.offset ?? offsetByDirection).animate(animation);

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void didUpdateWidget(AnimTransOpacity oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (mounted) {
      startAnimation();
    }
  }

  void startAnimation() {
    final delayMillies = widget.initDelay.inMilliseconds +
        widget.delay.inMilliseconds * widget.delayIndex;
    Future.delayed(Duration(milliseconds: delayMillies), () {
      if (!mounted) return;
      if (widget.isReverse) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: offset.value,
          child: Opacity(
            opacity: opacity.value,
            child: child,
          ),
        );
      },
    );
  }
}
