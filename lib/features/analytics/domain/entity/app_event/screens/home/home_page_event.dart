part of '../../app_event.dart';

sealed class HomePageEvent extends AppEvent {
  const HomePageEvent() : super(AppEventScreen.homePage);
}

/// Tutorial view
class HomePageTutorialViewEvent extends HomePageEvent {
  HomePageTutorialViewEvent({
    required this.index,
  });

  final int index;

  @override
  Map<String, Object> toJson() => {
        "index": index,
      };
}

/// Setting click
class HomePageSettingClickEvent extends HomePageEvent {}

/// Create click
class HomePageCreateClickEvent extends HomePageEvent {}

/// Join click
class HomePageJoinClickEvent extends HomePageEvent {}

/// Rejoin click
class HomePageRejoinClickEvent extends HomePageEvent {}
