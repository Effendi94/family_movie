// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:dio/src/dio.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../../apis/movie_api.dart';
import '../../apis/tv_api.dart';
import '../../ui/views/movie/movie_viewmodel.dart';
import '../services/dio_service.dart';
import '../services/search_service.dart';
import '../services/user_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => SearchService());
  locator.registerSingleton<Dio>(DioService.getInstance());
  locator.registerLazySingleton(() => MovieAPI());
  locator.registerLazySingleton(() => TVAPI());
  locator.registerSingleton(MovieViewModel());
}
