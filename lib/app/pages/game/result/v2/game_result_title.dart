import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameResultTitle extends StatelessWidget {
  const GameResultTitle({
    super.key,
    required this.isMafiaWin,
  });

  final bool isMafiaWin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: AutoSizeText.rich(
        textAlign: TextAlign.center,
        maxLines: 1,
        minFontSize: 8,
        TextSpan(
          children: [
            TextSpan(
              text: isMafiaWin ? S.current.mafia : S.current.citizen,
              style: context.subTypo.header0.copyWith(
                fontSize: 38,
                color: isMafiaWin
                    ? context.color.primary
                    : context.color.secondary,
              ),
            ),
            TextSpan(
              text: S.current.gameResultWin,
              style: context.subTypo.header0.copyWith(
                fontSize: 38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
