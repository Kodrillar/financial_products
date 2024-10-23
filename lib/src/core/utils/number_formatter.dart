import "package:intl/intl.dart";

enum Currencies {
  naira,
  dollar,
}

class NumberFormatter {
  NumberFormatter._();

  static String formatAmount(
          {required dynamic amount, required String currency}) =>
      NumberFormat.currency(
              symbol: currency == Currencies.dollar.name ? '\$' : '₦')
          .format(amount);
}
