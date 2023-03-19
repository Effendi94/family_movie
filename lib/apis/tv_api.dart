import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../application/app/app.locator.dart';
import '../application/app/constants/common.dart';
import '../application/app/constants/endpoint.dart';
import '../application/helpers/dio_error_type_parser.dart';
import '../application/models/movie/tv.dart';
import '../application/models/response_json.dart';
import '../application/services/user_service.dart';

class TVAPI {
  final Dio _dio = locator<Dio>();
  final _userService = locator<UserService>();

  Future<Either<ResponseJSON, TV>> fetchTVOnTheAir(int page) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'page': page,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.tvOnTheAir,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(TV.fromJson(res.data));
      } else {
        return Left(ResponseJSON.fromJson(res.data));
      }
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);
      return Left(
        ResponseJSON(
          statusCode: e.response?.statusCode ?? Common.internalServerError,
          statusMessage: errorMessage,
          success: false,
        ),
      );
    }
  }

  Future<Either<ResponseJSON, TV>> fetchTVPopular(int page) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'page': page,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.tvPopular,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(TV.fromJson(res.data));
      } else {
        return Left(ResponseJSON.fromJson(res.data));
      }
    } on DioError catch (e) {
      final errorMessage = DioErrorTypeParser.parseToCustomMessage(e);
      return Left(
        ResponseJSON(
          statusCode: e.response?.statusCode ?? Common.internalServerError,
          statusMessage: errorMessage,
          success: false,
        ),
      );
    }
  }
}