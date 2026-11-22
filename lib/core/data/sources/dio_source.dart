import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trouble_painter/core/utils/log/dio_logger.dart';

abstract class DioSource {
  static final $ = Provider.autoDispose<Dio>((ref) {
    return Dio()..interceptors.add(DioLogger());
  });
}
