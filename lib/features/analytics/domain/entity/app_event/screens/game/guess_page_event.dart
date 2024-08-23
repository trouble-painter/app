part of '../../app_event.dart';

sealed class GuessPageEvent extends AppEvent {
  const GuessPageEvent() : super(AppEventScreen.guessPage);
}

/// Exposure
class GuessPageExposureEvent extends GuessPageEvent {}

/// Hint click
class GuessPageHintClickEvent extends GuessPageEvent {
  final int remainMs;

  GuessPageHintClickEvent({required this.remainMs});
  @override
  Map<String, Object> toJson() => {
        "remainMs": remainMs,
      };
}

/// Submit click
class GuessPageSubmitClickEvent extends GuessPageEvent {
  final int remainMs;

  GuessPageSubmitClickEvent({required this.remainMs});
  @override
  Map<String, Object> toJson() => {
        "remainMs": remainMs,
      };
}

/// Enter click
class GuessPageEnterClickEvent extends GuessPageEvent {
  final int remainMs;

  GuessPageEnterClickEvent({required this.remainMs});
  @override
  Map<String, Object> toJson() => {
        "remainMs": remainMs,
      };
}
