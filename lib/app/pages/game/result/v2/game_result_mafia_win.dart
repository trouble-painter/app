import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameResultMafiaWin extends StatelessWidget {
  const GameResultMafiaWin({
    super.key,
    required this.mafia,
  });

  final GameUser mafia;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = width / 265 * 217;
        return Stack(
          children: [
            const SizedBox(width: double.infinity),

            /// Mafia
            const AssetImg(
              'result_mafia_0',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            /// Paint
            AssetImg(
              'result_mafia_1',
              color: mafia.color,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            /// Text
            Positioned(
              top: height * 0.1,
              left: width * 0.36,
              right: width * 0.27,
              bottom: height * 0.2,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.typo.subHeader1.copyWith(
                      color: context.color.subtext4,
                    ),
                    children: [
                      TextSpan(text: S.current.gameResultV2MafiaWin1),
                      TextSpan(
                        text: mafia.nickname,
                        style: context.typo.subHeader1.copyWith(
                          color: mafia.color,
                          fontWeight: context.typo.bold,
                        ),
                      ),
                      TextSpan(text: S.current.gameResultV2MafiaWin2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
