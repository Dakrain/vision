import '../entities/entities.dart';

abstract class ConfigRepository {
  Future<Config> fetchConfig();
}
