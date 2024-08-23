import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/component/component_page.dart';
import 'package:x_pr/app/pages/dev/dev_page.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page.dart';
import 'package:x_pr/app/pages/dev/log/log_page.dart';
import 'package:x_pr/app/pages/game/game_exit_confirm_dialog/game_exit_confirm_dialog.dart';
import 'package:x_pr/app/pages/game/game_page.dart';
import 'package:x_pr/app/pages/home/home_page.dart';
import 'package:x_pr/app/pages/home/notice_dialog/notice_dialog.dart';
import 'package:x_pr/app/pages/join/join_page.dart';
import 'package:x_pr/app/pages/login/bottom_sheets/login_bottom_sheet.dart';
import 'package:x_pr/app/pages/login/dialogs/logout_dialog.dart';
import 'package:x_pr/app/pages/nickname/nickname_page.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_detail/app_license_detail_page.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page.dart';
import 'package:x_pr/app/pages/setting/language/language_bottom_sheet.dart';
import 'package:x_pr/app/pages/setting/setting_page.dart';
import 'package:x_pr/app/pages/splash/maintenance_dialog/maintenance_dialog.dart';
import 'package:x_pr/app/pages/splash/splash_page.dart';
import 'package:x_pr/app/pages/splash/update_dialog/update_dialog.dart';
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/core/theme/components/pages/bottom_sheet_page.dart';
import 'package:x_pr/core/theme/components/pages/custom_page_transition.dart';
import 'package:x_pr/core/theme/components/pages/dialog_page.dart';
import 'package:x_pr/features/analytics/domain/service/analytics_service.dart';
import 'package:x_pr/features/config/domain/entities/maintenance_dialog_data.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_data.dart';
import 'package:x_pr/features/config/domain/entities/update_dialog_data.dart';

class RoutesSetting {
  static final $ = Provider<RoutesSetting>((ref) {
    return RoutesSetting(
      analyticsService: ref.read(AnalyticsService.$),
    );
  });
  RoutesSetting({
    required AnalyticsService analyticsService,
  }) : _analyticsService = analyticsService;

  final AnalyticsService _analyticsService;

  /// NavigatorKey BuildContext
  BuildContext get context => navigatorKey.currentContext!;

  /// NavigatorKey
  late final GlobalKey<NavigatorState> navigatorKey =
      router.routerDelegate.navigatorKey;

  /// Router
  late final GoRouter router = GoRouter(
    observers: [
      _analyticsService.getNavigatorObserver(),
    ],
    routes: [
      /// SplashPage
      GoRoute(
        path: '/',
        name: Routes.splashPage.name,
        builder: (context, state) => const SplashPage(),
      ),

      /// SplashPage / UpdateDialog
      GoRoute(
        path: '/update',
        name: Routes.updateDialog.name,
        pageBuilder: (context, state) => DialogPage(
          route: Routes.updateDialog,
          barrierDismissible: false,
          child: UpdateDialog(
            updateDialogData: state.extra as UpdateDialogData,
          ),
        ),
      ),

      /// SplashPage / MaintenanceDialog
      GoRoute(
        path: '/maintenance',
        name: Routes.maintenanceDialog.name,
        pageBuilder: (context, state) => DialogPage(
          route: Routes.maintenanceDialog,
          barrierDismissible: false,
          child: MaintenanceDialog(
            maintenanceDialogData: state.extra as MaintenanceDialogData,
          ),
        ),
      ),

      /// SplashPage / NicknamePage
      GoRoute(
        path: '/nickname',
        name: Routes.nicknamePage.name,
        builder: (context, state) => const NicknamePage(),
      ),

      /// HomePage
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

      /// HomePage / JoinPage
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

      /// HomePage / NoticeDialog
      GoRoute(
        path: '/home/notice',
        name: Routes.noticeDialog.name,
        pageBuilder: (context, state) => DialogPage(
          route: Routes.noticeDialog,
          child: NoticeDialog(
            noticeData: state.extra as NoticeDialogData,
          ),
        ),
      ),

      /// HomePage / GamePage
      GoRoute(
        path: '/home/game',
        name: Routes.gamePage.name,
        builder: (context, state) => const GamePage(),
      ),

      /// HomePage / GamePage / GameExitConfirmDialog
      GoRoute(
        path: '/home/game/exit',
        name: Routes.gameExitDialog.name,
        pageBuilder: (context, state) => const DialogPage(
          route: Routes.gameExitDialog,
          child: GameExitConfirmDialog(),
        ),
      ),

      /// HomePage / SettingPage
      GoRoute(
        path: '/home/setting',
        name: Routes.settingPage.name,
        builder: (context, state) => const SettingPage(),
      ),

      /// HomePage / SettingPage / EditNicknamePage
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

      /// HomePage / SettingPage / LanguageBottomSheet
      GoRoute(
        path: '/home/setting/language',
        name: Routes.languageBottomSheet.name,
        pageBuilder: (context, state) => const BottomSheetPage(
          route: Routes.languageBottomSheet,
          child: LanguageBottomSheet(),
        ),
      ),

      /// HomePage / SettingPage / AppLicensePage
      GoRoute(
        path: '/home/setting/license',
        name: Routes.licensePage.name,
        builder: (context, state) => const AppLicensePage(),
      ),

      /// HomePage / SettingPage / AppLicensePage / AppLicenseDetailPage
      GoRoute(
        path: '/home/setting/license/detail',
        name: Routes.licenseDetailPage.name,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return AppLicenseDetailPage(
            package: extra['package'],
            licenseEntries: extra['licenseEntries'],
          );
        },
      ),

      /// HomePage / SettingPage / DevPage
      GoRoute(
        path: '/home/setting/dev',
        name: Routes.devPage.name,
        builder: (context, state) => const DevPage(),
      ),

      /// HomePage / SettingPage / DevPage / LogPage
      GoRoute(
        path: '/home/setting/dev/log',
        name: Routes.devLogPage.name,
        builder: (context, state) => const LogPage(),
      ),

      /// HomePage / SettingPage / DevPage / ComponentPage
      GoRoute(
        path: '/home/setting/dev/component',
        name: Routes.devComponentPage.name,
        builder: (context, state) => const ComponentPage(),
      ),

      /// HomePage / SettingPage / DevPage / LocalDataPage
      GoRoute(
        path: '/home/setting/dev/local_data',
        name: Routes.devLocalDataPage.name,
        builder: (context, state) => const LocalDataPage(),
      ),

      /// HomePage / SettingPage / DevPage / LogoutDialog
      GoRoute(
        path: '/home/setting/dev/local_data/logout',
        name: Routes.devLogoutDialog.name,
        pageBuilder: (context, state) => const DialogPage(
          route: Routes.devLogoutDialog,
          child: LogoutDialog(),
        ),
      ),

      /// HomePage / SettingPage / DevPage / LoginBottomSheet
      GoRoute(
        path: '/home/setting/dev/local_data/login',
        name: Routes.devLoginBottomSheet.name,
        pageBuilder: (context, state) => const BottomSheetPage(
          route: Routes.devLoginBottomSheet,
          child: LoginBottomSheet(),
        ),
      ),
    ],
  );
}
