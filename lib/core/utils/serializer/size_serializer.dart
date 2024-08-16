import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class SizeSerializer implements JsonConverter<Size, Map<String, dynamic>> {
  const SizeSerializer();

  @override
  Size fromJson(Map<String, dynamic>? json) {
    return json?['w'] == null ? Size.zero : Size(json!['w'], json['h']);
  }

  @override
  Map<String, dynamic> toJson(Size size) => {
        'w': size.width,
        'h': size.height,
      };
}
