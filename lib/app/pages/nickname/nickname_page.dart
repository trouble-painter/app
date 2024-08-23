import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/nickname/nickname_page_model.dart';
import 'package:x_pr/app/pages/nickname/nickname_page_state.dart';
import 'package:x_pr/app/pages/nickname/widgets/nickname_layout.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/description/description.dart';
import 'package:x_pr/core/theme/components/input/hide_keyboard.dart';
import 'package:x_pr/core/theme/components/input/input.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/view/base_view.dart';

class NicknamePage extends StatelessWidget {
  const NicknamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: NicknamePageModel.new,
      state: (ref, prevState) => NicknamePageState(
        nickname: "",
        controller: TextEditingController(),
        focusNode: FocusNode(),
        isShowHint: false,
        nicknameMax: 7,
      ),
      initState: (ref, viewModel) {
        Future.delayed(
          const Duration(milliseconds: Constant.pageTransitionMillies),
          viewModel.state.focusNode.requestFocus,
        );
      },
      onStateChanged: (ref, viewModel, state, oldState) {
        if (state.isSubmitted && oldState?.isSubmitted != true) {
          context.goNamed(Routes.homePage.name);
        }
      },
      builder: (ref, viewModel, state) {
        return HideKeyboard(
          child: NicknameLayout(
            title: Description(
              title: S.current.nicknameTitle,
              titleMaxLines: 2,
              type: DescriptionType.large,
              content: [
                TextSpan(
                  text: S.current.nicknameMax(state.nicknameMax),
                ),
              ],
            ),

            /// Inpupt
            input: Focus(
              onFocusChange: viewModel.onFocusChanged,
              child: Input(
                focusNode: state.focusNode,
                controller: state.controller,
                hint: S.current.nicknameHint,
                textStyle: context.typo.header0,
                hintStyle: context.typo.header0.copyWith(
                  fontWeight: context.typo.light,
                  color: context.color.inputColor.hint.withOpacity(
                    state.isShowHint ? 1 : 0,
                  ),
                ),
                maxLength: 7,
                isBackground: false,
                textAlign: TextAlign.center,
                onChanged: viewModel.onNicknameChanged,
                onSubmitted: (_) => viewModel.onSubmitted(isEnter: true),
              ),
            ),

            /// Terms of service
            termsOfService: GestureDetector(
              onTap: viewModel.showTermsOfService,
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: S.current.nicknameAgreement1),
                    TextSpan(
                      text: S.current.termsOfService,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: context.color.subtext5,
                      ),
                    ),
                    TextSpan(text: S.current.nicknameAgreement2),
                  ],
                ),
                maxLines: 1,
                minFontSize: 6,
                textAlign: TextAlign.center,
                style: context.typo.caption1.copyWith(
                  color: context.color.subtext5,
                ),
              ),
            ),

            /// Complete button
            submitButton: Button(
              margin: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              size: ButtonSize.large,
              width: double.infinity,
              text: S.current.complete,
              disabled: state.nickname.isEmpty,
              onPressed: () => viewModel.onSubmitted(isEnter: false),
            ),
          ),
        );
      },
    );
  }
}
