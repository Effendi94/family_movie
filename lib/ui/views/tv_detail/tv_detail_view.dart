import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/custom_loader.dart';
import 'tv_detail_viewmodel.dart';
import 'widgets/body_detail.dart';
import 'widgets/header_detail.dart';

class TvDetailview extends ViewModelBuilderWidget<TVDetailViewModel> {
  final int? tvId;
  const TvDetailview({Key? key, required this.tvId}) : super(key: key);

  @override
  void onViewModelReady(TVDetailViewModel viewModel) {
    viewModel.initData(tvId.toString());
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, TVDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: CustomColors.dark,
      appBar: CustomAppBar.plain(context: context),
      primary: false,
      body: viewModel.isBusy
          ? CustomLoader.loaderWithAsset(context)
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      HeaderDetail(),
                      BodyDetail(),
                    ],
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: CustomColors.white,
                    ),
                    onPressed: viewModel.navigateBack,
                  ),
                )
              ],
            ),
    );
  }

  @override
  TVDetailViewModel viewModelBuilder(BuildContext context) =>
      TVDetailViewModel();
}
