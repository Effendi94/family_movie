import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/custom_loader.dart';
import 'movie_detail_viewmodel.dart';
import 'widgets/body_detail.dart';
import 'widgets/header_detail.dart';

class MovieDetailView extends ViewModelBuilderWidget<MovieDetailViewModel> {
  final int? movieId;
  const MovieDetailView({Key? key, required this.movieId}) : super(key: key);

  @override
  void onViewModelReady(MovieDetailViewModel viewModel) {
    viewModel.initData(movieId.toString());
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, MovieDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      appBar: CustomAppBar.plain(context: context),
      primary: false,
      body: viewModel.isBusy
          ? CustomLoader.loaderWithAsset(context)
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      HeaderDetail(),
                      BodyDetail(),
                    ],
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: CustomColors.white,
                    ),
                    onPressed: viewModel.navigateBack,
                  ),
                )
              ],
            ),
    );
  }

  @override
  MovieDetailViewModel viewModelBuilder(BuildContext context) =>
      MovieDetailViewModel();
}
