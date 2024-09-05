import 'package:freezed_annotation/freezed_annotation.dart';

part 'admob.freezed.dart';
part 'admob.g.dart';

@freezed
class Admob with _$Admob {
  factory Admob({
    required String appId,
    required String quickStartRewardId,
  }) = _Admob;

  Admob._();

  factory Admob.fromJson(Map<String, dynamic> json) => _$AdmobFromJson(json);

  factory Admob.empty() => Admob(
        appId: "",
        quickStartRewardId: "",
      );
}
