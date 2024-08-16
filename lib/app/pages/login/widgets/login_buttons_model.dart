import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';

class LoginButtonsModel extends BaseViewModel<AuthServiceState> {
  LoginButtonsModel(super.initState);

  Future<Result> login(SignInMethod signInMethod) async {
    final res = await ref.read(AuthService.$.notifier).login(signInMethod);
    switch (res) {
      case Success():
        Toast.showText(S.current.loginSuccess);
        break;
      case Failure():
        Toast.showText(S.current.loginFailure);
        break;
      case Cancel():
        break;
    }
    return res;
  }
}
