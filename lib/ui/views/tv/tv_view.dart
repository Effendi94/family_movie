import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import 'tv_viewmodel.dart';
import 'widgets/popular.dart';
import 'widgets/tv_on_the_air.dart';

class TVView extends ViewModelBuilderWidget<TVViewModel> {
  const TVView({super.key});

  @override
  Widget builder(BuildContext context, TVViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            TVOnTheAir(),
            TVPopular(),
          ],
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => TVViewModel();
}
