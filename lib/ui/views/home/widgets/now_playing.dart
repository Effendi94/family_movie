// import 'package:flutter/material.dart';
// import 'package:javan_tes/application/enums/category_type.dart';
// import 'package:stacked_hooks/stacked_hooks.dart';

// import '../../shared/list_movie_slider.dart';
// import '../../shared/sub_heading_text.dart';
// import '../home_viewmodel.dart';

// class NowPlayingView extends HookViewModelWidget<HomeViewModel> {
//   const NowPlayingView({super.key});

//   @override
//   Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
//     return viewModel.listNowPlaying.isNotEmpty
//         ? Column(
//             children: [
//               SubHeadingText(
//                 headingText: 'Now Playing',
//                 onTap: () =>
//                     viewModel.navigateToCategory(CategoryType.nowPlaying),
//               ),
//               ListMovieSlider(
//                 listMovie: viewModel.listNowPlaying,
//                 onTap: viewModel.goToDetailMovie,
//               ),
//             ],
//           )
//         : Container();
//   }
// }
