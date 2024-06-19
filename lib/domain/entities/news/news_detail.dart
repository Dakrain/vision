// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'news.dart';

part 'news_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NewsDetail extends News {
  final String? content;
  final int? isDownloadFile;

  NewsDetail({
    this.content,
    this.isDownloadFile,
    super.id,
    super.createdAt,
    super.categoryId,
    super.title,
    super.shortContent,
    super.totalView,
    super.type,
    super.imageUrl,
    super.categoryName,
  });

  factory NewsDetail.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailFromJson(json);
}
