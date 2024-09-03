import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/theme/components/clipper/bubble_clipper.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';

class JoinQrBubble extends StatelessWidget {
  const JoinQrBubble({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const BubbleClipper(
        arrowHeight: 10,
        arrowWidth: 15,
      ),
      child: Container(
        color: context.color.text,
        height: 62,
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        padding: const EdgeInsets.only(
          left: 13,
          right: 13,
          top: 4,
          bottom: 4,
        ),
        child: TextBalancer(
          text,
          style: context.typo.header3.copyWith(
            color: Palette.darkBlack,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
