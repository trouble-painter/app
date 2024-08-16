import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:x_pr/app/pages/home/onboarding/onboarding_page_view_model.dart';
import 'package:x_pr/app/pages/home/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page1/onboarding_page1.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page2.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page3.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page4.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page5.dart';
import 'package:x_pr/app/pages/home/onboarding/pages/onboarding_page6.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/foundations/app_theme.dart';
import 'package:x_pr/core/theme/res/layout.dart';
import 'package:x_pr/core/utils/ext/num_ext.dart';
import 'package:x_pr/core/view/base_view.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.nickname});

  final String nickname;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: OnboardingPageViewModel.new,
      state: (ref, prevState) {
        return OnboardingPageViewState(
          language: ref.watch(ConfigService.$).language,
        );
      },
      builder: (ref, viewModel, state) {
        final pageList = [
          OnboardingPage1(viewModel.controller, nickname: nickname),
          OnboardingPage2(language: state.language),
          const OnboardingPage3(),
          OnboardingPage4(language: state.language),
          const OnboardingPage5(),
          const OnboardingPage6(),
        ];
        return Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  /// PageView
                  GestureDetector(
                    onTapUp: (details) {
                      final center = context.screen.width / 2;
                      final isNext = details.globalPosition.dx > center;
                      viewModel.onNext(isNext, pageList.length - 1);
                    },
                    child: PageView.builder(
                      controller: viewModel.controller,
                      onPageChanged: (_) => HapticFeedback.mediumImpact(),
                      itemBuilder: (context, index) => const SizedBox(),
                    ),
                  ),

                  /// Content
                  IgnorePointer(
                    child: ClipRRect(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          for (int i = pageList.length - 1; i >= 0; i--)
                            AnimatedBuilder(
                              animation: viewModel.controller,
                              builder: (context, child) {
                                final page = viewModel.controller.page ?? 0;
                                double index = page % pageList.length;
                                if (index > pageList.length - 0.5) {
                                  index -= pageList.length;
                                }
                                final d = index.decimal;
                                final double opacity = (index - i).abs() >= 0.5
                                    ? 0
                                    : d <= 0.5
                                        ? 1 - 2 * d
                                        : -1 + 2 * d;
                                return Opacity(
                                  opacity: opacity.clamp(0, 1),
                                  child: child,
                                );
                              },
                              child: pageList[i],
                            ),
                        ],
                      ),
                    ),
                  ),

                  /// Role
                  Positioned(
                    top: 22,
                    child: AnimatedBuilder(
                      animation: viewModel.controller,
                      child: SafeArea(
                        child: Text(
                          S.current.homeOnboardingRole,
                          style: context.typo.header3,
                        ),
                      ),
                      builder: (context, child) {
                        const pageCount = OnboardingPageViewState.pageCount;
                        final page = viewModel.controller.page ?? 0;
                        final value = page % pageCount;
                        final x =
                            value > pageCount - 1 ? pageCount - value : value;
                        final double opacity = ((x - 0.5) * 2).clamp(0, 1);
                        return Opacity(
                          opacity: opacity,
                          child: child!,
                        );
                      },
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
            const SizedBox(height: 11),
          ],
        );
      },
    );
  }
}
