import 'package:logger/logger.dart';

/// Applicationwide logging solution that uses the logger package to log messages
/// based on the configured logging level.
class AppLogger {
  AppLogger._();
  static Logger get log => Logger();

  ///Logs 'debug' data/message if logging level accepts logs from debug level
  static void d(dynamic message) => log.d(message);

  ///Logs 'info' data/message if logging level accepts logs from info level
  static void i(dynamic message) => log.i(message);

  ///Logs 'error' data/message if logging level accepts logs from error level
  static void e(dynamic message) => log.e(message);
}
