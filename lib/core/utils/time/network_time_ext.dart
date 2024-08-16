import 'package:ntp/ntp.dart';
import 'package:x_pr/core/utils/log/logger.dart';

class NetworkTime {
  /// Network time protocol base offset
  static Duration _ntpOffset = Duration.zero;

  /// Sync network time protocol
  static Future<void> init() async {
    try {
      final DateTime deviceTime = DateTime.now().toLocal();
      final ntpOffsetMs = await NTP.getNtpOffset(localTime: deviceTime);
      _ntpOffset = Duration(milliseconds: ntpOffsetMs);
    } catch (e) {
      Logger.e("Failed to init network time", e);
    }
  }

  /// Current local time synchronized with Network time protocol
  static DateTime get now => DateTime.now().toLocal().add(_ntpOffset);
}
