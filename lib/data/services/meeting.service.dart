import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'meeting.service.g.dart';

@RestApi()
abstract class MeetingService {
  factory MeetingService(Dio dio, {String? baseUrl}) = _MeetingService;
}
