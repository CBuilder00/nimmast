/// `NimmstaException` serves as a base class for exceptions in the library.
abstract class NimmstaException implements Exception {
  /// A descriptive message about the exception.
  final String message;

  NimmstaException(this.message);
}

/// [ResponseException] is a specific type of [NimmstaException] that indicates
/// errors contained in respones obtained as a result of an Http request.
class ResponseException extends NimmstaException {
  int statusCode;

  /// Constructs a [ResponseException] with a custom message, and http status code.
  ResponseException(String message, this.statusCode) : super(message);

  @override
  String toString() =>
      'A response was received from server with HTTP error code $statusCode and the following details: $message';
}

/// [TimeoutException] is a specific type of [NimmstaException] indicating that
/// a timeout has occured in any of the stages of connection estabilshment
/// , request, or response.
class TimeoutException extends NimmstaException {
  /// Constructs a [TimeoutException] with a custom message.
  TimeoutException(String message) : super(message);

  @override
  String toString() =>
      'A timeout has occured during a network operation with the following details: $message';
}

/// [NetworkException] is a specific type of [NimmstaException] representing
/// unclassified networking exceptions.
class NetworkException extends NimmstaException {
  /// Constructs a [NetworkException] with a custom message.
  NetworkException(String message) : super(message);

  @override
  String toString() =>
      'A network error has occured with the following details: $message';
}

/// `UnknownException` is a type of [NimmstaException] for unclassified or unexpected errors.
class UnknownException extends NimmstaException {
  /// Constructs an [UnknownException] with a custom message.
  UnknownException(String message) : super(message);

  @override
  String toString() =>
      'Unknown error occured with the following details: $message';
}
