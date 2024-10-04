import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/image/asset_img.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key, required this.language});
  final Language language;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Voting
        Positioned(
          left: 53.dw,
          right: 53.dw,
          child: Transform.translate(
            offset: Offset(0, -52.dh),
            child: AssetImg(
              'onboarding4_voting',
              language: language,
            ),
          ),
        ),

        /// Mafia
        Positioned(
          right: 14.dw,
          child: Transform.translate(
            offset: Offset(0, -5.dh),
            child: AssetImg(
              'onboarding4_mafia',
              language: language,
              width: 63.dw,
            ),
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
                S.current.homeOnboarding4Title,
                style: context.typo.header2,
              ),
              const SizedBox(height: 12),
              OnboardingDesc(
                text: S.current.homeOnboarding4Desc,
                isUseTextBalancer: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
