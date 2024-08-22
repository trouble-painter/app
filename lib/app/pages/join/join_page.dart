import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:x_pr/app/pages/join/join_page_model.dart';
import 'package:x_pr/app/pages/join/join_page_model_impl.dart';
import 'package:x_pr/app/pages/join/join_page_model_test.dart';
import 'package:x_pr/app/pages/join/join_page_state.dart';
import 'package:x_pr/app/pages/join/widgets/join_app_bar.dart';
import 'package:x_pr/app/pages/join/widgets/join_layout.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/components/input/hide_keyboard.dart';
import 'package:x_pr/core/theme/components/loader/loader.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/utils/env/constant.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  Future<void> joinRoom(JoinPageModel viewModel, BuildContext context) async {
    if (await viewModel.joinRoom() && context.mounted) {
      context.pushReplacementNamed(Routes.gamePage.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => BaseView(
        viewModel: ref.watch(ConfigService.$).isUiTestMode
            ? JoinPageModelTest.new
            : JoinPageModelImpl.new,
        state: (ref, prevState) => JoinPageState(
          controller: TextEditingController(),
          invitationCodeLength: Constant.invitationCodeLength,
        ),
        builder: (ref, viewModel, state) {
          return Loader(
            isBusy: state.isBusy,
            child: HideKeyboard(
              child: JoinLayout(
                /// AppBar
                appBar: const JoinAppBar(),

                /// Title
                title: Text(
                  S.current.joinTitle,
                  style: context.typo.header1,
                ),

                /// Pin Code
                pinCode: Pinput(
                  autofocus: true,
                  focusNode: state.focusNode,
                  controller: state.controller,
                  onChanged: viewModel.onChange,
                  hapticFeedbackType: HapticFeedbackType.mediumImpact,
                  defaultPinTheme: PinTheme(
                    width: 34,
                    height: 41,
                    textStyle: context.typo.subHeader0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: context.color.iconContainer,
                    ),
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                  ),
                  separatorBuilder: (index) {
                    return const SizedBox(width: 4);
                  },
                  length: state.invitationCodeLength,
                  cursor: Container(
                    height: 20,
                    width: 2,
                    color: context.color.primary,
                  ),
                  keyboardType: TextInputType.text,
                  onCompleted: (text) {
                    if (text.length != state.invitationCodeLength) {
                      viewModel.focus();
                    } else {
                      state.focusNode.unfocus();
                      joinRoom(viewModel, context);
                    }
                  },
                ),

                /// Paste Button
                pasteButton: FutureBuilder(
                  future: viewModel.hasStringsInClipbaord,
                  builder: (context, snapshot) {
                    final hasStrings = snapshot.data ?? false;
                    return AnimTransOpacity(
                      isReverse: !hasStrings,
                      child: Button(
                        text: S.current.joinPaste,
                        size: ButtonSize.small,
                        type: ButtonType.flat,
                        disabled: !hasStrings,
                        color: context.color.primary,
                        onPressed: viewModel.pasteFromClipboard,
                      ),
                    );
                  },
                ),

                /// Join Button
                joinButton: Button(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  size: ButtonSize.large,
                  text: S.current.join,
                  onPressed: () => joinRoom(viewModel, context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
