import 'package:flutter/material.dart';

abstract class TypoPrimary {
  const TypoPrimary({
    required this.name,
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
  });

  final String name;
  final FontWeight regular;
  final FontWeight medium;
  final FontWeight semiBold;
  final FontWeight bold;
}

class Pretendard implements TypoPrimary {
  const Pretendard();

  @override
  final String name = 'pretendard';

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight medium = FontWeight.w500;

  @override
  final FontWeight semiBold = FontWeight.w600;

  @override
  final FontWeight bold = FontWeight.w700;
}
