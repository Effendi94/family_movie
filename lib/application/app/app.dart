import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../apis/movie_api.dart';
// import '../../../ui/views/home/home_view.dart';
// import '../../../ui/views/movies/category/category_view.dart';
// import '../../../ui/views/movies/movie_detail/movie_detail_view.dart';
import '../../../ui/views/startup/startup_view.dart';
import '../services/dio_service.dart';
import '../services/user_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  // MaterialRoute(page: HomeView, path: '/home'),
  // MaterialRoute(page: MovieDetailView, path: '/movie-detail'),
  // MaterialRoute(page: CategoryView, path: '/category'),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: UserService),
  Singleton(
    classType: DioService,
    resolveUsing: DioService.getInstance,
    asType: Dio,
  ),
  LazySingleton(classType: MovieAPI),
])
class App {}
