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

/// Bgm toggle
class SettingPageBgmToggleEvent extends SettingPageEvent {
  final bool isMute;

  SettingPageBgmToggleEvent(this.isMute);

  @override
  Map<String, Object> toJson() => {
        "isMute": isMute,
      };
}

/// Contact click
class SettingPageContactClickEvent extends SettingPageEvent {}

/// License click
class SettingPageLicenseClickEvent extends SettingPageEvent {}

/// Terms of service click
class SettingPageTermsOfServiceClickEvent extends SettingPageEvent {}

/// Versionl click
class SettingPageVersionClickEvent extends SettingPageEvent {}

/// Instagram click
class SettingPageInstagramClickEvent extends SettingPageEvent {}

/// Discord click
class SettingPageDiscordClickEvent extends SettingPageEvent {}

/// Suggest keywords click
class SettingPageSuggestKeywordsClickEvent extends SettingPageEvent {}

/// Notice click
class SettingPageNoticeClickEvent extends SettingPageEvent {}
