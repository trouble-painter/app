import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class GameVotingCounter extends StatelessWidget {
  const GameVotingCounter({
    super.key,
    required this.child,
    required this.text,
  });

  final Widget child;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Child
        child,

        /// Blur
        Positioned(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: SizedBox.square(
              dimension: 18,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 6,
                  sigmaY: 6,
                ),
                child: const SizedBox(),
              ),
            ),
          ),
        ),

        /// Text
        Positioned(
          child: Text(
            text,
            style: context.typo.caption2.copyWith(
              color: Palette.gray110,
            ),
          ),
        ),
      ],
    );
  }
}
