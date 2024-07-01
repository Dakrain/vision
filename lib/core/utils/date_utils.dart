import 'package:intl/intl.dart';

class DateTimeUtils {
  //Create function from above
  static String getFormattedDateFromTimestamp(int timestamp, String formmat) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedDate = DateFormat(formmat).format(date);

    return formattedDate;
  }
}
