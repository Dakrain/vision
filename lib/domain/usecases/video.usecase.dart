import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class VideoUsecase {
  final VideoRepository repository;

  VideoUsecase(this.repository);

  Future<Either<ApiError, Paging<Video>>> fetchVideos({int? categoryId, int? pageNumber}) async {
    try {
      final result = await repository.fetchVideos(pageNumber: pageNumber, categoryId: categoryId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<Video>>> fetchRelatedVideos(int videoId) async {
    try {
      final result = await repository.fetchRelatedVideos(videoId);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<VideoCategory>>> fetchVideosGroupByCategory() async {
    try {
      final result = await repository.fetchVideosGroupByCategory();
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<Video>>> fetchSlideVideos() async {
    try {
      final result = await repository.fetchSlideVideos();
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
