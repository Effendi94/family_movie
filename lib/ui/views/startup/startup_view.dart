import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../../application/app/constants/image_constants.dart';
import 'startup_viewmodel.dart';

class StartUpView extends ViewModelBuilderWidget<StartupViewModel> {
  const StartUpView({super.key});

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.init();
    });
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, StartupViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              ImageConstants.flutterIcon,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Family',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: CustomColors.white,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Movie',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: CustomColors.orange,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}
