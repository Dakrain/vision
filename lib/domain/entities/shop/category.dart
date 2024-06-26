// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Category {
  final int? id;
  final int? createdAt;
  final String? name;
  final int? parentId;
  final String? langCode;
  final String? imageUrl;

  Category({
    this.id,
    this.createdAt,
    this.name,
    this.parentId,
    this.langCode,
    this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
