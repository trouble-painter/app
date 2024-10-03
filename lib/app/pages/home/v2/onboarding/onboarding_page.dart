import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:text_balancer/text_balancer.dart';
import 'package:x_pr/app/pages/home/v2/onboarding/onboarding_page_model.dart';
import 'package:x_pr/app/pages/home/v2/onboarding/widgets/onboarding_page_item.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/buttons/button/button.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/palette.dart';
import 'package:x_pr/core/view/base_view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingPageModel, void>(
      viewModel: OnboardingPageModel.new,
      state: (ref, prevState) {},
      initState: (ref, viewModel) => viewModel.init(),
      builder: (ref, viewModel, state) {
        final pageList = [
          OnboardingPageItem(
            image: 'onboarding_v2_1',
            language: viewModel.language,
            index: 0,
            title: TextBalancer(S.current.onboarding1Title),
            content: TextBalancer(S.current.onboarding1Desc),
          ),
          OnboardingPageItem(
            image: 'onboarding_v2_2',
            index: 1,
            title: TextBalancer(S.current.onboarding2Title),
            content: TextBalancer(S.current.onboarding2Desc),
          ),
          OnboardingPageItem(
            image: 'onboarding_v2_3',
            language: viewModel.language,
            index: 2,
            title: TextBalancer(S.current.onboarding3Title),
            content: TextBalancer(S.current.onboarding3Desc),
          ),
          OnboardingPageItem(
            image: 'onboarding_v2_4',
            index: 3,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextBalancer(S.current.onboarding4Title1),
                TextBalancer(
                  S.current.mafia,
                  style: context.typo.header3.copyWith(
                    color: context.color.primary,
                  ),
                ),
                TextBalancer(S.current.onboarding4Title2),
              ],
            ),
            content: TextBalancer(S.current.onboarding4Desc1),
          ),
          OnboardingPageItem(
            image: 'onboarding_v2_5',
            index: 4,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextBalancer(S.current.onboarding4Title1),
                TextBalancer(
                  S.current.citizen,
                  style: context.typo.header3.copyWith(
                    color: context.color.secondary,
                  ),
                ),
                TextBalancer(S.current.onboarding4Title2),
              ],
            ),
            content: TextBalancer(S.current.onboarding4Desc2),
          ),
        ];
        return GestureDetector(
          onTap: context.pop,
          child: Scaffold(
            backgroundColor: Palette.black.withOpacity(0.8),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),

                /// Dialog
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(
                    left: 37,
                    right: 37,
                    bottom: 16,
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  decoration: BoxDecoration(
                    color: context.color.dialogSurface,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      /// Page View
                      SizedBox(
                        height: 440,
                        child: PageView.builder(
                          controller: viewModel.controller,
                          onPageChanged: viewModel.onPageChanged,
                          itemBuilder: (context, index) =>
                              pageList[index % pageList.length],
                        ),
                      ),

                      /// Header
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),

                            /// Title
                            TextBalancer(
                              S.current.onboardingTitle,
                              style: context.typoSecondary.header2.copyWith(
                                color: context.color.primary,
                              ),
                            ),
                            const Spacer(),

                            /// Pop button
                            Button(
                              icon: 'close',
                              color: context.color.text,
                              backgroundColor: context.color.surface,
                              onPressed: context.pop,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Indicator
                SmoothPageIndicator(
                  axisDirection: Axis.horizontal,
                  controller: viewModel.controller,
                  count: pageList.length,
                  effect: WormEffect(
                    activeDotColor: context.color.primary,
                    dotColor: context.color.onHintContainer,
                    dotHeight: 6,
                    dotWidth: 6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
