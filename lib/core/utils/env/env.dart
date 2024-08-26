// ignore_for_file: non_constant_identifier_names
import 'package:x_pr/core/utils/env/flavor.dart';
import 'package:x_pr/core/utils/log/logger.dart';

class Env {
  static late final Flavor FLAVOR;
  static late final String BASE_URL;
  static late final String BASE_SOCKET_URL;
  static late final String ERROR_WEBHOOK_URL;
  static late final String INVITE_URL;
  static late final String AOS_GOOGLE_CLIENT_ID;
  static late final String IOS_GOOGLE_CLIENT_ID;

  static void load(Map<String, String> map) {
    FLAVOR = Flavor.fromString(map['FLAVOR']!);
    BASE_URL = map['BASE_URL']!;
    BASE_SOCKET_URL = map['BASE_SOCKET_URL']!;
    ERROR_WEBHOOK_URL = map['ERROR_WEBHOOK_URL']!;
    INVITE_URL = map['INVITE_URL']!;
    AOS_GOOGLE_CLIENT_ID = map['AOS_GOOGLE_CLIENT_ID']!;
    IOS_GOOGLE_CLIENT_ID = map['IOS_GOOGLE_CLIENT_ID']!;
    Logger.d('👅 Flavor : $FLAVOR');
  }
}
