import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../../../application/app/constants/endpoint.dart';
import '../../../../application/helpers/ui_helpers.dart';
import '../movie_detail_viewmodel.dart';
import 'video_player.dart';

class HeaderDetail extends HookViewModelWidget<MovieDetailViewModel> {
  const HeaderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
      BuildContext context, MovieDetailViewModel viewModel) {
    return SizedBox(
      height: screenHeight(context),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CachedNetworkImage(
            imageUrl: EndPoint.imdbImagePath
                .replaceAll('%PATH%', viewModel.movieData.backdropPath ?? ''),
            width: screenWidth(context),
            fit: BoxFit.cover,
            placeholder: (context, url) => SizedBox(
              width: screenWidth(context),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => SizedBox(
              width: screenWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: CustomColors.error,
                  ),
                  Text(
                    'Image Error',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const VideoPlayer(),
        ],
      ),
    );
  }
}
