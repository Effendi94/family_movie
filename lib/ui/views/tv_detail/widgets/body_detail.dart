import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../../../application/app/constants/endpoint.dart';
import '../../../../application/helpers/format_utils.dart';
import '../../../../application/models/movie/tv.dart';
import '../../../shared/custom_textbutton_icon.dart';
import '../../../shared/image_error.dart';
import '../tv_detail_viewmodel.dart';

class BodyDetail extends HookViewModelWidget<TVDetailViewModel> {
  const BodyDetail({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, TVDetailViewModel viewModel) {
    final tv = viewModel.tvData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          buildOverview(tv, context),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextButtonIcon(
                onTap: () {},
                label: 'Download',
                icon: Icons.cloud_download,
              ),
              CustomTextButtonIcon(
                onTap: () {},
                label: 'Watchlist',
                icon: Icons.add,
              ),
              CustomTextButtonIcon(
                onTap: () {},
                label: 'Share',
                icon: Icons.share,
              ),
            ],
          ),
          const SizedBox(height: 15),
          viewModel.reviewData.isEmpty
              ? Container()
              : Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: CustomColors.white,
                        fontWeight: FontWeight.w900,
                      ),
                ),
          ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: viewModel.reviewData.length > 3
                ? 3
                : viewModel.reviewData.length,
            itemBuilder: (context, index) {
              final review = viewModel.reviewData[index];
              return Card(
                color: Colors.grey[700],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: CachedNetworkImage(
                          imageUrl: EndPoint.imdbImagePath.replaceAll(
                              '%PATH%', review.authorDetails?.avatarPath ?? ''),
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
                          errorWidget: (context, url, error) =>
                              const ImageError(
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
                              review.authorDetails?.username ?? '',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: CustomColors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              FormatUtils.convertShortDateTime(
                                  review.createdAt ?? ''),
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: CustomColors.textSecondary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              review.content ?? '',
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: CustomColors.white,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildOverview(TvData movie, BuildContext context) {
    return ReadMoreText(
      movie.overview ?? '',
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'more',
      // trimExpandedText: 'less',
      style: Theme.of(context).textTheme.caption?.copyWith(
            color: CustomColors.neutral40,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
      moreStyle: Theme.of(context).textTheme.caption?.copyWith(
            color: CustomColors.orange,
            fontWeight: FontWeight.w700,
            fontSize: 10,
          ),
      lessStyle: Theme.of(context).textTheme.caption?.copyWith(
            color: Colors.transparent,
          ),
    );
  }
}
