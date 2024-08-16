import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_stroke.freezed.dart';
part 'game_stroke.g.dart';

@freezed
class GameStroke with _$GameStroke {
  factory GameStroke({
    required List<double> x,
    required List<double> y,
    required List<double> t,
  }) = _GameStroke;

  const GameStroke._();
  int get length => x.length;
  bool get isEmpty => x.isEmpty;

  factory GameStroke.fromJson(Map<String, dynamic> json) =>
      _$GameStrokeFromJson(json);

  GameStroke sublist(int start, int end) {
    return copyWith(
      x: x.sublist(start, end),
      y: y.sublist(start, end),
      t: t.sublist(start, end),
    );
  }

  GameStroke add(GameStroke other) {
    return copyWith(
      x: x + other.x,
      y: y + other.y,
      t: t + other.t,
    );
  }
}
