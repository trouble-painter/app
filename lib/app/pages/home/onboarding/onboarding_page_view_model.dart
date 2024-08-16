import 'package:flutter/material.dart';
import 'package:x_pr/app/pages/home/onboarding/onboarding_page_view_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';

class OnboardingPageViewModel extends BaseViewModel<OnboardingPageViewState> {
  OnboardingPageViewModel(super.buildState);

  final PageController controller = PageController(
    initialPage: (1000 * OnboardingPageViewState.pageCount).toInt(),
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
}
