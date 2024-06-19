import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/providers/storage.provider.dart';

class AuthenInterceptor extends InterceptorsWrapper {
  final String version;
  final String uuid;
  final StorageProvider storageProvider;

  AuthenInterceptor({
    required this.version,
    required this.uuid,
    required this.storageProvider,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? token = storageProvider.get('token');

    options.headers.addAll(<String, dynamic>{
      'appplatform': Platform.isAndroid ? 'Android' : 'iOS',
      'apppversion': version,
      'appdeviceid': uuid,
      'applocale': 'vn'
    });

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
