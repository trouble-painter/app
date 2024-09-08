import 'package:x_pr/features/config/domain/entities/language.dart';

class LanguageBottomSheetState {
  final Language language;
  final bool isBusy;

  const LanguageBottomSheetState({
    required this.language,
    required this.isBusy,
  });

  LanguageBottomSheetState copyWith({
    Language? language,
    bool? isBusy,
  }) {
    return LanguageBottomSheetState(
      language: language ?? this.language,
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
