// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain/constants/error_constant.dart';
import '../../domain/domain.dart';
import '../../domain/providers/providers.dart';

abstract class BaseRepository {
  NetworkProvider networkProvider;
  LoggerProvider loggerProvider;

  BaseRepository({
    required this.networkProvider,
    required this.loggerProvider,
  });

  Future<T> execute<T>(Future<BaseResponse<T>> input) async {
    try {
      if (await networkProvider.isConnected) {
        final result = await input;

        if (result.isSuccess) {
          return result.data as T;
        } else {
          throw (result.error ?? const ApiError());
        }
      } else {
        throw const ApiError(
          code: ErrorConstants.networkErrorMessage,
          message: ErrorConstants.noNetworkErrorMessage,
        );
      }
    } catch (e, stacktrace) {
      Future.microtask(() => loggerProvider.log('Error 🚀: ${stacktrace.toString()}'));

      throw const ApiError(
        code: ErrorConstants.defaultErrorCode,
        message: ErrorConstants.defaultErrorMessage,
      );
    }
  }
}
