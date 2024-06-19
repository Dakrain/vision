import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:flutter_base_project/domain/entities/video/video.dart';
import 'package:flutter_base_project/domain/entities/video/video_detail.dart';
import 'package:injectable/injectable.dart';

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
    throw UnimplementedError();
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
}
