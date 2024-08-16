import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:x_pr/app/pages/setting/setting_page_state.dart';
import 'package:x_pr/core/localization/generated/l10n.dart';
import 'package:x_pr/core/theme/components/toast/toast.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class SettingPageModel extends BaseViewModel<SettingPageState> {
  SettingPageModel(super.buildState);
  late ConfigService configService = ref.read(ConfigService.$.notifier);
  Config get config => ref.read(ConfigService.$);
  bool get isShowDev => config.isDeveloper;

  void showTermsOfService() {
    config.termsOfServiceUrl.launchBrowser();
  }

  void copyUuid() {
    final data = ClipboardData(text: config.uuid);
    Clipboard.setData(data);
    Toast.showText('🐹');
  }

  void toggleBgmMute() {
    configService.toggleBgmMute();
  }

  void onContactUsPressed() async {
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
}
