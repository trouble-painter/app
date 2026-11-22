import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';
import 'package:trouble_painter/core/utils/platform/platform_info.dart';
import 'package:trouble_painter/core/utils/time/network_time_ext.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/review/domain/entities/in_app_review_trigger.dart';

class AppReviewService {
  static final $ = Provider<AppReviewService>((ref) => AppReviewService(ref));

  /// Wait before asking so the review sheet does not cover the screen entry
  static const Duration requestDelay = Duration(seconds: 2);

  /// App Store allows 3 prompts per 365 days
  static const Duration iosRequestInterval = Duration(days: 122);

  /// Play Store: once a month
  static const Duration androidRequestInterval = Duration(days: 30);

  final Ref ref;
  AppReviewService(this.ref);

  InAppReview get _inAppReview => InAppReview.instance;
  Config get _config => ref.read(ConfigService.$);

  Duration? get _requestInterval {
    if (PlatformInfo.isIOS) return iosRequestInterval;
    if (PlatformInfo.isAndroid) return androidRequestInterval;
    return null;
  }

  bool _isDue(InAppReviewTrigger trigger, Duration interval) {
    final lastRequestedAt = _config.lastInAppReviewRequestedAt;
    return switch (trigger) {
      InAppReviewTrigger.firstGameEnd => lastRequestedAt == null,
      InAppReviewTrigger.homeEntry => lastRequestedAt != null &&
          NetworkTime.now.difference(lastRequestedAt) >= interval,
    };
  }

  /// Requests the in-app review if [trigger] is due; returns whether it did.
  Future<bool> requestIfDue(InAppReviewTrigger trigger) async {
    try {
      final interval = _requestInterval;
      if (interval == null || !_isDue(trigger, interval)) return false;
      if (!await _inAppReview.isAvailable()) return false;

      await ref
          .read(ConfigService.$.notifier)
          .updateLastInAppReviewRequestedAt(NetworkTime.now);
      await Future.delayed(requestDelay);
      await _inAppReview.requestReview();
      return true;
    } catch (e, s) {
      Logger.e("Failed to request in-app review", e, s);
      return false;
    }
  }

  /// Opens the store page where the user can write a review.
  Future<void> openStoreReview() async {
    try {
      await _inAppReview.openStoreListing(appStoreId: _config.appId.ios);
    } catch (e, s) {
      Logger.e("Failed to open store review", e, s);
    }
  }
}
