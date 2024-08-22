import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/result/enums/game_result_type.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/components/profile/profile_mafia.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameResultCard extends StatelessWidget {
  const GameResultCard({
    super.key,
    required this.isMafiaWin,
    required this.isMafiaCorrect,
    required this.mafia,
    required this.mafiaAnswer,
    required this.resultType,
    required this.onRetry,
    required this.showResultMs,
  });

  final bool isMafiaWin;
  final bool isMafiaCorrect;
  final String mafiaAnswer;
  final GameUser mafia;
  final GameResultType resultType;
  final VoidCallback onRetry;
  final int showResultMs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          /// Winner Profile
          ProfileMafia(
            mafia: mafia,
            showNickname: false,
            isConnected: true,
          ),
          const SizedBox(height: 32),

          /// Win
          AutoSizeText.rich(
            textAlign: TextAlign.center,
            maxLines: 1,
            minFontSize: 8,
            TextSpan(
              children: [
                TextSpan(
                  text: isMafiaWin ? S.current.mafia : S.current.citizens,
                  style: context.subTypo.header1.copyWith(
                    color: isMafiaWin
                        ? context.color.primary
                        : context.color.secondary,
                  ),
                ),
                TextSpan(
                  text: isMafiaWin
                      ? S.current.gameResultMafiaWins
                      : S.current.gameResultCitizensWin,
                  style: context.subTypo.header1,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// Nickname
          Container(
            decoration: BoxDecoration(
              color: mafia.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Text(
              mafia.nickname,
              style: context.typo.subHeader2.copyWith(
                color: mafia.color,
              ),
            ),
          ),

          const SizedBox(height: 24),

          /// Description
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: context.typo.body2.copyWith(
                color: context.color.subtext5,
              ),
              children: [
                if (resultType == GameResultType.citizenWind)
                  TextSpan(
                    text: mafiaAnswer,
                    style: context.typo.body2.copyWith(
                      color: context.color.secondary,
                    ),
                  ),
                TextSpan(text: resultType.description),
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(4, -1),
                    child: AssetImg(
                      resultType.emoji,
                      width: context.typo.body2.fontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: context.color.primary.withOpacity(0.1),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Text(
              S.current.gameResultTimerDesc(showResultMs ~/ 1000),
              style: context.typo.subHeader1.copyWith(
                color: context.color.primary,
              ),
            ),
          ),

          /// Retry
          // Button(
          //   text: S.current.gameResultRetry,
          //   shadow: context.deco.highlight,
          //   onPressed: onRetry,
          // ),
        ],
      ),
    );
  }
}
