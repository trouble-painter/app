import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameReadyRole extends StatelessWidget {
  const GameReadyRole({super.key, required this.isMafia});

  final bool isMafia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          /// Role
          AutoSizeText.rich(
            textAlign: TextAlign.center,
            maxLines: 2,
            TextSpan(
              style: context.typoSecondary.header0,
              children: [
                TextSpan(
                  text: "${S.current.gameReadyRole1}\n",
                ),
                TextSpan(
                  text: isMafia ? S.current.mafia : S.current.citizen,
                  style: context.typoSecondary.header0.copyWith(
                    color: isMafia
                        ? context.color.primary
                        : context.color.secondary,
                  ),
                ),
                TextSpan(
                  text: S.current.gameReadyRole2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),

          /// Description
          TextBalancer(
            isMafia
                ? S.current.gameReadyRoleMafiaDescription
                : S.current.gameReadyRoleCitizenDescription,
            style: context.typo.body1.copyWith(
              color: context.color.subtext2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
