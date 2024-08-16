// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x_pr/app/pages/dev/component/component_page.dart';
import 'package:x_pr/app/pages/dev/dev_page.dart';
import 'package:x_pr/app/pages/dev/gemini/gemini_page.dart';
import 'package:x_pr/app/pages/dev/local_data/local_data_page.dart';
import 'package:x_pr/app/pages/dev/log/log_page.dart';
import 'package:x_pr/app/pages/dev/socket/socket_page.dart';
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
import 'package:x_pr/core/theme/components/pages/custom_page_transition.dart';

part 'routes_helper.dart';

enum Routes {
  splash,
  nickname,
  login,
  home,
  setting,
  editNickname,
  ossLicense,
  join,
  dev,
  devLog,
  devLocalData,
  devComponent,
  devSocket,
  devGemini,
  gameV2Lobby,
  gameV2Room,
  gameV2Round,
  game,
  ;

  @override
  String toString() => name;

  static final GlobalKey<NavigatorState> navigatorKey =
      config.routerDelegate.navigatorKey;

  static BuildContext get context => Routes.navigatorKey.currentContext!;

  static final GoRouter config = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: Routes.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/nickname',
        name: Routes.nickname.name,
        builder: (context, state) => const NicknamePage(),
      ),
      GoRoute(
        path: '/login',
        name: Routes.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: Routes.home.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const HomePage(),
            isVertical: true,
          );
        },
      ),
      GoRoute(
        path: '/setting',
        name: Routes.setting.name,
        builder: (context, state) => const SettingPage(),
      ),
      GoRoute(
        path: '/setting/editNickname',
        name: Routes.editNickname.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const EditNicknamePage(),
            isBlur: true,
          );
        },
      ),
      GoRoute(
        path: '/setting/license',
        name: Routes.ossLicense.name,
        builder: (context, state) => const AppLicensePage(),
      ),
      GoRoute(
        path: '/join',
        name: Routes.join.name,
        pageBuilder: (context, state) {
          return CustomPageTransition.page(
            const JoinPage(),
            isBlur: true,
          );
        },
      ),

      /// Game
      GoRoute(
        path: '/game',
        name: Routes.game.name,
        builder: (context, state) => const GamePage(),
      ),

      /// Game : v2
      GoRoute(
        path: '/game/v2/lobby',
        name: Routes.gameV2Lobby.name,
        builder: (context, state) => const gameLobbyV2.GameLobbyPage(),
      ),
      GoRoute(
        path: '/game/v2/room/:id',
        name: Routes.gameV2Room.name,
        builder: (context, state) => gameRoomV2.GameRoomPage(
          roomId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/game/v2/round/:id',
        name: Routes.gameV2Round.name,
        builder: (context, state) => gameRoundV2.GameRoundPage(
          roundId: state.pathParameters['id']!,
        ),
      ),

      /// Dev
      GoRoute(
        path: '/dev',
        name: Routes.dev.name,
        builder: (context, state) => const DevPage(),
      ),
      GoRoute(
        name: Routes.devLog.name,
        path: '/dev/log',
        builder: (context, state) => const LogPage(),
      ),
      GoRoute(
        name: Routes.devLocalData.name,
        path: '/dev/local_data',
        builder: (context, state) => const LocalDataPage(),
      ),
      GoRoute(
        name: Routes.devSocket.name,
        path: '/dev/socket',
        builder: (context, state) => const SocketPage(),
      ),
      GoRoute(
        path: '/dev/component',
        name: Routes.devComponent.name,
        builder: (context, state) => const ComponentPage(),
      ),
      GoRoute(
        path: '/dev/gemini',
        name: Routes.devGemini.name,
        builder: (context, state) => const GeminiPage(),
      ),
    ],
  );
}
