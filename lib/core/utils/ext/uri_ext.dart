import 'package:url_launcher/url_launcher.dart';
import 'package:x_pr/core/utils/log/logger.dart';

extension UriExt on Uri {
  /// Launch browser
  Future<bool> launchBrowser({LaunchMode? launchMode}) async {
    try {
      return await launchUrl(
        this,
        mode: launchMode ?? LaunchMode.inAppWebView,
      );
    } catch (e, s) {
      Logger.e('Failed to launchBrowser', e, s);
      if (launchMode == LaunchMode.externalApplication) {
        /// If external application failed
        return launchBrowser(launchMode: LaunchMode.platformDefault);
      }
      return false;
    }
  }
}
