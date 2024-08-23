import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';

class NoticeDialogModel extends BaseViewModel<NoticeDialogData> {
  NoticeDialogModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(NoticeDialogExposureEvent());
  }

  void showUrl() {
    if (state.url == null) return;
    state.url?.launchBrowser();

    /// Send event
    analyticsService.sendEvent(NoticeDialogUrlClickEvent());
  }
}
