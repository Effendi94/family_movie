import 'package:intl/intl.dart';

import '../app/constants/endpoint.dart';

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

  static String? checkImageUrl(String? url) {
    if (url == null) {
      return url;
    }
    url = url.replaceFirst('/', '');
    String result = EndPoint.imdbImagePath.replaceAll('%PATH%', url);
    if (url.startsWith('http://') || url.startsWith('https://')) {
      result = url;
    }
    return result;
  }
}
