import 'package:flutter/material.dart';
import 'package:x_pr/core/theme/components/anims/anim_switcher.dart';
import 'package:x_pr/core/theme/components/app_bar/transparent_app_bar.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    super.key,
    required this.onboarding,
    required this.createButton,
    required this.joinButton,
    required this.rejoinButton,
    required this.settingButton,
    required this.isShowRejoinButton,
    required this.randomMatchingButton,
  });

  final bool isShowRejoinButton;
  final Widget onboarding;
  final Widget createButton;
  final Widget joinButton;
  final Widget rejoinButton;
  final Widget settingButton;
  final Widget randomMatchingButton;

  @override
  Widget build(BuildContext context) {
    const double gap = 12;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Onboarding
              Expanded(child: onboarding),
              const SizedBox(height: 54),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: AnimSwitcher(
                  state: isShowRejoinButton,
                  builder: (isShowReentry) {
                    return isShowReentry

                        /// Rejoin
                        ? SizedBox(
                            height: ButtonSize.large.height * 2 + gap,
                            child: Center(child: rejoinButton),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              /// Quick start
                              randomMatchingButton,
                              const SizedBox(height: gap),

                              /// Create
                              createButton,
                              const SizedBox(height: gap),

                              /// Join
                              joinButton,
                            ],
                          );
                  },
                ),
              ),
              SizedBox(
                height: context.responsiveH(
                  54,
                  small: 34,
                ),
              ),
            ],
          ),

          /// Setting
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: settingButton,
            ),
          ),
        ],
      ),
    );
  }
}
