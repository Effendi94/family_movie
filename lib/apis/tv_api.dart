import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../application/app/app.locator.dart';
import '../application/app/constants/common.dart';
import '../application/app/constants/endpoint.dart';
import '../application/helpers/dio_error_type_parser.dart';
import '../application/models/movie/review.dart';
import '../application/models/movie/tv.dart';
import '../application/models/movie/video_data.dart';
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

  Future<Either<ResponseJSON, TV>> fetchTVTopRated(int page) async {
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
        EndPoint.tvTopRated,
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

  Future<Either<ResponseJSON, List<VideoData>>> fetchTVVideos(
      String tvId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.tvVideo.replaceAll('%TV_ID%', tvId),
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        final resultData = List<VideoData>.from(
          List.from(res.data['results'])
              .map(
                (x) => VideoData.fromJson(x),
              )
              .toList(),
        );
        return Right(resultData);
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

  Future<Either<ResponseJSON, TvData>> fetchTvDetail(String tvId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.tvDetail.replaceAll('%TV_ID%', tvId),
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(TvData.fromJson(res.data));
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

  Future<Either<ResponseJSON, List<ReviewData>>> fetchTVReview(
      String tvId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.tvReview.replaceAll('%TV_ID%', tvId),
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );

      if (res.statusCode == 200) {
        final resultData = List<ReviewData>.from(
          List.from(res.data['results'])
              .map(
                (x) => ReviewData.fromJson(x),
              )
              .toList(),
        );
        return Right(resultData);
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
