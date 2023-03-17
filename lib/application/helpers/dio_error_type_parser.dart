import 'package:dio/dio.dart';

class DioErrorTypeParser {
  static String parseToCustomMessage(DioError e) {
    // log(e.response!.statusMessage!, name: 'Server Error Response');
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return 'Connection timeout.';

      case DioErrorType.other:
        return 'Oops! Sesuatu telah terjadi. Jangan khawatir, kami sedang menanganinya. Kami akan segera kembali melayani Anda.';

      case DioErrorType.response:
        String message = e.message;

        switch (e.response?.statusCode) {
          case 400:
            message =
                '400 Bad Request: This indicates that the server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).';
            break;

          case 404:
            message =
                "404 Not Found: This indicates that the server can't find the requested resource";
            break;

          case 500:
            message =
                '500 Internal Server Error: This indicates that the server encountered an unexpected condition that prevented it from fulfilling the request.';
            break;
        }

        return message;

      default:
        return e.message;
    }
  }
}
