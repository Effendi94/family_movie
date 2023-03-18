import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/enums/category_type.dart';
import '../../../shared/list_movie_slider.dart';
import '../../../shared/sub_heading_text.dart';
import '../../movie/movie_viewmodel.dart';

class UpComingView extends HookViewModelWidget<MovieViewModel> {
  const UpComingView({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, MovieViewModel viewModel) {
    return viewModel.listUpcoming.isNotEmpty
        ? Column(
            children: [
              SubHeadingText(
                headingText: 'Upcoming',
                onTap: () =>
                    viewModel.navigateToCategory(CategoryType.upcoming),
              ),
              ListMovieSlider(
                listMovie: viewModel.listUpcoming,
                onTap: viewModel.goToDetailMovie,
              ),
            ],
          )
        : Container();
  }
}
