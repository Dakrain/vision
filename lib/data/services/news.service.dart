import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'news.service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String? baseUrl}) = _NewsService;

  @GET('/posts')
  Future<BaseResponse<Paging<News>>> getNews({
    @Query('type') required String type,
    @Query('title') String? title,
    @Query('category_id') int? categoryId,
    @Query('page') int? page,
  });

  @GET('/posts/feature')
  Future<BaseResponse<Paging<News>>> getHighlightNews({
    @Query('type') required String type,
    @Query('title') String? title,
    @Query('category_id') int? categoryId,
    @Query('page') int? page,
  });

  @GET('/posts/{id}')
  Future<BaseResponse<NewsDetail>> getNewsDetail({
    @Path('id') required String id,
  });

  @GET('/posts/related')
  Future<BaseResponse<Paging<News>>> getRelatedNews({
    @Query('type') required String type,
    @Query('id') required String id,
  });
}
