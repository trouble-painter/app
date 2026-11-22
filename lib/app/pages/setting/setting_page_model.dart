import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:trouble_painter/app/pages/setting/setting_page_state.dart';
import 'package:trouble_painter/app/routes/routes.dart';
import 'package:trouble_painter/app/routes/routes_setting.dart';
import 'package:trouble_painter/core/localization/generated/l10n.dart';
import 'package:trouble_painter/core/theme/components/toast/toast.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/utils/ext/future_ext.dart';
import 'package:trouble_painter/core/utils/ext/uri_ext.dart';
import 'package:trouble_painter/core/view/base_view_model.dart';
import 'package:trouble_painter/features/analytics/domain/entities/app_event/app_event.dart';
import 'package:trouble_painter/features/analytics/domain/services/analytics_service.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/notification/domain/services/notification_service.dart';

class SettingPageModel extends BaseViewModel<SettingPageState> {
  SettingPageModel(super.buildState);
  BuildContext get context => ref.read(RoutesSetting.$).context;
  late ConfigService configService = ref.read(ConfigService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  NotificationService get notificationService {
    return ref.read(NotificationService.$.notifier);
  }

  Config get config => ref.read(ConfigService.$);
  bool get isShowDev => config.isDeveloper;

  void onTermsOfServicePressed() {
    config.termsOfServiceUrl.launchBrowser();

    /// Send event
    analyticsService.sendEvent(SettingPageTermsOfServiceClickEvent());
  }

  void onNoticePressed() {
    context.pushNamed(Routes.noticePage.name);

    /// Send event
    analyticsService.sendEvent(SettingPageNoticeClickEvent());
  }

  void versionPressed() {
    final data = ClipboardData(text: config.uuid);
    Clipboard.setData(data);
    Toast.showText('🐹');

    /// Send event
    analyticsService.sendEvent(SettingPageVersionClickEvent());
  }

  Future<void> versionLongPressed() async {
    /// Send event
    analyticsService.sendEvent(SettingPageVersionLongClickEvent());

    final result = await configService.activateDeveloper();
    if (result case Success(value: true)) {
      Toast.showText('🛠️');
    }
  }

  Future<void> toggleQuickStartNotification() async {
    if (state.notificationSetting.disableQuickStartNoti) return;

    final isSubscribe = !state.notificationSetting.receiveQuickStartNoti;
    if (isSubscribe) {
      /// Check Permission
      final authorizationStatus = await notificationService.requestPermission();
      if (authorizationStatus != AuthorizationStatus.authorized) {
        /// Unauthorized -> Go to notification setting
        if (context.mounted) {
          context.pushNamed(Routes.goToNotificationSettingDialog.name);
        }
        return;
      }
    }
    final isSuccess = await (isSubscribe
            ? notificationService.subscribeQuickStartNotification()
            : notificationService.unsubscribeQuickStartNotification())
        .waiting(
      callback: (isBusy) {
        state = state.copyWith(isBusy: isBusy);
      },
    );
    if (isSuccess) {
      analyticsService.sendEvent(
        isSubscribe
            ? SettingPageQuickStartNotiOnEvent()
            : SettingPageQuickStartNotiOffEvent(),
      );
      Toast.showText(
        isSubscribe
            ? S.current.settingQuickStartNotificationEnalbed
            : S.current.settingQuickStartNotificationDisabled,
        type: TextToastType.success,
      );
    } else {
      Toast.showText(S.current.tryAgain);
    }
  }

  void toggleBgmMute() {
    configService.toggleBgmMute();

    /// Send event
    analyticsService.sendEvent(SettingPageBgmToggleEvent(config.isBgmMute));
  }

  void onContactUsPressed() async {
    /// Send event
    analyticsService.sendEvent(SettingPageContactClickEvent());

    final subject = "🎨 [${S.current.appName}] ";
    final mailTo = config.contactUsEmail;
    final body = """


────────────────────
👇 ${S.current.settingContactUsDoNotDelete}
os : ${kIsWeb ? 'web' : Platform.operatingSystem}
os version : ${Platform.operatingSystemVersion}
app version : ${config.appInfo.appVersion}
────────────────────""";
    final url = Uri.encodeFull('mailto:$mailTo?subject=$subject&body=$body');
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      Toast.showText(S.current.settingContactUsPleaseMailTo(mailTo));
    }
  }

  void licensePressed() {
    /// Send event
    analyticsService.sendEvent(SettingPageLicenseClickEvent());
    context.pushNamed(Routes.licensePage.name);
  }

  void languagePressed() {
    /// Send event
    analyticsService.sendEvent(SettingPageLanguageClickEvent());
    context.pushNamed(Routes.languageBottomSheet.name);
  }

  void editNicknamePressed() {
    /// Send event
    analyticsService.sendEvent(SettingPageEditNicknameClickEvent());
    context.pushNamed(Routes.editNicknamePage.name);
  }

  void onPopPressed() {
    /// Send event
    analyticsService.sendEvent(SettingPageBackClickEvent());
  }
}
