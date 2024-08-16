import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/login/widgets/login_button/login_button.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/bottom_sheets/base_bottom_sheet.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      builder: (context, ref) => Column(
        children: [
          TextBalancer(
            S.current.loginPageTitle,
            textAlign: TextAlign.center,
            minLines: 2,
            style: context.typo.subHeader2.copyWith(
              fontWeight: context.typo.bold,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16),
            child: LoginButton(
              onLoginSuccess: context.pop,
            ),
          ),
        ],
      ),
    );
  }
}
