import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_pr/core/utils/log/dio_logger.dart';

abstract class DioSource {
  static final $ = AutoDisposeProvider<Dio>((ref) {
    return Dio()..interceptors.add(DioLogger());
  });
}
