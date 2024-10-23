import 'dart:convert';

import 'package:financial_products/src/core/utils/logging/app_logger.dart';
import 'package:financial_products/src/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;

class DataLayerProcessor {
  DataLayerProcessor._();

  static ReturnType processRequestResponse<ReturnType>(http.Response response,
      ReturnType Function(dynamic responseData) responseDataCallback) {
    AppLogger.logD('Return Type: $ReturnType');
    AppLogger.logD(response.body);
    AppLogger.logD(response.statusCode);
    final decodedResponseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return responseDataCallback(decodedResponseBody['result']);
    }

    final responseMessage = decodedResponseBody["message"];

    if (responseMessage != null &&
        (responseMessage is String) &&
        responseMessage.isNotEmpty) {
      throw AppExceptionWithNetworkMessage(responseMessage);
    }

    throw UnexpectedException();
  }
}
