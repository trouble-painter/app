import 'package:x_pr/app/pages/setting/app_license/app_license_detail/app_license_detail_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';

class AppLicenseDetailPageModel
    extends BaseViewModel<AppLicenseDetailPageState> {
  AppLicenseDetailPageModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void onPopPressed() {
    /// Send event
    analyticsService.sendEvent(LicenseDetailPageBackClickEvent());
  }
}
