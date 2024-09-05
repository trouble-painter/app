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

/// Create room click
class HomePageCreateRoomClickEvent extends HomePageEvent {}

/// Join room click
class HomePageJoinRoomClickEvent extends HomePageEvent {}

/// Rejoin room click
class HomePageRejoinRoomClickEvent extends HomePageEvent {}

/// Quick start click
class HomePageQuickStartClickEvent extends HomePageEvent {}
