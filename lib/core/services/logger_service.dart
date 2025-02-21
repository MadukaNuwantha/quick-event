import 'package:logger/logger.dart';

class LoggerService {
  final Logger _logger;

  LoggerService()
      : _logger = Logger(
          printer: PrettyPrinter(),
        );

  void debug(String message) => _logger.d(message);
  void info(String message) => _logger.i(message);
  void warning(String message) => _logger.w(message);
  void error(String message, {dynamic error}) => _logger.e(message, error: error);
}
