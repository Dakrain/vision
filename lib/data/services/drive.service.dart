import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/requests/requests.dart';
import 'package:retrofit/retrofit.dart';

import '../models/models.dart';

part 'drive.service.g.dart';

@RestApi()
abstract class DriveService {
  factory DriveService(Dio dio, {String? baseUrl}) = _DriveService;
}
