import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../application/app/constants/endpoint.dart';
import '../../application/helpers/ui_helpers.dart';
import '../../application/models/movie/tv.dart';
import 'image_error.dart';

class ListTVSlider extends StatelessWidget {
  final List<TvData> listTv;
  final int? totalItem;
  final Function(int?) onTap;

  const ListTVSlider({
    Key? key,
    required this.listTv,
    required this.onTap,
    this.totalItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context) * .23,
      child: ListView.builder(
        itemCount: listTv.isNotEmpty ? listTv.length : totalItem,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (listTv.isNotEmpty && index == listTv.length + 1) {}
          final tv = listTv[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () => onTap(tv.id),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: CachedNetworkImage(
                  width: screenWidth(context) * .33,
                  // height: screenHeight(context) * .23,
                  fit: BoxFit.cover,
                  imageUrl: EndPoint.imdbImagePath
                      .replaceAll('%PATH%', tv.posterPath ?? ''),
                  placeholder: (context, url) => SizedBox(
                    width: screenWidth(context) * .33,
                    height: screenHeight(context) * .23,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => ImageError(
                    width: screenWidth(context) * .33,
                    height: screenHeight(context) * .23,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
