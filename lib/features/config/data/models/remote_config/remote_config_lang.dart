import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_pr/features/config/domain/entities/language.dart';

part 'remote_config_lang.freezed.dart';
part 'remote_config_lang.g.dart';

@freezed
class RemoteConfigLang with _$RemoteConfigLang {
  factory RemoteConfigLang({
    @Default("") String ko,
    @Default("") String en,
  }) = _RemoteConfigLang;

  RemoteConfigLang._();

  bool isEmpty(Language language) {
    return language.isKorean ? ko.isEmpty : en.isEmpty;
  }

  factory RemoteConfigLang.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigLangFromJson(json);

  factory RemoteConfigLang.fromJsonString(String jsonString) {
    return jsonString.isEmpty
        ? RemoteConfigLang()
        : RemoteConfigLang.fromJson(jsonDecode(jsonString));
  }

  String fromLang(Language language) => language.isKorean ? ko : en;
}
