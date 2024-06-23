import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../services/video.service.dart';

@Injectable(as: VideoRepository)
class VideoRepositoryImpl extends BaseRepository implements VideoRepository {
  final VideoService service;

  VideoRepositoryImpl({
    required super.networkProvider,
    required super.loggerProvider,
    required this.service,
  });

  @override
  Future<Paging<Video>> fetchRelatedVideos(int videoId) {
    return execute(service.getRelatedVideos(videoId));
  }

  @override
  Future<VideoDetail> fetchVideoDetail(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Paging<Video>> fetchVideos({int? categoryId, int? pageNumber}) {
    return execute(
        service.getVideos(pageNumber: pageNumber, categoryId: categoryId));
  }

  @override
  Future<Paging<VideoCategory>> fetchVideosGroupByCategory() {
    return execute(service.getVideosGroupByCategory());
  }

  @override
  Future<Paging<Video>> fetchSlideVideos() {
    return execute(service.getSlideVideos());
  }
}
