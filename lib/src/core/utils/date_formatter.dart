import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatDate(DateTime date) => DateFormat(
          '${DateFormat.ABBR_MONTH} ${DateFormat.DAY}, ${DateFormat.YEAR} HH:mm a')
      .format(date);
}
