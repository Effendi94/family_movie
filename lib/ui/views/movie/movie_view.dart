import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import 'movie_viewmodel.dart';
import 'widgets/now_playing.dart';
import 'widgets/popular.dart';
import 'widgets/upcoming.dart';

class MovieView extends ViewModelBuilderWidget<MovieViewModel> {
  const MovieView({super.key});

  @override
  bool get initialiseSpecialViewModelsOnce => true;

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(
      BuildContext context, MovieViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            NowPlayingView(),
            PopularView(),
            UpComingView(),
          ],
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => MovieViewModel();
}
