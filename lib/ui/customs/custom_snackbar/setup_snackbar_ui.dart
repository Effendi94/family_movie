import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import '../../../../application/app/constants/custom_colors.dart';
import '../../../../application/enums/snackbar_type.dart';

void setupSnackbarUI() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.info,
    config: SnackbarConfig(
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 0.0, 16.0),
      margin: const EdgeInsets.all(12),
      backgroundColor: CustomColors.orange10,
      borderRadius: 6.0,
      icon: Icon(
        Icons.close_rounded,
        color: CustomColors.primary,
      ),
      isDismissible: false,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 0.0, 16.0),
      margin: const EdgeInsets.all(12),
      backgroundColor: CustomColors.error,
      borderRadius: 6.0,
      icon: Icon(
        Icons.close_rounded,
        color: CustomColors.primary,
      ),
      isDismissible: false,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.failedConnection,
    config: SnackbarConfig(
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 0.0, 16.0),
      margin: const EdgeInsets.all(12),
      backgroundColor: CustomColors.error,
      borderRadius: 6.0,
      animationDuration: const Duration(seconds: 3),
      icon: Icon(
        Icons.close_rounded,
        color: CustomColors.primary,
      ),
      isDismissible: false,
    ),
  );
}
