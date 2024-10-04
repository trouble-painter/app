import 'package:flutter/material.dart';

abstract class TypoSecondary {
  const TypoSecondary({
    required this.name,
    required this.regular,
  });

  final String name;
  final FontWeight regular;
}

class BlackHanSans implements TypoSecondary {
  const BlackHanSans();

  @override
  final String name = 'blackHanSans';

  @override
  final FontWeight regular = FontWeight.w400;
}
