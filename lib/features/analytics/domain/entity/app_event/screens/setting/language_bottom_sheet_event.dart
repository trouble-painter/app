part of '../../app_event.dart';

sealed class LanguageBottomSheetEvent extends AppEvent {
  LanguageBottomSheetEvent() : super(AppEventScreen.languageBottomSheet);
}

/// Update
class LanguageBottomSheetUpdateEvent extends LanguageBottomSheetEvent {
  final Language language;

  LanguageBottomSheetUpdateEvent(this.language);

  @override
  Map<String, Object> toJson() => {
        "locale": language.locale.toString(),
      };
}
