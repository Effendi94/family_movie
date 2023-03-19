import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import '../../shared/custom_appbar.dart';
import '../../shared/search_delegate_widget.dart';
import 'movie_category_viewmodel.dart';
import 'widgets/category_wrapper.dart';

class MovieCategoryView extends ViewModelBuilderWidget<MovieCategoryViewModel> {
  const MovieCategoryView({super.key});

  @override
  Widget builder(
      BuildContext context, MovieCategoryViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CustomAppBar.search(
        context: context,
        appBarTitle: viewModel.appBarTitle,
        searchDelegate: SearchDelegateWidget(
          label: 'Search Movie',
        ),
      ),
      body: SmartRefresher(
        controller: viewModel.refreshController,
        onRefresh: viewModel.onRefresh,
        onLoading: viewModel.onLoadMore,
        enablePullDown: viewModel.listCategoryMovie.isNotEmpty,
        enablePullUp: viewModel.listCategoryMovie.isEmpty
            ? false
            : !viewModel.hasReachedMax,
        header: const ClassicHeader(),
        footer: const ClassicFooter(),
        child: (viewModel.listCategoryMovie.isNotEmpty)
            ? const CategoryWrapper()
            : Container(),
      ),
    );
  }

  @override
  MovieCategoryViewModel viewModelBuilder(BuildContext context) =>
      MovieCategoryViewModel();
}
