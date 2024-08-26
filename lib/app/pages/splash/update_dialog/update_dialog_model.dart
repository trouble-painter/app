import 'package:store_redirect/store_redirect.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class UpdateDialogModel extends BaseViewModel<UpdateDialogData> {
  UpdateDialogModel(super.buildState);

  late final AnalyticsService analyticsService = ref.read(AnalyticsService.$);
  Config get config => ref.read(ConfigService.$);

  void init() {
    /// Send event
    analyticsService.sendEvent(UpdateDialogExposureEvent());
  }

  void showUrl() {
    /// Send event
    analyticsService.sendEvent(UpdateDialogUrlClickEvent());

    state.url.launchBrowser();
  }

  void goToUpdate() {
    /// Send event
    analyticsService.sendEvent(UpdateDialogUpdateClickEvent());
    StoreRedirect.redirect(
      androidAppId: config.appId.aos,
      iOSAppId: config.appId.ios,
    );
  }
}
