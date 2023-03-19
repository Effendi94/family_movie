import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/enums/category_type.dart';
import '../../../shared/list_movie_slider.dart';
import '../../../shared/sub_heading_text.dart';
import '../movie_viewmodel.dart';

class NowPlayingView extends HookViewModelWidget<MovieViewModel> {
  const NowPlayingView({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, MovieViewModel viewModel) {
    return viewModel.listNowPlaying.isNotEmpty
        ? Column(
            children: [
              SubHeadingText(
                headingText: 'Now Playing',
                color: Colors.white,
                onTap: () =>
                    viewModel.navigateToCategory(CategoryType.nowPlaying),
              ),
              ListMovieSlider(
                listMovie: viewModel.listNowPlaying,
                onTap: viewModel.goToDetailMovie,
              ),
            ],
          )
        : Container();
  }
}
