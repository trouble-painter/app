import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/domain/entities/result.dart';
import 'package:x_pr/core/utils/log/logger.dart';
import 'package:x_pr/features/auth/data/sources/auth_dio_source.dart';
import 'package:x_pr/features/auth/domain/entities/jwt.dart';
import 'package:x_pr/features/config/domain/entities/config.dart';
import 'package:x_pr/features/config/domain/services/config_service.dart';

class RemoteGameSource {
  static final $ = Provider<RemoteGameSource>((ref) {
    return RemoteGameSource(
      authDio: ref.read(AuthDioSource.$),
      getConfig: () => ref.read(ConfigService.$),
    );
  });

  const RemoteGameSource({
    required Dio authDio,
    required Config Function() getConfig,
  })  : _getConfig = getConfig,
        _dio = authDio;

  final Dio _dio;
  final Config Function() _getConfig;
  String _getUrl(String path) => _getConfig().baseUrl.resolve(path).toString();

  Future<Result<String?>> getPlayingRoomId(Jwt jwt) async {
    try {
      final result = await _dio.get(_getUrl("api/v1/playing-room"));
      final String? roomId = result.data["roomId"];
      return Success(roomId);
    } catch (e, s) {
      Logger.e("Failed to getPlayingRoomid", e, s);
      return Failure(e);
    }
  }
}
