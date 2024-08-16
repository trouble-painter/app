import 'package:flutter/material.dart';

class AnimHovering extends StatefulWidget {
  const AnimHovering({
    super.key,
    double? delta,
    required this.child,
    this.duration,
  }) : delta = delta ?? 12;

  final Widget child;
  final Duration? duration;
  final double delta;

  @override
  State<AnimHovering> createState() => _AnimHoveringState();
}

class _AnimHoveringState extends State<AnimHovering>
    with SingleTickerProviderStateMixin {
  /// Anim controller
  late final AnimationController controller = AnimationController(
    duration: widget.duration ?? const Duration(milliseconds: 2000),
    vsync: this,
  );

  /// Animation
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeInOutCubic,
  );

  /// Offset
  late final Animation<Offset> offset = Tween<Offset>(
    begin: Offset(0, widget.delta / 2),
    end: Offset(0, -(widget.delta / 2)),
  ).animate(animation);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.forward();
    });

    controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          controller.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          controller.reverse();
          break;
      }
    });
    controller.forward();
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
          child: child,
        );
      },
    );
  }
}
