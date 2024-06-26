import 'package:dartz/dartz.dart';
import '../entities/shop/categories.dart';
import '../repositories/shop.repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/entities.dart';

@injectable
class ShopUsecase {
  final ShopRepository repository;

  ShopUsecase(this.repository);

  Future<Either<ApiError, Paging<Product>>> getProducts({
    int? pageNumber,
    int? categoryId,
    String? name,
    String? sortBy,
  }) async {
    try {
      final result = await repository.getProducts(
        pageNumber: pageNumber,
        categoryId: categoryId,
        name: name,
        sortBy: sortBy,
      );

      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Product>> getProductDetail(int id) async {
    try {
      final result = await repository.getProductDetail(id);
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }

  Future<Either<ApiError, Categories>> getProductGroupByCategory() async {
    try {
      final result = await repository.getProductGroupByCategory();
      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
