import 'package:family_movie/application/mixins/movie_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/category_type.dart';

class MovieViewModel extends FutureViewModel with MovieMixin {
  final _navigationService = locator<NavigationService>();

  void navigateToCategory(CategoryType categoryType) {
    Category.setType = categoryType;

    // _navigationService.navigateTo(Routes.categoryView);
  }

  @override
  Future futureToRun() async {
    await Future.wait([
      getNowPlaying(),
      getPopular(),
      getUpcoming(),
    ]);
  }
}
