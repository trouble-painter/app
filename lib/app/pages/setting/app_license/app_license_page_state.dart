import 'package:flutter/foundation.dart';

class AppLicensePageState {
  final bool isBusy;
  final List<String> packages;
  final List<LicenseEntry> licenses;
  final Map<String, List<int>> packageLicenseMap;

  AppLicensePageState({
    this.isBusy = false,
    required this.packages,
    required this.licenses,
    required this.packageLicenseMap,
  });

  factory AppLicensePageState.init() => AppLicensePageState(
        isBusy: true,
        packages: [],
        licenses: [],
        packageLicenseMap: {},
      );
}
