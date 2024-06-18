import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'meeting.service.g.dart';

@RestApi()
abstract class MeetingService {
  factory MeetingService(Dio dio, {String? baseUrl}) = _MeetingService;
}
