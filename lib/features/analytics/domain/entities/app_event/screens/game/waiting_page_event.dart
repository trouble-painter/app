part of '../../app_event.dart';

sealed class WaitingPageEvent extends AppEvent {
  const WaitingPageEvent() : super(AppEventScreen.waitingPage);
}

/// Exposure
class WaitingPageExposureEvent extends WaitingPageEvent {}

/// Start click
class WaitingPageStartClickEvent extends WaitingPageEvent {}

/// Ready click (non-host only)
class WaitingPageReadyClickEvent extends WaitingPageEvent {}

/// Ready cancel click (non-host only)
class WaitingPageReadyCancelClickEvent extends WaitingPageEvent {}

/// Invite click
class WaitingPageInviteClickEvent extends WaitingPageEvent {}

/// Rule setting click (host only)
class WaitingPageRuleClickEvent extends WaitingPageEvent {}
