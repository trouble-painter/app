import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_id.freezed.dart';
part 'app_id.g.dart';

@freezed
class AppId with _$AppId {
  factory AppId({
    required String aos,
    required String ios,
  }) = _AppId;

  AppId._();

  factory AppId.fromEmpty() => AppId(aos: "", ios: "");

  factory AppId.fromJson(Map<String, dynamic> json) => _$AppIdFromJson(json);
}
