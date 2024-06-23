import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'drive.service.g.dart';

@RestApi()
abstract class DriveService {
  factory DriveService(Dio dio, {String? baseUrl}) = _DriveService;
}
