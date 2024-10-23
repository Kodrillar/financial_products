import 'dart:io';

import 'package:financial_products/src/core/utils/logging/app_logger.dart';
import 'package:financial_products/src/exceptions/app_exceptions.dart';

class RepositoryOperator {
  Future<ReturnType> processRepoOperation<ReturnType>({
    required Future<ReturnType> Function() operation,
  }) async {
    try {
      return await operation();
    } on AppExceptionWithNetworkMessage {
      rethrow;
    } on SocketException catch (e) {
      AppLogger.logD(e);
      AppLogger.logD(e.runtimeType);
      throw AppSocketException();
    } on UnexpectedException {
      rethrow;
    } catch (ex, st) {
      AppLogger.logD('Repo Error: $ex', stackTrace: st);
      throw UnexpectedException();
    }
  }
}
