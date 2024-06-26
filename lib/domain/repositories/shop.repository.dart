import '../entities/shop/categories.dart';

import '../entities/entities.dart';

abstract class ShopRepository {
  Future<Paging<Product>> getProducts({
    int? pageNumber,
    int? categoryId,
    String? name,
    String? sortBy,
  });

  Future<Product> getProductDetail(int id);

  Future<Categories> getProductGroupByCategory();
}
