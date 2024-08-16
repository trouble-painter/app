import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/game/v3/guess/citizen/game_guess_mafia_bubble.dart';
import 'package:x_pr/core/theme/components/profile/profile_mafia.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v3/domain/entities/game_user.dart';

class GameGuessMafiaProfile extends StatelessWidget {
  const GameGuessMafiaProfile({
    super.key,
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
