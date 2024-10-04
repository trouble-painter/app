import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes_helper.dart';

enum Routes {
  /// Splash
  splashPage,
  updateDialog,
  maintenanceDialog,

  /// Nickname
  nicknamePage,

  /// Home
  homePage,
  onboardingPage,
  noticeDialog,
  joinBottomSheet,
  quickStartPushDialog,
  quickStartNotiPermissionDialog,

  /// Join
  joinPage,
  joinQrPage,

  /// Game
  gamePage,
  gameInviteBottomSheet,
  gameExitDialog,

  /// Setting
  settingPage,
  goToNotificationSettingDialog,
  languageBottomSheet,

  /// EditNickname
  editNicknamePage,

  /// License
  licensePage,
  licenseDetailPage,

  /// Notice
  noticePage,

  /// Dev
  devPage,
  devLogPage,
  devLocalDataPage,
  devComponentPage,
  devLogoutDialog,
  devLoginBottomSheet,
  ;

  @override
  String toString() => name;

  factory Routes.fromString(String str) {
    for (final value in values) {
      if (value.name == str) return value;
    }
    throw UnsupportedError("$str cannot be converted to Rotues");
  }
}
