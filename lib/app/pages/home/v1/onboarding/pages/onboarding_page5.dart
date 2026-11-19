import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:trouble_painter/app/pages/home/v1/onboarding/pages/widgets/onboarding_desc.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/image/asset_img.dart';
import 'package:trouble_painter/core/theme/foundations/app_theme.dart';
import 'package:trouble_painter/core/theme/res/layout.dart';

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
