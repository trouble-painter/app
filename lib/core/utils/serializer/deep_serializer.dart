import 'dart:convert';

class DeepSerializer {
  const DeepSerializer();

  Map<String, dynamic> toJson(Map<String, dynamic> value) {
    final roomStr = jsonEncode(value);
    return jsonDecode(roomStr);
  }
}
