// import 'package:flutter/material.dart';
// import 'package:stacked_hooks/stacked_hooks.dart';

// import '../../../../application/enums/category_type.dart';
// import '../../shared/list_movie_slider.dart';
// import '../../shared/sub_heading_text.dart';
// import '../home_viewmodel.dart';

// class PopularView extends HookViewModelWidget<HomeViewModel> {
//   const PopularView({super.key});

//   @override
//   Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
//     return viewModel.listPopular.isNotEmpty
//         ? Column(
//             children: [
//               SubHeadingText(
//                 headingText: 'Popular',
//                 onTap: () => viewModel.navigateToCategory(CategoryType.popular),
//               ),
//               ListMovieSlider(
//                 listMovie: viewModel.listPopular,
//                 onTap: viewModel.goToDetailMovie,
//               ),
//             ],
//           )
//         : Container();
//   }
// }
