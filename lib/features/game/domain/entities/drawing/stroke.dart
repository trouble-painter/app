import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stroke.freezed.dart';
part 'stroke.g.dart';

@freezed
class Stroke with _$Stroke {
  factory Stroke({
    required List<double> x,
    required List<double> y,
    required List<double> t,
  }) = _Stroke;

  const Stroke._();
  int get length => x.length;
  bool get isEmpty => x.isEmpty;

  factory Stroke.fromJson(Map<String, dynamic> json) => _$StrokeFromJson(json);

  Stroke sublist(int start, int end) {
    return copyWith(
      x: x.sublist(start, end),
      y: y.sublist(start, end),
      t: t.sublist(start, end),
    );
  }

  Stroke add(Stroke other) {
    return copyWith(
      x: x + other.x,
      y: y + other.y,
      t: t + other.t,
    );
  }

  double get strokeLength {
    if (length <= 1) {
      return 0;
    }

    double totalDistance = 0.0;
    for (int i = 0; i < length - 2; i++) {
      final dx = (x[i + 1] - x[i]).abs();
      final dy = (y[i + 1] - y[i]).abs();
      totalDistance += sqrt(dx * dx + dy * dy);
    }

    return totalDistance;
  }
}
