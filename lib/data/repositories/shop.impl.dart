import 'package:flutter_base_project/domain/entities/paging.dart';
import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/shop.service.dart';
import 'package:flutter_base_project/domain/entities/shop/product.dart';
import 'package:flutter_base_project/domain/repositories/shop.repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ShopRepository)
class ShopRepositoryImpl extends BaseRepository implements ShopRepository {
  final ShopService service;

  ShopRepositoryImpl({
    required super.networkProvider,
    required super.loggerProvider,
    required this.service,
  });

  @override
  Future<Product> getProductDetail(int id) {
    return execute(service.getProductDetail(id));
  }

  @override
  Future<Paging<Product>> getProducts({int? pageNumber, int? categoryId, String? name, String? sortBy}) {
    return execute(service.getProducts(
      pageNumber: pageNumber,
      categoryId: categoryId,
      name: name,
      sort: sortBy,
    ));
  }
}
