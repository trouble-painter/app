import 'package:trouble_painter/app/pages/setting/app_license/app_license_detail/app_license_detail_page_state.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';

class AppLicenseDetailPageModel
    extends BaseViewModel<AppLicenseDetailPageState> {
  AppLicenseDetailPageModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void onPopPressed() {
    /// Send event
    analyticsService.sendEvent(LicenseDetailPageBackClickEvent());
  }
}
