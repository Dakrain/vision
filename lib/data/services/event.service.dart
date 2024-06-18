import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'event.service.g.dart';

@RestApi()
abstract class EventService {
  factory EventService(Dio dio, {String? baseUrl}) = _EventService;
}
