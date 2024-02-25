import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime dateTime) {
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
