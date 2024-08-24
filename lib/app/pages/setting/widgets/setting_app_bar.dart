import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/pop_button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key, required this.onPopPressed});
  final VoidCallback onPopPressed;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 6,
          sigmaY: 6,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: 8,
          ),
          child: Stack(
            children: [
              const SizedBox(width: double.infinity),

              /// Pop
              PopButton(
                onPressed: onPopPressed,
              ),

              /// Title
              Positioned.fill(
                child: Center(
                  child: Text(
                    S.current.setting,
                    style: context.typo.header3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
