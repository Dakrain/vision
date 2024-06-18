abstract class StorageProvider {
  T? get<T>(String key, {T? defaultValue});
  Future<void> set(String key, dynamic value);
  Future<void> delete(String key);
}
