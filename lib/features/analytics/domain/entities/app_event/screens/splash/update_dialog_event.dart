part of '../../app_event.dart';

sealed class UpdateDialogEvent extends AppEvent {
  const UpdateDialogEvent() : super(AppEventScreen.updateDialog);
}

/// Exposure
class UpdateDialogExposureEvent extends UpdateDialogEvent {}

/// Url click
class UpdateDialogUrlClickEvent extends UpdateDialogEvent {}

/// Update click
class UpdateDialogUpdateClickEvent extends UpdateDialogEvent {}
