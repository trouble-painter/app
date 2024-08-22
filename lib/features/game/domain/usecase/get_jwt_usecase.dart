import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/domain/usecases/base_usecase.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class GetJwtUsecaseParam {}

class GetJwtUsecase implements BaseUsecase<GetJwtUsecaseParam, Future<Jwt>> {
  static final $ = AutoDisposeProvider<GetJwtUsecase>((ref) {
    return GetJwtUsecase(
      authServiceState: ref.read(AuthService.$),
      authService: ref.read(AuthService.$.notifier),
      configService: ref.read(ConfigService.$.notifier),
    );
  });

  GetJwtUsecase({
    required this.authService,
    required this.configService,
    required this.authServiceState,
  });
  final AuthService authService;
  final ConfigService configService;
  final AuthServiceState authServiceState;

  @override
  Future<Jwt> call([GetJwtUsecaseParam? param]) async {
    switch (authServiceState) {
      case Unauthenticated():
        return await _login();
      case Authenticated(authState: final authState):
        final isExpired = JwtDecoder.isExpired(authState.jwt.accessToken);
        if (isExpired) {
          return await _refresh();
        } else {
          return authState.jwt;
        }
    }
  }

  Future<Jwt> _login() async {
    final result = await authService.login(SignInMethod.anonymous);
    return switch (result) {
      Success(value: final authState) => authState.jwt,
      Failure(e: final e) => throw e,
      Cancel() => throw const Cancel(),
    };
  }

  Future<Jwt> _refresh() async {
    final result = await authService.refreshAccessToken();
    return switch (result) {
      Success(value: final jwt) => jwt,
      Failure(e: final e) => throw e,
      Cancel() => throw const Cancel(),
    };
  }
}
