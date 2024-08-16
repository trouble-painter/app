import 'package:dio/dio.dart';
import 'package:x_pr/core/utils/log/logger.dart';

class DioLogger extends InterceptorsWrapper {
  DioLogger({
    void Function(RequestOptions options)? onRequest,
  }) : _onRequest = onRequest;

  /// Call by reference
  final void Function(RequestOptions options)? _onRequest;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _onRequest?.call(options);
    Logger.i(
      "🟠 onRequest: [${options.method}] ${options.path}\n🔖 Authorization | ${options.headers['Authorization']}\nData | ${options.data}",
    );
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.i(
      "🟢 onResponse: [${response.statusCode}] ${response.requestOptions.path}\n${response.headers["content-type"]} | \n${response.data}",
    );
    return handler.next(response);
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    Logger.i(
      "🔴 onError: [${e.response?.statusCode}] ${e.requestOptions.path}\n${e.response?.data}",
    );
    return handler.next(e);
  }
}
