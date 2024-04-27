import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication.service.g.dart';

@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String? baseUrl}) =
      _AuthenticationService;
}
