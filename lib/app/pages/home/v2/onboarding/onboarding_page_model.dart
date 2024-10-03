import 'package:flutter/material.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class OnboardingPageModel extends BaseViewModel<void> {
  OnboardingPageModel(super.buildState);

  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  Language get language => ref.read(ConfigService.$).language;
  PageController controller = PageController(
    initialPage: 5000,
  );

  void init() {
    /// Send event
    analyticsService.sendEvent(OnboardingPageTutorialViewEvent(index: 0));
  }

  void onPageChanged(int index) {
    /// Send event
    analyticsService.sendEvent(
      OnboardingPageTutorialViewEvent(index: index % 5),
    );
  }
}
