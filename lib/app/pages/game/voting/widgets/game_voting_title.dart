import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class GameVotingTitle extends StatelessWidget {
  const GameVotingTitle({
    super.key,
    this.useV1 = false,
  });

  final bool useV1;

  @override
  Widget build(BuildContext context) {
    return useV1 ? const _GameVotingTitleV1() : const _GameVotingTitleV2();
  }
}

class _GameVotingTitleV2 extends StatelessWidget {
  const _GameVotingTitleV2();

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      S.current.gameVotingTitle,
      maxLines: 1,
      style: context.typo.header2,
    );
  }
}

class _GameVotingTitleV1 extends StatelessWidget {
  const _GameVotingTitleV1();

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GameVotinTitleClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: context.color.surface,
        ),
        constraints: BoxConstraints(
          maxWidth: context.screen.width * 0.9,
        ),
        padding: const EdgeInsets.only(
          top: 34,
          left: 16,
          right: 48,
        ),
        child: AutoSizeText(
          S.current.gameVotingTitle,
          maxLines: 1,
          style: context.typo.header2,
        ),
      ),
    );
  }
}

class GameVotinTitleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final (w, h) = (size.width, size.height);
    const double c1 = 20;
    const double c2 = 28;
    Path path = Path()
      ..moveTo(0, 0)
      ..arcToPoint(
        const Offset(c1, c1),
        radius: const Radius.circular(c1),
        clockwise: false,
      )
      ..lineTo(w - 2 * c2, c1)
      ..cubicTo(w - c2, c1, w - c2, h, w, h)
      ..lineTo(0, h)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
