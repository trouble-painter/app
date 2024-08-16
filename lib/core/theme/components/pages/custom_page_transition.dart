import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/env/constant.dart';

/// TODO : Implement cupertino swipe back
class CustomPageTransition extends StatelessWidget {
  const CustomPageTransition({
    super.key,
    required this.animation,
    required this.child,
    this.isVertical = false,
    this.isBlur = false,
  });

  final Animation<double> animation;
  final Widget child;
  final bool isVertical;
  final bool isBlur;

  static Page page(
    Widget child, {
    bool isVertical = false,
    bool isBlur = false,
    Duration duration = const Duration(
      milliseconds: Constant.pageTransitionMillies,
    ),
  }) {
    return CustomTransitionPage(
      child: child,
      opaque: !isBlur,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondAnimation, child) {
        return CustomPageTransition(
          animation: animation,
          isVertical: isVertical,
          isBlur: isBlur,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final (sw, sh) = (context.screen.width, context.screen.height);
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        final tween = Tween(
          begin: isVertical ? Offset(0, sh) : Offset(sw, 0),
          end: const Offset(0, 0),
        ).chain(
          CurveTween(curve: Curves.easeInOut),
        );
        return Transform.translate(
          offset: animation.drive(tween).value,
          child: ChildBuilder(
            child: child!,
            builder: (child) => isBlur
                ? ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 40 * animation.value,
                        sigmaY: 40 * animation.value,
                      ),
                      child: child,
                    ),
                  )
                : child,
          ),
        );
      },
    );
  }
}
