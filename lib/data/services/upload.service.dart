import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:retrofit/retrofit.dart';

part 'upload.service.g.dart';

@RestApi()
abstract class UploadService {
  factory UploadService(Dio dio, {String baseUrl}) = _UploadService;

  @MultiPart()
  @POST('/file/upload')
  Future<BaseResponse<Upload>> uploadFile({
    @SendProgress() ProgressCallback? sendProgress,
    @Body() required FormData file,
  });
}
