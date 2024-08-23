import 'package:url_launcher/url_launcher.dart';
import 'package:x_pr/core/utils/log/logger.dart';

extension UriExt on Uri {
  /// Launch browser
  Future<bool> launchBrowser({LaunchMode? launchMode}) async {
    try {
      if (await canLaunchUrl(this)) {
        return await launchUrl(
          this,
          mode: launchMode ?? LaunchMode.inAppWebView,
        );
      }
      return false;
    } catch (e, s) {
      Logger.e('Failed to launchBrowser', e, s);
      return false;
    }
  }
}
