import 'package:x_pr/app/pages/nickname/nickname_page_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class NicknamePageModel extends BaseViewModel<NicknamePageState> {
  NicknamePageModel(super.buildState);
  Config get config => ref.read(ConfigService.$);
  ConfigService get configService => ref.read(ConfigService.$.notifier);
  AuthService get authService => ref.read(AuthService.$.notifier);

  void onNicknameChanged(String nickname) {
    state = state.copyWith(
      nickname: nickname.trim(),
    );
  }

  void onFocusChanged(bool isFocused) {
    state = state.copyWith(isShowHint: !isFocused);
  }

  Future<void> onSubmitted() async {
    if (state.isBusy) return;
    if (state.nickname.isEmpty) {
      state.focusNode.requestFocus();
      return Toast.showText(S.current.nicknameRequired);
    } else {
      state.focusNode.unfocus();
      await Future.delayed(const Duration(milliseconds: 333));
    }

    /// Update nickname & isFirstRun to false
    final updateRes = await configService.updateNickname(state.nickname);
    if (updateRes.isSuccess) {
      /// Sign in with anonymous
      authService.login(SignInMethod.anonymous);
      state = state.copyWith(isSubmitted: true);
    } else {
      Toast.showText(S.current.tryAgain);
    }
  }

  void showTermsOfService() {
    config.termsOfServiceUrl.launchBrowser();
  }
}
