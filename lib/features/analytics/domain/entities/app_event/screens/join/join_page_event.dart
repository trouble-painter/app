part of '../../app_event.dart';

sealed class JoinPageEvent extends AppEvent {
  const JoinPageEvent() : super(AppEventScreen.joinPage);
}

/// Paste click
class JoinPagePasteClickEvent extends JoinPageEvent {}

/// Submit
class JoinPageSubmitEvent extends JoinPageEvent {}

/// Back click
class JoinPageBackClickEvent extends JoinPageEvent {}
