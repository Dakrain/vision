import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'shop.service.g.dart';

@RestApi()
abstract class ShopService {
  factory ShopService(Dio dio, {String? baseUrl}) = _ShopService;
}
