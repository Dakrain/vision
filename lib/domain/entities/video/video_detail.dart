import 'package:freezed_annotation/freezed_annotation.dart';

import 'related.dart';
import 'video.dart';

part 'video_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideoDetail extends Video {
  final String? slug;
  final String? content;
  final int? publishAt;
  final String? tag;
  final int? displayOrder;
  final int? mediaId;
  final int? isDownloadFile;
  final int? totalLike;
  final int? totalShare;
  final int? status;
  final int? createdAdminId;
  final int? updatedAdminId;
  final String? dynamicLink;
  final List<Related>? related;

  VideoDetail({
    this.slug,
    this.content,
    this.publishAt,
    this.tag,
    this.displayOrder,
    this.mediaId,
    this.isDownloadFile,
    this.totalLike,
    this.totalShare,
    this.status,
    this.createdAdminId,
    this.updatedAdminId,
    this.dynamicLink,
    this.related,
    super.id,
    super.createdAt,
    super.categoryId,
    super.title,
    super.shortContent,
    super.videoUrl,
    super.thumbnail,
    super.totalView,
    super.thumbnailUrl,
    super.categoryName,
  });
}
