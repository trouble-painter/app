import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/data/sources/dio_source.dart';
import 'package:trouble_painter/core/domain/entities/result.dart';
import 'package:trouble_painter/core/utils/log/logger.dart';

class RemoteDeveloperSource {
  static final $ = Provider.autoDispose<RemoteDeveloperSource>((ref) {
    return RemoteDeveloperSource(dio: ref.read(DioSource.$));
  });

  const RemoteDeveloperSource({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future<Result<bool>> isDeveloper({
    required Uri baseUrl,
    required String uuid,
  }) async {
    try {
      final result = await _dio.post(
        baseUrl.resolve("api/v1/developer").toString(),
        data: {"uuid": uuid},
      );
      final bool isDeveloper = result.data["isDeveloper"];
      return Success(isDeveloper);
    } catch (e, s) {
      Logger.e("Failed to check developer", e, s);
      return Failure(e);
    }
  }
}
