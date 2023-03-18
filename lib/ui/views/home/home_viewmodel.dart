import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
}
