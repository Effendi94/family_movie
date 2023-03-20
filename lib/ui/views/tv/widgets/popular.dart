import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/enums/category_type.dart';
import '../../../shared/list_tv_slider.dart';
import '../../../shared/sub_heading_text.dart';
import '../tv_viewmodel.dart';

class TVPopular extends HookViewModelWidget<TVViewModel> {
  const TVPopular({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, TVViewModel viewModel) {
    return viewModel.listTVPopular.isNotEmpty
        ? Column(
            children: [
              SubHeadingText(
                headingText: 'Popular',
                color: Colors.white,
                onTap: () =>
                    viewModel.navigateToCategory(CategoryType.tvPopular),
              ),
              ListTVSlider(
                listTv: viewModel.listTVPopular,
                onTap: viewModel.goToTVDetail,
              ),
            ],
          )
        : Container();
  }
}
