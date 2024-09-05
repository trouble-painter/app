part of '../../app_event.dart';

sealed class LicenseDetailPageEvent extends AppEvent {
  LicenseDetailPageEvent() : super(AppEventScreen.licenseDetailPage);
}

/// Back click
class LicenseDetailPageBackClickEvent extends LicenseDetailPageEvent {}
