import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/enums/category_type.dart';
import '../../../shared/list_movie_slider.dart';
import '../../../shared/sub_heading_text.dart';
import '../movie_viewmodel.dart';

class PopularView extends HookViewModelWidget<MovieViewModel> {
  const PopularView({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, MovieViewModel viewModel) {
    return viewModel.listPopular.isNotEmpty
        ? Column(
            children: [
              SubHeadingText(
                headingText: 'Popular',
                color: Colors.white,
                onTap: () => viewModel.navigateToCategory(CategoryType.popular),
              ),
              ListMovieSlider(
                listMovie: viewModel.listPopular,
                onTap: viewModel.goToDetailMovie,
              ),
            ],
          )
        : Container();
  }
}
