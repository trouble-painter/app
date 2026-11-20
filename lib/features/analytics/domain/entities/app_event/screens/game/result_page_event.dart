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

/// A player picked below the canvas to see their strokes
class ResultPageUserSelectedEvent extends ResultPageEvent {
  final bool isMafia;

  ResultPageUserSelectedEvent({required this.isMafia});

  @override
  Map<String, Object> toJson() => {"isMafia": isMafia};
}
