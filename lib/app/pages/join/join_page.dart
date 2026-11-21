import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:trouble_painter/app/pages/join/join_page_model_impl.dart';
import 'package:trouble_painter/app/pages/join/join_page_model_test.dart';
import 'package:trouble_painter/app/pages/join/join_page_state.dart';
import 'package:trouble_painter/app/pages/join/widgets/join_app_bar.dart';
import 'package:trouble_painter/app/pages/join/widgets/join_page_layout.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/components/buttons/button/button.dart';
import 'package:trouble_painter/core/theme/components/input/hide_keyboard.dart';
import 'package:trouble_painter/core/theme/components/loader/loader.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/view/base_view.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/services/room_code_length_service.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  static const double _pinGap = 4;
  static const double _minPinWidth = 34;
  static const double _maxPinWidth = 56;
  static const double _pinHeightRatio = 1.2;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => ref.watch(RoomCodeLengthService.$).when(
            loading: () => const Loader(isBusy: true, child: SizedBox.expand()),
            error: (e, s) => Scaffold(
              body: Center(
                child: Button(
                  text: S.current.tryAgain,
                  onPressed: () => ref.invalidate(RoomCodeLengthService.$),
                ),
              ),
            ),
            data: (length) => _buildJoin(context, ref, length),
          ),
    );
  }

  Widget _buildJoin(BuildContext context, WidgetRef ref, int length) {
    final pinWidth =
        ((JoinPageLayout.pinCodeWidth - _pinGap * (length - 1)) / length)
            .clamp(_minPinWidth, _maxPinWidth);
    return BaseView(
      viewModel: ref.watch(ConfigService.$).isUiTestMode
          ? JoinPageModelTest.new
          : JoinPageModelImpl.new,
      state: (ref, prevState) => JoinPageState(
        controller: TextEditingController(),
        invitationCodeLength: length,
      ),
      builder: (ref, viewModel, state) {
        return Loader(
          isBusy: state.isBusy,
          child: HideKeyboard(
            child: JoinPageLayout(
              /// AppBar
              appBar: JoinAppBar(
                onPopPressed: viewModel.onBackPressed,
              ),

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
                  width: pinWidth,
                  height: pinWidth * _pinHeightRatio,
                  textStyle: context.typo.subHeader0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: context.color.iconContainer,
                  ),
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                ),
                separatorBuilder: (index) {
                  return const SizedBox(width: _pinGap);
                },
                length: state.invitationCodeLength,
                cursor: Container(
                  height: 20,
                  width: 2,
                  color: context.color.primary,
                ),
                keyboardType: TextInputType.text,
                onCompleted: viewModel.onPinCodeComplete,
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
                onPressed: viewModel.joinPressed,
              ),
            ),
          ),
        );
      },
    );
  }
}
