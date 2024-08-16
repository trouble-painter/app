import 'package:freezed_annotation/freezed_annotation.dart';

class TimeSerializer implements JsonConverter<DateTime, String> {
  const TimeSerializer();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime date) => date.toUtc().toIso8601String();
}
