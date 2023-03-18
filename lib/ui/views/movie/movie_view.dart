import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../home/widgets/upcoming.dart';
import 'movie_viewmodel.dart';
import 'widgets/now_playing.dart';
import 'widgets/popular.dart';

class MovieView extends ViewModelBuilderWidget<MovieViewModel> {
  const MovieView({super.key});

  @override
  Widget builder(
      BuildContext context, MovieViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
