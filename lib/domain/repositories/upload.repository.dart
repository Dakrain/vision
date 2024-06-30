import 'dart:io';

import 'package:flutter_base_project/domain/entities/entities.dart';

abstract class UploadRepository {
  Future<Upload> upload({
    void Function(int count, int total)? callback,
    required File file,
    required String type,
    required int id,
  });
}
