import 'package:url_launcher/url_launcher.dart';
import 'package:x_pr/core/utils/log/logger.dart';

extension UriExt on Uri {
  /// Launch browser
  void launchBrowser({LaunchMode? launchMode}) async {
    try {
      if (await canLaunchUrl(this)) {
        launchUrl(
          this,
          mode: launchMode ?? LaunchMode.inAppWebView,
        );
      }
    } catch (e, s) {
      Logger.e('Failed to launchBrowser', e, s);
    }
  }
}
