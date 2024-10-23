import 'dart:convert';

import 'package:financial_products/src/core/network/api_urls.dart';
import 'package:financial_products/src/core/utils/data_layer_processor.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

//Low-level API for processing Authentication
class AuthNetworkHelper {
  Future<void> logIn(AppUser appUser) async {
    final http.Response response = await http.post(
      Uri.parse(ApiUrls.login),
      body: jsonEncode(appUser.toMap()),
      headers: {"Content-Type": 'application/Json'},
    );

    return DataLayerProcessor.processRequestResponse<void>(
        response, (responseData) {});
  }

  Future<void> verifyEmail({
    required AppUser appUser,
    required int otp,
  }) async {
    final Map requestBody = {
      "email": appUser.email,
      "otp": otp.toString(),
    };

    final http.Response response = await http.post(
      Uri.parse(ApiUrls.emailVerification),
      body: jsonEncode(requestBody),
      headers: {"Content-Type": 'application/Json'},
    );

    return DataLayerProcessor.processRequestResponse<void>(
        response, (responseData) {});
  }
}

final authNetworkHelperProvider =
    Provider.autoDispose<AuthNetworkHelper>((ref) => AuthNetworkHelper());
