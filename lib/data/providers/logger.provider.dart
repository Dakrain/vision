import 'package:flutter_base_project/domain/providers/providers.dart';
import 'package:logger/logger.dart';

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
