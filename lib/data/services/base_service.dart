import 'package:dio/dio.dart';

class BaseService {
  late Dio dio;

  BaseService() {
    dio = Dio();

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
      requestBody: true,
    ));
  }
}
