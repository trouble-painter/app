import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page_state.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/app/routes/routes_setting.dart';
import 'package:x_pr/core/utils/ext/uri_ext.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class AppLicensePageModel extends BaseViewModel<AppLicensePageState> {
  AppLicensePageModel(super.buildState);

  BuildContext get context => ref.read(RoutesSetting.$).context;
  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);
  Config get config => ref.read(ConfigService.$);

  Future<void> init() async {
    state = await LicenseRegistry.licenses.fold<AppLicensePageState>(
      AppLicensePageState(
        isBusy: false,
        packages: [],
        licenses: [],
        packageLicenseMap: {},
      ),
      (prev, licenseEntry) {
        for (final package in licenseEntry.packages) {
          if (!prev.packageLicenseMap.containsKey(package)) {
            prev.packageLicenseMap[package] = [];
            prev.packages.add(package);
          }
          prev.packageLicenseMap[package]!.add(prev.licenses.length);
        }
        prev.licenses.add(licenseEntry);
        return prev;
      },
    );
  }

  void onPopPressed() {
    /// Send event
    analyticsService.sendEvent(LicensePageBackClickEvent());
  }

  void onBgmLicensePressed() {
    config.bgmLicenseUrl.launchBrowser();

    /// Send event
    analyticsService.sendEvent(LicensePageLicenseClickEvent("BGM"));
  }

  void onLicensePressed(String package, List<LicenseEntry> entries) {
    context.pushNamed(
      Routes.licenseDetailPage.name,
      extra: {
        "package": package,
        "licenseEntries": entries,
      },
    );

    /// Send event
    analyticsService.sendEvent(LicensePageLicenseClickEvent(package));
  }
}
