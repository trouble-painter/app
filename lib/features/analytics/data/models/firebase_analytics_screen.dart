// ignore_for_file: constant_identifier_names
import 'package:x_pr/app/routes/routes.dart';
import 'package:x_pr/features/analytics/domain/entities/app_event/app_event.dart';

enum FirebaseAnalyticsScreen {
  splash_page,
  update_dialog,
  maintenance_dialog,
  nickname_page,
  home_page,
  notice_dialog,
  join_page,
  join_qr_page,
  join_bottom_sheet,
  game_exit_dialog,
  quick_start_waiting_page,
  waiting_page,
  ready_page,
  drawing_page,
  voting_page,
  guess_page,
  result_page,
  setting_page,
  language_bottom_sheet,
  edit_nickname_page,
  license_page,
  license_detail_page;

  factory FirebaseAnalyticsScreen.fromRoutes(Routes routes) {
    return switch (routes) {
      Routes.splashPage => splash_page,
      Routes.updateDialog => update_dialog,
      Routes.maintenanceDialog => maintenance_dialog,
      Routes.nicknamePage => nickname_page,
      Routes.homePage => home_page,
      Routes.noticeDialog => notice_dialog,
      Routes.joinPage => join_page,
      Routes.settingPage => setting_page,
      Routes.languageBottomSheet => language_bottom_sheet,
      Routes.editNicknamePage => edit_nickname_page,
      Routes.licensePage => license_page,
      _ => throw UnsupportedError(
          "$routes cannot be converted to FirebaseAnalyticsScreen",
        )
    };
  }

  factory FirebaseAnalyticsScreen.fromAppEventScreen(AppEventScreen screen) {
    return switch (screen) {
      AppEventScreen.splashPage => splash_page,
      AppEventScreen.updateDialog => update_dialog,
      AppEventScreen.maintenanceDialog => maintenance_dialog,
      AppEventScreen.nicknamePage => nickname_page,
      AppEventScreen.homePage => home_page,
      AppEventScreen.noticeDialog => notice_dialog,
      AppEventScreen.joinPage => join_page,
      AppEventScreen.joinQrPage => join_qr_page,
      AppEventScreen.joinBottomSheet => join_bottom_sheet,
      AppEventScreen.gameExitDialog => game_exit_dialog,
      AppEventScreen.quickStartWaitingPage => quick_start_waiting_page,
      AppEventScreen.waitingPage => waiting_page,
      AppEventScreen.readyPage => ready_page,
      AppEventScreen.drawingPage => drawing_page,
      AppEventScreen.votingPage => voting_page,
      AppEventScreen.guessPage => guess_page,
      AppEventScreen.resultPage => result_page,
      AppEventScreen.settingPage => setting_page,
      AppEventScreen.languageBottomSheet => language_bottom_sheet,
      AppEventScreen.editNicknamePage => edit_nickname_page,
      AppEventScreen.licensePage => license_page,
      AppEventScreen.licenseDetailPage => license_detail_page,
    };
  }
}
