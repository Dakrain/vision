import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

@injectable
class ConfigUsecase {
  final ConfigRepository repository;

  ConfigUsecase(this.repository);

  Future<Either<ApiError, Config>> fetchConfig() async {
    try {
      final result = await repository.fetchConfig();
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
