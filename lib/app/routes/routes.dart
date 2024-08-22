// ignore_for_file: library_prefixes
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/component/component_page.dart';
import 'package:x_pr/app/pages/dev/dev_page.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page.dart';
import 'package:x_pr/app/pages/dev/log/log_page.dart';
import 'package:x_pr/app/pages/game/game_page.dart';
import 'package:x_pr/app/pages/game/widgets/game_exit_confirm_dialog.dart';
import 'package:x_pr/app/pages/home/dialogs/notice_dialog.dart';
import 'package:x_pr/app/pages/home/home_page.dart';
import 'package:x_pr/app/pages/join/join_page.dart';
import 'package:x_pr/app/pages/login/bottom_sheets/login_bottom_sheet.dart';
import 'package:x_pr/app/pages/login/dialogs/logout_dialog.dart';
import 'package:x_pr/app/pages/nickname/nickname_page.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page.dart';
import 'package:x_pr/app/pages/setting/setting_page.dart';
import 'package:x_pr/app/pages/splash/splash_page.dart';
import 'package:x_pr/app/routes/routes_observer.dart';
import 'package:x_pr/core/theme/components/pages/bottom_sheet_page.dart';
import 'package:x_pr/core/theme/components/pages/custom_page_transition.dart';
import 'package:x_pr/core/theme/components/pages/dialog_page.dart';
import 'package:x_pr/core/utils/ext/string_ext.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';

part 'routes_helper.dart';

enum Routes {
  /// Splash
  splashPage,
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

  static final GlobalKey<NavigatorState> navigatorKey =
      config.routerDelegate.navigatorKey;

  static BuildContext get context => Routes.navigatorKey.currentContext!;

  static final GoRouter config = GoRouter(
    observers: [
      RoutesObserver(),
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      /// Splash
      GoRoute(
        path: '/',
        name: Routes.splashPage.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/nickname',
        name: Routes.nicknamePage.name,
        builder: (context, state) => const NicknamePage(),
      ),

      /// Home
      GoRoute(
        path: '/home',
        name: Routes.homePage.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const HomePage(),
            name: Routes.homePage.name,
            isVertical: true,
          );
        },
      ),
      GoRoute(
        path: '/home/join',
        name: Routes.joinPage.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const JoinPage(),
            name: Routes.joinPage.name,
            isBlur: true,
          );
        },
      ),
      GoRoute(
        path: '/home/notice',
        name: Routes.noticeDialog.name,
        pageBuilder: (context, state) => DialogPage(
          child: NoticeDialog(
            noticeData: state.extra as NoticeDialogData,
          ),
        ),
      ),

      /// Game
      GoRoute(
        path: '/home/game',
        name: Routes.gamePage.name,
        builder: (context, state) => const GamePage(),
      ),
      GoRoute(
        path: '/home/game/exit',
        name: Routes.gameExitDialog.name,
        pageBuilder: (context, state) => const DialogPage(
          child: GameExitConfirmDialog(),
        ),
      ),

      /// Setting
      GoRoute(
        path: '/home/setting',
        name: Routes.settingPage.name,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/home/setting/editNickname',
        name: Routes.editNicknamePage.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const EditNicknamePage(),
            name: Routes.editNicknamePage.name,
            isBlur: true,
          );
        },
      ),
      GoRoute(
        path: '/home/setting/license',
        name: Routes.licensePage.name,
        builder: (context, state) => const AppLicensePage(),
      ),

      /// Dev
      GoRoute(
        path: '/home/setting/dev',
        name: Routes.devPage.name,
        builder: (context, state) => const DevPage(),
      ),
      GoRoute(
        path: '/home/setting/dev/log',
        name: Routes.devLogPage.name,
        builder: (context, state) => const LogPage(),
      ),
      GoRoute(
        path: '/home/setting/dev/component',
        name: Routes.devComponentPage.name,
        builder: (context, state) => const ComponentPage(),
      ),
      GoRoute(
        path: '/home/setting/dev/local_data',
        name: Routes.devLocalDataPage.name,
        builder: (context, state) => const LocalDataPage(),
      ),
      GoRoute(
        path: '/home/setting/dev/local_data/logout',
        name: Routes.devLogoutDialog.name,
        pageBuilder: (context, state) => const DialogPage(
          child: LogoutDialog(),
        ),
      ),
      GoRoute(
        path: '/home/setting/dev/local_data/login',
        name: Routes.devLoginBottomSheet.name,
        pageBuilder: (context, state) => const BottomSheetPage(
          child: LoginBottomSheet(),
        ),
      ),
    ],
  );
}
