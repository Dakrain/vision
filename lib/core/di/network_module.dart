import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/interceptor/auth.interceptor.dart';
import 'package:flutter_base_project/data/interceptor/response.interceptor.dart';
import 'package:flutter_base_project/data/services/services.dart';
import 'package:flutter_base_project/domain/providers/storage.provider.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class NetworkModule {
  @singleton
  @preResolve
  Future<Dio> provideDio(StorageProvider storageProvider) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final Dio dio = Dio();

    dio.interceptors.add(ResponseInterceptor());

    dio.interceptors.add(AuthenInterceptor(
        version: '${packageInfo.version}.${packageInfo.buildNumber}',
        uuid: 'N/A',
        storageProvider: storageProvider));

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    return dio;
  }

  AuthenticationService provideAuthenService(Dio dio) =>
      AuthenticationService(dio, baseUrl: 'https://api.vision20.us/v1');

  EventService provideEventService(Dio dio) =>
      EventService(dio, baseUrl: 'https://api.vision20.us/v1');

  ShopService provideShopService(Dio dio) =>
      ShopService(dio, baseUrl: 'https://api.vision20.us/v1');

  NewsService provideNewsService(Dio dio) =>
      NewsService(dio, baseUrl: 'https://api.vision20.us/v1');

  VideoService provideVideoService(Dio dio) =>
      VideoService(dio, baseUrl: 'https://api.vision20.us/v1');

  MeetingService provideMeetingService(Dio dio) =>
      MeetingService(dio, baseUrl: 'https://api.vision20.us/v1');
}
