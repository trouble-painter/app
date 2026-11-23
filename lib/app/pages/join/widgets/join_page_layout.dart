import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/theme/components/anims/anim_trans_opacity.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';

class JoinPageLayout extends StatelessWidget {
  const JoinPageLayout({
    super.key,
    required this.appBar,
    required this.title,
    required this.pinCode,
    required this.pasteButton,
    required this.joinButton,
  });

  final Widget appBar;
  final Widget title;
  final Widget pinCode;
  final Widget pasteButton;
  final Widget joinButton;

  /// Width the pin code boxes share
  static const double pinCodeWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.surface.withValues(alpha: 0.6),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            AnimTransOpacity(
              delayIndex: 0,
              child: appBar,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.dh),

                    /// Title
                    AnimTransOpacity(
                      delayIndex: 1,
                      child: title,
                    ),

                    SizedBox(height: 44.dh),

                    /// PinCode
                    AnimTransOpacity(
                      delayIndex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: SizedBox(
                          width: pinCodeWidth,
                          child: pinCode,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.dh),

                    /// PasteButton, which fades in by itself once the clipboard has text
                    pasteButton,
                  ],
                ),
              ),
            ),

            /// JoinButton
            AnimTransOpacity(
              delayIndex: 3,
              child: joinButton,
            ),
            SizedBox(
              height: context.responsiveH(
                context.keyboardHeight,
                small: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
