import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/data/models/models.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    debugPrint('🚀onResponse: ${response.data}');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    debugPrint('🚀onResponse: $err');
    if (err.type == DioExceptionType.badResponse && err.response != null) {
      final error =
          ApiError.fromJson(err.response!.data as Map<String, dynamic>);
    }
  }
}
