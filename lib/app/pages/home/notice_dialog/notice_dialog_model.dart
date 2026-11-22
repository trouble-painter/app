import 'package:trouble_painter/core/utils/ext/uri_ext.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/notice_dialog_data.dart';

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
