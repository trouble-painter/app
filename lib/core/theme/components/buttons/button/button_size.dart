part of 'button.dart';

enum ButtonSize {
  small,
  regular,
  large;

  double get height => switch (this) {
        ButtonSize.small => 42,
        ButtonSize.regular => 46,
        ButtonSize.large => 54,
      };

  double get iconSize => switch (this) {
        ButtonSize.small => 22,
        _ => 24,
      };

  EdgeInsets get padding => switch (this) {
        ButtonSize.small => const EdgeInsets.all(
            10,
          ),
        ButtonSize.regular => const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 14,
          ),
        ButtonSize.large => const EdgeInsets.all(
            16,
          ),
      };

  TextStyle getTextStyle(BuildContext context) => switch (this) {
        _ => context.typo.subHeader1,
      };
}
