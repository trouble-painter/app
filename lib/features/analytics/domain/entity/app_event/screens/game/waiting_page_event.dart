part of '../../app_event.dart';

sealed class WaitingPageEvent extends AppEvent {
  const WaitingPageEvent() : super(AppEventScreen.waitingPage);
}

/// Start click
class WaitingPageStartClickEvent extends WaitingPageEvent {}

/// Invite click
class WaitingPageInviteClickEvent extends WaitingPageEvent {}

/// Back
class WaitingPageBackClickEvent extends WaitingPageEvent {}

class WaitingPageBackConfirmEvent extends WaitingPageEvent {}

class WaitingPageBackCancelEvent extends WaitingPageEvent {}
