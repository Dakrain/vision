// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'style.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  final int? id;
  final int? createdAt;
  final int? categoryId;
  final String? name;
  final String? description;
  final int? publishAt;
  final int? image;
  final int? price;
  final String? imageUrl;
  final String? categoryName;
  final Style? style;

  Product({
    this.id,
    this.createdAt,
    this.categoryId,
    this.name,
    this.description,
    this.publishAt,
    this.image,
    this.price,
    this.imageUrl,
    this.categoryName,
    this.style,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
