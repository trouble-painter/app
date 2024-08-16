import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class EditNicknamePageModel extends BaseViewModel<EditNicknamePageState> {
  EditNicknamePageModel(super.buildState);

  void onFocusChanged(bool isFocusing) {
    state = state.copyWith(
      showHint: !isFocusing,
    );
  }

  void onNicknameChanged(String nickname) {
    state = state.copyWith(
      isSubmitButtonDiabled: nickname.trim().isEmpty,
    );
  }

  void onSubmitted() async {
    final nickname = state.controller.text.trim();
    if (nickname.isEmpty) return;
    final result = await ref.read(ConfigService.$.notifier).updateNickname(
          nickname,
        );
    if (result.isSuccess) {
      state = state.copyWith(isComplete: true);
    }
  }

  @override
  void dispose() {
    state.controller.dispose();
  }
}
