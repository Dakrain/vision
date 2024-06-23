import '../constants/error_constant.dart';

abstract class BaseException implements Exception {
  final String message;
  final String code;
  StackTrace? stackTrace;

  BaseException({required this.message, required this.code, this.stackTrace});
}

class AppException extends BaseException {
  AppException({required super.message, required super.code, super.stackTrace});

  // Using the error constants here
  factory AppException.fromException({Object? exception, StackTrace? stackTrace}) {
    return AppException(
      message: ErrorConstants.defaultErrorCode,
      code: ErrorConstants.defaultErrorCode,
      stackTrace: stackTrace,
    );
  }
}

class NetworkException extends BaseException {
  NetworkException({required super.message, required super.code, super.stackTrace});

  // Using the error constants here
  factory NetworkException.noNetworkError({StackTrace? stackTrace}) {
    return NetworkException(
      message: ErrorConstants.noNetworkErrorMessage,
      code: ErrorConstants.noNetworkErrorCode,
      stackTrace: stackTrace,
    );
  }
}
