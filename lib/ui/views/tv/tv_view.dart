import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tv_viewmodel.dart';

class TVView extends ViewModelBuilderWidget<TVViewModel> {
  const TVView({super.key});

  @override
  Widget builder(BuildContext context, TVViewModel viewModel, Widget? child) {
    return Container();
  }

  @override
  viewModelBuilder(BuildContext context) => TVViewModel();
}
