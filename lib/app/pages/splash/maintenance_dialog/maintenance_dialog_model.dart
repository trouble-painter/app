import 'package:intl/intl.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/services/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/maintenance_dialog_data.dart';

class MaintenanceDialogModel extends BaseViewModel<MaintenanceDialogData> {
  MaintenanceDialogModel(super.buildState);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

  String get duration {
    final dateFormat = DateFormat('yy.MM.dd HH:mm');
    return "${dateFormat.format(state.startedAt)} ~ ${dateFormat.format(state.endedAt)}";
  }

  void init() {
    /// Send event
    analyticsService.sendEvent(MaintenanceDialogExposureEvent());
  }
}
