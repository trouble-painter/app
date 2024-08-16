import 'package:x_pr/core/localization/generated/l10n.dart';

enum GameCategory {
  animal,
  object;

  String get intl => switch (this) {
        GameCategory.animal => S.current.animal,
        GameCategory.object => S.current.object,
      };
}
