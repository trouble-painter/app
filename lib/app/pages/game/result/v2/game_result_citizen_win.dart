import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameResultCitizenWin extends StatelessWidget {
  const GameResultCitizenWin({
    super.key,
    required this.mafia,
    required this.mafiaAnswer,
    required this.isKo,
  });

  final GameUser mafia;
  final String mafiaAnswer;
  final bool isKo;

  int get _answerMaxLength => isKo ? 20 : 30;
  String get mafiaAnswerEllipsed => mafiaAnswer.length > _answerMaxLength
      ? "${mafiaAnswer.substring(0, _answerMaxLength)}..."
      : mafiaAnswer;

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
              'result_citizen_0',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            /// Pencil
            AssetImg(
              'result_citizen_1',
              color: mafia.color,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            AssetImg(
              'result_citizen_2',
              color: mafia.color,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),

            /// Text
            Positioned(
              top: height * 0.05,
              left: height * 0.15,
              right: width * 0.45,
              bottom: height * 0.19,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.typo.subHeader1.copyWith(
                      color: context.color.subtext4,
                    ),
                    children: [
                      /// Mafia
                      TextSpan(text: S.current.gameResultV2MafiaWin1),
                      TextSpan(
                        text: mafia.nickname,
                        style: context.typo.subHeader1.copyWith(
                          color: mafia.color,
                          fontWeight: context.typo.bold,
                        ),
                      ),
                      TextSpan(text: S.current.gameResultV2MafiaWin2),

                      /// Mafia answer
                      TextSpan(text: S.current.gameResultV2CitizenWin1),
                      TextSpan(
                        text: mafiaAnswerEllipsed,
                        style: context.typo.subHeader1.copyWith(
                          color: mafia.color,
                          fontWeight: context.typo.bold,
                        ),
                      ),
                      TextSpan(text: S.current.gameResultV2CitizenWin2),
                    ],
                  ),
                ),
              ),
            ),

            /// Character
            const AssetImg(
              'result_citizen_3',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ],
        );
      },
    );
  }
}
