part of 'profile.dart';

enum ProfileSize {
  icon,
  small,
  regular,
  large;

  double get diameter => switch (this) {
        ProfileSize.icon => 18,
        ProfileSize.small => 50,
        ProfileSize.regular => 56,
        ProfileSize.large => 86,
      };

  double get hatWidth => switch (this) {
        ProfileSize.icon => 5.22,
        ProfileSize.small => 14.5,
        ProfileSize.regular => 16.2,
        ProfileSize.large => 24.9,
      };

  double get hatTop => switch (this) {
        ProfileSize.icon => 3.96,
        ProfileSize.small => 11,
        ProfileSize.regular => 12.32,
        ProfileSize.large => 18.92,
      };
}
