part of '../../app_event.dart';

sealed class SettingPageEvent extends AppEvent {
  SettingPageEvent() : super(AppEventScreen.settingPage);
}

/// Back click
class SettingPageBackClickEvent extends SettingPageEvent {}

/// Edit nickname click
class SettingPageEditNicknameClickEvent extends SettingPageEvent {}

/// Language click
class SettingPageLanguageClickEvent extends SettingPageEvent {}

/// Bgm on
class SettingPageBgmOnEvent extends SettingPageEvent {}

/// Bgm off
class SettingPageBgmOffEvent extends SettingPageEvent {}

/// Contact us click
class SettingPageContactUsClickEvent extends SettingPageEvent {}

/// License click
class SettingPageLicenseClickEvent extends SettingPageEvent {}

/// Turms of service click
class SettingPageTurmsOfServiceClickEvent extends SettingPageEvent {}

/// Versionl click
class SettingPageVersionClickEvent extends SettingPageEvent {}
