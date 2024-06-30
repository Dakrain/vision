import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/data.dart';
import 'package:flutter_base_project/domain/domain.dart';
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
        version: '${packageInfo.version}.${packageInfo.buildNumber}', uuid: 'N/A', storageProvider: storageProvider));
    dio.options.baseUrl = 'https://api.vision20.us/v1';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    return dio;
  }

  AuthenticationService provideAuthenService(Dio dio) => AuthenticationService(dio);

  EventService provideEventService(Dio dio) => EventService(dio);

  ShopService provideShopService(Dio dio) => ShopService(dio);

  NewsService provideNewsService(Dio dio) => NewsService(dio);

  VideoService provideVideoService(Dio dio) => VideoService(dio);

  MeetingService provideMeetingService(Dio dio) => MeetingService(dio);

  ChatService provideChatService(Dio dio) => ChatService(dio);

  ConfigService provideConfigService(Dio dio) => ConfigService(dio);

  ContactService provideContactService(Dio dio) => ContactService(dio);

  UploadService provideUploadService(Dio dio) => UploadService(dio);
}
