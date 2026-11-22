import 'package:material_ui/material_ui.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/language.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';

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

  /// Left half goes to the previous page, right half to the next page.
  void onDialogTapped({required double dx, required double width}) {
    const duration = Duration(milliseconds: 300);
    const curve = Curves.easeOut;
    if (dx < width / 2) {
      controller.previousPage(duration: duration, curve: curve);
    } else {
      controller.nextPage(duration: duration, curve: curve);
    }
  }

  void onPageChanged(int index) {
    /// Send event
    analyticsService.sendEvent(
      OnboardingPageTutorialViewEvent(index: index % 5),
    );
  }
}
