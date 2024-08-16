import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class OnboardingPage5 extends StatelessWidget {
  const OnboardingPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -18.dh,
          child: AssetImg(
            'onboarding5_light',
            width: 181.dw,
          ),
        ),
        Positioned(
          top: 138.dh,
          child: AssetImg(
            'onboarding5_character',
            width: 246.dw,
          ),
        ),
        Positioned(
          left: OnboardingPageViewState.textLeft,
          right: OnboardingPageViewState.textRight,
          bottom: OnboardingPageViewState.textBottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  style: context.typo.header2,
                  children: [
                    TextSpan(text: S.current.homeOnboarding5Title1),
                    TextSpan(
                      text: S.current.mafia,
                      style: context.typo.header2.copyWith(
                        color: context.color.primary,
                      ),
                    ),
                    TextSpan(text: S.current.homeOnboarding5Title2),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              OnboardingDesc(text: S.current.homeOnboarding5Desc1),
            ],
          ),
        ),
      ],
    );
  }
}
