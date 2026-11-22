import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/core/view/base_view_state.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';
import 'package:trouble_painter/features/auth/domain/services/auth_service.dart';

class LoginButtonModel extends BaseViewModel<BaseViewState> {
  LoginButtonModel(super.initState);

  Future<Result> login(SignInMethod signInMethod) async {
    final res = await ref.read(AuthService.$.notifier).login(signInMethod);
    switch (res) {
      case Success():
        state = BaseViewState.success;
        break;
      case Failure():
        state = BaseViewState.failure;
        break;
      case Cancel():
        break;
    }
    return res;
  }
}
