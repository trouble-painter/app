// ignore_for_file: non_constant_identifier_names
import 'package:flutter/foundation.dart';
import 'package:trouble_painter/core/utils/env/flavor.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';

class Env {
  static late final Flavor FLAVOR;
  static late final String BASE_URL;
  static late final String BASE_SOCKET_URL;
  static late final String INVITE_URL;
  static late final String AOS_GOOGLE_CLIENT_ID;
  static late final String IOS_GOOGLE_CLIENT_ID;

  /// `--dart-define=LOCAL_SERVER=<host>:<port>` connects a debug build to a
  /// local server (`make run`) over plain http/ws.
  static const String _localServer = String.fromEnvironment('LOCAL_SERVER');

  /// Remote Config must not override the server address then.
  static bool get isLocalServer => kDebugMode && _localServer.isNotEmpty;

  static void load(Map<String, String> map) {
    FLAVOR = Flavor.fromString(map['FLAVOR']!);
    BASE_URL = isLocalServer ? 'http://$_localServer' : map['BASE_URL']!;
    BASE_SOCKET_URL =
        isLocalServer ? 'ws://$_localServer' : map['BASE_SOCKET_URL']!;
    INVITE_URL = map['INVITE_URL']!;
    AOS_GOOGLE_CLIENT_ID = map['AOS_GOOGLE_CLIENT_ID']!;
    IOS_GOOGLE_CLIENT_ID = map['IOS_GOOGLE_CLIENT_ID']!;
    Logger.d('👅 Flavor : $FLAVOR');
    if (isLocalServer) Logger.d('👅 Local server : $_localServer');
  }
}
