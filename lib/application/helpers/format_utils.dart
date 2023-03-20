import 'package:intl/intl.dart';

class FormatUtils {
  static double convertToDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return 0.00 + value;
    } else if (value == null) {
      return 0.0;
    } else {
      return value;
    }
  }

  static String convertShortDateTime(String strDate) {
    if (strDate.isNotEmpty) {
      DateTime dateTime = DateTime.parse(strDate);
      String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
      return formattedDate;
    }
    return "";
  }

  static String convertYear(String strDate) {
    if (strDate.isNotEmpty) {
      DateTime dateTime = DateTime.parse(strDate);
      String formattedDate = DateFormat('yyyy').format(dateTime);
      return formattedDate;
    }
    return "";
  }
}
