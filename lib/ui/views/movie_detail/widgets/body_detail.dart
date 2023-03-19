import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../../../application/models/static.dart';
import '../../../shared/custom_button.dart';
import '../movie_detail_viewmodel.dart';
import 'rating_start.dart';

class BodyDetail extends HookViewModelWidget<MovieDetailViewModel> {
  const BodyDetail({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, MovieDetailViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.movieData.title ?? '-',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: CustomColors.textPrimary,
                                  ),
                        ),
                        CustomButton(
                          text: 'Watch Full Movie',
                          leadingIcon: Icons.play_circle,
                          onPressed: () => viewModel.onTapWatchMovie(context),
                        ),
                        Text(
                          _showGenres(viewModel.movieData.genres),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: CustomColors.textSecondary,
                                  ),
                        ),
                        Text(
                          _showDuration(viewModel.movieData.runtime),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: CustomColors.textSecondary,
                                  ),
                        ),
                        const RatingStar(),
                        const SizedBox(height: 16),
                        Text(
                          'Overview',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: CustomColors.textPrimary,
                                  ),
                        ),
                        Text(
                          '${viewModel.movieData.overview}',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: CustomColors.textPrimary,
                                  ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Container(
                          color: CustomColors.primary,
                          height: 4,
                          width: 48,
                        ),
                        const SizedBox(height: 3),
                        Container(
                          color: CustomColors.primary,
                          height: 4,
                          width: 24,
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
        // initialChildSize: 0.5,
        minChildSize: 0.25,
        // maxChildSize: 1.0,
      ),
    );
  }

  String _showGenres(List<StaticModel>? genres) {
    String result = '';
    if (genres != null) {
      for (var genre in genres) {
        result += '${genre.name}, ';
      }
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int? runtime) {
    if (runtime != null && runtime > 0) {
      final int hours = runtime ~/ 60;
      final int minutes = runtime % 60;
      if (hours > 0) {
        return '${hours}h ${minutes}m';
      } else {
        return '${minutes}m';
      }
    }
    return '-';
  }
}
