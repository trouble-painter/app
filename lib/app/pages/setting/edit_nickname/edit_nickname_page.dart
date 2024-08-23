import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page_model.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page_state.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/widgets/edit_nickname_app_bar.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/description/description.dart';
import 'package:x_pr/core/theme/components/input/hide_keyboard.dart';
import 'package:x_pr/core/theme/components/input/input.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class EditNicknamePage extends StatelessWidget {
  const EditNicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: EditNicknamePageModel.new,
      state: (ref, prevState) {
        final nickname = ref.read(ConfigService.$).nickname;
        return EditNicknamePageState(
          nickname: nickname,
          controller: TextEditingController(text: nickname),
        );
      },
      onStateChanged: (ref, viewModel, state, oldState) {
        if (state.isComplete && oldState?.isComplete != true) {
          context.pop();
        }
      },
      builder: (ref, viewModel, state) {
        return Scaffold(
          backgroundColor: context.color.surface.withOpacity(0.6),
          body: HideKeyboard(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          /// AppBar
                          EditNicknameAppBar(onPopPressed: viewModel.onPopPressed,),
                          const SizedBox(height: 44),

                          /// Title
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Description(
                              title: S.current.editNicknameTitle,
                              content: [
                                TextSpan(text: S.current.editNicknameDesc),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),

                          /// Input
                          Focus(
                            onFocusChange: viewModel.onFocusChanged,
                            child: Input(
                              autoFocus: true,
                              controller: state.controller,
                              isBackground: false,
                              maxLength: 7,
                              textAlign: TextAlign.center,
                              textStyle: context.typo.header0,
                              hint: S.current.editNicknameHint,
                              onChanged: viewModel.onNicknameChanged,
                              onSubmitted: (_) {
                                viewModel.onSubmitted(isEnter: true);
                              },
                              hintStyle: context.typo.header0.copyWith(
                                color: context.color.hint.withOpacity(
                                  state.showHint ? 1 : 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Submit button
                  Button(
                    width: double.infinity,
                    disabled: state.isSubmitButtonDiabled,
                    margin: const EdgeInsets.all(20),
                    size: ButtonSize.large,
                    text: S.current.complete,
                    onPressed: () => viewModel.onSubmitted(isEnter: false),
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
