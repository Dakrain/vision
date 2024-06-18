import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'authentication.service.g.dart';

@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String? baseUrl}) =
      _AuthenticationService;

  @POST('/user/login')
  Future<BaseResponse<User>> login(@Body() LoginRequest request);
}
