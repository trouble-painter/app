part of '../../app_event.dart';

sealed class LanguageBottomSheetEvent extends AppEvent {
  LanguageBottomSheetEvent() : super(AppEventScreen.languageBottomSheet);
}

/// Korean click
class LanguageBottomSheetKoreanClickEvent extends LanguageBottomSheetEvent {}

/// English click
class LanguageBottomSheetEnglishClickEvent extends LanguageBottomSheetEvent {}
