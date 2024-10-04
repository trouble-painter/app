import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/env/constant.dart';

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
    required String name,
    bool isVertical = false,
    bool isBlur = false,
    bool isOpaque = false,
    Duration duration = const Duration(
      milliseconds: Constant.pageTransitionMillies,
    ),
  }) {
    return CustomTransitionPage(
      child: child,
      opaque: isOpaque,
      transitionDuration: duration,
      name: name,
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
    final tweenAnim = Tween(
      begin: isVertical ? Offset(0, sh) : Offset(sw, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      ),
    );
    return AnimatedBuilder(
      animation: tweenAnim,
      child: child,
      builder: (context, child) {
        final value = tweenAnim.value;
        return Transform.translate(
          offset: value,
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
