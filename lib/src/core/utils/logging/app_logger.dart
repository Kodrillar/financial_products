import 'package:logger/logger.dart';

/// Applicationwide logging solution that uses the logger package to log messages
/// based on the configured logging level.
class AppLogger {
  AppLogger._();
  static Logger get log => Logger();

  ///Logs 'debug' data/message if logging level accepts logs from debug level
  static void logD(dynamic message, {StackTrace? stackTrace}) =>
      log.d(message, stackTrace: stackTrace);

  ///Logs 'info' data/message if logging level accepts logs from info level
  static void logI(dynamic message) => log.i(message);

  ///Logs 'error' data/message if logging level accepts logs from error level
  static void logE(dynamic message, {StackTrace? stackTrace}) =>
      log.e(message, stackTrace: stackTrace);
}
