import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class VideoRepository {
  Future<Paging<Video>> fetchVideos({int? categoryId, int? pageNumber});

  Future<VideoDetail> fetchVideoDetail(String id);

  Future<Paging<Video>> fetchRelatedVideos(int videoId);
}
