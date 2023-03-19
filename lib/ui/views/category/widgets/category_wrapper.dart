import 'package:cached_network_image/cached_network_image.dart';
import 'package:family_movie/application/models/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../../application/app/constants/endpoint.dart';
import '../../../shared/custom_loader.dart';
import '../../../shared/image_error.dart';
import '../../../shared/image_shimmer.dart';
import '../category_viewmodel.dart';

class CategoryWrapper extends HookViewModelWidget<CategoryViewModel> {
  const CategoryWrapper({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, CategoryViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: viewModel.isLoading
          ? CustomLoader.loaderWithAsset(context)
          : buildBody(viewModel),
    );
  }

  GridView buildBody(CategoryViewModel viewModel) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 3,
        childAspectRatio: 0.7,
      ),
      itemCount: viewModel.listCategoryMovie.length,
      itemBuilder: (BuildContext ctx, index) {
        final movie = viewModel.listCategoryMovie[index];
        return InkWell(
          onTap: () => viewModel.goToDetailMovie(movie.id),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            child: buildImage(movie),
          ),
        );
      },
    );
  }

  Widget buildImage(MovieData movie) {
    return CachedNetworkImage(
      imageUrl:
          EndPoint.imdbImagePath.replaceAll('%PATH%', movie.posterPath ?? ''),
      fit: BoxFit.cover,
      placeholder: (context, url) => const ImageShimmer(),
      errorWidget: (context, url, error) => const ImageError(),
    );
  }
}
