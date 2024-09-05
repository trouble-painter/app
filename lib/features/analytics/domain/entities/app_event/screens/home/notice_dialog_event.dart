part of '../../app_event.dart';

sealed class NoticeDialogEvent extends AppEvent {
  const NoticeDialogEvent() : super(AppEventScreen.noticeDialog);
}

/// Exposure
class NoticeDialogExposureEvent extends NoticeDialogEvent {}

/// Url click
class NoticeDialogUrlClickEvent extends NoticeDialogEvent {}
