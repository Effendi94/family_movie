import 'package:flutter/material.dart';

import '../../application/app/constants/image_constants.dart';

class ImageNotAvailable extends StatelessWidget {
  final double? width;
  final double? height;
  const ImageNotAvailable({
    super.key,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: Image.asset(
        ImageConstants.imageNotAvaiable,
        fit: BoxFit.contain,
        width: width,
        height: height,
      ),
    );
  }
}
