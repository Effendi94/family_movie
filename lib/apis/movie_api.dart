import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../application/app/app.locator.dart';
import '../application/app/constants/common.dart';
import '../application/app/constants/endpoint.dart';
import '../application/enums/search_type.dart';
import '../application/helpers/dio_error_type_parser.dart';
import '../application/models/movie/movie.dart';
import '../application/models/movie/review.dart';
import '../application/models/response_json.dart';
import '../application/models/static.dart';
import '../application/models/movie/video_data.dart';
import '../application/services/user_service.dart';

class MovieAPI {
  final Dio _dio = locator<Dio>();
  final _userService = locator<UserService>();

  Future<Either<ResponseJSON, Movie>> fetchNowPlaying(int page) async {
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
        EndPoint.nowPlayingMovie,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(Movie.fromJson(res.data));
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

  Future<Either<ResponseJSON, Movie>> fetchPopular(int page) async {
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
        EndPoint.popularMovie,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(Movie.fromJson(res.data));
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

  Future<Either<ResponseJSON, Movie>> fetchTopRated(int page) async {
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
        EndPoint.topRatedMovie,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(Movie.fromJson(res.data));
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

  Future<Either<ResponseJSON, Movie>> fetchUpcoming(int page) async {
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
        EndPoint.upcomingMovie,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(Movie.fromJson(res.data));
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

  Future<Either<ResponseJSON, Movie>> fetchMovieByCategory(
      String endpoint, int page) async {
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
        endpoint,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(Movie.fromJson(res.data));
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

  Future<Either<ResponseJSON, MovieData>> fetchMovieDetail(
      String movieId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.detailMovie.replaceAll('%MOVIE_ID%', movieId),
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        return Right(MovieData.fromJson(res.data));
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

  Future<Either<ResponseJSON, List<VideoData>>> fetchVideo(
      String movieId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.movieVideo.replaceAll('%MOVIE_ID%', movieId),
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

  Future<Either<ResponseJSON, List<ReviewData>>> fetchMovieReview(
      String movieId) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'language': 'en-US',
      };
      final res = await _dio.get(
        EndPoint.movieReview.replaceAll('%MOVIE_ID%', movieId),
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

  Future<Either<ResponseJSON, List<StaticModel>>> searchVideoByKeywords(
      String query) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'query': query,
      };
      final res = await _dio.get(
        EndPoint.searchByKeyword,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        final resultData = List<StaticModel>.from(
          List.from(res.data['results'])
              .map(
                (x) => StaticModel.fromJson(x),
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

  Future<Either<ResponseJSON, List<MovieData>>> searchMovie(
      String query) async {
    try {
      final Map<String, dynamic> headers = {
        'content-type': 'application/json',
      };
      final Map<String, dynamic> params = {
        'api_key': _userService.movieAPIKey,
        'query': query,
      };
      final res = await _dio.get(
        Search.endpoint,
        queryParameters: params,
        options: Options(
          headers: headers,
        ),
      );
      if (res.statusCode == 200) {
        final resultData = List<MovieData>.from(
          List.from(res.data['results'])
              .map(
                (x) => MovieData.fromJson(x),
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
