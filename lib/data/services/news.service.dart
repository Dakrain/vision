import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'news.service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String? baseUrl}) = _NewsService;
}
