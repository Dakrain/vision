import 'package:freezed_annotation/freezed_annotation.dart';

part 'related.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Related {
  final int? id;
  final int? categoryId;
  final String? title;
  final String? slug;
  final String? shortContent;
  final String? content;
  final int? publishAt;
  final String? tag;
  final String? videoUrl;
  final int? mediaId;
  final int? thumbnail;
  final int? totalView;
  final int? totalLike;
  final int? totalShare;
  final int? isPlaylist;
  final int? status;
  final int? createdAdminId;
  final String? categoryName;

  Related({
    this.id,
    this.categoryId,
    this.title,
    this.slug,
    this.shortContent,
    this.content,
    this.publishAt,
    this.tag,
    this.videoUrl,
    this.mediaId,
    this.thumbnail,
    this.totalView,
    this.totalLike,
    this.totalShare,
    this.isPlaylist,
    this.status,
    this.createdAdminId,
    this.categoryName,
  });

  factory Related.fromJson(Map<String, dynamic> json) => _$RelatedFromJson(json);
}
