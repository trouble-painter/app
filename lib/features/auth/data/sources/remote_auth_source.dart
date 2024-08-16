import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/data/sources/dio_source.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/id_token.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class RemoteAuthSource {
  static final $ = AutoDisposeProvider<RemoteAuthSource>((ref) {
    return RemoteAuthSource(
      dio: ref.read(DioSource.$),
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  final Dio dio;
  final Config Function() getConfig;
  const RemoteAuthSource({
    required this.dio,
    required this.getConfig,
  });

  String getUrl(String path) => getConfig().baseUrl.resolve(path).toString();

  Future<Result<Jwt>> signIn(IdToken idToken, SignInMethod signInMethod) async {
    try {
      switch (signInMethod) {
        case SignInMethod.google:
          throw UnimplementedError();
        case SignInMethod.apple:
          throw UnimplementedError();
        case SignInMethod.anonymous:
          final res = await dio.post(getUrl("/api/v1/auth/anonymous-signin"));
          return Success(Jwt.fromJson(res.data));
      }
    } catch (e, s) {
      Logger.e("Failed to signIn", e, s);
      return Failure(e);
    }
  }

  Future<Result<void>> signOut() async {
    return const Success(null);
  }

  Future<Result<Jwt>> reissue(String refreshToken) async {
    try {
      final res = await dio.post(
        getUrl("/api/v1/auth/reissue"),
        data: {
          "refreshToken": refreshToken,
        },
      );
      return Success(Jwt.fromJson(res.data));
    } catch (e, s) {
      Logger.e("Failed to reissue", e, s);
      return Failure(e);
    }
  }
}
