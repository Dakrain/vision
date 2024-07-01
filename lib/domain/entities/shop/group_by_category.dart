// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'group_by_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GroupByCategory {
  final int? categoryId;
  final String? categoryName;
  final List<Product>? product;
  final List<GroupByCategory>? subCategories;

  GroupByCategory({
    this.categoryId,
    this.categoryName,
    this.product,
    this.subCategories,
  });

  factory GroupByCategory.fromJson(Map<String, dynamic> json) =>
      _$GroupByCategoryFromJson(json);
}
