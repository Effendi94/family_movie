import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../tv_viewmodel.dart';

class TVVideoPlayer extends HookViewModelWidget<TVViewModel> {
  const TVVideoPlayer({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, TVViewModel viewModel) {
    return viewModel.playerIsReady
        ? CarouselSlider(
            carouselController: viewModel.carouselController,
            items: List.generate(
              viewModel.listTVVideoKey.length,
              (i) {
                YoutubePlayerController ytController = viewModel.lYTC[i];

                return buildVideoPlayer(context, ytController,
                    viewModel.carouselController, viewModel);
              },
            ).toList(),
            options: CarouselOptions(
              // height: 200,
              initialPage: viewModel.currentPageIndex,
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                debugPrint(reason.name);
                viewModel.onPageCarouselChanged(index);
              },
            ),
          )
        : Container();
  }

  Widget buildVideoPlayer(
      BuildContext context,
      YoutubePlayerController controller,
      CarouselController carouselController,
      TVViewModel viewModel) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: CustomColors.primary,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
              RemainingDuration(),
            ],
            onEnded: (YoutubeMetaData md) {
              controller.reset();
              carouselController.nextPage();
            },
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Text(
            '${viewModel.currentPageIndex + 1}/${viewModel.listTVVideoKey.length} ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: CustomColors.white,
                  fontSize: 10,
                ),
          ),
        ),
      ],
    );
  }
}
