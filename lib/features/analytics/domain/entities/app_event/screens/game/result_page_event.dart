part of '../../app_event.dart';

sealed class ResultPageEvent extends AppEvent {
  const ResultPageEvent() : super(AppEventScreen.resultPage);
}

/// Citizens win
class ResultPageCitizensWinEvent extends ResultPageEvent {}

/// Mafia wins by keyword
class ResultPageMafiaWinsByKeywordEvent extends ResultPageEvent {}

/// Mafia wins by vote
class ResultPageMafiaWinsByVoteEvent extends ResultPageEvent {}
