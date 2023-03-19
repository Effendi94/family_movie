import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../../application/app/constants/endpoint.dart';
import '../../application/helpers/ui_helpers.dart';
import '../../application/models/movie/movie.dart';
import 'image_error.dart';
import 'image_shimmer.dart';

class MovieTile extends StatelessWidget {
  final MovieData movieData;

  const MovieTile({
    Key? key,
    required this.movieData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            child: Stack(
              children: [
                _buildOverview(context),
                _buildImage(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Align _buildOverview(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(left: 90),
        width: screenWidth(context),
        constraints: const BoxConstraints(
          minHeight: 70,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          movieData.overview != null && movieData.overview!.isNotEmpty
              ? movieData.overview!
              : 'Overview not avaiable',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: CustomColors.white,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          softWrap: true,
        ),
      ),
    );
  }

  Align _buildImage(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            width: screenWidth(context) * .17,
            height: screenHeight(context) * 2,
            fit: BoxFit.cover,
            imageUrl: EndPoint.imdbImagePath
                .replaceAll('%PATH%', movieData.posterPath ?? ''),
            placeholder: (context, url) => SizedBox(
              width: screenWidth(context) * .17,
              height: screenHeight(context) * 2,
              child: const ImageShimmer(),
            ),
            errorWidget: (context, url, error) => ImageError(
              width: screenWidth(context) * .17,
              height: screenHeight(context) * 2,
            ),
          ),
        ),
      ),
    );
  }
}
