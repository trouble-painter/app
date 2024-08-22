import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes_helper.dart';

enum Routes {
  /// Splash
  splashPage,
  updateDialog,
  maintenanceDialog,
  nicknamePage,

  /// Home
  homePage,
  joinPage,
  noticeDialog,

  /// Game
  gamePage,
  gameExitDialog,

  /// Setting
  settingPage,
  licensePage,
  editNicknamePage,
  languageBottomSheet,

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
