import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class GameFailurePage extends StatelessWidget {
  const GameFailurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          S.current.tryAgain,
          style: context.typo.subHeader1,
        ),
      ),
    );
  }
}
