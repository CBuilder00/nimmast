import 'package:dio/dio.dart';
import 'package:nimmsta_lib/src/dio_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException exc, ErrorInterceptorHandler handler) {
    DioException exception;

    if (exc.response != null) {
      exception = ResponseDioException(
        exc.requestOptions,
        exc.message ?? '',
        exc.response!.statusCode!,
      );
    } else if (exc.type == DioExceptionType.connectionTimeout ||
        exc.type == DioExceptionType.sendTimeout ||
        exc.type == DioExceptionType.receiveTimeout) {
      exception = TimeoutDioException(
        exc.requestOptions,
        exc.message ?? '',
      );
    } else {
      exception = NetworkDioException(
        exc.requestOptions,
        exc.message ?? '',
      );
    }

    super.onError(exception, handler);
  }
}
