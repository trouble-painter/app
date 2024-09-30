part of '../../app_event.dart';

sealed class OnboardingPageEvent extends AppEvent {
  const OnboardingPageEvent() : super(AppEventScreen.onboardingPage);
}

/// Tutorial view
class OnboardingPageTutorialViewEvent extends OnboardingPageEvent {
  OnboardingPageTutorialViewEvent({
    required this.index,
  });

  final int index;

  @override
  Map<String, Object> toJson() => {
        "index": index,
      };
}
