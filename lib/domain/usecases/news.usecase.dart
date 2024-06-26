import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsUsecase {
  final NewsRepository repository;

  NewsUsecase(this.repository);

  Future<Either<ApiError, Paging<News>>> getNews({
    required String type,
    String? title,
    int? categoryId,
    int? pageNumber,
  }) async {
    try {
      final result = await repository.getNews(
        type: type,
        title: title,
        categoryId: categoryId,
        pageNumber: pageNumber,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<News>>> getRelatedNews({
    required int type,
    required String id,
  }) async {
    String typeString = 'news';

    if (type == 2) {
      typeString = 'news';
    } else if (type == 5) {
      typeString = 'duonglinh';
    } else if (type == 6) {
      typeString = 'library';
    } else if (type == 4) {
      typeString = 'music';
    }
    try {
      final result = await repository.getRelatedNews(type: typeString, id: id);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, NewsDetail>> getNewsDetail({
    required String id,
  }) async {
    try {
      final result = await repository.getNewsDetail(id: id);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Paging<News>>> getHighlightNews({
    required String type,
    String? title,
    int? categoryId,
  }) async {
    try {
      final result = await repository.getHighlightNews(
        type: type,
        title: title,
        categoryId: categoryId,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
