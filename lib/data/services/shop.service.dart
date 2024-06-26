import 'package:dio/dio.dart';

import '../../domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/entities/shop/categories.dart';

part 'shop.service.g.dart';

@RestApi()
abstract class ShopService {
  factory ShopService(Dio dio, {String? baseUrl}) = _ShopService;

  @GET('/product')
  Future<BaseResponse<Paging<Product>>> getProducts({
    @Query('page_number') int? pageNumber,
    @Query('category_id') int? categoryId,
    @Query('name') String? name,
    @Query('sort_by_price') String? sort,
  });

  @GET('/product/{id}')
  Future<BaseResponse<Product>> getProductDetail(
    @Path('id') int id,
  );

  @GET('/product/groupbycategory')
  Future<BaseResponse<Categories>> getProductGroupByCategory();
}
