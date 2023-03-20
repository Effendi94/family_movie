import 'package:cached_network_image/cached_network_image.dart';
import 'package:family_movie/ui/shared/image_error.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../../../application/app/constants/endpoint.dart';
import '../../../../application/helpers/format_utils.dart';
import '../../../../application/models/static.dart';
import '../movie_detail_viewmodel.dart';
import 'video_player.dart';

class HeaderDetail extends HookViewModelWidget<MovieDetailViewModel> {
  const HeaderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget buildViewModelWidget(
      BuildContext context, MovieDetailViewModel viewModel) {
    final movie = viewModel.movieData;
    return Column(
      children: [
        const VideoPlayer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: EndPoint.imdbImagePath
                      .replaceAll('%PATH%', movie.backdropPath ?? ''),
                  fit: BoxFit.cover,
                  width: 70,
                  height: 90,
                  placeholder: (context, url) => const SizedBox(
                    width: 70,
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const ImageError(
                    width: 70,
                    height: 90,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? '',
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: CustomColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 10),
                    buildGenres(context, movie.genres),
                    const SizedBox(height: 3),
                    Text(
                      FormatUtils.convertYear(movie.releaseDate ?? ''),
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: CustomColors.textSecondary,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGenres(BuildContext context, List<StaticModel>? genres) {
    return Wrap(
      children: List.generate(
        genres?.length ?? 0,
        ((index) {
          return RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: CustomColors.textSecondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
              children: <TextSpan>[
                TextSpan(text: genres?[index].name ?? ''),
                if (index != genres!.length - 1) const TextSpan(text: ' • '),
              ],
            ),
          );
        }),
      ),
    );
  }
}
