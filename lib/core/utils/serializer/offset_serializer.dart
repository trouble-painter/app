import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OffsetSerializer implements JsonConverter<Offset, Map<String, double>> {
  const OffsetSerializer();

  @override
  Offset fromJson(Map<String, double> json) {
    return Offset(json['dx']!, json['dy']!);
  }

  @override
  Map<String, double> toJson(Offset offset) => {
        "dx": offset.dx,
        "dy": offset.dy,
      };
}
