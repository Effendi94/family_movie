import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../application/app/constants/custom_colors.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/helpers/format_utils.dart';
import '../../application/helpers/ui_helpers.dart';
import '../../application/models/movie/movie.dart';

class ListMovieSlider extends StatelessWidget {
  final List<MovieData> listMovie;
  final int? totalItem;
  final Function(int?) onTap;

  const ListMovieSlider({
    Key? key,
    required this.listMovie,
    required this.onTap,
    this.totalItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * .3,
      child: ListView.builder(
        itemCount: listMovie.isNotEmpty ? listMovie.length : totalItem,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (listMovie.isNotEmpty && index == listMovie.length + 1) {}
          final movie = listMovie[index];
          return InkWell(
            onTap: () => onTap(movie.id),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      height: screenHeight(context) * .22,
                      width: screenWidth(context) * .3,
                      fit: BoxFit.cover,
                      imageUrl: EndPoint.imdbImagePath
                          .replaceAll('%PATH%', movie.posterPath ?? ''),
                      placeholder: (context, url) => SizedBox(
                        width: screenWidth(context) * .3,
                        height: screenHeight(context) * .22,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        width: screenWidth(context) * .3,
                        height: screenHeight(context) * .22,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error,
                              color: CustomColors.error,
                            ),
                            Text(
                              'Image Error',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: CustomColors.textPrimary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: screenWidth(context) * .3,
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      movie.title ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: CustomColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    width: screenWidth(context) * .3,
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      FormatUtils.convertShortDateTime(movie.releaseDate ?? ''),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: CustomColors.textSecondary,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
