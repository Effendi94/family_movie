import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import 'tv_viewmodel.dart';

class TVView extends ViewModelBuilderWidget<TVViewModel> {
  const TVView({super.key});

  @override
  Widget builder(BuildContext context, TVViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[],
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => TVViewModel();
}
