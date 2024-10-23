class ApiUrls {
  ApiUrls._();

  static const String _baseUrl = 'https://naml-mobile.norrenberger.com';

  static const String login = "$_baseUrl/otp/create-email-otp";
  static const String emailVerification = "$_baseUrl/otp/verify-email-otp/";

  static const String products = "$_baseUrl/product/all-products";
}
