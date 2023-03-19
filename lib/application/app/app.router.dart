// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:family_movie/ui/views/home/home_view.dart' as _i3;
import 'package:family_movie/ui/views/movie/movie_detail/movie_detail_view.dart'
    as _i4;
import 'package:family_movie/ui/views/movie_category/movie_category_view.dart'
    as _i5;
import 'package:family_movie/ui/views/startup/startup_view.dart' as _i2;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const startUpView = '/';

  static const homeView = '/home';

  static const movieDetailView = '/movie-detail';

  static const movieCategoryView = '/movie-category';

  static const all = <String>{
    startUpView,
    homeView,
    movieDetailView,
    movieCategoryView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startUpView,
      page: _i2.StartUpView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.movieDetailView,
      page: _i4.MovieDetailView,
    ),
    _i1.RouteDef(
      Routes.movieCategoryView,
      page: _i5.MovieCategoryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartUpView(),
        settings: data,
      );
    },
    _i3.HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
      );
    },
    _i4.MovieDetailView: (data) {
      final args = data.getArgs<MovieDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.MovieDetailView(key: args.key, movieId: args.movieId),
        settings: data,
      );
    },
    _i5.MovieCategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.MovieCategoryView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MovieDetailViewArguments {
  const MovieDetailViewArguments({
    this.key,
    required this.movieId,
  });

  final _i6.Key? key;

  final int? movieId;
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToStartUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieDetailView({
    _i6.Key? key,
    required int? movieId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.movieDetailView,
        arguments: MovieDetailViewArguments(key: key, movieId: movieId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMovieCategoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.movieCategoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
