import 'package:hive_flutter/hive_flutter.dart';

abstract class StorageProvider {
  Future<T> get<T>(String key, {T? defaultValue});
  Future<void> set(String key, dynamic value);
  Future<void> delete(String key);
}

class HiveStorageProvider implements StorageProvider {
  final Box<dynamic> _box;

  HiveStorageProvider(this._box);

  Future<void> init() {
    return Hive.initFlutter();
  }

  @override
  Future<void> set(String key, dynamic value) async {
    return _box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    return _box.delete(key);
  }

  @override
  Future<T> get<T>(String key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue);
  }
}
