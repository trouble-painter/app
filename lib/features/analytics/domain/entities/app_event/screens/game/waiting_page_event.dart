part of '../../app_event.dart';

sealed class WaitingPageEvent extends AppEvent {
  const WaitingPageEvent() : super(AppEventScreen.waitingPage);
}

/// Exposure
class WaitingPageExposureEvent extends WaitingPageEvent {}

/// Start click
class WaitingPageStartClickEvent extends WaitingPageEvent {}

/// Invite click
class WaitingPageInviteClickEvent extends WaitingPageEvent {}
