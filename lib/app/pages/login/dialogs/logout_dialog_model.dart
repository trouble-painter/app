import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/core/view/base_view_state.dart';
import 'package:trouble_painter/features/auth/domain/services/auth_service.dart';

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
