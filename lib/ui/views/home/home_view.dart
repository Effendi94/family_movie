import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../../application/enums/search_type.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/search_delegate_widget.dart';
import '../movie/movie_view.dart';
import '../profile/profile_view.dart';
import '../tv/tv_view.dart';
import 'home_viewmodel.dart';
import 'widgets/home_drawer.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: viewModel.currentIndex == 2
          ? null
          : CustomAppBar.search(
              context: context,
              appBarTitle: 'Family Movie',
              isLoading: false,
              searchDelegate: SearchDelegateWidget(
                label: Search.type == SearchType.movie
                    ? 'Search Movie'
                    : 'Search Tvs',
              ),
            ),
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      drawer: const HomeDrawer(),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        reverse: viewModel.reverse,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: getViewForIndex(viewModel.currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.dark,
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.onChangeTab,
        selectedItemColor: CustomColors.white,
        unselectedItemColor: CustomColors.neutral50,
        iconSize: 14,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: viewModel.bottomNavigationItems
            .map(
              (v) => BottomNavigationBarItem(
                label: v.title,
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Icon(v.icon),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const MovieView();
      case 1:
        return const TVView();
      case 2:
        return const ProfileView();
      default:
        return const MovieView();
    }
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
