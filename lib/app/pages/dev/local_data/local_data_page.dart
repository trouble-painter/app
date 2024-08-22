import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/dev/local_data/dialogs/reset_config_confirm_dialog.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page_model.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page_state.dart';
import 'package:x_pr/app/pages/dev/local_data/widgets/local_data_section.dart';
import 'package:x_pr/app/pages/login/widgets/log_in_out_button.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_switcher.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class LocalDataPage extends StatelessWidget {
  const LocalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: LocalDataPageModel.new,
      state: (ref, prevState) => LocalDataPageState(
        config: ref.watch(ConfigService.$),
        authState: switch (ref.watch(AuthService.$)) {
          Unauthenticated() => null,
          Authenticated(authState: AuthState authState) => authState,
        },
      ),
      builder: (ref, viewModel, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(S.current.localDataPageTitle),
            actions: [
              /// Login & Logout
              const LogInOutButton(),

              /// Reset config
              Button(
                iconWidget: (color, isInactive) => Icon(
                  Icons.delete,
                  color: color,
                ),
                type: ButtonType.flat,
                onPressed: () {
                  context.dialog(
                    const ResetConfigConfirmDialog(),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 64),
              child: Column(
                children: [
                  /// Config
                  LocalDataSection(
                    title: "Config",
                    previewData: state.config.toJson(),
                  ),

                  /// AuthState
                  AnimSwitcher(
                    state: state.authState,
                    builder: (authState) {
                      return authState == null
                          ? const LocalDataSection(
                              title: "Not Signed In",
                            )
                          : Column(
                              children: [
                                /// SignInMethod
                                LocalDataSection(
                                  title: "SignInMethod",
                                  previewData: authState.signInMethod,
                                ),

                                /// JWT - AccessToken
                                LocalDataSection(
                                  title: "AccessToken",
                                  previewData: authState.jwt.accessToken,
                                ),

                                /// JWT - RefreshToken
                                LocalDataSection(
                                  title: "RefreshToken",
                                  previewData: authState.jwt.refreshToken,
                                ),

                                /// IdToken
                                if (authState.idToken.isNotEmpty)
                                  LocalDataSection(
                                    title: "IdToken",
                                    previewData: viewModel.getPayload(
                                      authState.idToken,
                                    ),
                                    copyData: authState.idToken,
                                  ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
