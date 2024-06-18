import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @singleton
  @preResolve
  Future<Box> provideBox() async {
    await Hive.initFlutter();
    return Hive.openBox('storage');
  }
}
