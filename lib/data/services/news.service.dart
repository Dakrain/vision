import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'news.service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String? baseUrl}) = _NewsService;
}
