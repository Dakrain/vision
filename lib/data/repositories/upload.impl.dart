import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/services.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:http_parser/http_parser.dart';

@Injectable(as: UploadRepository)
class UploadRepositoryImpl extends BaseRepository implements UploadRepository {
  final UploadService service;

  UploadRepositoryImpl({
    required super.networkProvider,
    required super.loggerProvider,
    required this.service,
  });

  @override
  Future<Upload> upload({
    void Function(int count, int total)? callback,
    required File file,
    required String type,
    required int id,
  }) async {
    final formData = FormData();

    String mimeType = file.path.split('.').last;
    String contentType = mimeType == 'pdf' ? 'application/pdf' : 'image/$mimeType';

    formData.files.add(
      MapEntry(
        'file',
        MultipartFile.fromFileSync(
          file.path,
          filename: file.path.split(Platform.pathSeparator).last,
          contentType: MediaType.parse(contentType),
        ),
      ),
    );

    return execute(service.uploadFile(sendProgress: callback, file: formData));
  }
}
