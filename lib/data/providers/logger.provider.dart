import 'package:flutter_base_project/domain/providers/logger_provider.dart';
import 'package:flutter_base_project/domain/providers/providers.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Singleton(as: LoggerProvider)
class LoggerProviderImpl extends LoggerProvider {
  late Logger logger;

  LoggerProviderImpl() {
    logger = Logger();
  }

  @override
  void log(String message, {String? name}) {
    logger.d(message);
  }
}
