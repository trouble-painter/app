import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorSerializer implements JsonConverter<Color, String> {
  const ColorSerializer();

  @override
  Color fromJson(String json) {
    return Color(
      int.parse(json.length == 6 ? "FF$json" : json, radix: 16),
    );
  }

  @override
  String toJson(Color color) => color.value.toRadixString(16);
}
