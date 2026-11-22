import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/utils/log/dio_logger.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/services/auth_service.dart';

abstract class AuthDioSource {
  static final $ = Provider<Dio>((ref) {
    return Dio()
      ..interceptors.add(
        DioLogger(
          onRequest: (options) {
            /// Read on every request so a refreshed token is used.
            final Jwt? jwt = switch (ref.read(AuthService.$)) {
              Unauthenticated() => null,
              Authenticated(authState: final authState) => authState.jwt,
            };
            if (jwt != null) {
              options.headers['Authorization'] = 'Bearer ${jwt.accessToken}';
            }
          },
        ),
      );
  });
}
