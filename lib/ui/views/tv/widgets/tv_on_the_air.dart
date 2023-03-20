import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/enums/category_type.dart';
import '../../../shared/list_tv_slider.dart';
import '../../../shared/sub_heading_text.dart';
import '../tv_viewmodel.dart';

class TVOnTheAir extends HookViewModelWidget<TVViewModel> {
  const TVOnTheAir({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, TVViewModel viewModel) {
    return viewModel.listTVOnTheAir.isNotEmpty
        ? Column(
            children: [
              SubHeadingText(
                headingText: 'On The Air',
                color: Colors.white,
                onTap: () =>
                    viewModel.navigateToCategory(CategoryType.tvOnTheAir),
              ),
              ListTVSlider(
                listTv: viewModel.listTVOnTheAir,
                onTap: viewModel.goToTVDetail,
              ),
            ],
          )
        : Container();
  }
}
