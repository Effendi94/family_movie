import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

import '../../../application/app/constants/image_constants.dart';
import '../../application/app/constants/custom_colors.dart';

class CustomLoader {
  static void showLoader(BuildContext context) {
    Loader.show(
      context,
      progressIndicator: CircularProgressIndicator(
        color: CustomColors.blue50,
      ),
      overlayColor: Colors.black26,
    );
  }

  static void hideLoader() {
    Loader.hide();
  }

  static Widget loaderWidget() {
    return Container(
      color: Colors.black26,
      child: Center(
        child: CircularProgressIndicator(
          color: CustomColors.blue50,
        ),
      ),
    );
  }

  static Widget loaderWithAsset(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.6,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        Center(
          child: Container(
            width: 118,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 76,
                    maxHeight: 76,
                    maxWidth: 76,
                    minWidth: 76,
                  ),
                  child: Image.asset(ImageConstants.loader),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please wait...',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
