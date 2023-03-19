import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../apis/tv_api.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../models/movie/tv.dart';

mixin TVMixin on BaseViewModel {
  final _tvApi = locator<TVAPI>();
  final _navigationService = locator<NavigationService>();
  List<TvData> listTVOnTheAir = [];
  List<TvData> listTVPopular = [];

  bool tvOnTheAirHasError = false;
  bool tvPopularHasError = false;

  int page = 1;
  Future<void> getTVOnTheAir() async {
    final res = await runBusyFuture(
      _tvApi.fetchTVOnTheAir(page),
    );
    res.fold((l) {
      tvOnTheAirHasError = true;
      // totalPages = 0;
      // totalResult = 0;
    }, (res) {
      listTVOnTheAir = res.results ?? [];
      // totalPages = res.totalPages ?? 0;
      // totalResult = res.totalResults ?? 0;
    });

    notifyListeners();
  }

  Future<void> getTVPopular() async {
    final res = await runBusyFuture(
      _tvApi.fetchTVPopular(page),
    );
    res.fold((l) {
      tvPopularHasError = true;
      // totalPages = 0;
      // totalResult = 0;
    }, (res) {
      listTVPopular = res.results ?? [];
      // totalPages = res.totalPages ?? 0;
      // totalResult = res.totalResults ?? 0;
    });

    notifyListeners();
  }

  void goToDetailMovie(int? movieId) {
    _navigationService.navigateTo(
      Routes.movieDetailView,
      arguments: MovieDetailViewArguments(movieId: movieId),
    );
  }
}
