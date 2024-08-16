import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/login/widgets/login_button/login_button_model.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/platform/platform_info.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/core/view/base_view_state.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.onLoginSuccess,
  });

  final VoidCallback? onLoginSuccess;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LoginButtonModel.new,
      state: (ref, prevState) => BaseViewState.init,
      onStateChanged: (ref, viewModel, state, oldState) {
        switch (state) {
          case BaseViewState.success:
            onLoginSuccess?.call();
            Toast.showText(S.current.loginSuccess);
            break;
          case BaseViewState.failure:
            Toast.showText(S.current.loginFailure);
            break;
          default:
            break;
        }
      },
      builder: (ref, viewModel, state) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(width: double.infinity),

          /// Login with Google
          Button(
            icon: 'google_logo',
            color: context.color.text,
            borderColor: context.color.text,
            type: ButtonType.outline,
            text: S.current.loginWithGoogle,
            borderRadius: BorderRadius.circular(32),
            onPressed: () => viewModel.login(SignInMethod.google),
          ),
          if (!PlatformInfo.isAndroid) ...[
            const SizedBox(height: 16),

            /// Login with Apple
            Button(
              icon: 'apple_logo',
              color: context.color.text,
              borderColor: context.color.text,
              type: ButtonType.outline,
              text: S.current.loginWithApple,
              borderRadius: BorderRadius.circular(32),
              onPressed: () => viewModel.login(SignInMethod.apple),
            ),
          ],

          const SizedBox(height: 16),
          Button(
            iconWidget: (color, isInactive) => Icon(
              Icons.person,
              color: color,
            ),
            text: S.current.loginWithAnonymous,
            borderRadius: BorderRadius.circular(32),
            type: ButtonType.outline,
            color: context.color.text,
            borderColor: context.color.text,
            onPressed: () => viewModel.login(SignInMethod.anonymous),
          ),
        ],
      ),
    );
  }
}
