import 'package:flutter/foundation.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page_state.dart';
import 'package:x_pr/core/view/base_view_model.dart';
import 'package:x_pr/features/analytics/domain/entity/app_event/app_event.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';

class AppLicensePageModel extends BaseViewModel<AppLicensePageState> {
  AppLicensePageModel(super.buildState);

  AnalyticsService get analyticsService => ref.read(AnalyticsService.$);

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
}
