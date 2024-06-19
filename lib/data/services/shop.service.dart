import 'package:dio/dio.dart';

import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

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
}
