import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'event.service.g.dart';

@RestApi()
abstract class EventService {
  factory EventService(Dio dio, {String? baseUrl}) = _EventService;
}
