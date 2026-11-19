import 'dart:convert';

/// Unsigned JWT with the given `exp`. Only for [JwtDecoder] in tests.
String fakeAccessToken({required DateTime exp}) {
  String encode(Map<String, dynamic> json) =>
      base64Url.encode(utf8.encode(jsonEncode(json))).replaceAll('=', '');
  final header = encode({'alg': 'HS256', 'typ': 'JWT'});
  final payload = encode({'exp': exp.millisecondsSinceEpoch ~/ 1000});
  return '$header.$payload.signature';
}
