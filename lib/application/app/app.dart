import 'package:dio/dio.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../apis/movie_api.dart';
import '../../../ui/views/startup/startup_view.dart';
import '../../apis/tv_api.dart';
import '../../ui/views/home/home_view.dart';
import '../../ui/views/movie_detail/movie_detail_view.dart';
import '../../ui/views/movie/movie_viewmodel.dart';
import '../../ui/views/category/category_view.dart';
import '../services/dio_service.dart';
import '../services/search_service.dart';
import '../services/user_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: HomeView, path: '/home'),
  MaterialRoute(page: MovieDetailView, path: '/movie-detail'),
  MaterialRoute(page: CategoryView, path: '/movie-category'),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: UserService),
  LazySingleton(classType: SearchService),
  Singleton(
    classType: DioService,
    resolveUsing: DioService.getInstance,
    asType: Dio,
  ),
  LazySingleton(classType: MovieAPI),
  LazySingleton(classType: TVAPI),
  Singleton(classType: MovieViewModel),
])
class AppSetup {}
