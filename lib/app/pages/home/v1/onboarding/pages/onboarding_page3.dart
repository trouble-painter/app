import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(0, -46.dh),
          child: AssetImg(
            'onboarding3_canvas',
            width: 140.dw,
          ),
        ),
        Transform.translate(
          offset: Offset(46.dw, -27.dh),
          child: AssetImg(
            'onboarding3_citizen',
            width: 185.dw,
          ),
        ),
        Transform.translate(
          offset: Offset(-27.5.dw, 36.5.dh),
          child: AssetImg(
            'onboarding3_mafia',
            width: 73.dw,
          ),
        ),
        Positioned(
          left: OnboardingPageViewState.textLeft,
          right: OnboardingPageViewState.textRight,
          bottom: OnboardingPageViewState.textBottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.current.homeOnboarding3Title,
                style: context.typo.header2,
              ),
              const SizedBox(height: 12),
              OnboardingDesc(text: S.current.homeOnboarding3Desc),
            ],
          ),
        ),
      ],
    );
  }
}
