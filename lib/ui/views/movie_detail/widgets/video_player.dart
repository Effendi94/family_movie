import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../movie_detail_viewmodel.dart';

class VideoPlayer extends HookViewModelWidget<MovieDetailViewModel> {
  const VideoPlayer({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, MovieDetailViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      // height: screenHeight(context) * .25,
      // width: screenWidth(context) * .8,
      child: viewModel.hasError
          ? Center(
              child: Text(
                'Player Error!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: CustomColors.textPrimary,
                    ),
              ),
            )
          : viewModel.videoKey.isEmpty
              ? Container()
              : YoutubePlayer(
                  controller: viewModel.videoPlayerController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: CustomColors.primary,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(isExpanded: true),
                    RemainingDuration(),
                  ],
                ),
    );
  }
}
