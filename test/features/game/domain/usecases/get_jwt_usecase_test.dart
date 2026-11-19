import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/domain/entities/auth_state.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/entities/sign_in_method.dart';
import 'package:trouble_painter/features/auth/domain/services/auth_service.dart';
import 'package:trouble_painter/features/auth/domain/usecases/refresh_access_token_usecase.dart';
import 'package:trouble_painter/features/config/domain/services/config_service.dart';
import 'package:trouble_painter/features/game/domain/usecases/get_jwt_usecase.dart';

import '../../../../helpers/fake_jwt.dart';

class _FakeAuthService extends AuthService {
  _FakeAuthService(this.refreshError);
  final Object refreshError;
  int loginCount = 0;

  static final loginJwt =
      Jwt(userId: 2, refreshToken: 'new-refresh', accessToken: 'new-access');

  @override
  Future<Result<Jwt>> refreshAccessToken() async => throw refreshError;

  @override
  Future<Result<AuthState>> login(SignInMethod signInMethod) async {
    loginCount++;
    return Success(
      AuthState(jwt: loginJwt, idToken: '', signInMethod: signInMethod),
    );
  }
}

void main() {
  final expiredState = Authenticated(
    AuthState(
      jwt: Jwt(
        userId: 1,
        refreshToken: 'refresh',
        accessToken: fakeAccessToken(
          exp: DateTime.now().subtract(const Duration(hours: 1)),
        ),
      ),
      idToken: '',
      signInMethod: SignInMethod.anonymous,
    ),
  );

  GetJwtUsecase usecase(AuthService authService) => GetJwtUsecase(
        authService: authService,
        configService: ConfigService(),
        authServiceState: expiredState,
      );

  group('GetJwtUsecase with an expired access token', () {
    test('signs in again when the refresh token is rejected', () async {
      final authService =
          _FakeAuthService(RefreshAccessTokenException.rejected);

      final jwt = await usecase(authService).call();

      expect(jwt, _FakeAuthService.loginJwt);
      expect(authService.loginCount, 1);
    });

    test('does not sign in again on a network error or 5xx', () async {
      final error = DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: 'offline',
      );
      final authService = _FakeAuthService(error);

      await expectLater(usecase(authService).call(), throwsA(error));
      expect(authService.loginCount, 0);
    });
  });
}
