// ignore_for_file: library_prefixes
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/component/component_page.dart';
import 'package:x_pr/app/pages/dev/dev_page.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page.dart';
import 'package:x_pr/app/pages/dev/log/log_page.dart';
import 'package:x_pr/app/pages/game/v2/lobby/game_lobby_page.dart'
    as gameLobbyV2;
import 'package:x_pr/app/pages/game/v2/room/game_room_page.dart' as gameRoomV2;
import 'package:x_pr/app/pages/game/v2/round/game_round_page.dart'
    as gameRoundV2;
import 'package:x_pr/app/pages/game/v3/game_page.dart';
import 'package:x_pr/app/pages/home/home_page.dart';
import 'package:x_pr/app/pages/join/join_page.dart';
import 'package:x_pr/app/pages/login/login_page.dart';
import 'package:x_pr/app/pages/nickname/nickname_page.dart';
import 'package:x_pr/app/pages/setting/app_license/app_license_page.dart';
import 'package:x_pr/app/pages/setting/edit_nickname/edit_nickname_page.dart';
import 'package:x_pr/app/pages/setting/setting_page.dart';
import 'package:x_pr/app/pages/splash/splash_page.dart';
import 'package:x_pr/app/routes/routes_observer.dart';
import 'package:x_pr/core/theme/components/pages/custom_page_transition.dart';
import 'package:x_pr/core/utils/ext/string_ext.dart';

part 'routes_helper.dart';

enum Routes {
  splashPage,
  nicknamePage,
  gamePage,
  homePage,
  settingPage,
  editNicknamePage,
  licensePage,
  joinPage,
  devPage,
  devLogPage,
  devLocalDataPage,
  devComponentPage,
  loginPage,
  gameV2LobbyPage,
  gameV2RoomPage,
  gameV2RoundPage,
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
      GoRoute(
        path: '/login',
        name: Routes.loginPage.name,
        builder: (context, state) => const LoginPage(),
      ),
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
        path: '/setting',
        name: Routes.settingPage.name,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/setting/editNickname',
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
        path: '/setting/license',
        name: Routes.licensePage.name,
        builder: (context, state) => const AppLicensePage(),
      ),
      GoRoute(
        path: '/join',
        name: Routes.joinPage.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const JoinPage(),
            name: Routes.joinPage.name,
            isBlur: true,
          );
        },
      ),

      /// Game
      GoRoute(
        path: '/game',
        name: Routes.gamePage.name,
        builder: (context, state) => const GamePage(),
      ),

      /// Game : v2
      GoRoute(
        path: '/game/v2/lobby',
        name: Routes.gameV2LobbyPage.name,
        builder: (context, state) => const gameLobbyV2.GameLobbyPage(),
      ),
      GoRoute(
        path: '/game/v2/room/:id',
        name: Routes.gameV2RoomPage.name,
        builder: (context, state) => gameRoomV2.GameRoomPage(
          roomId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/game/v2/round/:id',
        name: Routes.gameV2RoundPage.name,
        builder: (context, state) => gameRoundV2.GameRoundPage(
          roundId: state.pathParameters['id']!,
        ),
      ),

      /// Dev
      GoRoute(
        path: '/dev',
        name: Routes.devPage.name,
        builder: (context, state) => const DevPage(),
      ),
      GoRoute(
        name: Routes.devLogPage.name,
        path: '/dev/log',
        builder: (context, state) => const LogPage(),
      ),
      GoRoute(
        name: Routes.devLocalDataPage.name,
        path: '/dev/local_data',
        builder: (context, state) => const LocalDataPage(),
      ),
      GoRoute(
        path: '/dev/component',
        name: Routes.devComponentPage.name,
        builder: (context, state) => const ComponentPage(),
      ),
    ],
  );
}
