import 'package:dio/dio.dart';
import 'package:nimmsta_lib/nimmsta_lib.dart';
import 'package:nimmsta_lib/src/error_interceptor.dart';

class DioManager {
  static Dio? _dio;

  DioManager._();

  static Dio getInstance() {
    if (_dio == null) {
      final config = NimmstaLib.config;

      _dio = Dio(
        BaseOptions(
          sendTimeout: config.timeout,
          connectTimeout: config.timeout,
          receiveTimeout: config.timeout,
        ),
      );
      _dio!.interceptors.add(ErrorInterceptor());
    }
    return _dio!;
  }
}
