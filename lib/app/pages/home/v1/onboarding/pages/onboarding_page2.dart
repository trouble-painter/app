import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key, required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(-57.dw, -71.dh),
          child: AssetImg(
            'onboarding2_mafia',
            language: language,
            width: 185.dw,
            // height: 185.dh,
          ),
        ),
        Transform.translate(
          offset: Offset(47.dw, -13.dh),
          child: AssetImg(
            'onboarding2_citizen',
            language: language,
            width: 188.dw,
            // height: 203.dh,
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
                S.current.homeOnboarding2Title,
                style: context.typo.header2,
              ),
              const SizedBox(height: 12),
              OnboardingDesc(text: S.current.homeOnboarding2Desc),
            ],
          ),
        ),
      ],
    );
  }
}
