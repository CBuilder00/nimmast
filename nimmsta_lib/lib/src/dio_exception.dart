import 'package:dio/dio.dart';

class ResponseDioException extends DioException {
  int statusCode;

  ResponseDioException(
    RequestOptions requestOptions,
    String message,
    this.statusCode,
  ) : super(requestOptions: requestOptions, message: message);
}

class TimeoutDioException extends DioException {
  TimeoutDioException(
    RequestOptions requestOptions,
    String message,
  ) : super(requestOptions: requestOptions, message: message);
}

class NetworkDioException extends DioException {
  NetworkDioException(
    RequestOptions requestOptions,
    String message,
  ) : super(requestOptions: requestOptions, message: message);
}
