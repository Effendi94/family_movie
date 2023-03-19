import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../apis/movie_api.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../enums/search_type.dart';
import '../models/movie/movie.dart';

class SearchService extends BaseViewModel with ReactiveServiceMixin {
  final _movieApi = locator<MovieAPI>();
  final _navigationService = locator<NavigationService>();
  List<MovieData> listSearch = [];
  bool isSearching = false;

  void searchMovie(String query) async {
    if (query.isNotEmpty) {
      isSearching = true;
      final res = await _movieApi.searchMovie(query);
      res.fold((l) {}, (res) {
        listSearch.addAll(res);
      });
      isSearching = false;
      notifyListeners();
    }
  }

  void goToDetailMovie(int? movieId) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movieId: movieId),
    );
  }
}
