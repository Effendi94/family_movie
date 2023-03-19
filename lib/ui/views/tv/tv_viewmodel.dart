import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/category_type.dart';
import '../../../application/mixins/tv_mixin.dart';

class TVViewModel extends FutureViewModel with TVMixin {
  final _navigationService = locator<NavigationService>();

  void navigateToCategory(CategoryType categoryType) {
    Category.setType = categoryType;

    _navigationService.navigateTo(Routes.movieCategoryView);
  }

  @override
  Future futureToRun() {
    return Future.wait([
      getTVOnTheAir(),
      getTVPopular(),
    ]);
  }
}
