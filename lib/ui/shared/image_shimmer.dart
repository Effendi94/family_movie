import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../application/app/constants/custom_colors.dart';

class ImageShimmer extends StatelessWidget {
  final double width;
  final double height;

  const ImageShimmer({
    super.key,
    this.width = 70,
    this.height = 200,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.shimmerBaseColor,
      highlightColor: CustomColors.shimmerhighlightColor,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}
