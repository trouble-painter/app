import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_dialog_history.freezed.dart';
part 'notice_dialog_history.g.dart';

@freezed
class NoticeDialogHistory with _$NoticeDialogHistory {
  factory NoticeDialogHistory({
    required int version,
    required DateTime exposedAt,
  }) = _NoticeDialogHistory;

  NoticeDialogHistory._();

  factory NoticeDialogHistory.fromEmpty() => NoticeDialogHistory(
        version: -1,
        exposedAt: DateTime(0, 0, 0),
      );

  factory NoticeDialogHistory.fromJson(Map<String, dynamic> json) =>
      _$NoticeDialogHistoryFromJson(json);
}
