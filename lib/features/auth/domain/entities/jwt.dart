import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt.freezed.dart';
part 'jwt.g.dart';

typedef RefreshToken = String;
typedef AccessToken = String;

@freezed
class Jwt with _$Jwt {
  factory Jwt({
    required int userId,
    required RefreshToken refreshToken,
    required AccessToken accessToken,
  }) = _Jwt;

  factory Jwt.fromJson(Map<String, dynamic> json) => _$JwtFromJson(json);
}
