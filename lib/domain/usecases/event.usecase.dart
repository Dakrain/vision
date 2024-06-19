import 'package:dartz/dartz.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:flutter_base_project/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class EventUsecase {
  final EventRepository repository;

  EventUsecase({
    required this.repository,
  });

  Future<Either<ApiError, Paging<Event>>> getEvents({
    required String type,
    String? name,
    int pageNumber = 1,
  }) async {
    try {
      final result = await repository.getEvents(
          type: type, name: name, pageNumber: pageNumber);

      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
