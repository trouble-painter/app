part of '../../app_event.dart';

sealed class GuessPageEvent extends AppEvent {
  const GuessPageEvent() : super(AppEventScreen.guessPage);
}

/// Exposure
class GuessPageExposureEvent extends GuessPageEvent {}

/// Submit
class GuessPageSubmitEvent extends GuessPageEvent {
  final int remainMs;
  final bool isEnter;

  GuessPageSubmitEvent({
    required this.remainMs,
    required this.isEnter,
  });
  @override
  Map<String, Object> toJson() => {
        "remainMs": remainMs,
        "isEnter": isEnter,
      };
}
