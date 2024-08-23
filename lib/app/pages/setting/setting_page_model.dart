import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:x_pr/app/pages/setting/setting_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class SettingPageModel extends BaseViewModel<SettingPageState> {
  SettingPageModel(super.buildState);
  BuildContext get context => ref.read(RoutesSetting.$).context;
  late ConfigService configService = ref.read(ConfigService.$.notifier);
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  Config get config => ref.read(ConfigService.$);
  bool get isShowDev => config.isDeveloper;

  void termsOfServicePressed() {
    config.termsOfServiceUrl.launchBrowser();

    /// Send event
    analyticsService.sendEvent(SettingPageTermsOfServiceClickEvent());
  }

  void versionPressed() {
    final data = ClipboardData(text: config.uuid);
    Clipboard.setData(data);
    Toast.showText('🐹');

    /// Send event
    analyticsService.sendEvent(SettingPageVersionClickEvent());
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
