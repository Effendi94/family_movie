import 'package:dio/dio.dart';

import '../../apis/api_interceptor.dart';
import '../../flavors.dart';

class DioService {
  static Dio getInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: F.variables['baseURL'] as String,
        connectTimeout: 120 * 1000, // 120 seconds
        receiveTimeout: 120 * 1000, // 120 seconds
        sendTimeout: 120 * 1000, // 120 seconds
      ),
    );

    dio.interceptors.add(ApiInterceptor());

    return dio;
  }
}
