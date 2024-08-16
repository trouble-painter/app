import 'package:flutter/material.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/login/widgets/login_button/login_button.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.loginPage),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.screen.height * 0.05),
            TextBalancer(
              S.current.loginPageTitle,
              textAlign: TextAlign.center,
              minLines: 2,
              style: context.typo.subHeader1.copyWith(
                fontWeight: context.typo.bold,
              ),
            ),
            Expanded(
              child: FlutterLogo(
                size: context.screen.height * 0.25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: context.screen.height * 0.08,
                left: 16,
                right: 16,
              ),
              child: LoginButton(
                onLoginSuccess: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
