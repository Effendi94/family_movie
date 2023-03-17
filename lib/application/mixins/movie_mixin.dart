// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// import '../../apis/movie_api.dart';
// import '../app/app.locator.dart';
// import '../app/app.router.dart';
// import '../models/movie.dart';

// mixin MovieMixin on BaseViewModel {
//   final _movieApi = locator<MovieAPI>();
//   final _navigationService = locator<NavigationService>();

//   List<MovieData> listNowPlaying = [];
//   List<MovieData> listPopular = [];
//   List<MovieData> listTopRated = [];
//   List<MovieData> listUpcoming = [];
//   List<MovieData> listSearch = [];
//   List<MovieData> listCategoryMovie = [];

//   bool nowPlayingHasError = false;
//   bool popularHasError = false;
//   bool topRatedHasError = false;
//   bool upcomingHasError = false;
//   bool hasReachedMax = false;
//   int page = 1;
//   int totalPages = 0;
//   int totalResult = 0;
//   bool isSearching = false;

//   Future<void> getNowPlaying() async {
//     final res = await runBusyFuture(
//       _movieApi.fetchNowPlaying(page),
//     );

//     res.fold((l) {
//       nowPlayingHasError = true;
//       totalPages = 0;
//       totalResult = 0;
//     }, (r) {
//       listNowPlaying.addAll(r.results!);
//       totalPages = r.totalPages ?? 0;
//       totalResult = r.totalResults ?? 0;
//     });

//     notifyListeners();
//   }

//   Future<void> getPopular() async {
//     final res = await runBusyFuture(
//       _movieApi.fetchPopular(page),
//     );
//     res.fold((l) {
//       popularHasError = true;
//       totalPages = 0;
//       totalResult = 0;
//     }, (res) {
//       listPopular = res.results ?? [];
//       totalPages = res.totalPages ?? 0;
//       totalResult = res.totalResults ?? 0;
//     });
//     notifyListeners();
//   }

//   Future<void> getTopRated() async {
//     final res = await runBusyFuture(
//       _movieApi.fetchTopRated(page),
//     );
//     res.fold((l) {
//       topRatedHasError = true;
//       totalPages = 0;
//       totalResult = 0;
//     }, (res) {
//       listTopRated = res.results ?? [];
//       totalPages = res.totalPages ?? 0;
//       totalResult = res.totalResults ?? 0;
//     });
//     notifyListeners();
//   }

//   Future<void> getUpcoming() async {
//     final res = await runBusyFuture(
//       _movieApi.fetchUpcoming(page),
//     );
//     res.fold((l) {
//       upcomingHasError = true;
//       totalPages = 0;
//       totalResult = 0;
//     }, (res) {
//       listUpcoming = res.results ?? [];
//       totalPages = res.totalPages ?? 0;
//       totalResult = res.totalResults ?? 0;
//     });

//     notifyListeners();
//   }

//   Future<void> getMovieByCategory(String endpoint) async {
//     final res = await runBusyFuture(
//       _movieApi.fetchMovieByCategory(endpoint, page),
//     );
//     res.fold((l) {
//       // upcomingHasError = true;
//       totalPages = 0;
//       totalResult = 0;
//     }, (res) {
//       if (res.results != null || res.results!.isNotEmpty) {
//         listCategoryMovie.addAll(res.results!);
//       }
//       totalPages = res.totalPages ?? 0;
//       totalResult = res.totalResults ?? 0;
//       hasReachedMax = page == totalPages;
//     });

//     notifyListeners();
//   }

//   void searchMovie(String query) async {
//     if (query.isNotEmpty) {
//       isSearching = true;
//       final res = await runBusyFuture(
//         _movieApi.searchMovie(query),
//       );
//       res.fold((l) {}, (res) {
//         listSearch.addAll(res);
//       });
//       isSearching = false;
//       notifyListeners();
//     }
//   }

//   void goToDetailMovie(int? movieId) {
//     _navigationService.navigateTo(
//       Routes.movieDetailView,
//       arguments: MovieDetailViewArguments(movieId: movieId),
//     );
//   }
// }
