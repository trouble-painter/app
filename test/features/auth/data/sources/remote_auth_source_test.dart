import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/features/auth/data/sources/remote_auth_source.dart';
import 'package:trouble_painter/features/auth/domain/entities/jwt.dart';
import 'package:trouble_painter/features/auth/domain/usecases/refresh_access_token_usecase.dart';
import 'package:trouble_painter/features/config/domain/entities/config.dart';

import '../../../../helpers/test_env.dart';

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.respond);
  final ResponseBody Function() respond;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async =>
      respond();

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(int statusCode, Map<String, dynamic> body) {
  return ResponseBody.fromString(
    jsonEncode(body),
    statusCode,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

void main() {
  setUpAll(loadTestEnv);

  RemoteAuthSource source(ResponseBody Function() respond) {
    final config = Config.init();
    return RemoteAuthSource(
      dio: Dio()..httpClientAdapter = _FakeAdapter(respond),
      getConfig: () => config,
    );
  }

  group('RemoteAuthSource.reissue', () {
    test('returns the jwt on 200', () async {
      final result = await source(
        () => _json(200, {
          'userId': 1,
          'accessToken': 'access',
          'refreshToken': 'refresh',
        }),
      ).reissue('refresh');

      expect(result, isA<Success<Jwt>>());
      expect((result as Success<Jwt>).value.accessToken, 'access');
    });

    for (final statusCode in [400, 401]) {
      test('maps $statusCode to rejected', () async {
        final result = await source(() => _json(statusCode, {})).reissue('x');

        expect(result, isA<Failure<Jwt>>());
        expect(
          (result as Failure<Jwt>).e,
          RefreshAccessTokenException.rejected,
        );
      });
    }

    test('does not map 5xx to rejected', () async {
      final result = await source(() => _json(503, {})).reissue('x');

      expect((result as Failure<Jwt>).e, isA<DioException>());
    });

    test('does not map a network error to rejected', () async {
      final result = await source(
        () => throw DioException.connectionError(
          requestOptions: RequestOptions(),
          reason: 'offline',
        ),
      ).reissue('x');

      expect((result as Failure<Jwt>).e, isA<DioException>());
    });
  });
}
