import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_base_project/domain/entities/entities.dart';
import 'package:injectable/injectable.dart';

import '../repositories/repositories.dart';

@injectable
class UploadUsecase {
  final UploadRepository repository;

  UploadUsecase({
    required this.repository,
  });

  Future<Either<ApiError, Upload>> uploadFile({
    void Function(int, int)? callback,
    required File file,
    required String type,
    required int id,
  }) async {
    try {
      final result = await repository.upload(
        callback: callback,
        file: file,
        type: type,
        id: id,
      );

      return Right(result);
    } catch (e) {
      return Left(ApiError.fromException(e));
    }
  }
}
