import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/game/v2/widgets/game_info_box.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/features/game/v2/domain/entities/common/game_keyword.dart';

class GameWaitingKeyword extends StatelessWidget {
  const GameWaitingKeyword({
    super.key,
    required this.isSpy,
    required this.keyword,
  });

  final bool isSpy;
  final GameKeyword keyword;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GameInfoBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isSpy
                        ? "${S.current.category} : ${keyword.category.intl}"
                        : "${S.current.keyword} : ${keyword.intl}",
                    style: context.typo.header1.copyWith(
                      fontWeight: context.typo.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextBalancer(
              isSpy ? S.current.youAreSpy : S.current.youAreNotSpy,
              textAlign: TextAlign.center,
              style: context.typo.subHeader0.copyWith(
                color: isSpy ? context.color.secondary : context.color.text,
                fontWeight: context.typo.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
