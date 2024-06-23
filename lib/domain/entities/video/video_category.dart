/*
 "lang_code": "vn",
            "image": 168,
            "created_at": 1607252208,
            "category_id": 9,
            "category_name": "Video Hài hước",
            */
import 'package:json_annotation/json_annotation.dart';

import 'video.dart';

part 'video_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoCategory {
  final String? categoryName;
  final int? categoryId;
  final int? createdAt;
  final List<Video> videos;

  VideoCategory({
    this.createdAt,
    this.categoryId,
    this.categoryName,
    this.videos = const [],
  });

  factory VideoCategory.fromJson(Map<String, dynamic> json) => _$VideoCategoryFromJson(json);
}
