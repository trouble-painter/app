import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameGuide extends StatelessWidget {
  const GameGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.typo.subHeader1.copyWith(
        fontWeight: context.typo.bold,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onLongPress: () => context.goNamed(Routes.home.name),
              child: Text(
                S.current.gameName,
                textAlign: TextAlign.center,
                style: context.typo.header2.copyWith(
                  fontWeight: context.typo.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              S.current.gameDesc1,
            ),
            const SizedBox(height: 32),
            Text(
              S.current.gameDesc2,
            ),
          ],
        ),
      ),
    );
  }
}
