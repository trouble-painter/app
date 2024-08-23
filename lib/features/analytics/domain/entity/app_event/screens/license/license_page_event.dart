part of '../../app_event.dart';

sealed class LicensePageEvent extends AppEvent {
  LicensePageEvent() : super(AppEventScreen.languageBottomSheet);
}

/// Back click
class LicensePageBackClickEvent extends LicensePageEvent {}

/// BGM license click
class LicensePageBgmLicenseClickEvent extends LicensePageEvent {}

/// Package license click
class LicensePagePackageLicenseClickEvent extends LicensePageEvent {
  final String packageName;

  LicensePagePackageLicenseClickEvent({required this.packageName});

  @override
  Map<String, Object> toJson() => {
        "packageName": packageName,
      };
}
