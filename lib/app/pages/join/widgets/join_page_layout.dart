import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.surface.withOpacity(0.6),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            appBar,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.dh),

                    /// Title
                    title,

                    SizedBox(height: 44.dh),

                    /// PinCode
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        width: 300,
                        child: pinCode,
                      ),
                    ),
                    SizedBox(height: 20.dh),

                    /// PasteButton
                    pasteButton,
                  ],
                ),
              ),
            ),

            /// JoinButton
            joinButton,
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
