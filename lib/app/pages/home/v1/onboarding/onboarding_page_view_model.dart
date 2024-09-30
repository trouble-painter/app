import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_pr/app/pages/home/v1/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';

class OnboardingPageViewModel extends BaseViewModel<OnboardingPageViewState> {
  OnboardingPageViewModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  final int initialPage = (1000 * OnboardingPageViewState.pageCount).toInt();
  late final PageController controller = PageController(
    initialPage: initialPage,
  );

  void onNext(bool isNext, int lastPage) {
    const duration = Duration(milliseconds: 333);
    const curve = Curves.easeInOut;
    if (isNext) {
      controller.nextPage(duration: duration, curve: curve);
    } else {
      controller.previousPage(duration: duration, curve: curve);
    }
  }

  void onPageChanged(int index) {
    HapticFeedback.mediumImpact();

    /// Send event
    final i = (index - initialPage) % OnboardingPageViewState.pageCount;
    analyticsService.sendEvent(HomePageTutorialViewEvent(index: i));
  }
}
