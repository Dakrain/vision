import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:flutter_base_project/domain/repositories/repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class VideoUsecase {
  final VideoRepository repository;

  VideoUsecase(this.repository);

  Future<Either<ApiError, Paging<Video>>> fetchVideos() async {
    try {
      final result = await repository.fetchVideos(pageNumber: 1);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
