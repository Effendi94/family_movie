import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/enums/search_type.dart';
import '../../../application/models/app/bottom_navigation.dart';

class HomeViewModel extends IndexTrackingViewModel {
  List<BottomNavigation> bottomNavigationItems = [
    BottomNavigation(
      title: 'Movies',
      icon: Icons.movie_rounded,
    ),
    BottomNavigation(
      title: 'TV',
      icon: Icons.tv_rounded,
    ),
    BottomNavigation(
      title: 'Profile',
      icon: Icons.account_circle,
    ),
  ];

  void onChangeTab(int index) {
    setIndex(index);
    switch (index) {
      case 0:
        Search.setType = SearchType.movie;
        break;
      case 1:
        Search.setType = SearchType.tv;
        break;
      default:
        Search.setType = SearchType.movie;
    }
    notifyListeners();
  }
}
