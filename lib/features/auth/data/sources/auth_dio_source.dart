import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/utils/log/dio_logger.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/auth/domain/services/auth_service.dart';

abstract class AuthDioSource {
  static final $ = AutoDisposeProvider<Dio>((ref) {
    final authServiceState = ref.read(AuthService.$);
    final Jwt? jwt = switch (authServiceState) {
      Unauthenticated() => null,
      Authenticated(authState: final authState) => authState.jwt,
    };
    return Dio()
      ..interceptors.add(
        DioLogger(
          onRequest: (options) {
            if (jwt != null) {
              options.headers['Authorization'] = 'bearer ${jwt.accessToken}';
            }
          },
        ),
      );
  });
}
