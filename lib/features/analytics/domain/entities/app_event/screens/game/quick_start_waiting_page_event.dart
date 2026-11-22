part of '../../app_event.dart';

sealed class QuickStartWaitingPageEvent extends AppEvent {
  const QuickStartWaitingPageEvent()
      : super(AppEventScreen.quickStartWaitingPage);
}

/// Exposure
class QuickStartWaitingPageExposureEvent extends QuickStartWaitingPageEvent {}

/// Mini game click event
class QuickStartWaitingPageMiniGameClickEvent
    extends QuickStartWaitingPageEvent {}

/// Match found: the accept step is shown
class QuickStartWaitingPageMatchFoundExposureEvent
    extends QuickStartWaitingPageEvent {}

/// Accept click
class QuickStartWaitingPageMatchAcceptClickEvent
    extends QuickStartWaitingPageEvent {}

/// Removed from the match for not accepting in time
class QuickStartWaitingPageMatchDeclinedEvent
    extends QuickStartWaitingPageEvent {}
