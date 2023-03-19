import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/enums/category_type.dart';
import '../../../../application/mixins/movie_mixin.dart';

class CategoryViewModel extends FutureViewModel with MovieMixin {
  bool isLoading = false;

  String get appBarTitle => Category.appbarTitle;
  String get endpoint => Category.endpoint;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> initData() async {
    isLoading = true;
    listCategoryMovie.clear();
    page = 1;
    await getMovieByCategory(endpoint);
    isLoading = false;
    notifyListeners();
  }

  Future<void> onRefresh() async {
    await initData();
  }

  Future<void> onLoadMore() async {
    debugPrint('load more');
    page = page + 1;
    await getMovieByCategory(endpoint);
    refreshController.loadComplete();
    notifyListeners();
  }

  @override
  Future futureToRun() async {
    await initData();
  }
}
