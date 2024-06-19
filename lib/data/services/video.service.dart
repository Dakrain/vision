import 'package:dio/dio.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'video.service.g.dart';

@RestApi()
abstract class VideoService {
  factory VideoService(Dio dio, {String? baseUrl}) = _VideoService;

  @GET('/videos')
  Future<BaseResponse<Paging<Video>>> getVideos({
    @Query('page_number') int? pageNumber,
    @Query('category_id') int? categoryId,
  });
}
