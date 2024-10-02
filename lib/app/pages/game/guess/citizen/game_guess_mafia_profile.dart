import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/guess/citizen/game_guess_mafia_bubble.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/components/profile/profile.dart';
import 'package:x_pr/core/theme/components/profile/profile_citizen.dart';
import 'package:x_pr/core/theme/components/profile/profile_mafia.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/game/domain/entities/game_user.dart';

class GameGuessMafiaProfile extends StatelessWidget {
  const GameGuessMafiaProfile({
    super.key,
    required this.mafia,
    required this.mafiaAnswer,
    this.useV1 = false,
  });

  final GameUser mafia;
  final String mafiaAnswer;
  final bool useV1;

  @override
  Widget build(BuildContext context) {
    return useV1
        ? _GameGuessMafiaProfileV1(mafia: mafia, mafiaAnswer: mafiaAnswer)
        : _GameGuessMafiaProfileV2(mafia: mafia, mafiaAnswer: mafiaAnswer);
  }
}

class _GameGuessMafiaProfileV2 extends StatelessWidget {
  const _GameGuessMafiaProfileV2({
    required this.mafia,
    required this.mafiaAnswer,
  });

  final GameUser mafia;
  final String mafiaAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// MafiaAnswer
        GameGuessMafiaBubble(
          mafiaAnswer: mafiaAnswer,
        ),

        const SizedBox(height: 8),

        /// Mafia
        AssetImg(
          'guess_mafia',
          height: 160.dh,
          width: 160.dh,
        ),

        const SizedBox(height: 16),

        /// Profile
        Container(
          decoration: BoxDecoration(
            color: context.color.hintContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 9,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileCitizen(
                user: mafia,
                size: ProfileSize.mini,
                nicknameStyle: context.typo.caption2,
                showNickname: false,
              ),
              const SizedBox(width: 8),
              Text(
                mafia.nickname,
                style: context.typo.subHeader2.copyWith(
                  color: mafia.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GameGuessMafiaProfileV1 extends StatelessWidget {
  const _GameGuessMafiaProfileV1({
    required this.mafia,
    required this.mafiaAnswer,
  });

  final GameUser mafia;
  final String mafiaAnswer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        /// Profile
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: context.color.hintContainer.withOpacity(0.6),
          ),
          child: Column(
            children: [
              /// Mafia
              ProfileMafia(
                mafia: mafia,
                showNickname: false,
                isConnected: true,
              ),
              const SizedBox(height: 12),

              /// Nickname
              Text(
                mafia.nickname,
                style: context.typo.subHeader2,
              ),
            ],
          ),
        ),

        /// MafiaAnswer
        Positioned(
          bottom: 144,
          child: GameGuessMafiaBubble(
            mafiaAnswer: mafiaAnswer,
          ),
        ),
      ],
    );
  }
}
