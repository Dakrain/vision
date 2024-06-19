// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class News {
  final int? id;
  final int? createdAt;
  final int? categoryId;
  final String? title;
  final String? shortContent;
  final int? totalView;
  final int? type;
  final String? imageUrl;
  final String? categoryName;

  News({
    this.id,
    this.createdAt,
    this.categoryId,
    this.title,
    this.shortContent,
    this.totalView,
    this.type,
    this.imageUrl,
    this.categoryName,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}