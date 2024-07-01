import 'package:flutter_base_project/data/repositories/base_repository.dart';
import 'package:flutter_base_project/data/services/config.service.dart';
import 'package:flutter_base_project/domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ConfigRepository)
class ConfigRepositoryImpl extends BaseRepository implements ConfigRepository {
  final ConfigService service;

  ConfigRepositoryImpl({
    required this.service,
    required super.networkProvider,
    required super.loggerProvider,
  });

  @override
  Future<Config> fetchConfig() {
    return execute(service.fetchConfig());
  }
}
