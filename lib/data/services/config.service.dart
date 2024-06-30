import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'config.service.g.dart';

@RestApi()
abstract class ConfigService {
  factory ConfigService(Dio dio, {String? baseUrl}) = _ConfigService;

  @GET('/getconfigs')
  Future<BaseResponse<Config>> fetchConfig();
}
