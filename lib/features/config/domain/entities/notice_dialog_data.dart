import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/core/utils/time/network_time_ext.dart';
import 'package:x_pr/features/config/domain/entities/notice_dialog_history.dart';

part 'notice_dialog_data.freezed.dart';
part 'notice_dialog_data.g.dart';

@freezed
class NoticeDialogData with _$NoticeDialogData {
  factory NoticeDialogData({
    required int version,
    required int exposureIntervalHour,
    required bool isShow,
    required DateTime startedAt,
    required DateTime endedAt,
    required String title,
    required String desc,
    Uri? url,
  }) = _NoticeDialogData;

  NoticeDialogData._();

  bool isShowNotice(NoticeDialogHistory? history) {
    final now = NetworkTime.now;

    /// Check isShow
    if (!isShow) return false;

    /// Check exposure time
    final isAfterStarted = now.isAfter(startedAt);
    final isBeforeEnded = now.isBefore(endedAt);
    if (!isAfterStarted || !isBeforeEnded) return false;

    /// Check first exposure
    if (history == null) return true;

    /// Check version
    if (history.version < version) return true;

    /// Check exposure interval
    final timeElapsedSinceExposure = now.difference(history.exposedAt);
    final interval = Duration(hours: exposureIntervalHour);
    return timeElapsedSinceExposure >= interval;
  }

  factory NoticeDialogData.fromJson(Map<String, dynamic> json) =>
      _$NoticeDialogDataFromJson(json);
}
