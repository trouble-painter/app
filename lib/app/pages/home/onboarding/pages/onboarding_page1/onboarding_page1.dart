import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page1/widgets/onboarding_page1_transition.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1(
    this.controller, {
    super.key,
    required this.nickname,
  });

  final String nickname;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Background
              const Positioned.fill(
                child: AssetImg(
                  'onboarding1_bg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// Title
              Positioned(
                top: context.safeaAreaPadding.top + 58,
                child: OnboardingPage1Transition(
                  controller,
                  // width: 248.dw,
                  height: 101.dh,
                  delay: const Duration(milliseconds: 555),
                  curve: Curves.bounceOut,
                  tween: Tween(
                    begin: Offset(0, -114.dh - 101.dh),
                    end: const Offset(0, 0),
                  ),
                  image: 'onboarding1_title',
                ),
              ),

              /// Citizen
              Positioned(
                left: 26,
                bottom: context.responsiveH(
                  100.dh,
                  small: 79.dh,
                ),
                child: OnboardingPage1Transition(
                  controller,
                  // width: 78.dw,
                  height: 118.dh,
                  delay: const Duration(milliseconds: 777),
                  tween: Tween(
                    begin: const Offset(-78 - 26, 0),
                    end: const Offset(0, 0),
                  ),
                  image: 'onboarding1_citizen',
                ),
              ),

              /// Mafia
              Positioned(
                right: 0,
                bottom: context.responsiveH(
                  40.dh,
                  small: 0,
                ),
                child: OnboardingPage1Transition(
                  controller,
                  // width: 243.dw,
                  height: 268.dh,
                  delay: const Duration(milliseconds: 1000),
                  tween: Tween(
                    begin: Offset(243.dw, 268.dh),
                    end: const Offset(0, 0),
                  ),
                  image: 'onboarding1_mafia',
                ),
              ),

              /// Gradient
              const Positioned.fill(
                child: AssetImg(
                  'onboarding1_gradient',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        /// Title
        Positioned(
          left: OnboardingPageViewState.textLeft,
          right: OnboardingPageViewState.textRight,
          bottom: OnboardingPageViewState.textBottom,
          child: Text(
            S.current.homeOnboarding1Title(nickname),
            style: context.typo.header2,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
