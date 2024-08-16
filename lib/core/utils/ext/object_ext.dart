import 'dart:convert';

extension ObjectExt on Object {
  String get pretty => const JsonEncoder.withIndent('  ').convert(this);
}
