part of '../../app_event.dart';

sealed class UpdateDialogEvent extends AppEvent {
  const UpdateDialogEvent() : super(AppEventScreen.updateDialog);
}

/// Exposure
class UpdateDialogExposureEvent extends UpdateDialogEvent {}

/// Link click
class UpdateDialogLinkClickEvent extends UpdateDialogEvent {}

/// Go to update click
class UpdateDialogGoToUpdateClickEvent extends UpdateDialogEvent {}
