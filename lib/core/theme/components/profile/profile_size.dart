part of 'profile.dart';

enum ProfileSize {
  icon(18),
  mini(24),
  small(50),
  regular(56),
  large(86);

  const ProfileSize(this.diameter);
  final double diameter;

  double get hatWidth => diameter * 0.29;

  double get hatTop => diameter * 0.22;
}
