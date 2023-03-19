import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';

import '../../../application/enums/search_type.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/search_delegate_widget.dart';
import 'category_viewmodel.dart';
import 'widgets/category_wrapper.dart';

class CategoryView extends ViewModelBuilderWidget<CategoryViewModel> {
  const CategoryView({super.key});

  @override
  Widget builder(
      BuildContext context, CategoryViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CustomAppBar.search(
        context: context,
        appBarTitle: viewModel.appBarTitle,
        searchDelegate: SearchDelegateWidget(
          label:
              Search.type == SearchType.movie ? 'Search Movie' : 'Search Tvs',
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
  CategoryViewModel viewModelBuilder(BuildContext context) =>
      CategoryViewModel();
}
