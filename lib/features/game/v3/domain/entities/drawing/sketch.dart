import 'package:flutter/material.dart';
import 'package:x_pr/core/utils/serializer/color_serializer.dart';
import 'package:x_pr/core/utils/serializer/size_serializer.dart';
import 'package:x_pr/features/game/v3/domain/entities/drawing/stroke.dart';

class Sketch {
  final int userId;
  final List<Stroke> strokeList;
  final Size canvasSize;
  final Color color;

  Sketch({
    required this.userId,
    required this.strokeList,
    required this.canvasSize,
    required this.color,
  });

  factory Sketch.empty() => Sketch(
        userId: -1,
        strokeList: [],
        canvasSize: Size.zero,
        color: Colors.black,
      );

  factory Sketch.fromJson(Map<String, dynamic> json) {
    return Sketch(
      userId: json['userId'] ?? -1,
      strokeList: (json['strokeList'] ?? [])
          .map<Stroke>((json) => Stroke.fromJson(json))
          .toList(),
      canvasSize: const SizeSerializer().fromJson(json['canvasSize']),
      color: const ColorSerializer().fromJson(json['color'] ?? 'FFFFFF'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "strokeList": strokeList.map((stroke) => stroke.toJson()).toList(),
      "canvasSize": const SizeSerializer().toJson(canvasSize),
      "color": const ColorSerializer().toJson(color),
    };
  }

  Sketch copyWith({
    int? userId,
    List<Stroke>? strokeList,
    Size? canvasSize,
    Color? color,
  }) {
    return Sketch(
      userId: userId ?? this.userId,
      strokeList: strokeList ?? this.strokeList,
      canvasSize: canvasSize ?? this.canvasSize,
      color: color ?? this.color,
    );
  }
}
