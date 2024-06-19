// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Video {
  final int? id;
  final int? createdAt;
  final int? categoryId;
  final String? title;
  final String? shortContent;
  final String? videoUrl;
  final int? thumbnail;
  final int? totalView;
  final String? thumbnailUrl;
  final String? categoryName;

  Video({
    this.id,
    this.createdAt,
    this.categoryId,
    this.title,
    this.shortContent,
    this.videoUrl,
    this.thumbnail,
    this.totalView,
    this.thumbnailUrl,
    this.categoryName,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
