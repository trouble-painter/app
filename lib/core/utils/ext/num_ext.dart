import 'package:x_pr/features/config/domain/entities/language.dart';

extension NumExt on num {
  String ordinal(Language language) {
    switch (language) {
      case Language.korean:
        return "$this번";
      case Language.english:
        if (this % 100 >= 11 && this % 100 <= 13) {
          return '${this}th';
        }
        switch (this % 10) {
          case 1:
            return '${this}st';
          case 2:
            return '${this}nd';
          case 3:
            return '${this}rd';
          default:
            return '${this}th';
        }
    }
  }

  /// returns decimal
  double get decimal {
    return (this - floor()).toDouble();
  }
}

extension IntExt on int {
  int ifZeroOrLess(int value) {
    return this <= 0 ? value : this;
  }
}


extension DoubleExt on double {
  double ifZero(double value) {
    return this == 0 ? value : this;
  }
}