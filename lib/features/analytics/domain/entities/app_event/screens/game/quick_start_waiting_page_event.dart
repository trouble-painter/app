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
