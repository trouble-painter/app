import 'package:flutter/material.dart';

abstract class TypoTertiary {
  const TypoTertiary({
    required this.name,
    required this.medium,
  });

  final String name;
  final FontWeight medium;
}

class Rubik implements TypoTertiary {
  const Rubik();

  @override
  final String name = 'rubik';

  @override
  final FontWeight medium = FontWeight.w500;
}
