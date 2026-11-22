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
        /// Keeps the same height as before with the larger text:
        /// 14.6 * 2 + 18 * 1.4 (subHeader0) = 16 * 2 + 16 * 1.4 (subHeader1)
        ButtonSize.large => const EdgeInsets.symmetric(
            vertical: 14.6,
            horizontal: 16,
          ),
      };

  TextStyle getTextStyle(BuildContext context) => switch (this) {
        ButtonSize.large => context.typo.subHeader0,
        _ => context.typo.subHeader1,
      };
}
