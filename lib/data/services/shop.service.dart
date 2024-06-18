import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'shop.service.g.dart';

@RestApi()
abstract class ShopService {
  factory ShopService(Dio dio, {String? baseUrl}) = _ShopService;
}
