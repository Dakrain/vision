import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/constants/error_constant.dart';
import 'package:flutter_base_project/domain/exceptions/base_exception.dart';
import 'package:flutter_base_project/domain/providers/logger_provider.dart';
import 'package:flutter_base_project/domain/providers/network_provider.dart';

abstract class BaseUseCase<Input, Output> {
  final NetworkProvider _networkProvider;
  final LoggerProvider _loggerProvider;

  const BaseUseCase(
      {required NetworkProvider networkProvider,
      required LoggerProvider loggerProvider})
      : _networkProvider = networkProvider,
        _loggerProvider = loggerProvider;

  FutureOr<Either<BaseException, Output>> execute(Input input) async {
    try {
      if (await _networkProvider.isConnected) {
        final result = await build(input);

        return Right(result);
      } else {
        return Left(NetworkException.noNetworkError());
      }
    } catch (e, stacktrace) {
      Future.microtask(
          () => _loggerProvider.log('Error 🚀: ${stacktrace.toString()}'));

      return Left(AppException(
          code: ErrorConstants.defaultErrorCode,
          message: ErrorConstants.defaultErrorMessage,
          stackTrace: stacktrace));
    }
  }

  FutureOr<Output> build(Input input);
}
