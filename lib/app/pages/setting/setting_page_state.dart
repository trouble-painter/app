import 'package:x_pr/features/config/domain/entities/app_info.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

class SettingPageState {
  final String profile;
  final String nickname;
  final bool isBgmDisabled;
  final bool isBgmMute;
  final Language language;
  final AppInfo appInfo;

  const SettingPageState({
    required this.profile,
    required this.isBgmDisabled,
    required this.isBgmMute,
    required this.nickname,
    required this.language,
    required this.appInfo,
  });

  SettingPageState copyWith({
    String? profile,
    String? nickname,
    bool? isBgmDisabled,
    bool? isBgmMute,
    Language? language,
    AppInfo? appInfo,
  }) {
    return SettingPageState(
      profile: profile ?? this.profile,
      nickname: nickname ?? this.nickname,
      isBgmDisabled: isBgmDisabled ?? this.isBgmDisabled,
      isBgmMute: isBgmMute ?? this.isBgmMute,
      language: language ?? this.language,
      appInfo: appInfo ?? this.appInfo,
    );
  }
}
