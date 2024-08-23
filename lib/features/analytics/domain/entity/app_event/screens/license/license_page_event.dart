part of '../../app_event.dart';

sealed class LicensePageEvent extends AppEvent {
  LicensePageEvent() : super(AppEventScreen.languageBottomSheet);
}

/// Back click
class LicensePageBackClickEvent extends LicensePageEvent {}

/// License click
class LicensePageLicenseClickEvent extends LicensePageEvent {
  final String name;

  LicensePageLicenseClickEvent(this.name);

  @override
  Map<String, Object> toJson() => {
        "name": name,
      };
}
