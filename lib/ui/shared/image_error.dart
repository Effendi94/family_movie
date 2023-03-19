import 'package:flutter/material.dart';

import '../../application/app/constants/custom_colors.dart';

class ImageError extends StatelessWidget {
  final double? width;
  final double? height;
  const ImageError({
    super.key,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[400],
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
                  color: CustomColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}
