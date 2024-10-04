import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';

class OnboardingPage6 extends StatelessWidget {
  const OnboardingPage6({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: AssetImg(
            'onboarding6_bg',
            fit: BoxFit.cover,
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
                      text: S.current.citizen,
                      style: context.typo.header2.copyWith(
                        color: context.color.secondary,
                      ),
                    ),
                    TextSpan(text: S.current.homeOnboarding5Title2),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              OnboardingDesc(text: S.current.homeOnboarding5Desc2),
            ],
          ),
        ),
      ],
    );
  }
}
