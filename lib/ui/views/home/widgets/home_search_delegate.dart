import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../../shared/custom_loader.dart';
import '../home_viewmodel.dart';

class HomeSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Movie';

  @override
  TextStyle? get searchFieldStyle => TextStyle(
        color: CustomColors.textSecondary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) close(context, null);
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(
          Icons.arrow_back,
        ),
      );

  @override
  Widget buildResults(BuildContext context) {
    // if (query.isNotEmpty) {
    //   return ViewModelBuilder<HomeViewModel>.reactive(
    //     viewModelBuilder: () => HomeViewModel(),
    //     onModelReady: (viewModel) => viewModel.searchMovie(query),
    //     disposeViewModel: false,
    //     fireOnModelReadyOnce: true,
    //     builder: (context, viewModel, child) => viewModel.isSearching
    //         ? CustomLoader.loaderWithAsset(context)
    //         : SearchResult(
    //             listMovies: viewModel.listSearch,
    //             onTap: viewModel.goToDetailMovie,
    //           ),
    //   );
    // }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    debugPrint('suggestion');
    return Container();
  }
}
