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
  noticeDialog,

  /// Join
  joinPage,

  /// Game
  gamePage,
  gameExitDialog,

  /// Setting
  settingPage,
  languageBottomSheet,

  /// EditNickname
  editNicknamePage,

  /// License
  licensePage,

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
}
