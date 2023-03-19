import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../movie_detail_viewmodel.dart';

class RatingStar extends HookViewModelWidget<MovieDetailViewModel> {
  const RatingStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
      BuildContext context, MovieDetailViewModel viewModel) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: viewModel.movieData.voteAverage ?? 0 / 2,
          itemCount: 10,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: CustomColors.orange10,
          ),
          itemSize: 24,
        ),
        Text(
          '${viewModel.fixedVoteAverage} / ${viewModel.movieData.voteCount}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.textPrimary,
              ),
        )
      ],
    );
  }
}
