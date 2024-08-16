import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/core/view/base_view_state.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';

class LogoutDialogModel extends BaseViewModel<BaseViewState> {
  LogoutDialogModel(super.initState);

  Future<void> logout() async {
    switch (await ref.read(AuthService.$.notifier).logout()) {
      case Success():
        state = BaseViewState.success;
        break;
      case Failure():
        state = BaseViewState.failure;
        break;
      case Cancel():
        break;
    }
  }
}
