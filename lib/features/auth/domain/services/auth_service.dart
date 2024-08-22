import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/domain/entities/auth_state.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/entities/sign_in_method.dart';
import 'package:x_pr/features/auth/domain/usecases/get_auth_state_usecase.dart';
import 'package:x_pr/features/auth/domain/usecases/refresh_access_token_usecase.dart';
import 'package:x_pr/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:x_pr/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:x_pr/features/game/domain/entities/game_exception/game_exception.dart';

part 'auth_service_state.dart';

class AuthService extends Notifier<AuthServiceState> {
  static final $ = NotifierProvider<AuthService, AuthServiceState>(() {
    return AuthService();
  });

  @override
  AuthServiceState build() {
    return const Unauthenticated();
  }

  Future<void> init() async {
    final authState = await ref.read(GetAuthStateUsecase.$).call(0);
    if (authState != null) {
      state = Authenticated(authState);
    } else {
      state = const Unauthenticated();
    }
  }

  Future<Result<Jwt>> refreshAccessToken() async {
    switch (state) {
      case Unauthenticated():
        return throw RefreshAccessTokenException.unauthenticated;
      case Authenticated(authState: final authState):
        final refreshToken = authState.jwt.refreshToken;
        final param = RefreshAccessTokenParam(refreshToken: refreshToken);
        final result = await ref.read(RefreshAccessTokenUsecase.$).call(param);
        switch (result) {
          case Success(value: final jwt):
            Logger.d("🔐 AccessToken refreshed");
            state = (state as Authenticated).copyWith(
              authState: authState.copyWith(jwt: jwt),
            );
            return result;
          case Failure(e: final e):
            throw e;
          case Cancel():
            return const Cancel();
        }
    }
  }

  Future<Result<AuthState>> login(SignInMethod signInMethod) async {
    final result = await ref.read(SignInUsecase.$).call(signInMethod);
    return switch (result) {
      Success(value: final authState) =>
        (state = Authenticated(authState), result).$2,
      Failure(e: final e) => throw e,
      Cancel() => result,
    };
  }

  Future<Result<void>> logout() async {
    switch (state) {
      case Unauthenticated():
        throw GameException.unauthenticated;
      case Authenticated(authState: AuthState authState):
        final result = await ref.read(SignOutUsecase.$).call(authState);
        if (result.isSuccess) {
          state = const Unauthenticated();
        }
        return result;
    }
  }

  waiting({required int milliseconds}) {}
}
