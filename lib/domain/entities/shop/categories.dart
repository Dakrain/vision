// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_base_project/domain/entities/shop/group_by_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';
import 'product.dart';

part 'categories.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class Categories {
  final List<Category>? categories;
  final List<Product>? newproducts;
  final List<GroupByCategory>? groupbycategory;

  Categories({
    this.categories,
    this.newproducts,
    this.groupbycategory,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
}
