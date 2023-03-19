import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../application/app/constants/common.dart';
import '../../application/app/constants/custom_colors.dart';
import '../../application/services/search_service.dart';
import 'custom_loader.dart';
import 'search_result.dart';

class SearchDelegateWidget extends SearchDelegate {
  final String label;
  SearchDelegateWidget({
    required this.label,
  });

  @override
  String? get searchFieldLabel => label;

  @override
  TextStyle? get searchFieldStyle => TextStyle(
        fontFamily: Common.defaultFontFamily,
        color: CustomColors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            backgroundColor: CustomColors.dark,
          ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          fontFamily: Common.defaultFontFamily,
          color: CustomColors.textSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        border: InputBorder.none,
      ),
    );
  }

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
    if (query.isNotEmpty) {
      return ViewModelBuilder<SearchService>.reactive(
        viewModelBuilder: () => SearchService(),
        onModelReady: (viewModel) => viewModel.searchMovie(query),
        disposeViewModel: false,
        fireOnModelReadyOnce: true,
        builder: (context, viewModel, child) => viewModel.isSearching
            ? CustomLoader.loaderWithAsset(context)
            : SearchResult(
                listMovies: viewModel.listSearch,
                onTap: viewModel.goToDetailMovie,
              ),
      );
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    debugPrint('suggestion');
    return Container();
  }
}
