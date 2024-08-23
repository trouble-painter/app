import 'package:store_redirect/store_redirect.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/env/env.dart';
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
    analyticsService.sendEvent(UpdateDialogExposureEvent());
  }

  void showUrl() {
    analyticsService.sendEvent(UpdateDialogUrlClickEvent());
    state.url.launchBrowser();
  }

  void goToUpdate() {
    analyticsService.sendEvent(UpdateDialogUpdateClickEvent());
    if (Env.FLAVOR.isDev) {
      Toast.showText("Not available in dev flavor");
    } else {
      StoreRedirect.redirect(
        androidAppId: config.appId.aos,
        iOSAppId: config.appId.ios,
      );
    }
  }
}
