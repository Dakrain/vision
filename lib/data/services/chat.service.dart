import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'chat.service.g.dart';

@RestApi()
abstract class ChatService {
  factory ChatService(Dio dio, {String? baseUrl}) = _ChatService;
}
