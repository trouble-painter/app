import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/builder/child_builder.dart';

class Blur extends StatelessWidget {
  const Blur({
    super.key,
    this.borderRadius = BorderRadius.zero,
    required this.child,
    required this.sigma,
    this.borderColor,
  });

  final BorderRadius borderRadius;
  final Widget child;
  final double sigma;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
            ),
            child: const SizedBox(),
          ),
        ),
        ChildBuilder(
          child: child,
          builder: (child) => borderColor == null
              ? child
              : DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor!,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: child,
                ),
        ),
      ],
    );
  }
}
